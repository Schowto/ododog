package com.odd.product.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

public class UserProductDao {
	private Properties prop = new Properties();
	
	public UserProductDao() {
		String filePath = UserProductDao.class.getResource("/db/sql/userProduct-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	
}
