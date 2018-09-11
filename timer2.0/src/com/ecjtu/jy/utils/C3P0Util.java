package com.ecjtu.jy.utils;

import java.sql.Connection;
import java.sql.SQLException;

import javax.sql.DataSource;

import com.mchange.v2.c3p0.ComboPooledDataSource;

/**
 * @author : yao
 * @date 创建时间：2017年7月24日 上午11:11:34
 * @version 1.0
 * 
 */
public class C3P0Util {
	static DataSource ds;

	static {
		 ds = new ComboPooledDataSource();
	}

	public static Connection getConnection() throws SQLException {

		return ds.getConnection();
	}

}
