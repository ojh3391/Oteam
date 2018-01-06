package reply.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
import reply.dao.ReplyDAO;
import reply.vo.ReplyVO;
import user.vo.UserVO;



public class ReplyInsertAction implements Action {
	
	private String path;
	
	

	public ReplyInsertAction(String path) {
		super();
		this.path = path;
	}



	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		
		ReplyVO vo1=new ReplyVO();
		
		int board_num=Integer.parseInt(req.getParameter("board_num"));
		
		String user_id=(String) req.getAttribute("user_id");
		
		String content=req.getParameter("content");
	
		vo1.setReply_content(content);
		vo1.setReply_board_num(board_num);
		vo1.setReply_writer(user_id);
		
		ReplyDAO dao=new ReplyDAO();
		int result=dao.insert(vo1);
		if(result==0) {
			path="board/qna_board_write_error.jsp";
		}
		path+="?board_num="+board_num;
		return new ActionForward(path, true);
	}

}
