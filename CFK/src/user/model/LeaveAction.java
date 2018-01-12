package user.model;

import java.io.File;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import action.ActionForward;
import board.model.BoardDeleteAction;
import dao.BoardDAO;
import dao.UserDAO;
import vo.BoardVO;

public class LeaveAction implements Action {
	
	private String path;
	
	

	public LeaveAction(String path) {
		super();
		this.path = path;
	}

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		String user_id=req.getParameter("user_id");

		UserDAO dao=new UserDAO();
		BoardDAO dao1=new BoardDAO();
		
		BoardVO vo=new BoardVO();
		vo=dao1.getBoardnum(user_id);
		
		int board_num=vo.getBoard_num();
		
		String fileName =vo.getBoard_file();
		
		
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
		
		dao.user_leave(user_id,board_num);
		
	
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
		return new ActionForward(path, true);
	}

}
