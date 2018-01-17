package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import control.JDBCUtil;
import vo.BoardVO;
import vo.NotifyVO;

public class NotifyDAO
{
	private Connection con=null;
	private PreparedStatement pstmt=null;
	private ResultSet rs=null;
	
	public int notify_insert(String content)
	{
		int result=0, num=0;
		try
		{
			con=JDBCUtil.getConnection();
			pstmt=con.prepareStatement("select max(notify_num) from cfk_notify");
			con.setAutoCommit(false);
			rs=pstmt.executeQuery();
			if(rs.next())
				num=rs.getInt(1)+1;
			else
				num=1;
			
			String sql="insert into cfk_notify values(?,?,now())";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, content);
			result=pstmt.executeUpdate();
			if(result>0)
				con.commit();
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}finally
		{
			JDBCUtil.close(con, pstmt, rs);
		}
		return result;
	}
	
	public Vector<NotifyVO> getNotifyList()
	{
		Vector<NotifyVO> list=new Vector<NotifyVO>();
		
		con=JDBCUtil.getConnection();
		pstmt=null;
		rs=null;
				
		try 
		{	
			String sql="select * from cfk_notify";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next())
			{
				NotifyVO vo=new NotifyVO();
								
				vo.setNotify_num(rs.getInt(1));
				vo.setNotify_content(rs.getString(2));
				vo.setNotify_date(rs.getDate(3));
				list.add(vo);
				
				
			}
		}catch(Exception e) 
		{
			e.printStackTrace();
		}finally 
		{
			JDBCUtil.close(con, pstmt, rs);
		}
		return list;
	}
	
		public int notify_delete(int notify_num)
		{
			int result=0;
			con=JDBCUtil.getConnection();
			try {
				String sql="delete from cfk_notify where notify_num=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, notify_num);
				result=pstmt.executeUpdate();
				
				
				
			} catch (SQLException e) {
				
				e.printStackTrace();
			}finally {
				JDBCUtil.close(con,pstmt);
			}
			
			
			return result;
					
		}
		
	
}
