package com.ecjtu.jy.dao.impl;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import com.ecjtu.jy.dao.IImgTxtInfoDao;
import com.ecjtu.jy.pojo.ImgTxtInfo;
import com.ecjtu.jy.utils.C3P0Util;
import com.ecjtu.jy.utils.JdbcUtils;
import com.ecjtu.jy.utils.Page;;

public class ImgTxtInfoDaoImpl implements IImgTxtInfoDao {

	static Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	
	@Override
	public int insertImgTxtInfo(ImgTxtInfo imgTxt) {
		int result = 0;
		String sql = "insert into imgtxt_info(imgTxtId,imgUrl,text,sendId,"
				+ "imgTxtSendTime,sendPlace,imgTxtPowerStatus) values(?,?,?,?,?,?,?)";
		try {
			conn = C3P0Util.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, imgTxt.getImgTxtId());
			ps.setString(2, imgTxt.getImgUrl());
			ps.setString(3, imgTxt.getText());
			ps.setInt(4, imgTxt.getSendId());
			ps.setTimestamp(5, imgTxt.getImgTxtSendTime());
			ps.setString(6, imgTxt.getSendPlace());
			ps.setInt(7, imgTxt.getImgTxtPowerStatus());
			result = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JdbcUtils.closePCR(conn, ps, rs);
		}
		
