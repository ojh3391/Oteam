package reply.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
import dao.ReplyDAO;


public class ReplyDeleteAction implements Action {
	private String path;
	
	public ReplyDeleteAction(String path) {
		super();
		this.path = path;
	}

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		int board_num=Integer.parseInt(req.getParameter("board_num"));
		int reply_num=Integer.parseInt(req.getParameter("reply_num"));
		int reply_re_ref=Integer.parseInt(req.getParameter("reply_re_ref"));
		int reply_re_lev=Integer.parseInt(req.getParameter("reply_re_lev"));
		int reply_re_seq=Integer.parseInt(req.getParameter("reply_re_seq"));
		//해당 일치하는 레코드 삭제하기
		ReplyDAO dao=new ReplyDAO();
		
		dao.reply_delete(reply_num,reply_re_ref,reply_re_lev,reply_re_seq);
		
		path+="?board_num="+board_num;
		//삭제후 리스트 이동
		return new ActionForward(path,true);
	}

}
