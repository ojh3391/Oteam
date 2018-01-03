package user.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
import user.dao.UserDAO;


public class UpdateAction implements Action {
	
	private String path;
	
	

	public UpdateAction(String path) {
		super();
		this.path = path;
	}



	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		String user_id=req.getParameter("user_id");
		String user_passwd=req.getParameter("user_passwd");
		String user_addr=req.getParameter("user_addr");
		String user_area=req.getParameter("user_area");
		String user_tel=req.getParameter("user_tel");
		String user_email=req.getParameter("user_email");
		
		UserDAO dao=new UserDAO();
		
		int result=dao.user_Update(user_id, user_passwd, user_addr,user_area, user_tel, user_email);
		
		
		return new ActionForward(path, true);
	}

}
