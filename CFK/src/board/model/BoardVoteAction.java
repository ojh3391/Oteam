package board.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
import board.dao.BoardDAO;
import user.dao.UserDAO;
import user.vo.UserVO;

public class BoardVoteAction implements Action {
	
	private String path;
	
	
	public BoardVoteAction(String path) {
		super();
		this.path = path;
	}


	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		String current_page=req.getParameter("page");
		//투표수 1씩 증가 담당
		int board_num=Integer.parseInt(req.getParameter("board_num"));
		
		
		BoardDAO dao=new BoardDAO();
		int result=dao.voteUpdate(board_num);
		
		
		if(result>0) {
			path+="?board_num="+board_num+"&page="+current_page;
		}
		
		
		return new ActionForward(path, true);
	}

}
