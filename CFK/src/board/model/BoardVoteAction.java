package board.model;

import java.io.PrintWriter;
import java.net.URLEncoder;

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
		
		String user_id=req.getParameter("user_id");
		

		UserDAO dao1=new UserDAO();
		UserVO rs=dao1.voteLimit(user_id);
		
		int vote=rs.getUser_check_vote();
		
		if(vote<=0) {
			path="vote_error.jsp";
			
			
			/*res.setContentType("text/html;charset=UTF-8");
			
			
			
			PrintWriter out=res.getWriter();
			out.println("<script>");
			out.println("alert('투표를 3회이상 하셨습니다.');");
			out.println("history.back();");
			out.println("</script>");
			out.close();*/
			
		}else {
			BoardDAO dao=new BoardDAO();
			dao.voteUpdate(board_num);
			dao1.voteMinus(user_id);
			
		}
		
		
		path+="?board_num="+board_num+"&page="+current_page;
		
		
		return new ActionForward(path, false);
	}

}
