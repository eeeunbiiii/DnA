package util;

import java.sql.Connection;
import java.sql.DriverManager;


public class DatabaseUtil {
	public static Connection getConnection() { //connection 상태를 리턴 
		try {
			String dbURL = "jdbc:mysql://localhost:3306/DNA";
			String dbID = "root";
			String dbPassword = "admin";
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			return DriverManager.getConnection(dbURL, dbID, dbPassword);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
