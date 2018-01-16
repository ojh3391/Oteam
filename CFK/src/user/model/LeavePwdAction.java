package user.model;

import java.io.File;
import java.io.PrintWriter;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import action.ActionForward;
import dao.BoardDAO;
import dao.ReplyDAO;
import dao.UserDAO;
import vo.BoardVO;
import vo.ReplyVO;
import vo.UserVO;

public class LeavePwdAction implements Action {
	
	private String path;
	
	

	public LeavePwdAction(String path) {
		super();
		this.path = path;
	}



	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		String user_id=req.getParameter("user_id");
		String user_passwd=req.getParameter("user_passwd");
		System.out.print(user_id); 
		UserDAO dao3=new UserDAO();
		UserVO result=dao3.isLogin(user_id, user_passwd);
		
		if(result!=null) {

			UserDAO dao=new UserDAO();
			BoardDAO dao1=new BoardDAO();
			ReplyDAO dao2=new ReplyDAO();
			
			BoardVO vo=new BoardVO();
			
			vo=dao1.getBoardnum(user_id);
			Vector<ReplyVO> ref=dao2.getRef(user_id);
			
			int board_num=0;
			int reply_re_ref=0;
			if(vo==null&&ref.isEmpty()) {
				dao.user_leave_only(user_id);
			}else if(vo==null&&ref.isEmpty()==false) {
				
				for(ReplyVO re:ref) {
					reply_re_ref=re.getReply_re_ref();
					dao.user_leave_reply(user_id, reply_re_ref);
				}
					
			}else if(vo!=null&&ref.isEmpty()==false){
				board_num=vo.getBoard_num();
				String fileName =vo.getBoard_real_file();
				
				for(ReplyVO re:ref) {
					reply_re_ref=re.getReply_re_ref();
					dao.user_leave_all(user_id,board_num,reply_re_ref);
				}
				
				String uploadPath=req.getServletContext().getRealPath("/boardUpload");
				String uploadPath1=req.getServletContext().getRealPath("/thumb");
				int idx=fileName.lastIndexOf(".");
				String _fileName=fileName.substring(0, idx);
				String filePath=uploadPath+"\\"+fileName;
				String filePath2=uploadPath1+"\\"+_fileName+".jpg";
				
		        File uploadfile=new File(filePath);
		        File uploadfile2=new File(filePath2);
		        
		        uploadfile.delete();
		        uploadfile2.delete(); // 파일 삭제
		        
			}else if(vo!=null&&ref.isEmpty()) {
				String fileName =vo.getBoard_real_file();
				String uploadPath=req.getServletContext().getRealPath("/boardUpload");
				String uploadPath1=req.getServletContext().getRealPath("/thumb");
				int idx=fileName.lastIndexOf(".");
				String _fileName=fileName.substring(0, idx);
				String filePath=uploadPath+"\\"+fileName;
				String filePath2=uploadPath1+"\\"+_fileName+".jpg";
				
		        File uploadfile=new File(filePath);
		        File uploadfile2=new File(filePath2);
		        
		        uploadfile.delete();
		        uploadfile2.delete(); // 파일 삭제
		        dao.user_leave_only(user_id);
			}
			
			
			
			HttpSession session=req.getSession(false);
			if(session.getAttribute("vo")!=null) {
				session.invalidate();
				res.setContentType("text/html;charset=UTF-8");
				PrintWriter out=res.getWriter();
				out.println("<script>");
				out.println("alert('탈퇴가 완료되었습니다.이용해주셔서 감사합니다');");
				out.println("location.href='index.jsp'");
				out.println("</script>");
				out.close();
				
			}
			
		}else {
			path="/error/passwd_error.jsp";
		}
		
		return new ActionForward(path, false);
	}

}
