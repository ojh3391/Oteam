package mail.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
import dao.BoardDAO;
import dao.UserDAO;
import vo.BoardVO;
import vo.UserVO;

public class MailSendAction implements Action {

	private String path;
	
	
	public MailSendAction(String path) {
		super();
		this.path = path;
	}


	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		String user_id=req.getParameter("user_id");
		
		UserDAO dao1=new UserDAO();
		BoardDAO dao=new BoardDAO();
		
		UserVO vo1=dao1.getUser(user_id);
		BoardVO vo=dao.getData(user_id);
		req.setAttribute("vo1", vo1);
		req.setAttribute("vo", vo);
		
		return new ActionForward(path,false);
	}

}
