package com.ecjtu.jy.dao.impl;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.sql.DataSource;
import com.ecjtu.jy.dao.IFollowDao;
import com.ecjtu.jy.pojo.Follow;
import com.ecjtu.jy.utils.C3P0Util;
import com.ecjtu.jy.utils.JdbcUtils;
import com.ecjtu.jy.utils.Page;


public class FollowDaoImpl implements IFollowDao {
	static Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	@Override
	public List<Follow> selectFollowByPageNum(int pageNum, int id, int type) {
		List<Follow> follows = new ArrayList<>();
		int page = (pageNum-1)*Page.COMMON_NUM;
		try {
			conn = conn = C3P0Util.getConnection();
			if (type == 0) {
				ps = conn.prepareStatement("select * from follow where followerid=? limit ?,?");
			}else {
				ps = conn.prepareStatement("select * from follow where befollowerid=? limit ?,?");
			}
			ps.setInt(1,id);
			ps.setInt(2,page);
			ps.setInt(3, Page.COMMON_NUM);
			rs = ps.executeQuery();
			while(rs.next()) {
				Follow follow = new Follow();
				follow.setId(rs.getInt("id"));
				follow.setFollowerId(rs.getInt("followerid"));
				follow.setBeFollowerId(rs.getInt("befollowerid"));
				follow.setFollowTime(rs.getTimestamp("ftime"));
//				follow.setFollowerName(rs.getString("followerName"));
//				follow.setFollowerImg(rs.getString("followImg"));
				follows.add(follow);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JdbcUtils.closePCR(conn, ps, rs);
		}
		
		return follows;
	}

	@Override
	public int selectFollowUserCount(int id, int type) {
		int count = 0;
		try {
			conn = C3P0Util.getConnection();
			
			if (type == 0) {
				ps = conn.prepareStatement("select count(id) count from follow where followerid=?");
			}else {
				ps = conn.prepareStatement("select count(id) count from follow where befollowerid=?");
			}
			
			ps.setInt(1, id);
			rs = ps.executeQuery();
			while (rs.next()) {
				count=rs.getInt("count");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JdbcUtils.closePCR(conn, ps, rs);
		}
		return count;
	}

	@Override
	public Follow selectFollowById(int id, int type) {
		Follow follow = new Follow();
		try {
			conn = C3P0Util.getConnection();
			
			if (type == 0) {
				ps = conn.prepareStatement("select * from follow where followerid=?");
			}else {
				ps = conn.prepareStatement("select * from follow where befollowerid=?");
			}
			
			ps.setInt(1, id);
			rs = ps.executeQuery();
			while (rs.next()) {
				follow.setId(rs.getInt("id"));
				follow.setFollowerId(rs.getInt("followerid"));
				follow.setBeFollowerId(rs.getInt("befollowerid"));
				follow.setFollowTime(rs.getTimestamp("ftime"));
//				follow.setFollowerName(rs.getString("followerName"));
//				follow.setFollowerImg(rs.getString("followImg"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JdbcUtils.closePCR(conn, ps, rs);
		}
		
		
		return follow;
	}

	@Override
	public int deleteFollowById(int id) {
		int result = 0;
		try {
			conn = C3P0Util.getConnection();
			ps = conn.prepareStatement("delete from follow where id=?");
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
	public int insertFollow(Follow follow) {
		String insert_sql="insert into follow(id,followerid,befollowerid,ftime,followerName,followerImg) values(?,?,?,?,?,?)";
		String insert_sql2="insert into follow(id,followerid,befollowerid,ftime) values(?,?,?,?)";
		int result = 0 ;
		try {
			//
			conn = C3P0Util.getConnection();
			ps = conn.prepareStatement(insert_sql2);
			ps.setInt(1, follow.getId());
			ps.setInt(2, follow.getFollowerId());
			ps.setInt(3, follow.getBeFollowerId());
			ps.setTimestamp(4, follow.getFollowTime());
//			ps.setString(5, follow.getFollowerName());
//			ps.setString(6, follow.getFollowerImg());
			result = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JdbcUtils.closePCR(conn,ps,rs);
		}	
		return result;
	}

}
