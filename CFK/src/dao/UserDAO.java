package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import control.JDBCUtil;
import vo.UserVO;

public class UserDAO {
	private Connection con=null;
	private PreparedStatement pstmt=null;
	private ResultSet rs=null;
	
	
	
	public int user_insert(String user_id, String user_passwd, String user_addr, String user_area, String user_tel, int user_age, String user_name, String user_email, String user_gender) {
		int result=0;
		Connection con=JDBCUtil.getConnection();
		PreparedStatement pstmt=null;
		String sql="insert into cfk_user values(?,?,?,?,?,?,?,?,?,?,?,?)";
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
			pstmt.setInt(11, 3);
			pstmt.setInt(12, 1);
			result=pstmt.executeUpdate();		
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(con,pstmt);
		}
		return result;
	}
	
	public UserVO isLogin(String user_id,String user_passwd) {
		UserVO vo=null;
		ResultSet rs=null;
		Connection con=JDBCUtil.getConnection();
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
			JDBCUtil.close(con,pstmt,rs);
		}
		
		return vo;
	}

	
	public UserVO getUser(String user_id) {
		UserVO vo=null;
		Connection con=JDBCUtil.getConnection();
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
			JDBCUtil.close(con, pstmt, rs);
		}
		return vo;
		
		
	}
	
	public int user_Update(String user_id, String user_passwd, String user_addr, String user_area, String user_tel, String user_email){
		int result=0;
		Connection con=JDBCUtil.getConnection();
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
			
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			JDBCUtil.close(con,pstmt);
		}
		return result;
	}
	
	public UserVO user_attend(String user_attend_date, String user_id) {
		UserVO vo = null;
		con=JDBCUtil.getConnection();
		
		try {
			pstmt=con.prepareStatement("update cfk_user set user_attend_date=? where user_id=?");
			pstmt.setString(1, user_attend_date);
			pstmt.setString(2, user_id);
			pstmt.executeUpdate();
			
			String sql="select user_id,user_attend_date from cfk_user where user_id=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, user_id);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				vo = new UserVO();
				vo.setUser_id(rs.getString("user_id"));
				vo.setUser_attend_date(rs.getString("user_attend_date"));
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(con,pstmt,rs);
		}
		return vo;
	}
	public UserVO voteLimit(String user_id) {
		UserVO vo=null;
		Connection con=JDBCUtil.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		//board_num이 일치하면 board_vote 하나 증가
		String sql="select user_check_vote from cfk_user where user_id=?";

		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, user_id);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				vo=new UserVO();
				vo.setUser_check_vote(rs.getInt("user_check_vote"));
				
			}
		} catch (SQLException e1) {
			
			e1.printStackTrace();
		
		}finally {
			JDBCUtil.close(con,pstmt,rs);
					
		}	
		return vo;
		
	}
	
	public int voteMinus(String user_id) {
		int result=0;
		//board_num이 일치하면 board_vote 하나 증가
	
		String sql="update cfk_user set user_check_vote=user_check_vote-1 where user_id=?";
		
		
		
		try {
			con=JDBCUtil.getConnection();
			pstmt=con.prepareStatement(sql);
			
			
			
			pstmt.setString(1, user_id);
			
			result=pstmt.executeUpdate();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			JDBCUtil.close(con,pstmt);
				
				
		}	
		return result;
	}
	public int user_leave_all(String user_id,int board_num,int reply_re_ref,int reply_num) {
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
					String sql="update cfk_reply set reply_content='삭제된 댓글', reply_writer='없음', reply_date=null, reply_re_del=1 where reply_writer=? and reply_num=?";
					pstmt=con.prepareStatement(sql);
					pstmt.setString(1, user_id);
					pstmt.setInt(2, reply_num);
					result=pstmt.executeUpdate();
				}
			}
			String sql="delete from cfk_user where user_id=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, user_id);
			result=pstmt.executeUpdate();
			
			sql="delete from cfk_board where board_writer=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, user_id);
			result=pstmt.executeUpdate();
			
			sql="delete from cfk_reply where reply_board_num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, board_num);
			result=pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(con, pstmt);
		}
		return result;
	}
	
	public int user_leave_only(String user_id) {
		int result=0;
		con=JDBCUtil.getConnection();
		
		try {
			String sql="delete from cfk_user where user_id=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, user_id);
			result=pstmt.executeUpdate();
			
			sql="delete from cfk_board where board_writer=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, user_id);
			result=pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(con, pstmt);
		}
		return result;
	}
	public int user_leave_reply(String user_id,int reply_re_ref,int reply_num) {
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
					System.out.println(reply_re_ref);
					
					result=pstmt.executeUpdate();
				}else {
					String sql="update cfk_reply set reply_content='삭제된 댓글', reply_writer='없음', reply_date=null, reply_re_del=1 where reply_writer=? and reply_num=?";
					pstmt=con.prepareStatement(sql);
					pstmt.setString(1, user_id);
					pstmt.setInt(2, reply_num);
					
					System.out.println(user_id);
					System.out.println(reply_num);
					result=pstmt.executeUpdate();
				}
			}
			String sql="delete from cfk_user where user_id=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, user_id);
			result=pstmt.executeUpdate();
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(con, pstmt);
		}
		return result;
	}
	public UserVO myUser(String user_id) {
		UserVO vo=null;
		Connection con=JDBCUtil.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select * from cfk_user where user_id=?";
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
				vo.setUser_attend_date(rs.getString("user_attend_date"));
				vo.setUser_check_vote(rs.getInt("user_check_vote"));
				vo.setUser_check_parti(rs.getInt("user_check_parti"));
				
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(con, pstmt, rs);
		}
		return vo;
	}
	
	//아이디 중복 체크
	public boolean user_check_reduplication(String user_id) {
		boolean result=false;
		con = JDBCUtil.getConnection();
		try {
			String sql="select user_id from cfk_user where user_id=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, user_id);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				result=true;	//해당 아이디 존재하면 true 리턴
			}
			return result;
		} catch (SQLException e1) {
			e1.printStackTrace();
		}finally {
			JDBCUtil.close(con, pstmt, rs);
		}	
			
		return result;
	}
	
	public Vector<UserVO> userList(){
		Vector<UserVO> list=new Vector<UserVO>();
			
		con=JDBCUtil.getConnection();
		pstmt=null;
		rs=null;
		
		try {
			pstmt=con.prepareStatement("select * from cfk_user");
			
			rs=pstmt.executeQuery();
			while(rs.next()) {
				UserVO vo=new UserVO();
				vo.setUser_id(rs.getString(1));
				vo.setUser_passwd(rs.getString(2));
				vo.setUser_addr(rs.getString(3));
				vo.setUser_area(rs.getString(4));
				vo.setUser_tel(rs.getString(5));
				vo.setUser_age(rs.getInt(6));
				vo.setUser_name(rs.getString(7));
				vo.setUser_email(rs.getString(8));
				vo.setUser_gender(rs.getString(9));
				vo.setUser_attend_date(rs.getString(10));
				vo.setUser_check_vote(rs.getInt(11));
				vo.setUser_check_parti(rs.getInt(12));
				list.add(vo);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(con, pstmt, rs);
		}
		return list;
	}
	
}
