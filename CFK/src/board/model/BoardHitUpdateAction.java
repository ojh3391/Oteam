package board.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
import board.dao.BoardDAO;

public class BoardHitUpdateAction implements Action {
	
	private String path;
	
	
	public BoardHitUpdateAction(String path) {
		super();
		this.path = path;
	}

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		//현재페이지
		String current_page=req.getParameter("page");
		
		// 조회수 업데이트 당담
		int board_num=Integer.parseInt(req.getParameter("board_num"));
		BoardDAO dao=new BoardDAO();
		
		int result=dao.hitUpdate(board_num);
		if(result>0) {
			path+="?board_num="+board_num+"&page="+current_page;
		}
		return new ActionForward(path,true);
	}

}
