/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50510
Source Host           : 127.0.0.1:3306
Source Database       : showpicture

Target Server Type    : MYSQL
Target Server Version : 50510
File Encoding         : 65001

Date: 2018-09-13 14:23:42
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for acomment
-- ----------------------------
DROP TABLE IF EXISTS `acomment`;
CREATE TABLE `acomment` (
  `commentId` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '评论Id',
  `comImgTxtId` int(11) unsigned NOT NULL COMMENT '图文消息Id',
  `commentorId` int(11) unsigned NOT NULL COMMENT '评论人Id',
  `commentContent` varchar(225) DEFAULT NULL COMMENT '评论内容',
  `commentorHead` varchar(225) DEFAULT NULL COMMENT '评论人头像',
  `commentCreatTime` datetime DEFAULT NULL COMMENT '评论时间',
  PRIMARY KEY (`commentId`),
  KEY `commentorId` (`commentorId`),
  CONSTRAINT `acomment_ibfk_1` FOREIGN KEY (`commentorId`) REFERENCES `user_info` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of acomment
-- ----------------------------
INSERT INTO `acomment` VALUES ('1', '1', '2', '', null, null);
INSERT INTO `acomment` VALUES ('2', '1', '4', null, null, null);
INSERT INTO `acomment` VALUES ('3', '1', '3', null, null, null);
INSERT INTO `acomment` VALUES ('4', '1', '5', null, null, null);
INSERT INTO `acomment` VALUES ('5', '1', '6', null, null, null);
INSERT INTO `acomment` VALUES ('6', '2', '1', null, null, null);
INSERT INTO `acomment` VALUES ('7', '2', '3', null, null, null);
INSERT INTO `acomment` VALUES ('8', '2', '4', null, null, null);
INSERT INTO `acomment` VALUES ('9', '2', '5', null, null, null);
INSERT INTO `acomment` VALUES ('10', '3', '4', null, null, null);
INSERT INTO `acomment` VALUES ('11', '3', '4', null, null, null);
INSERT INTO `acomment` VALUES ('12', '3', '2', null, null, null);
INSERT INTO `acomment` VALUES ('13', '4', '2', null, null, null);
INSERT INTO `acomment` VALUES ('14', '4', '3', null, null, null);
INSERT INTO `acomment` VALUES ('15', '5', '2', null, null, null);
INSERT INTO `acomment` VALUES ('16', '5', '3', null, null, null);
INSERT INTO `acomment` VALUES ('17', '6', '1', null, null, null);

-- ----------------------------
-- Table structure for activity
-- ----------------------------
DROP TABLE IF EXISTS `activity`;
CREATE TABLE `activity` (
  `activityId` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '群活动Id',
  `activityName` varchar(32) NOT NULL DEFAULT '新建活动' COMMENT '活动名',
  `activityContent` varchar(225) DEFAULT NULL COMMENT '群活动内容',
  `callId` int(11) unsigned NOT NULL COMMENT '召集人Id',
  `callName` varchar(32) DEFAULT NULL COMMENT '召集人名',
  `needNum` int(11) NOT NULL DEFAULT '5' COMMENT '需要人数',
  `beginTime` datetime DEFAULT NULL COMMENT '开始时间',
  `endTime` datetime DEFAULT NULL COMMENT '结束时间',
  PRIMARY KEY (`activityId`),
  KEY `callId` (`callId`),
  KEY `callName` (`callName`),
  CONSTRAINT `activity_ibfk_1` FOREIGN KEY (`callId`) REFERENCES `user_info` (`userId`) ON DELETE CASCADE,
  CONSTRAINT `activity_ibfk_2` FOREIGN KEY (`callName`) REFERENCES `user_info` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of activity
-- ----------------------------
INSERT INTO `activity` VALUES ('1', '穿越长白山', '组队穿越长白山', '1', 'gaoyang', '5', '2018-07-25 10:31:53', '2018-07-29 10:31:56');

-- ----------------------------
-- Table structure for album
-- ----------------------------
DROP TABLE IF EXISTS `album`;
CREATE TABLE `album` (
  `albumId` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '相册Id',
  `albumName` varchar(32) NOT NULL DEFAULT '新建相册' COMMENT '相册名',
  `albumCreatTime` datetime DEFAULT NULL COMMENT '相册创建时间',
  `albumCreatorId` int(11) unsigned NOT NULL COMMENT '相册创建人Id',
  `albumPowerStatus` int(1) NOT NULL DEFAULT '0' COMMENT '相册权限状态,默认0,公开',
  PRIMARY KEY (`albumId`),
  KEY `albumCreatorId` (`albumCreatorId`),
  CONSTRAINT `album_ibfk_1` FOREIGN KEY (`albumCreatorId`) REFERENCES `user_info` (`userId`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of album
-- ----------------------------
INSERT INTO `album` VALUES ('1', '剪影', '2018-07-25 10:33:14', '1', '0');

-- ----------------------------
-- Table structure for bottle
-- ----------------------------
DROP TABLE IF EXISTS `bottle`;
CREATE TABLE `bottle` (
  `bottleId` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '瓶子Id',
  `bottleName` varchar(32) DEFAULT NULL COMMENT '瓶子名称',
  `bottleContent` varchar(225) DEFAULT NULL COMMENT '瓶子内容',
  `bottleUserId` int(11) unsigned NOT NULL COMMENT '瓶主人Id',
  `bottleUserName` varchar(32) DEFAULT NULL COMMENT '瓶子主任名称',
  `driftTime` datetime DEFAULT NULL COMMENT '漂流时间',
  `state` int(1) NOT NULL DEFAULT '0' COMMENT '瓶子状态，默认为0,为漂流',
  `gainUserId` int(11) unsigned DEFAULT NULL COMMENT '捞取人Id',
  `gainUserName` varchar(32) DEFAULT '' COMMENT '捞取人名称',
  PRIMARY KEY (`bottleId`),
  KEY `bottleUserId` (`bottleUserId`),
  KEY `bottleUserName` (`bottleUserName`),
  KEY `gainUserId` (`gainUserId`) USING BTREE,
  KEY `gainUserName` (`gainUserName`) USING BTREE,
  CONSTRAINT `bottle_ibfk_1` FOREIGN KEY (`bottleUserId`) REFERENCES `user_info` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `bottle_ibfk_2` FOREIGN KEY (`bottleUserName`) REFERENCES `user_info` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bottle
-- ----------------------------
INSERT INTO `bottle` VALUES ('1', '心愿瓶', '我想要个妹子', '1', 'gaoyang', '2018-07-25 10:35:45', '0', '0', null);

-- ----------------------------
-- Table structure for collection
-- ----------------------------
DROP TABLE IF EXISTS `collection`;
CREATE TABLE `collection` (
  `collectionId` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '收藏Id',
  `collectorId` int(11) unsigned NOT NULL COMMENT '收藏者Id',
  `collectionImgTxtId` int(11) unsigned NOT NULL COMMENT '图文Id',
  `collectionCreatTime` datetime NOT NULL COMMENT '收藏时间',
  PRIMARY KEY (`collectionId`),
  KEY `collectorId` (`collectorId`),
  KEY `collectionImgTxtId` (`collectionImgTxtId`),
  CONSTRAINT `collection_ibfk_1` FOREIGN KEY (`collectorId`) REFERENCES `user_info` (`userId`) ON DELETE CASCADE,
  CONSTRAINT `collection_ibfk_2` FOREIGN KEY (`collectionImgTxtId`) REFERENCES `imgtxt_info` (`imgTxtId`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of collection
-- ----------------------------
INSERT INTO `collection` VALUES ('1', '1', '1', '2018-07-25 10:45:08');

-- ----------------------------
-- Table structure for feedback
-- ----------------------------
DROP TABLE IF EXISTS `feedback`;
CREATE TABLE `feedback` (
  `feedbackId` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '反馈Id',
  `feedbackContent` varchar(225) DEFAULT NULL COMMENT '反馈内容',
  `feedbackerId` int(11) unsigned NOT NULL COMMENT '反馈人Id',
  `feedbackerName` varchar(32) NOT NULL COMMENT '反馈人名',
  `feedbackTime` datetime DEFAULT NULL COMMENT '反馈时间',
  `feedbackStatus` int(1) NOT NULL DEFAULT '0' COMMENT '反馈状态，默认为0，为受理',
  PRIMARY KEY (`feedbackId`),
  KEY `feedbackerId` (`feedbackerId`),
  KEY `feedbackerName` (`feedbackerName`),
  CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`feedbackerId`) REFERENCES `user_info` (`userId`) ON DELETE CASCADE,
  CONSTRAINT `feedback_ibfk_2` FOREIGN KEY (`feedbackerName`) REFERENCES `user_info` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of feedback
-- ----------------------------
INSERT INTO `feedback` VALUES ('1', '这是一条测试反馈', '1', 'gaoyang', '2018-07-25 10:45:47', '0');

-- ----------------------------
-- Table structure for follow
-- ----------------------------
DROP TABLE IF EXISTS `follow`;
CREATE TABLE `follow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `followerid` int(10) unsigned NOT NULL,
  `befollowerid` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `1` (`followerid`),
  KEY `2` (`befollowerid`),
  CONSTRAINT `1` FOREIGN KEY (`followerid`) REFERENCES `user_info` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `2` FOREIGN KEY (`befollowerid`) REFERENCES `user_info` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of follow
-- ----------------------------
INSERT INTO `follow` VALUES ('1', '1', '2');
INSERT INTO `follow` VALUES ('2', '2', '1');
INSERT INTO `follow` VALUES ('3', '2', '3');
INSERT INTO `follow` VALUES ('4', '4', '5');
INSERT INTO `follow` VALUES ('5', '3', '2');
INSERT INTO `follow` VALUES ('6', '4', '6');
INSERT INTO `follow` VALUES ('7', '1', '3');
INSERT INTO `follow` VALUES ('8', '1', '4');
INSERT INTO `follow` VALUES ('9', '1', '5');
INSERT INTO `follow` VALUES ('10', '1', '6');
INSERT INTO `follow` VALUES ('12', '1', '7');
INSERT INTO `follow` VALUES ('13', '1', '8');

-- ----------------------------
-- Table structure for img
-- ----------------------------
DROP TABLE IF EXISTS `img`;
CREATE TABLE `img` (
  `imgId` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '图片Id',
  `belongId` int(11) unsigned NOT NULL COMMENT '所属相册Id',
  `aImgUrl` varchar(225) DEFAULT NULL COMMENT '图片URL',
  PRIMARY KEY (`imgId`),
  KEY `belongId` (`belongId`),
  CONSTRAINT `img_ibfk_1` FOREIGN KEY (`belongId`) REFERENCES `album` (`albumId`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of img
-- ----------------------------
INSERT INTO `img` VALUES ('1', '1', 'xxx');
INSERT INTO `img` VALUES ('2', '1', 'ddd');
INSERT INTO `img` VALUES ('3', '1', 'ccc');
INSERT INTO `img` VALUES ('4', '1', '123');
INSERT INTO `img` VALUES ('5', '1', '222');

-- ----------------------------
-- Table structure for imgtxt_info
-- ----------------------------
DROP TABLE IF EXISTS `imgtxt_info`;
CREATE TABLE `imgtxt_info` (
  `imgTxtId` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '图文Id',
  `imgUrl` varchar(225) NOT NULL DEFAULT '' COMMENT '图片路径',
  `text` varchar(225) DEFAULT NULL COMMENT '文本内容',
  `sendId` int(11) unsigned NOT NULL COMMENT '发送人Id',
  `imgTxtSendTime` datetime DEFAULT NULL COMMENT '图文发表时间',
  `sendPlace` varchar(225) DEFAULT NULL COMMENT '图文发表地点',
  `imgtxtPowerStatus` int(1) NOT NULL DEFAULT '0' COMMENT '图文权限状态,0表示公开',
  PRIMARY KEY (`imgTxtId`),
  KEY `sendId` (`sendId`),
  CONSTRAINT `imgtxt_info_ibfk_1` FOREIGN KEY (`sendId`) REFERENCES `user_info` (`userId`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of imgtxt_info
-- ----------------------------
INSERT INTO `imgtxt_info` VALUES ('1', 'xxxx', '这是测试图文消息', '1', '2018-07-25 10:44:43', '广东', '0');
INSERT INTO `imgtxt_info` VALUES ('2', '12223', '123', '2', null, '东', '0');
INSERT INTO `imgtxt_info` VALUES ('3', 'qqq', 'qwe', '1', null, null, '0');
INSERT INTO `imgtxt_info` VALUES ('4', 'qwe', 'asdasdasd', '1', null, null, '0');
INSERT INTO `imgtxt_info` VALUES ('5', 'asdasd', 'asdasd', '1', null, null, '0');
INSERT INTO `imgtxt_info` VALUES ('6', 'qweqwe', 'qweqwe', '1', null, null, '0');
INSERT INTO `imgtxt_info` VALUES ('7', 'qweqweq', 'qweqweasdasd', '1', null, null, '0');

-- ----------------------------
-- Table structure for inerestsort
-- ----------------------------
DROP TABLE IF EXISTS `inerestsort`;
CREATE TABLE `inerestsort` (
  `inerestSortId` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '兴趣分类Id',
  `inerestSortName` varchar(32) DEFAULT NULL COMMENT '兴趣分类名称',
  PRIMARY KEY (`inerestSortId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of inerestsort
-- ----------------------------
INSERT INTO `inerestsort` VALUES ('1', '旅游');
INSERT INTO `inerestsort` VALUES ('2', '游戏');
INSERT INTO `inerestsort` VALUES ('3', '美食');
INSERT INTO `inerestsort` VALUES ('4', '技术宅');
INSERT INTO `inerestsort` VALUES ('5', '天文学');
INSERT INTO `inerestsort` VALUES ('6', '地理');

-- ----------------------------
-- Table structure for interest
-- ----------------------------
DROP TABLE IF EXISTS `interest`;
CREATE TABLE `interest` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `interestId` int(11) unsigned NOT NULL COMMENT '兴趣Id',
  `interestUserId` int(11) unsigned NOT NULL COMMENT '用户Id',
  PRIMARY KEY (`id`),
  KEY `interestUserId` (`interestUserId`),
  KEY `interestId` (`interestId`),
  CONSTRAINT `interest_ibfk_1` FOREIGN KEY (`interestUserId`) REFERENCES `user_info` (`userId`) ON DELETE CASCADE,
  CONSTRAINT `interest_ibfk_2` FOREIGN KEY (`interestId`) REFERENCES `inerestsort` (`inerestSortId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of interest
-- ----------------------------
INSERT INTO `interest` VALUES ('1', '1', '1');
INSERT INTO `interest` VALUES ('2', '2', '1');
INSERT INTO `interest` VALUES ('6', '1', '3');
INSERT INTO `interest` VALUES ('7', '2', '4');
INSERT INTO `interest` VALUES ('10', '2', '3');
INSERT INTO `interest` VALUES ('11', '2', '5');
INSERT INTO `interest` VALUES ('21', '5', '1');
INSERT INTO `interest` VALUES ('22', '3', '1');

-- ----------------------------
-- Table structure for interview
-- ----------------------------
DROP TABLE IF EXISTS `interview`;
CREATE TABLE `interview` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '访问记录Id',
  `interviewId` int(11) unsigned NOT NULL COMMENT '访问者Id',
  `interviewName` varchar(225) DEFAULT NULL,
  `interviewImg` varchar(255) DEFAULT NULL,
  `beinterviewId` int(11) unsigned NOT NULL COMMENT '被访问者Id',
  `interviewTime` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`id`),
  KEY `interviewId` (`interviewId`) USING BTREE,
  KEY `beinterviewId` (`beinterviewId`) USING BTREE,
  CONSTRAINT `interview_ibfk_1` FOREIGN KEY (`beinterviewId`) REFERENCES `user_info` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `interview_ibfk_2` FOREIGN KEY (`interviewId`) REFERENCES `user_info` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of interview
-- ----------------------------
INSERT INTO `interview` VALUES ('1', '1', null, null, '2', '2018-07-25 10:55:28');
INSERT INTO `interview` VALUES ('2', '2', null, null, '1', '2018-07-25 10:55:45');
INSERT INTO `interview` VALUES ('3', '3', null, null, '1', null);
INSERT INTO `interview` VALUES ('4', '4', null, null, '1', null);
INSERT INTO `interview` VALUES ('5', '5', null, null, '1', null);
INSERT INTO `interview` VALUES ('6', '6', null, null, '1', null);
INSERT INTO `interview` VALUES ('7', '7', null, null, '1', null);
INSERT INTO `interview` VALUES ('8', '8', null, null, '1', null);

-- ----------------------------
-- Table structure for joinactivity
-- ----------------------------
DROP TABLE IF EXISTS `joinactivity`;
CREATE TABLE `joinactivity` (
  `joinactivity_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `activityid` int(11) unsigned NOT NULL,
  `joinerid` int(11) unsigned NOT NULL,
  `stat` int(11) NOT NULL DEFAULT '0' COMMENT '0为正在审核1为审核成功',
  PRIMARY KEY (`joinactivity_id`),
  KEY `joinerid` (`joinerid`) USING BTREE,
  KEY `activityid` (`activityid`) USING BTREE,
  CONSTRAINT `joinactivity_ibfk_1` FOREIGN KEY (`activityid`) REFERENCES `activity` (`activityId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `joinactivity_ibfk_2` FOREIGN KEY (`joinerid`) REFERENCES `user_info` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of joinactivity
-- ----------------------------
INSERT INTO `joinactivity` VALUES ('1', '1', '1', '0');
INSERT INTO `joinactivity` VALUES ('5', '1', '2', '0');

-- ----------------------------
-- Table structure for laud
-- ----------------------------
DROP TABLE IF EXISTS `laud`;
CREATE TABLE `laud` (
  `laudId` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '点赞Id',
  `laudImgTxtId` int(11) unsigned NOT NULL COMMENT '图文Id',
  `beLaudId` int(11) unsigned NOT NULL COMMENT '被赞人Id',
  `beLaudName` varchar(32) NOT NULL COMMENT '被赞人名',
  PRIMARY KEY (`laudId`),
  KEY `laudImgTxtId` (`laudImgTxtId`),
  KEY `beLaudId` (`beLaudId`),
  KEY `beLaudName` (`beLaudName`),
  CONSTRAINT `laud_ibfk_1` FOREIGN KEY (`beLaudId`) REFERENCES `user_info` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `laud_ibfk_2` FOREIGN KEY (`laudImgTxtId`) REFERENCES `imgtxt_info` (`imgTxtId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `laud_ibfk_3` FOREIGN KEY (`beLaudName`) REFERENCES `user_info` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of laud
-- ----------------------------
INSERT INTO `laud` VALUES ('1', '1', '1', 'gaoyang');
INSERT INTO `laud` VALUES ('2', '1', '1', 'gaoyang');
INSERT INTO `laud` VALUES ('3', '2', '1', 'gaoyang');
INSERT INTO `laud` VALUES ('4', '2', '1', 'gaoyang');
INSERT INTO `laud` VALUES ('5', '2', '1', 'gaoyang');
INSERT INTO `laud` VALUES ('6', '4', '1', 'gaoyang');
INSERT INTO `laud` VALUES ('7', '4', '1', 'gaoyang');
INSERT INTO `laud` VALUES ('8', '2', '1', 'gaoyang');
INSERT INTO `laud` VALUES ('9', '5', '1', 'gaoyang');
INSERT INTO `laud` VALUES ('10', '6', '1', 'gaoyang');
INSERT INTO `laud` VALUES ('11', '7', '1', 'gaoyang');

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `messageId` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '留言Id',
  `messageUserId` int(11) unsigned NOT NULL COMMENT '留言人Id',
  `messageUserName` varchar(32) DEFAULT NULL COMMENT '留言人名称',
  `message` varchar(225) DEFAULT NULL COMMENT '留言内容',
  `messageUserImg` varchar(225) DEFAULT NULL COMMENT '留言人头像',
  `beMessageUserId` int(11) unsigned NOT NULL COMMENT '被留言人Id',
  PRIMARY KEY (`messageId`),
  KEY `messageUserId` (`messageUserId`),
  KEY `messageUserName` (`messageUserName`),
  KEY `beMessageUserId` (`beMessageUserId`),
  KEY `messageUserImg` (`messageUserImg`),
  CONSTRAINT `message_ibfk_1` FOREIGN KEY (`messageUserId`) REFERENCES `user_info` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `message_ibfk_2` FOREIGN KEY (`messageUserName`) REFERENCES `user_info` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `message_ibfk_3` FOREIGN KEY (`beMessageUserId`) REFERENCES `user_info` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `message_ibfk_4` FOREIGN KEY (`messageUserImg`) REFERENCES `user_info` (`headPicture`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES ('1', '1', 'gaoyang', '小胖l love you', null, '2');

-- ----------------------------
-- Table structure for privateletter
-- ----------------------------
DROP TABLE IF EXISTS `privateletter`;
CREATE TABLE `privateletter` (
  `privateLetterId` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '私信Id',
  `privateLetterContent` varchar(225) DEFAULT NULL COMMENT '私信内容',
  `privateLetterType` int(1) NOT NULL DEFAULT '0' COMMENT '私信类型,默认为0,私信',
  `acceptStatus` int(1) NOT NULL DEFAULT '0' COMMENT '接受状态,默认为0',
  `sendTime` datetime DEFAULT NULL COMMENT '发送时间',
  `sendId` int(1) unsigned NOT NULL COMMENT '发送者Id',
  `acceptId` int(1) unsigned NOT NULL COMMENT '接收者Id',
  PRIMARY KEY (`privateLetterId`),
  KEY `sendId` (`sendId`),
  KEY `acceptId` (`acceptId`),
  CONSTRAINT `privateletter_ibfk_1` FOREIGN KEY (`sendId`) REFERENCES `user_info` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `privateletter_ibfk_2` FOREIGN KEY (`acceptId`) REFERENCES `user_info` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of privateletter
-- ----------------------------

-- ----------------------------
-- Table structure for reply
-- ----------------------------
DROP TABLE IF EXISTS `reply`;
CREATE TABLE `reply` (
  `replyId` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '回复Id',
  `rcommentId` int(11) unsigned NOT NULL COMMENT '评论Id',
  `replyUserId` int(11) unsigned NOT NULL COMMENT '回复人Id',
  `replyContent` varchar(225) DEFAULT NULL COMMENT '回复内容',
  `replyHead` varchar(225) DEFAULT NULL COMMENT '回复头像',
  `replyCreatTime` datetime DEFAULT NULL COMMENT '回复时间',
  PRIMARY KEY (`replyId`),
  KEY `replyUserId` (`replyUserId`),
  KEY `replyHead` (`replyHead`),
  CONSTRAINT `reply_ibfk_1` FOREIGN KEY (`replyUserId`) REFERENCES `user_info` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `reply_ibfk_2` FOREIGN KEY (`replyHead`) REFERENCES `user_info` (`headPicture`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of reply
-- ----------------------------

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info` (
  `userId` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户Id',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `userPassword` varchar(32) NOT NULL COMMENT '用户密码',
  `sex` varchar(1) NOT NULL DEFAULT '' COMMENT '用户性别',
  `place` varchar(225) DEFAULT NULL COMMENT '地区',
  `userCreatTim` datetime DEFAULT NULL COMMENT '账号创建时间',
  `headPicture` varchar(225) DEFAULT NULL COMMENT '用户头像',
  `messagePower` int(1) NOT NULL DEFAULT '0' COMMENT '留言权限，默认为0(0为公开)',
  `visitPower` int(1) NOT NULL DEFAULT '0' COMMENT '访问权限，默认为0公开',
  `isAdmin` int(1) NOT NULL DEFAULT '0' COMMENT '是否为管理员，默认为0，用户',
  `birthday` date DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`userId`),
  KEY `username` (`username`),
  KEY `headPicture` (`headPicture`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES ('1', 'gaoyang', '123456', '男', '广东', '2018-07-25 10:29:46', null, '0', '0', '0', '2000-01-25', null);
INSERT INTO `user_info` VALUES ('2', 'ljn', '123456', '男', '广东', '2018-07-25 10:47:57', null, '0', '0', '0', null, null);
INSERT INTO `user_info` VALUES ('3', 'lll', '123456', '', null, null, null, '0', '0', '0', null, null);
INSERT INTO `user_info` VALUES ('4', 'www', '123', '', null, null, null, '0', '0', '0', null, null);
INSERT INTO `user_info` VALUES ('5', 'qqq', '123', '', null, null, null, '0', '0', '0', null, null);
INSERT INTO `user_info` VALUES ('6', 'wwwe', '123', '', null, null, null, '0', '0', '0', null, null);
INSERT INTO `user_info` VALUES ('7', 'asd', 'qweqwedqw', '', null, null, null, '0', '0', '0', null, null);
INSERT INTO `user_info` VALUES ('8', 'ssss', 'dddas', '', null, null, null, '0', '0', '0', null, null);
INSERT INTO `user_info` VALUES ('9', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '', null, null, null, '0', '0', '0', null, null);
INSERT INTO `user_info` VALUES ('10', 'admin2', 'E10ADC3949BA59ABBE56E057F20F883E', '男', null, '2018-08-29 11:51:00', null, '0', '0', '0', null, '1075869729@qq.com');

-- ----------------------------
-- Table structure for word
-- ----------------------------
DROP TABLE IF EXISTS `word`;
CREATE TABLE `word` (
  `wordId` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '过滤词汇Id',
  `words` varchar(32) NOT NULL COMMENT '过滤词汇',
  PRIMARY KEY (`wordId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of word
-- ----------------------------
