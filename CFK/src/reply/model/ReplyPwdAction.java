package reply.model;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;

import user.dao.UserDAO;
import user.vo.UserVO;

public class ReplyPwdAction implements Action {
	
	private String path;
	
	public ReplyPwdAction(String path) {
		super();
		this.path = path;
	}
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		String current_page=req.getParameter("page");
		
		int board_num=Integer.parseInt(req.getParameter("board_num"));
		String content=req.getParameter("content");
		String user_id=req.getParameter("user_id");
		String user_passwd=req.getParameter("user_passwd");
	
		// 비밀번호 맞는지 확인하기
		UserDAO dao=new UserDAO();
		UserVO result=dao.isLogin(user_id, user_passwd);
		if(result!=null) {
			path+="?board_num="+board_num+"&page="+current_page;
			req.setAttribute("user_id", user_id);
			req.setAttribute("content", content);
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
