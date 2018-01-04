package reply.model;

import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import action.Action;
import action.ActionForward;
import board.dao.BoardDAO;
import board.vo.BoardVO;
import reply.dao.ReplyDAO;
import reply.vo.ReplyVO;

public class ReplyViewAction implements Action {
	private String path;
	
	public ReplyViewAction(String path) {
		super();
		this.path = path;
	}

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		String current_page=req.getParameter("page");
		//qna_board_list.jsp 넘어오는 값 가져오기
		//board_num 가져오기
		int board_num=Integer.parseInt(req.getParameter("board_num"));
		
		//board_num과 일치하는 DB 내용 가져오기
		BoardDAO dao=new BoardDAO();
		ReplyDAO dao1=new ReplyDAO();
		
		BoardVO vo=dao.getRow(board_num);
		Vector<ReplyVO> vo1=dao1.reply_all(board_num);
		//가져온 내용 담고 페이지 이동
		req.setAttribute("vo", vo);
		req.setAttribute("vo1", vo1);
		req.setAttribute("page", current_page);
		
		
		return new ActionForward(path,false);
	}

}
