package com.ecjtu.jy.pojo;

import java.sql.Date;
import java.sql.Timestamp;

/**
 * 用户实体类
 * @author 建伟
 * @date 20180724
 * @version 1.0
 * 
 */
public class UserInfo {

	private Integer userId;				//ID
	private String username;			//用户名
	private String password;			//密码
	private String sex;					//性别
	private String place;				//地区， 
	private Timestamp userCreateTime;	//用户创建时间
	private String headPicture;			//头像
	private Integer messagePower;		//留言权限,  
	private Integer visitPower;			//访问权限
	private Integer isAdmin;			//标识符【是否为管理员】
	private String email;
	private Date birthday;
	public UserInfo(Integer userId, String username, String password, String sex, String place,
			Timestamp userCreateTime, String headPicture, Integer messagePower, Integer visitPower, Integer isAdmin,String email) {
		super();
		this.userId = userId;
		this.username = username;
		this.password = password;
		this.sex = sex;
		this.place = place;
		this.userCreateTime = userCreateTime;
		this.headPicture = headPicture;
		this.messagePower = messagePower;
		this.visitPower = visitPower;
		this.isAdmin = isAdmin;
		this.email = email;
	}
	public UserInfo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getPlace() {
		return place;
	}
	public void setPlace(String place) {
		this.place = place;
	}
	public Timestamp getUserCreateTime() {
		return userCreateTime;
	}
	public void setUserCreateTime(Timestamp userCreateTime) {
		this.userCreateTime = userCreateTime;
	}
	public String getHeadPicture() {
		return headPicture;
	}
	public void setHeadPicture(String headPicture) {
		this.headPicture = headPicture;
	}
	public Integer getMessagePower() {
		return messagePower;
	}
	public void setMessagePower(Integer messagePower) {
		this.messagePower = messagePower;
	}
	public Integer getVisitPower() {
		return visitPower;
	}
	public void setVisitPower(Integer visitPower) {
		this.visitPower = visitPower;
	}
	public Integer getIsAdmin() {
		return isAdmin;
	}
	public void setIsAdmin(Integer isAdmin) {
		this.isAdmin = isAdmin;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	@Override
	public String toString() {
		return "UserInfo [userId=" + userId + ", username=" + username + ", password=" + password + ", sex=" + sex
				+ ", place=" + place + ", userCreateTime=" + userCreateTime + ", headPicture=" + headPicture
				+ ", messagePower=" + messagePower + ", visitPower=" + visitPower + ", isAdmin=" + isAdmin + ", email="
				+ email + "]";
	}

	
	
}
