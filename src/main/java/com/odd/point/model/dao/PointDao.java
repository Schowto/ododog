package com.odd.point.model.dao;

import java.util.Properties;

public class PointDao {
	
	private Properties prop = new Properties();
	
	public PointDao() {
		String filePath = PointDao.class.getResource("/db/sql/point-mapper.xml").getPath();
	}

}
