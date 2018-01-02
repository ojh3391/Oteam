package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;




@WebServlet("*.do")
public class ControlServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// 기본 셋팅
		// 넘어오는 데이터 한글처리
		req.setCharacterEncoding("UTF-8");
		
		// URL분리하기
		String requestURI=req.getRequestURI(); 
		String contextPath=req.getContextPath();
		String cmd=requestURI.substring(contextPath.length());
		
		
		
		//cmd에따라 액션 생성
		ActionFactory baf=ActionFactory.getInstance();
		Action action=baf.action(cmd);
		
		//액션에 일시키기
		ActionForward af=null;
		try {
			af=action.execute(req, res);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		//결과에 따라 이동
		if(af.isRedirect()) {
			res.sendRedirect(af.getPath());
		}else {
			RequestDispatcher rd=req.getRequestDispatcher(af.getPath());
			rd.forward(req, res);
		}
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
