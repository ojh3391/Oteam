package reply.model;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
import dao.ReplyDAO;
import dao.UserDAO;
import vo.UserVO;

public class ReplyUpdatePwdAction implements Action {
	
	private String path;
	
	public ReplyUpdatePwdAction(String path) {
		super();
		this.path = path;
	}
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		String current_page=req.getParameter("page");
		
		String user_id=req.getParameter("user_id");
		String user_passwd=req.getParameter("user_passwd");
		String content=req.getParameter("content");
		int board_num=Integer.parseInt(req.getParameter("board_num"));
		int reply_num=Integer.parseInt(req.getParameter("reply_num"));
	
		// 비밀번호 맞는지 확인하기
		UserDAO dao=new UserDAO();
		UserVO result=dao.isLogin(user_id, user_passwd);
		if(result!=null) {
			
			ReplyDAO dao1=new ReplyDAO();
			
			dao1.reply_update(reply_num,content);
			
			path+="?board_num="+board_num+"&current_page="+current_page;
			
		}else {
			res.setContentType("text/html;charset=UTF-8");
			PrintWriter out=res.getWriter();
			out.println("<script>");
			out.println("alert('비빌번호가 틀렸습니다.');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
		}
		//비밀번호가 맞다면 삭제하고 액션으로 페이지 이동
		
		return new ActionForward(path,false);
	
	
	}

}
