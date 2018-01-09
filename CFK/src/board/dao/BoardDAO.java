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
	//조회수 없데이트
	public int hitUpdate(int board_num) {
		int result=0;
		//board_num이 일치하면 readcount 하나 증가
	
		String sql="update cfk_board set board_readcount=board_readcount+1 where board_num=?";
		try {
			con=getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, board_num);
			result=pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(con,pstmt);
				
				
		}	
		return result;
	}
	public BoardVO getRow(int board_num) {
		BoardVO vo=null;
		con=getConnection();
		pstmt=null;
		rs=null;
		
		try {
			pstmt=con.prepareStatement("select * from cfk_board where board_num=?");
			pstmt.setInt(1, board_num);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				vo= new BoardVO();
				vo.setBoard_num(rs.getInt("board_num"));
				vo.setBoard_subject(rs.getString("board_subject"));
				vo.setBoard_content(rs.getString("board_content"));
				vo.setBoard_file(rs.getString("board_file"));			
				vo.setBoard_real_file(rs.getString("board_real_file"));
				vo.setBoard_writer(rs.getString("board_writer"));
				vo.setBoard_vote(rs.getInt("board_vote"));
				vo.setBoard_date(rs.getDate("board_date"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(con, pstmt, rs);
			
			
		}
		return vo;
	}
	public int board_delete(int board_num) {
		int result=0;
		con=getConnection();
		pstmt=null;
		
		try {
			String sql="delete from cfk_board where board_num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, board_num);
			result=pstmt.executeUpdate();
			sql="delete from cfk_reply where reply_board_num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, board_num);
			result=pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(con,pstmt);
		}
		return result;
	}
	public int board_update(BoardVO vo)
	{
		int result=0;
		con=getConnection();
		pstmt=null;
		
		try
		{
			String sql="update cfk_board set board_subject=?, board_content=?, board_file=?,board_real_file=?,board_thumbnail=? where board_num=?";
			pstmt=con.prepareStatement(sql);
			
			pstmt.setString(1, vo.getBoard_subject());
			pstmt.setString(2, vo.getBoard_content());
			pstmt.setString(3, vo.getBoard_file());
			pstmt.setString(4, vo.getBoard_real_file());
			pstmt.setString(5, vo.getBoard_thumbnail());
			pstmt.setInt(6, vo.getBoard_num());
			
			
			result=pstmt.executeUpdate();
				
		}catch(Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}finally
		{
			close(con, pstmt);
		}
		
		return result;
	}
	
	public int voteUpdate(int board_num) {
		int result=0;
		//board_num이 일치하면 board_vote 하나 증가
	
		String sql="update cfk_board set board_vote=board_vote+1 where board_num=?";
		
		
		
		try {
			con=getConnection();
			pstmt=con.prepareStatement(sql);
			
			
			
			pstmt.setInt(1, board_num);
			
			result=pstmt.executeUpdate();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(con,pstmt);
				
				
		}	
		return result;
	}
	
	public Vector<BoardVO> getRank()
	{
		Vector<BoardVO> rank=new Vector<BoardVO>();
		
		con=getConnection();
		pstmt=null;
		rs=null;
				
		try 
		{	
			String sql="select board_writer,board_subject,board_content,board_real_file,board_date,board_vote,board_thumbnail,user_age,board_num from cfk_board,cfk_user where cfk_board.board_writer=cfk_user.user_id order by board_vote desc limit 4";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next())
			{
				BoardVO bo=new BoardVO();
								
				bo.setBoard_writer(rs.getString(1));
				bo.setBoard_subject(rs.getString(2));
				bo.setBoard_content(rs.getString(3));
				bo.setBoard_real_file(rs.getString(4));
				bo.setBoard_date(rs.getDate(5));
				bo.setBoard_vote(rs.getInt(6));
				bo.setBoard_thumbnail(rs.getString(7));
				bo.setUser_age(rs.getInt(8));
				bo.setBoard_num(rs.getInt(9));
				
				rank.add(bo);
				
				
			}
		}catch(Exception e) 
		{
			e.printStackTrace();
		}finally 
		{
			close(con, pstmt, rs);
		}
		return rank;
	}
	
	public Vector<BoardVO> getMaleRank()
	{
		Vector<BoardVO> rank1=new Vector<BoardVO>();
		
		con=getConnection();
		pstmt=null;
		rs=null;
				
		try 
		{	
			String sql="select board_writer,board_subject,board_content,board_real_file,board_date,board_vote,board_thumbnail,user_gender,board_num from cfk_board,cfk_user where cfk_board.board_writer=cfk_user.user_id and cfk_user.user_gender='남' order by board_vote desc limit 4";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next())
			{
				BoardVO bo1=new BoardVO();
								
				bo1.setBoard_writer(rs.getString(1));
				bo1.setBoard_subject(rs.getString(2));
				bo1.setBoard_content(rs.getString(3));
				bo1.setBoard_real_file(rs.getString(4));
				bo1.setBoard_date(rs.getDate(5));
				bo1.setBoard_vote(rs.getInt(6));
				bo1.setBoard_thumbnail(rs.getString(7));
				bo1.setUser_gender(rs.getString(8));
				bo1.setBoard_num(rs.getInt(9));
				
				rank1.add(bo1);
				
				
			}
		}catch(Exception e) 
		{
			e.printStackTrace();
		}finally 
		{
			close(con, pstmt, rs);
		}
		return rank1;
	}
	
	public Vector<BoardVO> getFemaleRank()
	{
		Vector<BoardVO> rank2=new Vector<BoardVO>();
		
		con=getConnection();
		pstmt=null;
		rs=null;
				
		try 
		{	
			String sql="select board_writer,board_subject,board_content,board_real_file,board_date,board_vote,board_thumbnail,user_gender,board_num from cfk_board,cfk_user where cfk_board.board_writer=cfk_user.user_id and cfk_user.user_gender='여' order by board_vote desc limit 4";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next())
			{
				BoardVO bo2=new BoardVO();
								
				bo2.setBoard_writer(rs.getString(1));
				bo2.setBoard_subject(rs.getString(2));
				bo2.setBoard_content(rs.getString(3));
				bo2.setBoard_real_file(rs.getString(4));
				bo2.setBoard_date(rs.getDate(5));
				bo2.setBoard_vote(rs.getInt(6));
				bo2.setBoard_thumbnail(rs.getString(7));
				bo2.setUser_gender(rs.getString(8));
				bo2.setBoard_num(rs.getInt(9));
				
				rank2.add(bo2);
				
				
			}
		}catch(Exception e) 
		{
			e.printStackTrace();
		}finally 
		{
			close(con, pstmt, rs);
		}
		return rank2;
	}
	public Vector<BoardVO> getSeokyoungRank()
	{
		Vector<BoardVO> rank3=new Vector<BoardVO>();
		
		con=getConnection();
		pstmt=null;
		rs=null;
				
		try 
		{	
			String sql="select board_writer,board_subject,board_content,board_real_file,board_date,board_vote,board_thumbnail,user_gender,board_num from cfk_board,cfk_user where cfk_board.board_writer=cfk_user.user_id and cfk_user.user_area='서울.경기' order by board_vote desc limit 4";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next())
			{
				BoardVO bo3=new BoardVO();
								
				bo3.setBoard_writer(rs.getString(1));
				bo3.setBoard_subject(rs.getString(2));
				bo3.setBoard_content(rs.getString(3));
				bo3.setBoard_real_file(rs.getString(4));
				bo3.setBoard_date(rs.getDate(5));
				bo3.setBoard_vote(rs.getInt(6));
				bo3.setBoard_thumbnail(rs.getString(7));
				bo3.setUser_gender(rs.getString(8));
				bo3.setBoard_num(rs.getInt(9));
				
				rank3.add(bo3);
				
				
			}
		}catch(Exception e) 
		{
			e.printStackTrace();
		}finally 
		{
			close(con, pstmt, rs);
		}
		return rank3;
	}
	
	public Vector<BoardVO> getKangwonRank()
	{
		Vector<BoardVO> rank4=new Vector<BoardVO>();
		
		con=getConnection();
		pstmt=null;
		rs=null;
				
		try 
		{	
			String sql="select board_writer,board_subject,board_content,board_real_file,board_date,board_vote,board_thumbnail,user_gender,board_num from cfk_board,cfk_user where cfk_board.board_writer=cfk_user.user_id and cfk_user.user_area='강원도' order by board_vote desc limit 4";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next())
			{
				BoardVO bo4=new BoardVO();
								
				bo4.setBoard_writer(rs.getString(1));
				bo4.setBoard_subject(rs.getString(2));
				bo4.setBoard_content(rs.getString(3));
				bo4.setBoard_real_file(rs.getString(4));
				bo4.setBoard_date(rs.getDate(5));
				bo4.setBoard_vote(rs.getInt(6));
				bo4.setBoard_thumbnail(rs.getString(7));
				bo4.setUser_gender(rs.getString(8));
				bo4.setBoard_num(rs.getInt(9));
				
				rank4.add(bo4);
				
				
			}
		}catch(Exception e) 
		{
			e.printStackTrace();
		}finally 
		{
			close(con, pstmt, rs);
		}
		return rank4;
	}
	
	public Vector<BoardVO> getChungcheongRank()
	{
		Vector<BoardVO> rank5=new Vector<BoardVO>();
		
		con=getConnection();
		pstmt=null;
		rs=null;
				
		try 
		{	
			String sql="select board_writer,board_subject,board_content,board_real_file,board_date,board_vote,board_thumbnail,user_gender,board_num from cfk_board,cfk_user where cfk_board.board_writer=cfk_user.user_id and cfk_user.user_area='충청권' order by board_vote desc limit 4";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next())
			{
				BoardVO bo5=new BoardVO();
								
				bo5.setBoard_writer(rs.getString(1));
				bo5.setBoard_subject(rs.getString(2));
				bo5.setBoard_content(rs.getString(3));
				bo5.setBoard_real_file(rs.getString(4));
				bo5.setBoard_date(rs.getDate(5));
				bo5.setBoard_vote(rs.getInt(6));
				bo5.setBoard_thumbnail(rs.getString(7));
				bo5.setUser_gender(rs.getString(8));
				bo5.setBoard_num(rs.getInt(9));
				
				rank5.add(bo5);
				
				
			}
		}catch(Exception e) 
		{
			e.printStackTrace();
		}finally 
		{
			close(con, pstmt, rs);
		}
		return rank5;
	}
	public Vector<BoardVO> getHonamRank()
	{
		Vector<BoardVO> rank6=new Vector<BoardVO>();
		
		con=getConnection();
		pstmt=null;
		rs=null;
				
		try 
		{	
			String sql="select board_writer,board_subject,board_content,board_real_file,board_date,board_vote,board_thumbnail,user_gender,board_num from cfk_board,cfk_user where cfk_board.board_writer=cfk_user.user_id and cfk_user.user_area='호남.제주' order by board_vote desc limit 4";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next())
			{
				BoardVO bo6=new BoardVO();
								
				bo6.setBoard_writer(rs.getString(1));
				bo6.setBoard_subject(rs.getString(2));
				bo6.setBoard_content(rs.getString(3));
				bo6.setBoard_real_file(rs.getString(4));
				bo6.setBoard_date(rs.getDate(5));
				bo6.setBoard_vote(rs.getInt(6));
				bo6.setBoard_thumbnail(rs.getString(7));
				bo6.setUser_gender(rs.getString(8));
				bo6.setBoard_num(rs.getInt(9));
				
				rank6.add(bo6);
				
				
			}
		}catch(Exception e) 
		{
			e.printStackTrace();
		}finally 
		{
			close(con, pstmt, rs);
		}
		return rank6;
	}
	public Vector<BoardVO> getYoungnamRank()
	{
		Vector<BoardVO> rank7=new Vector<BoardVO>();
		
		con=getConnection();
		pstmt=null;
		rs=null;
				
		try 
		{	
			String sql="select board_writer,board_subject,board_content,board_real_file,board_date,board_vote,board_thumbnail,user_gender,board_num from cfk_board,cfk_user where cfk_board.board_writer=cfk_user.user_id and cfk_user.user_area='영남권' order by board_vote desc limit 4";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next())
			{
				BoardVO bo7=new BoardVO();
								
				bo7.setBoard_writer(rs.getString(1));
				bo7.setBoard_subject(rs.getString(2));
				bo7.setBoard_content(rs.getString(3));
				bo7.setBoard_real_file(rs.getString(4));
				bo7.setBoard_date(rs.getDate(5));
				bo7.setBoard_vote(rs.getInt(6));
				bo7.setBoard_thumbnail(rs.getString(7));
				bo7.setUser_gender(rs.getString(8));
				bo7.setBoard_num(rs.getInt(9));
				
				rank7.add(bo7);
				
				
			}
		}catch(Exception e) 
		{
			e.printStackTrace();
		}finally 
		{
			close(con, pstmt, rs);
		}
		return rank7;
	}
	
	
}
