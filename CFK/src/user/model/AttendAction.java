package user.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
import dao.UserDAO;
import vo.UserVO;


public class AttendAction implements Action {

	private String path;
	
	public AttendAction(String path) {
		super();
		this.path = path;
	}

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		String select_year=req.getParameter("select_year");
		String select_month=req.getParameter("select_month");
		String select_day=req.getParameter("select_day");
		String user_id=req.getParameter("user_id");
		String user_attend_date=(select_year+"-"+select_month+"-"+select_day);
		
		UserDAO dao=new UserDAO();
		UserVO vo = dao.user_attend(user_attend_date, user_id);
		
		req.setAttribute("vo", vo);
		
		return new ActionForward(path, false);
	}

}
