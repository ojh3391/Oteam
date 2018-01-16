package dash.model;

import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
import dao.BoardDAO;
import vo.BoardVO;

public class DashBoardList implements Action
{
	private String path;
	
	public DashBoardList(String path)
	{
		super();
		this.path=path;
	}

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws Exception
	{
		BoardDAO dao=new BoardDAO();
		Vector<BoardVO> list=dao.getDashList();
		
		req.setAttribute("list", list);
		
		
		return new ActionForward(path, false);
	}

}
