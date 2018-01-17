package dash.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
import dao.NotifyDAO;

public class NotifyInsertAction implements Action
{
	private String path;
	
	public NotifyInsertAction(String path)
	{
		super();
		this.path = path;
	}

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws Exception
	{
		String notify_content=req.getParameter("notify_content");
		System.out.println(notify_content);
		NotifyDAO dao=new NotifyDAO();
		dao.notify_insert(notify_content);
		
		
		return new ActionForward(path, true);
	}

}
