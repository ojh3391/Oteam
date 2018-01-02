package control;

import action.Action;

import user.model.InsertAction;
import user.model.LoginAction;

public class ActionFactory {
	// 서블릿의 의뢰를 받아 각각의 cmd에 따라 액션 생성후 넘기기
	private static ActionFactory baf=null;
	private ActionFactory() {}
	public static ActionFactory getInstance() {
		if(baf==null) {
			baf=new ActionFactory();
		}
		return baf;
	}
		
	Action action=null;
		
	public Action action(String cmd) {
		if(cmd.equals("/insert.do")) {
			action=new InsertAction("index.jsp");
		}else if(cmd.equals("/login.do")) {
			action=new LoginAction("index.jsp");
		}
		return action;
	}
}

