package control;

import action.Action;
import board.model.BoardDeleteAction;
import board.model.BoardEnterAction;
import board.model.BoardHitUpdateAction;
import board.model.BoardListAction;
import board.model.BoardDeletePwdAction;
import board.model.BoardUpdateAction;
import board.model.BoardViewAction;
import board.model.BoardVoteAction;
import board.model.BoardRankAction;
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
			action=new ModifyAction("cfk_user_mypage.jsp");
		}else if(cmd.equals("/mypage.do")) {
			action=new MypageAction("cfk_user_update.jsp");
		}else if(cmd.equals("/update.do")) {
			action=new UpdateAction("cfk_user_modify.jsp");
		}else if(cmd.equals("/login.do")) {							//로그인 체크
			action=new LoginAction("index.jsp");
		}else if(cmd.equals("/logout.do")) {
			action=new LogoutAction("index.jsp");
		}else if(cmd.equals("/enter.do")) {							//참가신청 액션
			action=new BoardEnterAction("index.jsp");
		}else if(cmd.equals("/List.do")) {							//리스트 가기전 체크
			action=new BoardListAction("/board_list.jsp");
		}else if(cmd.equals("/HitUpdate.do")) {
			action=new BoardHitUpdateAction("View.do");
		}else if(cmd.equals("/View.do")) {
			action= new ReplyViewAction("board_view.jsp");
		}else if(cmd.equals("/aDate.do")) {
			action=new AttendAction("board_attend_confirm.jsp");
		}else if(cmd.equals("/reply_pwd.do")) {
			action=new ReplyPwdCheckAction("ReplyInsert.do");
		}else if(cmd.equals("/ReplyInsert.do")) {
			action=new ReplyInsertAction("View.do");		
		}else if(cmd.equals("/board_delete_pwd.do")) {
			action=new BoardDeletePwdAction("BoardDelete.do");
		}else if(cmd.equals("/BoardDelete.do")) {
			action=new BoardDeleteAction("List.do");
		}else if(cmd.equals("/reply_delete.do")) {
			action=new ReplyPwdCheckAction3("ReplyDelete.do");
		}else if(cmd.equals("/ReplyDelete.do")) {
			action=new ReplyDeleteAction("View.do");
		}else if(cmd.equals("/reply_pwd2.do")) {
			action=new ReplyPwdCheckAction2("qReplyInsert.do");
		}else if(cmd.equals("/qReplyInsert.do")) {
			action=new ReplyInsertAction2("View.do");
		}else if(cmd.equals("/boardView.do")) {
			action=new BoardViewAction("board_update.jsp");
		}else if(cmd.equals("/board_update.do")) {
			action=new BoardUpdateAction("View.do");
		}else if(cmd.equals("/Vote.do")) {
			action=new BoardVoteAction("View.do");
		}else if(cmd.equals("/rank.do")){							//메인으로 가기 전 랭크체크
			action=new BoardRankAction("board_main.jsp");
		}else if(cmd.equals("/leave.do")) {
			action=new LeaveAction("index.jsp");
		}
		
		return action;
	}
}

