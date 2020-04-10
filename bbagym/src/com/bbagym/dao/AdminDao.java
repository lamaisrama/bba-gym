package com.bbagym.dao;

import static com.bbagym.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

public class AdminDao {
	private Properties prop=new Properties();
	
	public AdminDao() {
		try {
			String path=MemberDao.class.getResource("/sql/member/member-query.properties").getPath();
			prop.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
}

