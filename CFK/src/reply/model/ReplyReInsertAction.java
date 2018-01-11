package reply.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
import reply.dao.ReplyDAO;
import reply.vo.ReplyVO;



public class ReplyReInsertAction implements Action {
	private String path;
	
	public ReplyReInsertAction(String path) {
		super();
		this.path = path;
	}

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// qna_board_reply에서 넘긴값 가져오기
		// hidden 값 4 개 가져오기
		ReplyVO vo=new ReplyVO();
		vo.setReply_num(Integer.parseInt(req.getParameter("reply_num")));
		vo.setReply_board_num(Integer.parseInt(req.getParameter("board_num")));
		vo.setReply_re_ref(Integer.parseInt(req.getParameter("reply_re_ref")));
		vo.setReply_re_lev(Integer.parseInt(req.getParameter("reply_re_lev")));
		vo.setReply_re_seq(Integer.parseInt(req.getParameter("reply_re_seq")));
		// form에 입력된 4개 가져오기
		vo.setReply_writer(req.getParameter("user_id"));
		vo.setReply_content(req.getParameter("content"));
		
		//테이블에 답변등록
		ReplyDAO dao=new ReplyDAO();
		int result=dao.board_reply(vo);
		if(result==0) {
			
		}
		path+="?board_num="+vo.getReply_board_num();
		return new ActionForward(path, true);
	}

}
