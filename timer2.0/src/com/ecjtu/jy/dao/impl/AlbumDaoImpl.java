package com.ecjtu.jy.dao.impl;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ecjtu.jy.dao.IAlbumDao;
import com.ecjtu.jy.pojo.Album;
import com.ecjtu.jy.utils.C3P0Util;
import com.ecjtu.jy.utils.JdbcUtils;

public class AlbumDaoImpl implements IAlbumDao {
	
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	@Override
	public List<Album> selectAlbumById(int id) {
		List<Album> albums = new ArrayList<>();
		try {
			conn = C3P0Util.getConnection();
			ps = conn.prepareStatement("select * from album where albumId = ?");
			ps.setInt(1, id);
			rs = ps.executeQuery();
			while (rs.next()) {
				Album album = new Album();
				album.setAlbumId(rs.getInt("albumId"));
				album.setAlbumName(rs.getString("albumName"));
				album.setAlbumCreatTime(rs.getTimestamp("albumCreatTime"));
				album.setAlbumCreatorId(rs.getInt("albumCreatorId"));
				album.setAlbumPowerStatus(rs.getInt("albumPowerStatus"));
				albums.add(album);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JdbcUtils.closePCR(conn, ps, rs);
		}
		return albums;
	}

	@Override
	public int insertAlbum(Album album) {
		int result = 0;
		try {
			conn = C3P0Util.getConnection();
			ps = conn.prepareStatement("insert into album(albumId,albumName,albumCreatTime,albumCreatorId,albumPowerStatus) values(?,?,?,?,?)");
			ps.setInt(1, album.getAlbumId());
			ps.setString(2, album.getAlbumName());
			ps.setTimestamp(3,album.getAlbumCreatTime());
			ps.setInt(4, album.getAlbumCreatorId());
			ps.setInt(5, album.getAlbumPowerStatus());
			result = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JdbcUtils.closePCR(conn, ps, rs);
		}
		return result;
	}

	@Override
	public int deleteAlbum(int id) {
		int result = 0;
		try {
			conn = C3P0Util.getConnection();
			ps = conn.prepareStatement("delete from album where albumId=?");
			ps.setInt(1, id);
			result = ps.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			JdbcUtils.closePCR(conn, ps, rs);
		}
		return result;
	}

	@Override
	public int updateAlbum(Album album) {
		int result = 0;
		try {
			conn = C3P0Util.getConnection();
			ps = conn.prepareStatement("update album set albumName=?,albumCreatTime=?,albumCreatorId=?,albumPowerStatus=? where albumId = ?");
			ps.setString(1, album.getAlbumName());
			ps.setTimestamp(2, album.getAlbumCreatTime());
			ps.setInt(3, album.getAlbumCreatorId());
			ps.setInt(4, album.getAlbumPowerStatus());
			ps.setInt(5, album.getAlbumId());
			result = ps.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			JdbcUtils.closePCR(conn, ps, rs);
		}
		return result;
	}

}
