package reply.model;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
import dao.ReplyDAO;
import dao.UserDAO;
import vo.ReplyVO;
import vo.UserVO;

public class ReplyRePwdAction implements Action {
	
	private String path;
	
	public ReplyRePwdAction(String path) {
		super();
		this.path = path;
	}
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		String current_page=req.getParameter("page");
		
		String user_id=req.getParameter("user_id");
		String user_passwd=req.getParameter("user_passwd");
		
		
		// 비밀번호 맞는지 확인하기
		UserDAO dao=new UserDAO();
		UserVO result=dao.isLogin(user_id, user_passwd);
		if(result!=null) {
			ReplyVO vo=new ReplyVO();
			vo.setReply_num(Integer.parseInt(req.getParameter("reply_num")));
			vo.setReply_board_num(Integer.parseInt(req.getParameter("board_num")));
			vo.setReply_re_ref(Integer.parseInt(req.getParameter("reply_re_ref")));
			vo.setReply_re_lev(Integer.parseInt(req.getParameter("reply_re_lev")));
			vo.setReply_re_seq(Integer.parseInt(req.getParameter("reply_re_seq")));
			
			vo.setReply_writer(req.getParameter("user_id"));
			vo.setReply_content(req.getParameter("content"));
			
			ReplyDAO dao1=new ReplyDAO();
			dao1.board_reply(vo);
			path+="?board_num="+vo.getReply_board_num()+"&current_page="+current_page;
			
		}else {
			res.setContentType("text/html;charset=UTF-8");
			PrintWriter out=res.getWriter();
			out.println("<script>");
			out.println("alert('비빌번호가 튿렸습니다.');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
		}
		//비밀번호가 맞다면 삭제하고 액션으로 페이지 이동
		
		return new ActionForward(path,false);
	
	
	}

}
