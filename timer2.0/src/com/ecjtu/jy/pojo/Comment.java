package com.ecjtu.jy.pojo;

import java.util.Date;

/**
 * 评论表
 * @author 建伟
 * @date 20180724
 * @version 1.0
 */
public class Comment {
	private Integer commentId;     //评论ID
	private Integer comImgTxtId;   //图文消息ID
	private Integer replyerId;	   //回复人ID
	private String comreplyContent;//回复内容
	private Integer replyHead;	   //回复人头像
	private Date createTime;	   //创建时间
	public Comment() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Comment(Integer commentId, Integer comImgTxtId, Integer replyerId, String comreplyContent, Integer replyHead,
			Date createTime) {
		super();
		this.commentId = commentId;
		this.comImgTxtId = comImgTxtId;
		this.replyerId = replyerId;
		this.comreplyContent = comreplyContent;
		this.replyHead = replyHead;
		this.createTime = createTime;
	}
	public Integer getCommentId() {
		return commentId;
	}
	public void setCommentId(Integer commentId) {
		this.commentId = commentId;
	}
	public Integer getComImgTxtId() {
		return comImgTxtId;
	}
	public void setComImgTxtId(Integer comImgTxtId) {
		this.comImgTxtId = comImgTxtId;
	}
	public Integer getReplyerId() {
		return replyerId;
	}
	public void setReplyerId(Integer replyerId) {
		this.replyerId = replyerId;
	}
	public String getComreplyContent() {
		return comreplyContent;
	}
	public void setComreplyContent(String comreplyContent) {
		this.comreplyContent = comreplyContent;
	}
	public Integer getReplyHead() {
		return replyHead;
	}
	public void setReplyHead(Integer replyHead) {
		this.replyHead = replyHead;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	@Override
	public String toString() {
		return "Comment [commentId=" + commentId + ", comImgTxtId=" + comImgTxtId + ", replyerId=" + replyerId
				+ ", comreplyContent=" + comreplyContent + ", replyHead=" + replyHead + ", createTime=" + createTime
				+ "]";
	}
	
	
	
}
