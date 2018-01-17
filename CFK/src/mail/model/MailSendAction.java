package mail.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
import dao.BoardDAO;
import vo.BoardVO;

public class MailSendAction implements Action {

	private String path;
	
	
	public MailSendAction(String path) {
		super();
		this.path = path;
	}


	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		String user_id=req.getParameter("user_id");
		
		BoardDAO dao=new BoardDAO();
		
		BoardVO vo=dao.getData(user_id);
		req.setAttribute("vo", vo);
		
		return new ActionForward(path,false);
	}

}
