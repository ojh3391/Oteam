package user.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import user.vo.UserVO;




public class UserDAO {
	private Connection con=null;
	private PreparedStatement pstmt=null;
	private ResultSet rs=null;
	
	
	//connection => dbcp
	public Connection getConnection() {
		Connection con=null;
		try
	    {
	         Class.forName("com.mysql.jdbc.Driver");
	         String url="jdbc:mysql://localhost:3306/javadb?useSSL=true";
	         con=DriverManager.getConnection(url,"root","12345");
	    }catch(Exception e)
	    {
	         e.printStackTrace();
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
		String sql="insert into cfk_user values(?,?,?,?,?,?,?,?,?,?,?)";
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
			pstmt.setString(10, null);
			pstmt.setInt(11, 0);
			result=pstmt.executeUpdate();		
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(con,pstmt);
		}
		return result;
	}
	
	public UserVO isLogin(String user_id,String user_passwd) {
		UserVO vo=null;
		ResultSet rs=null;
		Connection con=getConnection();
		PreparedStatement pstmt=null;
		String sql="select user_id,user_name from cfk_user where user_id=? and user_passwd=?";
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, user_id);
			pstmt.setString(2, user_passwd);
			rs=pstmt.executeQuery(); 
			if(rs.next()) {
				vo=new UserVO();
				vo.setUser_id(rs.getString("user_id"));
				vo.setUser_name(rs.getString("user_name"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(con,pstmt,rs);
		}
		
		return vo;
	}

	
	public UserVO getUser(String user_id) {
		UserVO vo=null;
		Connection con=getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select user_id, user_passwd, user_addr, user_area, user_tel, user_age, user_name, user_email, user_gender from cfk_user where user_id=?";
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, user_id);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				vo=new UserVO();
				vo.setUser_id(rs.getString("user_id"));
				vo.setUser_passwd(rs.getString("user_passwd"));
				vo.setUser_addr(rs.getString("user_addr"));
				vo.setUser_area(rs.getString("user_area"));
				vo.setUser_tel(rs.getString("user_tel"));
				vo.setUser_age(rs.getInt("user_age"));
				vo.setUser_name(rs.getString("user_name"));
				vo.setUser_email(rs.getString("user_email"));
				vo.setUser_gender(rs.getString("user_gender"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(con, pstmt, rs);
		}
		return vo;
		
		
	}
	
	public int user_Update(String user_id, String user_passwd, String user_addr, String user_area, String user_tel, String user_email){
		int result=0;
		Connection con=getConnection();
		PreparedStatement pstmt=null;
		try {
			String sql="update cfk_user set user_passwd=?, user_addr=?, user_area=?, user_tel=?, user_email=? where user_id=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, user_passwd);
			pstmt.setString(2, user_addr);
			pstmt.setString(3, user_area);
			pstmt.setString(4, user_tel);
			pstmt.setString(5, user_email);
			pstmt.setString(6, user_id);
			result=pstmt.executeUpdate();
			System.out.println(user_passwd);
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			close(con,pstmt);
		}
		return result;
		
	}
	
}
