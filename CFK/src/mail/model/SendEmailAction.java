package mail.model;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
import dao.UserDAO;

public class SendEmailAction implements Action {
	
	private String path;
	
	

	public SendEmailAction(String path) {
		super();
		this.path = path;
	}



	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		String address=req.getParameter("address");
		String user_name=req.getParameter("user_name");
		String mail_content=req.getParameter("mail_content");
		
		SendEmail email=new SendEmail(address,user_name, mail_content);
		
		if(email!=null) {
			res.setContentType("text/html;charset=UTF-8");
			PrintWriter out=res.getWriter();
			out.println("<script>");
			out.println("alert('메일이 정상적으로 발송되었습니다.');");
			out.println("location.href='Dashuser.do'");
			out.println("</script>");
			out.close();
		}
		return new ActionForward(path,false);
	}

}
