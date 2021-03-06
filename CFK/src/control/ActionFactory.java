package control;

import action.Action;
import board.model.BoardEnterAction;
import board.model.BoardHitUpdateAction;
import board.model.BoardListAction;
import board.model.BoardDeletePwdAction;
import board.model.BoardUpdateAction;
import board.model.BoardChangePwdAction;
import board.model.BoardDeleteAction;
import board.model.BoardVoteAction;
import dash.model.DashBoardAction;
import dash.model.DashUserAction;
import dash.model.NotifyDeleteAction;
import dash.model.NotifyInsertAction;
import mail.model.MailViewAction;
import mail.model.SendEmailAction;
import board.model.BoardRankAction;
import reply.model.ReplyPwdAction;
import reply.model.ReplyRePwdAction;
import reply.model.ReplyUpdatePwdAction;
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
			action=new MypageAction("user/user_mypage.jsp");
		}else if(cmd.equals("/update_page.do")) {					//회원수정 페이지 액션
			action=new UpdatePageAction("user/user_update.jsp");		
		}else if(cmd.equals("/update.do")) {						//회원수정 액션
			action=new UpdateAction("user/user_page_pwd.jsp");
		}else if(cmd.equals("/login.do")) {							//로그인 액션
			action=new LoginAction("index.jsp");
		}else if(cmd.equals("/logout.do")) {						//로그아웃 액션
			action=new LogoutAction("index.jsp");
		}else if(cmd.equals("/Enter.do")) {							//참가신청 액션
			action=new BoardEnterAction("List.do");
		}else if(cmd.equals("/List.do")) {							//리스트 가기전 체크
			action=new BoardListAction("board/board_list.jsp");
		}else if(cmd.equals("/HitUpdate.do")) {						//게시글 조회수 증가
			action=new BoardHitUpdateAction("View.do");
		}else if(cmd.equals("/View.do")) {							//뷰 가기전 체크
			action= new ReplyViewAction("reply/reply_view.jsp");
		}else if(cmd.equals("/Attend.do")) {						//방청신청 액션
			action=new AttendAction("board/board_attend_confirm.jsp");
		}else if(cmd.equals("/reply_pwd.do")) {						//댓글 등록시 비번체크 및 액션
			action=new ReplyPwdAction("View.do");		
		}else if(cmd.equals("/board_delete_pwd.do")) {				//게시글 삭제 시 비번체크 및 액션
			action=new BoardDeletePwdAction("List.do");	
		}else if(cmd.equals("/reply_delete.do")) {					//댓글 삭제 비번체크 및 액션
			action=new ReplyDeletePwdAction("View.do");
		}else if(cmd.equals("/reply_re_pwd.do")) {					//댓글에 댓글 비번체크 및 액션
			action=new ReplyRePwdAction("View.do");
		}else if(cmd.equals("/board_change_pwd.do")) {				//게시글 변경 시 비번체크
			action=new BoardChangePwdAction("board/board_update.jsp");	
		}else if(cmd.equals("/board_update.do")) {					//게시글 변경 액션
			action=new BoardUpdateAction("View.do");
		}else if(cmd.equals("/Vote.do")) {							//투표 액션
			action=new BoardVoteAction("View.do");
		}else if(cmd.equals("/Rank.do")){							//메인으로 가기 전 랭크체크
			action=new BoardRankAction("board/board_main.jsp");
		}else if(cmd.equals("/user_leave_pwd.do")) {				//탈퇴시 비번 체크 및 액션
			action=new LeavePwdAction("Rank.do");
		}else if(cmd.equals("/reply_update_pwd.do")) {				//댓글 수정시 비번 체크 및 액션
			action=new ReplyUpdatePwdAction("View.do");
		}else if(cmd.equals("/Dashboard.do")){						//관리자 페이지 게시판관리 액션
			action=new DashBoardAction("dashboard/pages/dash_board.jsp");
		}else if(cmd.equals("/Dashuser.do")) {                      //관리자 페이지 회원관리 액션
			action=new DashUserAction("dashboard/pages/dash_user.jsp");
		}else if(cmd.equals("/Leave.do")) {							//관리자가 회원 추방
			action=new LeavePwdAction("Dashuser.do");
		}else if(cmd.equals("/notify_insert.do")) {					//관리자가 공지사항 추가
			action=new NotifyInsertAction("Dashboard.do");
		}else if(cmd.equals("/dashboard_delete.do")) {              //관리자 게시글 삭제
			action=new BoardDeleteAction("Dashboard.do");
		}else if(cmd.equals("/dash_mail.do")) {                     //관리자가 이메일 이동
			action=new MailViewAction("dashboard/pages/dash_email.jsp");
		}else if(cmd.equals("/notify_delete.do")) {                 //공지사항 삭제
			action=new NotifyDeleteAction("Dashboard.do");
		}else if(cmd.equals("/sendemail.do")) {                      //관리자작 이메일 전송으로 이동
			action=new SendEmailAction("Dashuser.do");
		}
		
		return action;
	}
}

