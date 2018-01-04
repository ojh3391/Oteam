package board.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

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
	//전체 게시글
	public int total_rows() {
		String sql="select count(*) from cfk_board";
		
		int total_rows=0;
		try {
			con=getConnection();
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				total_rows=rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(con, pstmt, rs);
		}
		return total_rows;
	}
	public Vector<BoardVO> getList(int page,int limit){
		//page 값에 의해 몇번째 레코드부터 돌릴지 결정
		int start=(page-1)*10;
		
		Vector<BoardVO> list=new Vector<BoardVO>();
		// 번호,제목,작성자,날짜,조회수 정보 뽑아서 vector 에 담기
	
		con=getConnection();
		pstmt=null;
		rs=null;
		
		try {
			pstmt=con.prepareStatement("select * from cfk_board order by board_num asc limit ?,?");
			pstmt.setInt(1, start);
			pstmt.setInt(2, limit);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				int board_num=rs.getInt(1);
				String board_subject=rs.getString(2);
				String board_thumbnail=rs.getString(6);
				String board_writer=rs.getString(7);
				int board_vote=rs.getInt(8);
				int board_readcount=rs.getInt(9);
				Date board_date=rs.getDate(10);
				
				BoardVO vo=new BoardVO(board_num, board_subject,board_thumbnail, board_writer, board_vote, board_readcount, board_date);
				list.add(vo);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(con, pstmt, rs);
		}
		return list;
	}
}
