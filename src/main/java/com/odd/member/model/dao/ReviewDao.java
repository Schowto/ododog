package com.odd.member.model.dao;

import static com.odd.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

import org.apache.catalina.authenticator.jaspic.PersistentProviderRegistrations.Property;

public class ReviewDao {
	
	private Properties prop = new Properties();
	
	public ReviewDao() {
		String filePath = ReviewDao.class.getResource("/db/sql/review-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	public 
	
	
	
	

}
