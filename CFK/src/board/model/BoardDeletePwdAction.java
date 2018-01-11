package board.model;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;

import user.dao.UserDAO;
import user.vo.UserVO;

public class BoardDeletePwdAction implements Action {
	
	private String path;
	
	public BoardDeletePwdAction(String path) {
		super();
		this.path = path;
	}
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		String current_page=req.getParameter("page");
		
		int board_num=Integer.parseInt(req.getParameter("board_num"));
		String user_id=req.getParameter("user_id");
		String user_passwd=req.getParameter("user_passwd");
	
		// 비밀번호 맞는지 확인하기
		UserDAO dao=new UserDAO();
		UserVO result=dao.isLogin(user_id, user_passwd);
		if(result!=null) {
			path+="?board_num="+board_num+"&page="+current_page;
			
		}else {
			path="error/passwd_error.jsp";
		}
		//비밀번호가 맞다면 삭제하고 액션으로 페이지 이동
		
		return new ActionForward(path,false);
	
	
	}

}
