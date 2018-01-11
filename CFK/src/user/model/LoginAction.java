package user.model;

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
			
			//관리자 admin 으로 접속 시 관리자 페이지로 이동
			if(vo.getUser_id().equals("admin")) {
				path="cfk_manage.jsp";
			}
				
		}else {
			path="error/login_error.jsp";
		}		
		return new ActionForward(path, false);	
	}

}
