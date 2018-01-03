package user.model;

import javax.servlet.http.*;

import action.Action;
import action.ActionForward;



public class LogoutAction implements Action
{
	private String path;
	
	public LogoutAction(String path)
	{
		super();
		this.path = path;
	}

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws Exception
	{
		HttpSession session=req.getSession(false);
		
		if(session.getAttribute("vo") !=null) {
			session.invalidate();
		}
		
		return new ActionForward(path, true);
	}

}
