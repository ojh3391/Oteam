package control;

import action.Action;
import board.model.BoardDeleteAction;
import board.model.BoardHitUpdateAction;
import board.model.BoardListAction;
import board.model.BoardPwdCheckAction;
import board.model.BoardUpdateAction;
import board.model.BoardViewAction;
import board.model.BoardVoteAction;
import board.model.PartiAction;
import reply.model.ReplyDeleteAction;
import reply.model.ReplyInsertAction;
import reply.model.ReplyInsertAction2;
import reply.model.ReplyPwdCheckAction;
import reply.model.ReplyPwdCheckAction2;
import reply.model.ReplyPwdCheckAction3;
import reply.model.ReplyViewAction;
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
		}else if(cmd.equals("/qHitUpdate.do")) {
			action=new BoardHitUpdateAction("qView.do");
		}else if(cmd.equals("/qView.do")) {
			action= new ReplyViewAction("cfk_user_voteview.jsp");
		}else if(cmd.equals("/aDate.do")) {
			action=new AttendAction("cfk_attend_confirm.jsp");
		}else if(cmd.equals("/reply_pwd.do")) {
			action=new ReplyPwdCheckAction("ReplyInsert.do");
		}else if(cmd.equals("/ReplyInsert.do")) {
			action=new ReplyInsertAction("qView.do");		
		}else if(cmd.equals("/board_pwd.do")) {
			action=new BoardPwdCheckAction("BoardDelete.do");
		}else if(cmd.equals("/BoardDelete.do")) {
			action=new BoardDeleteAction("qList.do");
		}else if(cmd.equals("/reply_delete.do")) {
			action=new ReplyPwdCheckAction3("ReplyDelete.do");
		}else if(cmd.equals("/ReplyDelete.do")) {
			action=new ReplyDeleteAction("qView.do");
		}else if(cmd.equals("/reply_pwd2.do")) {
			action=new ReplyPwdCheckAction2("qReplyInsert.do");
		}else if(cmd.equals("/qReplyInsert.do")) {
			action=new ReplyInsertAction2("qView.do");
		}else if(cmd.equals("/boardView.do")) {
			action=new BoardViewAction("board_update.jsp");
		}else if(cmd.equals("/board_update.do")) {
			action=new BoardUpdateAction("qView.do");
		}else if(cmd.equals("/qVote.do")) {
			action=new BoardVoteAction("qView.do");
		}
		
		return action;
	}
}

