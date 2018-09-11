package com.ecjtu.jy.pojo;

import java.sql.Timestamp;

/**
 * 回复表实体类
 * @author 建伟
 * @date 20170724
 * @version 1.0
 */
public class Reply {

	private Integer replyId;		//回复ID
	private Integer commentId;		//评论ID
	private Integer replyerId;		//回复人ID
	private String repreplyContent;	//回复内容
	private Timestamp replyTime; 	//回复时间
	public Reply(Integer replyId, Integer commentId, Integer replyerId, String repreplyContent, Timestamp replyTime) {
		super();
		this.replyId = replyId;
		this.commentId = commentId;
		this.replyerId = replyerId;
		this.repreplyContent = repreplyContent;
		this.replyTime = replyTime;
	}
	public Reply() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "Reply [replyId=" + replyId + ", commentId=" + commentId + ", replyerId=" + replyerId
				+ ", repreplyContent=" + repreplyContent + ", replyTime=" + replyTime + "]";
	}
	public Integer getReplyId() {
		return replyId;
	}
	public void setReplyId(Integer replyId) {
		this.replyId = replyId;
	}
	public Integer getCommentId() {
		return commentId;
	}
	public void setCommentId(Integer commentId) {
		this.commentId = commentId;
	}
	public Integer getReplyerId() {
		return replyerId;
	}
	public void setReplyerId(Integer replyerId) {
		this.replyerId = replyerId;
	}
	public String getRepreplyContent() {
		return repreplyContent;
	}
	public void setRepreplyContent(String repreplyContent) {
		this.repreplyContent = repreplyContent;
	}
	public Timestamp getReplyTime() {
		return replyTime;
	}
	public void setReplyTime(Timestamp replyTime) {
		this.replyTime = replyTime;
	}
	
	
	
}
