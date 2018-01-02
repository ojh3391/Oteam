package action;

import javax.servlet.http.*;

public interface Action
{
	// cmd에 따라 만든 모든 액션의 부모역할 및 같은 틀 제공
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws Exception;
}
