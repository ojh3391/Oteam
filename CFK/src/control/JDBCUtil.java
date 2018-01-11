package control;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class JDBCUtil {
	//자바 JDBC를 이용한 커넥션 연결, 종류 담당
	public static Connection getConnection() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
	        String url="jdbc:mysql://localhost:3306/javadb?useSSL=true";
	        return DriverManager.getConnection(url,"root","12345");
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	//close
	public static void close(Connection con, PreparedStatement pstmt, ResultSet rs) {
		try {
			if(rs!=null)rs.close();
			if(pstmt!=null)pstmt.close();
			if(con!=null)con.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	public static void close(Connection con, PreparedStatement pstmt) {
		try {
			
			if(pstmt!=null)pstmt.close();
			if(con!=null)con.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
