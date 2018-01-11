package board.model;

import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import action.Action;
import action.ActionForward;
import board.dao.BoardDAO;
import board.vo.BoardVO;
import board.vo.PageVO;
import reply.dao.ReplyDAO;
import reply.vo.ReplyVO;

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
