package reply.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import board.vo.BoardVO;
import reply.vo.ReplyVO;


public class ReplyDAO {

	
	private Connection con=null;
	private PreparedStatement pstmt=null;
	private ResultSet rs=null;
	
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

	public int reply_insert(ReplyVO vo) {
		int result=0;
		int num=0;
		
		
		
		try {
			con=getConnection();
			//글을 하나 등록하기 전에 글 번호를 알기 위해 값 가져오기
			pstmt=con.prepareStatement("select max(reply_num)from cfk_reply");
			con.setAutoCommit(false);
			rs=pstmt.executeQuery();
			if(rs.next())
				num=rs.getInt(1)+1;
			else
				num=1;
			
			String sql="insert into cfk_reply values(?,?,?,now(),?,?,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, vo.getReply_content());
			pstmt.setString(3, vo.getReply_writer());
			pstmt.setInt(4,vo.getReply_board_num());
			pstmt.setInt(5, num);
			pstmt.setInt(6, 0);
			pstmt.setInt(7, 0);
			
			
			result=pstmt.executeUpdate();
			if(result>0)
				con.commit();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(con,pstmt,rs);
		}
		return result;
	}
	
	public Vector<ReplyVO> getList(int page,int limit,int board_num){
		//page 값에 의해 몇번째 레코드부터 돌릴지 결정
		int start=(page-1)*10;
		
		Vector<ReplyVO> list=new Vector<ReplyVO>();
		// 번호,제목,작성자,날짜,조회수 정보 뽑아서 vector 에 담기
		
		con=getConnection();
		pstmt=null;
		rs=null;
		
		try {
			pstmt=con.prepareStatement("select * from cfk_reply where reply_board_num=? order by reply_re_ref desc, reply_re_seq asc limit ?,?");
			pstmt.setInt(1, board_num);
			pstmt.setInt(2, start);
			pstmt.setInt(3, limit);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				String reply_content=rs.getString(2);
				String reply_writer=rs.getString(3);
				Date reply_date=rs.getDate(4);
				int reply_re_ref=rs.getInt(6);
				int reply_re_lev=rs.getInt(7);
				int reply_re_seq=rs.getInt(8);
				ReplyVO vo=new ReplyVO(reply_content,reply_writer,reply_date,reply_re_ref,reply_re_lev,reply_re_seq);
				list.add(vo);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(con,pstmt,rs);
		}
		return list;
	}
}
