package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class JDBCConnection {
	private static Connection con;
	
	public static Connection getConnection() {
		try {
			final String url = "jdbc:mysql://localhost:3306/ootdb";

			try {
				Class.forName("com.mysql.jdbc.Driver");
				con =  DriverManager.getConnection(url, "root", "");
				return con;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	public static void dbClose() {
		try {
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
}
