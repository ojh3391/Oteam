package control;

import action.Action;
import board.model.BoardListAction;
import board.model.PartiAction;
import user.model.*;




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
		}else if(cmd.equals("/modify.do")) {
			action=new ModifyAction("cfk_user_update.jsp");
		}else if(cmd.equals("/update.do")) {
			action=new UpdateAction("index.jsp");
		}else if(cmd.equals("/login.do")) {
			action=new LoginAction("index.jsp");
		}else if(cmd.equals("/logout.do")) {
			action=new LogoutAction("index.jsp");
		}else if(cmd.equals("/parti.do")) {
			action=new PartiAction("index.jsp");
		}else if(cmd.equals("/qList.do")) {
			action=new BoardListAction("cfk_board_list.jsp");
		}	
		return action;
	}
}

