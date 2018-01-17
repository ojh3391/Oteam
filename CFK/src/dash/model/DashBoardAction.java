package dash.model;

import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
import dao.BoardDAO;
import dao.NotifyDAO;
import vo.BoardVO;
import vo.NotifyVO;

public class DashBoardAction implements Action
{
	private String path;
	
	public DashBoardAction(String path)
	{
		super();
		this.path=path;
	}

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws Exception
	{
		BoardDAO dao=new BoardDAO();
		Vector<BoardVO> list=dao.getDashList();
		
		NotifyDAO nao=new NotifyDAO();
		Vector<NotifyVO> notiList=nao.getNotifyList();
		
		req.setAttribute("list", list);
		req.setAttribute("notiList", notiList);
		
		return new ActionForward(path, false);
	}

}
