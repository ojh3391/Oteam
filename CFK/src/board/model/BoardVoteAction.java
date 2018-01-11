package board.model;


import java.net.URLDecoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
import dao.BoardDAO;
import dao.UserDAO;
import vo.UserVO;

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
		
		String user_id1=req.getParameter("user_id");
	
		String user_id=URLDecoder.decode((URLDecoder.decode(user_id1, "8859_1")), "UTF-8");
		
		UserDAO dao1=new UserDAO();
		UserVO rs=dao1.voteLimit(user_id);
		
		int vote=rs.getUser_check_vote();
		
		if(vote<=0) {
			path="error/vote_error.jsp";
		}else {
			BoardDAO dao=new BoardDAO();
			dao.voteUpdate(board_num);
			dao1.voteMinus(user_id);
			
		}

		path+="?board_num="+board_num+"&page="+current_page;

		return new ActionForward(path, false);
	}

}
