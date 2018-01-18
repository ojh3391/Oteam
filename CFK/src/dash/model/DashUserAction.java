package dash.model;

import java.io.PrintWriter;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import action.ActionForward;
import dao.BoardDAO;
import dao.NotifyDAO;
import dao.UserDAO;
import vo.BoardVO;
import vo.NotifyVO;
import vo.UserVO;

public class DashUserAction implements Action {

	private String path;
	
	
	public DashUserAction(String path) {
		super();
		this.path = path;
	}


	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		HttpSession session=req.getSession(false);
		UserVO vo1=(UserVO)session.getAttribute("vo");
		if(vo1.getUser_id().equals("admin")) {
			UserDAO dao=new UserDAO();
			
			Vector<UserVO> list=dao.userList();
			req.setAttribute("list", list);
		}else {
			PrintWriter out=res.getWriter();
			out.println("<script>");
			out.println("alert('어딜 드려오려하나!');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
		}
			
		return new ActionForward(path, false);
	}

}
