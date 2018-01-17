package dash.model;

import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
import dao.NotifyDAO;
import vo.NotifyVO;

public class NotifyViewAction implements Action
{
	private String path;
	
	public NotifyViewAction(String path)
	{
		super();
		this.path = path;
	}

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws Exception
	{
		NotifyDAO dao=new NotifyDAO();
		Vector<NotifyVO> notiList=dao.getNotifyList();
		
		
		req.setAttribute("notiList", notiList);
		
		
		return new ActionForward(path, true);
	}

}
