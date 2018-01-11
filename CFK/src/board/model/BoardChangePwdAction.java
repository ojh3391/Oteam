package board.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
import dao.BoardDAO;
import vo.BoardVO;

public class BoardChangePwdAction implements Action {
	private String path;
	
	public BoardChangePwdAction(String path) {
		super();
		this.path = path;
	}

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
	
		int board_num=Integer.parseInt(req.getParameter("board_num"));
		
		BoardDAO dao=new BoardDAO();
			
		BoardVO vo=dao.getRow(board_num);
		
		req.setAttribute("vo", vo);
			
		return new ActionForward(path,false);
	}

}
