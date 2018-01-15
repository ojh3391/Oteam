package user.model;

import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
import dao.BoardDAO;
import dao.ReplyDAO;
import dao.UserDAO;
import vo.BoardVO;
import vo.ReplyVO;
import vo.UserVO;



public class MypageAction implements Action {
	private String path;
	
	
	public MypageAction(String path) {
		super();
		this.path = path;
	}


	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		String user_id=req.getParameter("user_id");
		String user_passwd=req.getParameter("user_passwd");
		
		
		UserDAO dao=new UserDAO();
		BoardDAO dao1=new BoardDAO();
		ReplyDAO dao2=new ReplyDAO();
		UserVO vo=dao.isLogin(user_id, user_passwd);
		
		if(vo!=null) {
			
			UserVO rs=dao.myUser(user_id);
			req.setAttribute("rs", rs);
			BoardVO vo1=dao1.getData(user_id);
			req.setAttribute("vo1", vo1);
			Vector<ReplyVO> list=dao2.myreplyList(user_id);
			req.setAttribute("list", list);
			
		}else {
			path="error/login_error.jsp";
		}
		
		return new ActionForward(path, false);
	}

}
