package com.ecjtu.jy.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ecjtu.jy.dao.ILaudDao;
import com.ecjtu.jy.pojo.Laud;
import com.ecjtu.jy.utils.C3P0Util;
import com.ecjtu.jy.utils.JdbcUtils;

public class LaudDaoImpl implements ILaudDao{

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
	public int insertLaud(Laud laud) {
		String sql="insert into laud values(?,?,?,?)";
		int result=0;
		try {
			ps=conn.prepareStatement(sql);
			ps.setInt(1, laud.getLaudId());
			ps.setInt(2, laud.getLaudImgTxtId());
			ps.setInt(3, laud.getBeLaudId());
			ps.setString(4, laud.getBeLaudName());
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
	public int deleteLaud(int txtid,int userid) {
		String sql="delete from laud where laudimgtxtid=? and belaudid =?";
		int result=0;
		try {
			ps=conn.prepareStatement(sql);
			ps.setInt(1, txtid);
			ps.setInt(2, userid);
			result=ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JdbcUtils.closePC(conn, ps);
		}
		return result;
	}

	@Override
	public int selectLaudCount(int txtid) {
		String sql="select count(laudId) from laud where laudImgTxtId=?";
		int count=0;
		try {
			ps=conn.prepareStatement(sql);
			ps.setInt(1, txtid);
			rs=ps.executeQuery();
			while(rs.next()){
				count=rs.getInt("count(laudId)");
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
	public List<Laud> selectLaud(int txtid) {
		List<Laud> lauds=new ArrayList<Laud>();
		String sql="select * from laud where laudImgTxtId=? limit 0,5";
		try {
			ps=conn.prepareStatement(sql);
			ps.setInt(1, txtid);
			rs=ps.executeQuery();
			while(rs.next()){
				Laud laud=new Laud();
				laud.setLaudId(rs.getInt("laudId"));
				laud.setLaudImgTxtId(rs.getInt("laudImgTxtId"));
				laud.setBeLaudId(rs.getInt("beLaudId"));
				laud.setBeLaudName(rs.getString("beLaudName"));
				lauds.add(laud);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JdbcUtils.closePCR(conn, ps, rs);
		}
		return lauds;
	}

	@Override
	public int isLaud(int userid, int txtid) {
		String sql="select * from laud where laudImgTxtId=? and beLaudId =?";
		int result=0;
		try {
			ps=conn.prepareStatement(sql);
			ps.setInt(1, txtid);
			ps.setInt(2, userid);
			rs=ps.executeQuery();
			if (rs.next()) {
				result=1;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}


}
