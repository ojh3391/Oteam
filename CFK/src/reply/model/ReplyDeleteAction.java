package reply.model;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
import reply.dao.ReplyDAO;


public class ReplyDeleteAction implements Action {
	private String path;
	
	public ReplyDeleteAction(String path) {
		super();
		this.path = path;
	}

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// board_num 가져오기
		int reply_num=Integer.parseInt(req.getParameter("board_num"));
		//해당 일치하는 레코드 삭제하기
		ReplyDAO dao=new ReplyDAO();
		
		dao.reply_delete(reply_num);
		
		
		//삭제후 리스트 이동
		return new ActionForward(path,true);
	}

}