		return result;
	}

	@Override
	public int deleteImgTxtInfoById(int id) {
		
		int result = 0;
		try {
			conn = C3P0Util.getConnection();
			ps = conn.prepareStatement("delete from imgtxt_info where imgTxtId=?");
			ps.setInt(1, id);
			result = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JdbcUtils.closePCR(conn, ps, rs);
		}
		
		return result;
	}

	@Override
	public List<ImgTxtInfo> selectImgTxtByPageNum(int pageNum, int id) {
		List<ImgTxtInfo> imgTxtInfos = new ArrayList<>();
		int page = (pageNum-1)*Page.IMGTXTPAGE_NUM;
		try {
			conn = conn = C3P0Util.getConnection();
			ps = conn.prepareStatement("select * from imgtxt_Info where sendId=? group by imgTxtId DESC limit ?,?");
			ps.setInt(1,id);
			ps.setInt(2,page);
			ps.setInt(3, Page.IMGTXTPAGE_NUM);
			rs = ps.executeQuery();
			while(rs.next()) {
				ImgTxtInfo imgTxtInfo = new ImgTxtInfo();
				imgTxtInfo.setImgTxtId(rs.getInt("imgTxtId"));
				imgTxtInfo.setImgUrl(rs.getString("imgUrl"));
				imgTxtInfo.setText(rs.getString("text"));
				imgTxtInfo.setSendId(rs.getInt("sendId"));
				imgTxtInfo.setImgTxtSendTime(rs.getTimestamp("imgTxtSendTime"));
				imgTxtInfo.setSendPlace(rs.getString("sendPlace"));
				imgTxtInfo.setImgTxtPowerStatus(rs.getInt("imgtxtPowerStatus"));
				imgTxtInfos.add(imgTxtInfo);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JdbcUtils.closePCR(conn, ps, rs);
		}
		return imgTxtInfos;
	}

	@Override
	public int selectImgTxtSum(int id) {
		int sum = 0;
		try {
			conn = C3P0Util.getConnection();
			ps = conn.prepareStatement("select count(sendId) count from imgtxt_info where sendId=?");
			ps.setInt(1, id);
			rs = ps.executeQuery();
			while (rs.next()) {
				sum=rs.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JdbcUtils.closePCR(conn, ps, rs);
		}
		return sum;
	}

	@Override
	public ImgTxtInfo selectImgTxtById(int id) {
		ImgTxtInfo imgTxtInfo = new ImgTxtInfo();
		try {
			conn = C3P0Util.getConnection();
			ps = conn.prepareStatement("select * from imgtxt_info where imgTxtId=?");
			ps.setInt(1, id);
			rs = ps.executeQuery();
			while(rs.next()) {
				imgTxtInfo.setImgTxtId(rs.getInt("imgTxtId"));
				imgTxtInfo.setImgUrl(rs.getString("imgUrl"));
				imgTxtInfo.setText(rs.getString("text"));
				imgTxtInfo.setSendId(rs.getInt("sendId"));
				imgTxtInfo.setImgTxtSendTime(rs.getTimestamp("imgTxtSendTime"));
				imgTxtInfo.setSendPlace(rs.getString("sendPlace"));
				imgTxtInfo.setImgTxtPowerStatus(rs.getInt("imgtxtPowerStatus"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JdbcUtils.closePCR(conn, ps, rs);
		}
		return imgTxtInfo;
	}

	@Override
	public List<ImgTxtInfo> selectImgTxtByHot(int pageNum, int id) {
		List<ImgTxtInfo> imgTxtInfos = new ArrayList<>();
		String sql = "select * from imgtxt_info i, " + 
				"(SELECT COUNT(laudId),laudImgTxtId FROM laud  GROUP BY laudImgTxtId HAVING COUNT(laudId) ORDER by COUNT(laudId) deSC) id " + 
				"WHERE i.imgTxtId = id.laudImgTxtId LIMIT ?,?";
		int page = (pageNum-1)*Page.IMGTXTPAGE_NUM;
		
		try {
			conn = C3P0Util.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setInt(1,page);
			ps.setInt(2, Page.IMGTXTPAGE_NUM);
			rs = ps.executeQuery();
			while(rs.next()) {
				ImgTxtInfo imgTxtInfo = new ImgTxtInfo();
				imgTxtInfo.setImgTxtId(rs.getInt("imgTxtId"));
				imgTxtInfo.setImgUrl(rs.getString("imgUrl"));
				imgTxtInfo.setText(rs.getString("text"));
				imgTxtInfo.setSendId(rs.getInt("sendId"));
				imgTxtInfo.setImgTxtSendTime(rs.getTimestamp("imgTxtSendTime"));
				imgTxtInfo.setSendPlace(rs.getString("sendPlace"));
				imgTxtInfo.setImgTxtPowerStatus(rs.getInt("imgtxtPowerStatus"));
				imgTxtInfos.add(imgTxtInfo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return imgTxtInfos;
	}

	@Override
	public List<ImgTxtInfo> selectImgTxtByComment(int pageNum, int id) {
		List<ImgTxtInfo> imgTxtInfos = new ArrayList<>();
		String sql = "select * from imgtxt_info i, " + 
				"(SELECT COUNT(commentId),comImgTxtId FROM acomment GROUP BY comImgTxtId HAVING COUNT(commentId) ORDER by COUNT(commentId) DESC) id " + 
				"WHERE i.imgTxtId = id.comImgTxtId LIMIT ?,?";
		int page = (pageNum-1)*Page.IMGTXTPAGE_NUM;
		
		try {
			conn = C3P0Util.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setInt(1,page);
			ps.setInt(2, Page.IMGTXTPAGE_NUM);
			rs = ps.executeQuery();
			while(rs.next()) {
				ImgTxtInfo imgTxtInfo = new ImgTxtInfo();
				imgTxtInfo.setImgTxtId(rs.getInt("imgTxtId"));
				imgTxtInfo.setImgUrl(rs.getString("imgUrl"));
				imgTxtInfo.setText(rs.getString("text"));
				imgTxtInfo.setSendId(rs.getInt("sendId"));
				imgTxtInfo.setImgTxtSendTime(rs.getTimestamp("imgTxtSendTime"));
				imgTxtInfo.setSendPlace(rs.getString("sendPlace"));
				imgTxtInfo.setImgTxtPowerStatus(rs.getInt("imgtxtPowerStatus"));
				imgTxtInfos.add(imgTxtInfo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return imgTxtInfos;
	}

}
