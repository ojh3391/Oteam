package dash.model;

import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
import dao.UserDAO;
import vo.UserVO;

public class DashUserAction implements Action {

	private String path;
	
	
	public DashUserAction(String path) {
		super();
		this.path = path;
	}


	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		UserDAO dao=new UserDAO();
		
		Vector<UserVO> list=dao.userList();
		req.setAttribute("list", list);
		
		return new ActionForward(path, false);
	}

}
