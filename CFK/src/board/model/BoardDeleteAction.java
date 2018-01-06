package board.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
import board.dao.BoardDAO;

public class BoardDeleteAction implements Action {
	private String path;
	
	public BoardDeleteAction(String path) {
		super();
		this.path = path;
	}

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// board_num 가져오기
		int board_num=Integer.parseInt(req.getParameter("board_num"));
		
		//해당 일치하는 레코드 삭제하기
		BoardDAO dao=new BoardDAO();
		
		dao.board_delete(board_num);
		
		//삭제후 리스트 이동
		return new ActionForward(path,true);
	}

}
