package user.model;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import action.ActionForward;
import dao.UserDAO;

public class LeaveAction implements Action {
	
	private String path;
	
	

	public LeaveAction(String path) {
		super();
		this.path = path;
	}



	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		String user_id=req.getParameter("user_id");
		//String user_passwd=req.getParameter("user_passwd");
		
		UserDAO dao=new UserDAO();
		dao.user_leave(user_id);
	
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
