package user.model;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import action.ActionForward;
import user.dao.UserDAO;
import user.vo.UserVO;

public class LoginAction implements Action {
	private String path;
	
	public LoginAction(String path) {
		super();
		this.path = path;
	}

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		//id,pwd가져오기
		String id=req.getParameter("user_id");
		String passwd=req.getParameter("user_passwd");
		
		//userstable 에 id,pwd 있는지 메소드 호출
		UserDAO dao=new UserDAO();
		UserVO vo=dao.isLogin(id, passwd);
		//존재하는 사용자라면 session에 담기 
		if(vo!=null) {
			HttpSession session=req.getSession();
			session.setAttribute("vo", vo);
					
		}else {
			res.setContentType("text/html;charset=UTF-8");
			PrintWriter out=res.getWriter();
			out.println("<script>");
			out.println("alert('아이디 또는 비밀번호를 다시 확인하세요.');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
		}		
		return new ActionForward(path, false);
	}

}
