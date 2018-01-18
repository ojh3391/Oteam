package dash.model;

import java.io.PrintWriter;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import action.ActionForward;
import dao.BoardDAO;
import dao.NotifyDAO;
import vo.BoardVO;
import vo.NotifyVO;
import vo.UserVO;

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
		HttpSession session=req.getSession(false);
		UserVO vo1=(UserVO)session.getAttribute("vo");
		if(vo1.getUser_id().equals("admin")) {
			BoardDAO dao=new BoardDAO();
			Vector<BoardVO> list=dao.getDashList();
			
			NotifyDAO nao=new NotifyDAO();
			Vector<NotifyVO> notiList=nao.getNotifyList();
			
			req.setAttribute("list", list);
			req.setAttribute("notiList", notiList);
		}else {
			PrintWriter out=res.getWriter();
			out.println("<script>");
			out.println("alert('어딜 드려오려하나!');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
		}
		
		
		return new ActionForward(path, false);
	}

}
