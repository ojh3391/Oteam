package dash.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
import dao.NotifyDAO;

public class NotifyDeleteAction implements Action
{	
	private String path;
	

	public NotifyDeleteAction(String path)
	{
		super();
		this.path = path;
	}


	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws Exception
	{
		int notify_num=Integer.parseInt(req.getParameter("notify_num"));

		NotifyDAO dao=new NotifyDAO();
		dao.notify_delete(notify_num);
		
		return new ActionForward(path, true);
	}

}
