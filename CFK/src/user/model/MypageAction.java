package user.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
import user.dao.UserDAO;
import user.vo.UserVO;



public class MypageAction implements Action {
	private String path;
	
	
	public MypageAction(String path) {
		super();
		this.path = path;
	}


	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		String user_id=req.getParameter("user_id");
		String user_passwd=req.getParameter("user_passwd");
		
		
		UserDAO dao=new UserDAO();
		UserVO vo=dao.isLogin(user_id, user_passwd);
		
		if(vo!=null) {
			
			UserVO rs=dao.myUser(user_id);
			req.setAttribute("rs", rs);
			
		}else {
			path="error/login_error.jsp";
		}
		
		return new ActionForward(path, false);
	}

}
