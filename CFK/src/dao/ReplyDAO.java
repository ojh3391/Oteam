package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import control.JDBCUtil;
import vo.BoardVO;
import vo.ReplyVO;


public class ReplyDAO {

	
	private Connection con=null;
	private PreparedStatement pstmt=null;
	private ResultSet rs=null;
	
	public Vector<ReplyVO> getList(int page,int limit,int board_num){
		//page 값에 의해 몇번째 레코드부터 돌릴지 결정
		int start=(page-1)*10;
		//System.out.println(board_num);
		Vector<ReplyVO> list=new Vector<ReplyVO>();
		// 번호,제목,작성자,날짜,조회수 정보 뽑아서 vector 에 담기
		
		con=JDBCUtil.getConnection();
		pstmt=null;
		rs=null;
		
		try {
			pstmt=con.prepareStatement("select * from cfk_reply where reply_board_num=? order by reply_re_ref desc, reply_re_seq asc limit ?,?");
			pstmt.setInt(1, board_num);
			pstmt.setInt(2, start);
			pstmt.setInt(3, limit);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				int reply_num=rs.getInt(1);
				String reply_content=rs.getString(2);
				String reply_writer=rs.getString(3);
				Date reply_date=rs.getDate(4);
				int reply_re_ref=rs.getInt(6);
				int reply_re_lev=rs.getInt(7);
				int reply_re_seq=rs.getInt(8);
				ReplyVO vo=new ReplyVO(reply_num,reply_content,reply_writer,reply_date,reply_re_ref,reply_re_lev,reply_re_seq);
				list.add(vo);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(con,pstmt,rs);
		}
		return list;
	}
	
	public int insert(ReplyVO vo1) {
		int insertCount=0;
		
		int num=0;
		
		
		try {
			con=JDBCUtil.getConnection();
			pstmt=con.prepareStatement("select max(reply_num) from cfk_reply");
			con.setAutoCommit(false);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				num=rs.getInt(1)+1;
			}else {
				num=1;
			}
			String sql="insert into cfk_reply values(?,?,?,now(),?,?,?,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, vo1.getReply_content());
			pstmt.setString(3, vo1.getReply_writer());
			pstmt.setInt(4, vo1.getReply_board_num());
			pstmt.setInt(5, num);
			pstmt.setInt(6, 0);
			pstmt.setInt(7, 0); 
			pstmt.setInt(8, 0); 
			
			insertCount=pstmt.executeUpdate();
			if(insertCount>0) {
				con.commit();
			}
			
		}catch(Exception e) {
			System.out.print(e);
			try {
				con.rollback();
			}catch(SQLException e1) {
				e1.printStackTrace();
			}
		}finally {
			JDBCUtil.close(con,pstmt,rs);
		}
		return insertCount;
	}
	
	public int total_rows(int board_num) {
		String sql="select count(*) from cfk_reply where reply_board_num=?";
		
		int total_rows=0;
		try {
			con=JDBCUtil.getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, board_num);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				total_rows=rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCUtil.close(con, pstmt, rs);
		}
		return total_rows;
	}
	
	public int reply_delete(int reply_num,int reply_re_ref,int reply_re_lev,int reply_re_seq) {
		int result=0;
		con=JDBCUtil.getConnection();
		
		try {
			pstmt=con.prepareStatement("select count(*) from cfk_reply where reply_re_ref=? and reply_re_del=0");
			pstmt.setInt(1, reply_re_ref);
			rs=pstmt.executeQuery();
			int total=0;
			if(rs.next()) {
				total=rs.getInt(1);
				if(total==1) {
					String sql="delete from cfk_reply where reply_re_ref=?";
					pstmt=con.prepareStatement(sql);
					pstmt.setInt(1, reply_re_ref);
					result=pstmt.executeUpdate();
				}else {
					String sql="update cfk_reply set reply_content='삭제된 댓글', reply_writer='없음', reply_date=null, reply_re_del=1 where reply_num=?";
					pstmt=con.prepareStatement(sql);
					pstmt.setInt(1, reply_num);
					result=pstmt.executeUpdate();
				}
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCUtil.close(con,pstmt,rs);
		}
		return result;	
		
	}
	
	
	public int board_reply(ReplyVO vo) {
		int result=0;
		
		//원본글에 값들 가져오기
		int re_ref=vo.getReply_re_ref();
		int re_lev=vo.getReply_re_lev();
		int re_seq=vo.getReply_re_seq();
		//답변글에 대한 새로운 번호 부여받기
		
		//업데이트 문 수행
		int num=0;
		
		try {
			con=JDBCUtil.getConnection();
			pstmt=con.prepareStatement("select max(reply_num) from cfk_reply");
			con.setAutoCommit(false);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				num=rs.getInt(1)+1;
			}else {
				num=1;
			}
			String sql="update cfk_reply set reply_re_seq=reply_re_seq+1 where reply_re_ref=? and reply_re_seq>?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, re_ref);
			pstmt.setInt(2, re_seq);
			result=pstmt.executeUpdate();
			
			//insert를 하기전에 원본글의 re_ref와 re_seq 값을 +1 실행후 답변글 사용
			re_seq+=1;
			re_lev+=1;
			//insert하기
			sql="insert into cfk_reply values(?,?,?,now(),?,?,?,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, vo.getReply_content());
			pstmt.setString(3, vo.getReply_writer());
			pstmt.setInt(4, vo.getReply_board_num());		
			pstmt.setInt(5, re_ref); //re_ref
			pstmt.setInt(6, re_lev);	//re_lev
			pstmt.setInt(7, re_seq);	//re_seq
			pstmt.setInt(8, 0);	
			
			result=pstmt.executeUpdate();
			if(result>0) {
				con.commit();
			}
			
			
		} catch (SQLException e) {
			System.out.print(e);
			try {
				con.rollback();
			}catch(SQLException e1) {
				e1.printStackTrace();
			}
		}finally {
			JDBCUtil.close(con, pstmt, rs);
		}		
		return result;
	}
	
	public ReplyVO getRef(String reply_writer) {
		ReplyVO vo=null;
		con=JDBCUtil.getConnection();
		
		try {
			pstmt=con.prepareStatement("select reply_re_ref from cfk_reply where reply_writer=?");
			pstmt.setString(1, reply_writer);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				vo= new ReplyVO();
				vo.setReply_re_ref(rs.getInt("reply_re_ref"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(con, pstmt, rs);
	
		}
		return vo;
	}
	
}
