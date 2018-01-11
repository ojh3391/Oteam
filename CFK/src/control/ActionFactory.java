package control;

import action.Action;
import board.model.BoardDeleteAction;
import board.model.BoardEnterAction;
import board.model.BoardHitUpdateAction;
import board.model.BoardListAction;
import board.model.BoardDeletePwdAction;
import board.model.BoardUpdateAction;
import board.model.BoardChangePwdAction;
import board.model.BoardVoteAction;
import board.model.BoardRankAction;
import reply.model.ReplyDeleteAction;
import reply.model.ReplyInsertAction;
import reply.model.ReplyReInsertAction;
import reply.model.ReplyPwdAction;
import reply.model.ReplyRePwdAction;
import reply.model.ReplyDeletePwdAction;
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
		if(cmd.equals("/insert.do")) {								//회원가입 액션
			action=new InsertAction("index.jsp");
		}else if(cmd.equals("/Mypage.do")) {						//회원페이지 비번체크 및 액션
			action=new MypageAction("user_mypage.jsp");
		}else if(cmd.equals("/update_page.do")) {					//회원수정 페이지 액션
			action=new UpdatePageAction("user_update.jsp");		
		}else if(cmd.equals("/update.do")) {						//회원수정 액션
			action=new UpdateAction("user_mypage.jsp");
		}else if(cmd.equals("/login.do")) {							//로그인 액션
			action=new LoginAction("index.jsp");
		}else if(cmd.equals("/logout.do")) {						//로그아웃 액션
			action=new LogoutAction("index.jsp");
		}else if(cmd.equals("/enter.do")) {							//참가신청 액션
			action=new BoardEnterAction("index.jsp");
		}else if(cmd.equals("/List.do")) {							//리스트 가기전 체크
			action=new BoardListAction("/board_list.jsp");
		}else if(cmd.equals("/HitUpdate.do")) {						//게시글 조회수 증가
			action=new BoardHitUpdateAction("View.do");
		}else if(cmd.equals("/View.do")) {							//뷰 가기전 체크
			action= new ReplyViewAction("board_view.jsp");
		}else if(cmd.equals("/Attend.do")) {						//방청신청 액션
			action=new AttendAction("board_attend_confirm.jsp");
		}else if(cmd.equals("/reply_pwd.do")) {						//댓글 등록시 비번체크
			action=new ReplyPwdAction("ReplyInsert.do");
		}else if(cmd.equals("/ReplyInsert.do")) {					//댓글 등록 액션
			action=new ReplyInsertAction("View.do");		
		}else if(cmd.equals("/board_delete_pwd.do")) {				//게시글 삭제 시 비번체크
			action=new BoardDeletePwdAction("BoardDelete.do");
		}else if(cmd.equals("/BoardDelete.do")) {					//게시글 삭제 액션
			action=new BoardDeleteAction("List.do");
		}else if(cmd.equals("/reply_delete.do")) {					//댓글 삭제 비번체크
			action=new ReplyDeletePwdAction("ReplyDelete.do");
		}else if(cmd.equals("/ReplyDelete.do")) {					//댓글 삭제 액션
			action=new ReplyDeleteAction("View.do");
		}else if(cmd.equals("/reply_re_pwd.do")) {					//댓글에 댓글 비번체크
			action=new ReplyRePwdAction("ReplyReInsert.do");
		}else if(cmd.equals("/ReplyReInsert.do")) {					//댓글에 댓글 등록 액션
			action=new ReplyReInsertAction("View.do");
		}else if(cmd.equals("/board_change_pwd.do")) {				//게시글 변경 시 비번체크
			action=new BoardChangePwdAction("board_update.jsp");	
		}else if(cmd.equals("/board_update.do")) {					//게시글 변경 액션
			action=new BoardUpdateAction("View.do");
		}else if(cmd.equals("/Vote.do")) {							//투표 액션
			action=new BoardVoteAction("View.do");
		}else if(cmd.equals("/Rank.do")){							//메인으로 가기 전 랭크체크
			action=new BoardRankAction("board_main.jsp");
		}else if(cmd.equals("/leave.do")) {							//탈퇴 액션
			action=new LeaveAction("index.jsp");
		}
		
		return action;
	}
}

