package user.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
import dao.UserDAO;
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
		
		UserDAO dao=new UserDAO();
		UserVO result=dao.isLogin(user_id, user_passwd);
		
		if(result!=null) {
			req.setAttribute("user_id", user_id);
			
		}else {
			path="/error/passwd_error.jsp";
		}
		
		return new ActionForward(path, false);
	}

}
