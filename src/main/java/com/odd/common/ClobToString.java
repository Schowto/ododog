package com.odd.common;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.Reader;
import java.sql.Clob;
import java.sql.SQLException;
import java.util.stream.Collectors;

import org.apache.tomcat.util.http.fileupload.IOUtils;

public class ClobToString {

	public static String clobToString( Clob clob ) {

	    String result = null;
	    Reader reader = null;
	    BufferedReader br = null;
	    try {
	        reader = clob.getCharacterStream();
	        br = new BufferedReader( reader );
	        result = br.lines().collect(Collectors.joining());
	    } catch (SQLException e) {
			e.printStackTrace();
		} finally {
	        if( reader != null ) {
	            try {
					reader.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
	        }
	        if( br != null ) {
	             try {
					br.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
	        }
	    }
	    return result;
	}

}
