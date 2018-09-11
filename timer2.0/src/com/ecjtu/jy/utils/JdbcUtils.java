package com.ecjtu.jy.utils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.sql.DataSource;

import org.apache.commons.dbutils.QueryRunner;



import com.mchange.v2.c3p0.ComboPooledDataSource;

/**
 * ��װ���õĲ���
 * 
 *
 */
public class JdbcUtils {

	// ��ʼ�����ӳ�
	private static DataSource dataSource;
	static {
		dataSource = new ComboPooledDataSource();
	}
	
	public static DataSource getDataSource() {
		return dataSource;
	}
	
	/**
	 * ����DbUtils���ù��������
	 */
	public static QueryRunner getQuerrRunner() {
		return new QueryRunner(dataSource);
	}
	
	/**
	 * �ر�Connection conn,PreparedStatement ps
	 * @param conn
	 * @param ps
	 */
	public static void closePC(Connection conn,PreparedStatement ps){
		
		try {
			if (ps != null){
				ps.close();
			}
			
			if (conn != null){
				conn.close();
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	/**
	 * �ر�Connection conn,PreparedStatement ps,ResultSet rs
	 * @param conn
	 * @param ps
	 * @param rs
	 */
	public static void closePCR(Connection conn,PreparedStatement ps,ResultSet rs){
		
		try {
			if (rs != null){
				rs.close();
			}
			closePC(conn, ps);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
}








