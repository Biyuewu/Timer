package com.ecjtu.jy.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import com.ecjtu.jy.dao.IUserInfoDao;
import com.ecjtu.jy.pojo.UserInfo;
import com.ecjtu.jy.utils.C3P0Util;
import com.ecjtu.jy.utils.JdbcUtils;

public class UserInfoImpl implements IUserInfoDao{

	
	
	
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	@Override
	public UserInfo selectUserByPassAndUserName(String userName, String password) {
		UserInfo userInfo = null;
		try {
			conn = C3P0Util.getConnection();
			ps = conn.prepareStatement("select * form user_info where username=? and userPassword=?");
			ps.setString(1, userName);
			ps.setString(2, password);
			rs = ps.executeQuery();
			if (rs.next()){
				userInfo = new UserInfo(rs.getInt("userid"),rs.getString("username"),rs.getString("userpassword"),rs.getString("sex"), rs.getString("place"), rs.getTimestamp("userCreatTim"), rs.getString("headPicture"), rs.getInt("messagePower"), rs.getInt("visitPower"), rs.getInt("isAdmin"),rs.getString(" email"));
			}
			/**
			 * rs.getDate("") 数据库里的类型为Date
			 * rs.getTimestamp("") 数据库里的类型为DateTIme
			 * 
			 */
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			JdbcUtils.closePCR(conn, ps, rs);
		}
		return userInfo;
	}

	@Override
	public int validateUserName(String userName) {
		
		return 0;
	}

	@Override
	public int validateEmail(String email) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public UserInfo selectUserById(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<UserInfo> selectUsersById(String likeName) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertUser(UserInfo user) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateUserImg(String img) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateUserInfo(UserInfo user) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateUserMessagePower(int id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateUserVisitPower(int id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteUser(int id) {
		// TODO Auto-generated method stub
		return 0;
	}

}
