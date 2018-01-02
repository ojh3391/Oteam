package user.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class UserDAO {
	private Connection con=null;
	private PreparedStatement pstmt=null;
	private ResultSet rs=null;
	
	
	//connection ?»κΈ?
	public Connection getConnection() {
		Context ctx;
		try {
			ctx=new InitialContext();
			DataSource ds=(DataSource) ctx.lookup("java:comp/env/jdbc/MySQL");
			con=ds.getConnection();
		}catch(Exception e) {
			System.out.println("DB μ»€λ₯? ?€?¨"+e);
		}
		return con;
		
	}
	
	public void close(Connection con, PreparedStatement pstmt, ResultSet rs) {
		try {
			if(rs!=null)rs.close();
			if(pstmt!=null)pstmt.close();
			if(con!=null)con.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	public void close(Connection con, PreparedStatement pstmt) {
		try {
			
			if(pstmt!=null)pstmt.close();
			if(con!=null)con.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	public int user_insert(String user_id, String user_passwd, String user_addr, String user_area, String user_tel, int user_age, String user_name, String user_email, String user_gender) {
		int result=0;
		Connection con=getConnection();
		PreparedStatement pstmt=null;
		String sql="insert into cfk_user values(?,?,?,?,?,?,?,?,?)";
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, user_id);
			pstmt.setString(2, user_passwd);
			pstmt.setString(3, user_addr);
			pstmt.setString(4, user_area);
			pstmt.setString(5, user_tel);
			pstmt.setInt(6, user_age);
			pstmt.setString(7, user_name);
			pstmt.setString(8, user_email);
			pstmt.setString(9, user_gender);
			result=pstmt.executeUpdate();		
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(con,pstmt);
		}
		return result;
	}
}
