package com.ecjtu.jy.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ecjtu.jy.dao.IPrivateLetterDao;
import com.ecjtu.jy.pojo.PrivateLetter;
import com.ecjtu.jy.utils.C3P0Util;
import com.ecjtu.jy.utils.JdbcUtils;
import com.ecjtu.jy.utils.Page;

public class PrivateLetterDaoImpl implements IPrivateLetterDao{

	static Connection conn;
	PreparedStatement ps;
	ResultSet rs;
	static{
		try {
			conn=C3P0Util.getConnection();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	@Override
	public int insertPrivateLetter(PrivateLetter letter) {
		String sql="insert into privateletter values(?,?,?,?,?,?,?)";
		int result=0;
		try {
			ps=conn.prepareStatement(sql);
			ps.setInt(1, letter.getPrivateLetterId());
			ps.setString(2, letter.getPrivateLetterContents());
			ps.setInt(3, letter.getPrivateLetterType());
			ps.setInt(4, letter.getAcceptStatus());
			ps.setObject(5, letter.getSendTime());
			ps.setInt(6, letter.getSenderId());
			ps.setInt(7, letter.getAcceptId());
			result=ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JdbcUtils.closePC(conn, ps);
		}
		return result;
	}

	@Override
	public int deletePrivateLetter(int user1id, int user2id) {
		String sql="delete from privateletter where sendId=? and acceptId=?";
		int result=0;
		try {
			ps=conn.prepareStatement(sql);
			ps.setInt(1, user1id);
			ps.setInt(2, user2id);
			result=ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JdbcUtils.closePC(conn, ps);
		}
		return result;
	}

	@Override
	public int deletePrivateLetterById(int letterid) {
		String sql="delete from privateletter where privateLetterId=?";
		int result=0;
		try {
			ps=conn.prepareStatement(sql);
			ps.setInt(1, letterid);
			result=ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JdbcUtils.closePC(conn, ps);
		}
		return result;
	}

	@Override
	public List<PrivateLetter> selectLetterByPageNum(int pageNum, int userid) {
		List<PrivateLetter> letters=new ArrayList<PrivateLetter>();
		String sql="select * from privateletter where sendId=? order by sendId limit ?,? ";
		try {
			ps=conn.prepareStatement(sql);
			ps.setInt(1, userid);
			ps.setInt(2, (pageNum-1)*Page.COMMON_NUM);
			ps.setInt(3, Page.COMMON_NUM);
			rs=ps.executeQuery();
			while(rs.next()){
				PrivateLetter letter=new PrivateLetter();
				letter.setPrivateLetterId(rs.getInt("privateLetterId"));
				letter.setPrivateLetterContents(rs.getString("privateLetterContent"));
				letter.setPrivateLetterType(rs.getInt("privateLetterType"));
				letter.setAcceptStatus(rs.getInt("acceptStatus"));
				letter.setSendTime(rs.getTimestamp("sendTime"));
				letter.setSenderId(rs.getInt("sendId"));
				letter.setAcceptId(rs.getInt("acceptId"));
				letters.add(letter);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JdbcUtils.closePC(conn, ps);
		}
		return letters;
	}

	@Override
	public int selectLetterCount(int userid) {
		String sql="select count(privateLetterId) from privateletter where sendId=?";
		int count=0;
		try {
			ps=conn.prepareStatement(sql);
			ps.setInt(1, userid);
			rs=ps.executeQuery();
			while(rs.next()){
				count=rs.getInt("count(privateLetterId)");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JdbcUtils.closePCR(conn, ps, rs);
		}
		return count;
	}

	@Override
	public int selectLetterCountByNotRead(int userid) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int selectLetterCountByIsRead(int userid) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<PrivateLetter> selectLetterByPageNum(int pageNum, int userid, int type) {
		// TODO Auto-generated method stub
		return null;
	}

	
}
