package com.ecjtu.jy.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ecjtu.jy.dao.IWordDao;
import com.ecjtu.jy.pojo.Word;
import com.ecjtu.jy.utils.C3P0Util;
import com.ecjtu.jy.utils.JdbcUtils;
import com.ecjtu.jy.utils.Page;

public class WordDaoImpl implements IWordDao{

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
	public int insertWord(Word word) {
		String sql="insert into word values(?,?)";
		int result=0;
		try {
			ps=conn.prepareStatement(sql);
			ps.setInt(1, word.getWordId());
			ps.setString(2, word.getWords());
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
	public int deleteWord(int id) {
		String sql="delete from word where wordId=?";
		int result=0;
		try {
			ps=conn.prepareStatement(sql);
			ps.setInt(1, id);
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
	public int updateWord(Word word) {
		String sql="update word set words=? where wordId=?";
		int result=0;
		try {
			ps=conn.prepareStatement(sql);
			ps.setString(1, word.getWords());
			ps.setInt(2, word.getWordId());
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
	public List<Word> selectWordByPageNum(int pageNum) {
		List<Word> words=new ArrayList<Word>();
		String sql="select * from word order by wordId limit ?,?";
		try {
			ps=conn.prepareStatement(sql);
			ps.setInt(1, (pageNum-1)*Page.COMMON_NUM);
			ps.setInt(2, Page.COMMON_NUM);
			rs=ps.executeQuery();
			while(rs.next()){
				Word word=new Word();
				word.setWordId(rs.getInt("wordId"));
				word.setWords(rs.getString("words"));
				words.add(word);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JdbcUtils.closePCR(conn, ps, rs);
		}
		return words;
	}

	@Override
	public int selectWordCount() {
		String sql="select count(wordId) from word";
		int count=0;
		try {
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next()){
				count=rs.getInt("count(wordId)");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JdbcUtils.closePCR(conn, ps, rs);
		}
		return count;
	}

}
