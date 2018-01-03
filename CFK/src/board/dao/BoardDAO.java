package board.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import board.vo.BoardVO;
import user.vo.UserVO;


public class BoardDAO {
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
	
	
	public int board_parti(BoardVO vo)
	{
		int result=0, num=0;
		
		try
		{
			con=getConnection();
			pstmt=con.prepareStatement("select max(board_num) from cfk_board");
			con.setAutoCommit(false);
			rs=pstmt.executeQuery();
			if(rs.next())
				num=rs.getInt(1)+1;
			else
				num=1;
			
			String sql="insert into cfk_board values(?,?,?,?,?,?,?,?,?,now())";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, vo.getBoard_subject());
			pstmt.setString(3, vo.getBoard_content());
			pstmt.setString(4, vo.getBoard_file());
			pstmt.setString(5, vo.getBoard_real_file());
			pstmt.setString(6, vo.getBoard_thumbnail());
			pstmt.setString(7, vo.getBoard_writer());
			pstmt.setInt(8, 0);
			pstmt.setInt(9, 0);
			
			result=pstmt.executeUpdate();
			if(result>0)
				con.commit();
				
			
			
			
		}catch(Exception e)
		{
			
		}finally
		{
			close(con, pstmt, rs);
		}
		
		return result;
	}
	
}
