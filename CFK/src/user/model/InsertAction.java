package user.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
import dao.UserDAO;


public class InsertAction implements Action {

	private String path;
	
	
	public InsertAction(String path) {
		super();
		this.path = path;
	}


	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		String user_id=req.getParameter("user_id");
		String user_passwd=req.getParameter("user_passwd");
		String user_name=req.getParameter("user_name");
		String user_area=req.getParameter("user_area");
		String user_addr=req.getParameter("user_addr");
		String user_tel=req.getParameter("user_tel");
		int user_age=Integer.parseInt(req.getParameter("user_age"));
		String user_email=req.getParameter("user_email");
		String user_gender=req.getParameter("user_gender");
		
		UserDAO dao=new UserDAO();
		//중복체크
		dao.user_check_reduplication(user_id);
		//회원정보 삽입
		dao.user_insert(user_id, user_passwd, user_addr, user_area, user_tel, user_age, user_name,user_email,user_gender);
		
		return new ActionForward(path, true);
	}

}
