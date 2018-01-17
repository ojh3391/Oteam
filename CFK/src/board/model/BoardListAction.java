package board.model;

import java.util.*;

import javax.servlet.http.*;

import action.Action;
import action.ActionForward;
import dao.*;
import vo.*;



public class BoardListAction implements Action
{
	private String path;
	
	
	public BoardListAction(String path)
	{
		super();
		this.path = path;
	}

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws Exception
	{
		//String current_page=req.getParameter("page");
		// DAO getList() 호출 후 
		// 사용자가 선택한 페이지 번호에 맞는 게시판 목록 가져오기
		// 1.사용자가 선택한 페이지 가져오기
		
		
		
		int page=1;
		if(req.getParameter("page")!=null) {
			page=Integer.parseInt(req.getParameter("page"));
		}
				
		BoardDAO dao=new BoardDAO();
		
		// 2.전체 게시물 수 가져오기
		int total_rows=dao.total_rows();
		// 3.한페이지에 보여줄 갯수 정하기
		int limit=10;
		// 4.화면 리스트페이지 하단에 total_page 결정
		int total_page=(int)((double)total_rows/limit+0.95);
		// 5.현재화면에서 보여줄 스타트페이지 구하기
		int startPage=((int)((double)page/10+0.9)-1)*10+1;
		// 6.엔드페이지
		int endPage=startPage+10-1;
		if(endPage>total_page) {
			endPage=total_page;
		}
		PageVO info=new PageVO();
		info.setPage(page);
		info.setEndPage(endPage);
		info.setStartPage(startPage);
		info.setTotalPage(total_page);
		info.setTotoalRows(total_rows);
		
		//페이지 변수값에 따른 목록가져오기
		Vector<BoardVO> list=dao.getList(page,limit);
		NotifyDAO dao1=new NotifyDAO();
		Vector<NotifyVO> notiList=dao1.getNotifyList();
		req.setAttribute("notiList", notiList);
		//가져온 목록을 request에 담고 페이지 이동
		if(list!=null) {
			req.setAttribute("list", list);
			req.setAttribute("info", info);
			
		}
		
		return new ActionForward(path, false);
	}

}
