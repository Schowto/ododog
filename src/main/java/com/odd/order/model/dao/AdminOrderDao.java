package com.odd.order.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

public class AdminOrderDao {
	
	private Properties prop = new Properties();
	
	public AdminOrderDao() {
		try {
			prop.loadFromXML(new FileInputStream(AdminOrderDao.class.getResource("/db/sql/adminOrder-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	

}
