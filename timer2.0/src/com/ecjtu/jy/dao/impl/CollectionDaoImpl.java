package com.ecjtu.jy.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import com.ecjtu.jy.pojo.Collection;
import java.util.List;

import com.ecjtu.jy.dao.ICollectionDao;
import com.ecjtu.jy.utils.C3P0Util;
import com.ecjtu.jy.utils.JdbcUtils;
import com.ecjtu.jy.utils.Page;

public class CollectionDaoImpl implements ICollectionDao {
	
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	@Override
	public List<Collection> selectCollectionByPage(int page, int id) {
		List<Collection> collections = new ArrayList<>();
		try {
			conn = C3P0Util.getConnection();
			ps = conn.prepareStatement("select * from collection where collectorId=? limit ?,?");
			ps.setInt(1, id);
			ps.setInt(2, (page-1)*Page.COMMON_NUM);
			ps.setInt(3, Page.COMMON_NUM);
			rs = ps.executeQuery();
			while (rs.next()) {
				Collection collection = new Collection();
				collection.setCollectionId(rs.getInt("collectionId"));
				collection.setCollectorId(rs.getInt("collectorId"));
				collection.setCollectionImgTxtId(rs.getInt("collectionImgTxtId"));
				collection.setCollectionCreatTime(rs.getTimestamp("collectionCreatTime"));
				collections.add(collection);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JdbcUtils.closePCR(conn, ps, rs);
		}
		return collections;
	}

	@Override
	public int selectCollectionPageSum(int id) {
		int count = 0;
		try {
			conn = C3P0Util.getConnection();
			ps = conn.prepareStatement("select count(*) from collection ");
			rs = ps.executeQuery();
			if (rs.next()) {
				count = rs.getInt(1);//对收藏总数赋值
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JdbcUtils.closePCR(conn, ps, rs);
		}
		return count;
	}

	@Override
	public int insertCollection(Collection collection) {
		int result = 0;
		try {
			conn = C3P0Util.getConnection();
			ps = conn.prepareStatement("insert into collection(collectionId,collectorId) values(?,?)");
			ps.setInt(1, collection.getCollectionId());
			ps.setInt(2, collection.getCollectorId());
			result = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JdbcUtils.closePCR(conn, ps, rs);
		}
		return result;
	}

	@Override
	public int deleteCollection(int id) {
		int result = 0;
		try {
			conn = C3P0Util.getConnection();
			ps = conn.prepareStatement("delete from collection where collectorId = ?");
			ps.setInt(1, id);
			result = ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JdbcUtils.closePCR(conn, ps, rs);
		}
		return result;
	}

}
