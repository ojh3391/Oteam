package reply.model;

import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
import dao.BoardDAO;
import dao.ReplyDAO;
import vo.ReplyVO;
import vo.BoardVO;
import vo.PageVO;

public class ReplyViewAction implements Action {
	private String path;
	
	public ReplyViewAction(String path) {
		super();
		
		this.path = path;
	}

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		//String current_page=req.getParameter("page");
		//qna_board_list.jsp 넘어오는 값 가져오기
		//board_num 가져오기
		int board_num=Integer.parseInt(req.getParameter("board_num"));
		
		int page=1;
		if(req.getParameter("page")!=null) {
			page=Integer.parseInt(req.getParameter("page"));
		}
				
		BoardDAO dao=new BoardDAO();
		ReplyDAO dao1=new ReplyDAO();
		
		// 2.전체 게시물 수 가져오기
		int total_rows=dao1.total_rows(board_num);
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
			
		BoardVO vo=dao.getRow(board_num);
		Vector<ReplyVO> list=dao1.getList(page,limit,board_num);
		//가져온 내용 담고 페이지 이동
		
		req.setAttribute("vo", vo);
		req.setAttribute("list", list);
		//req.setAttribute("page", current_page);
		req.setAttribute("info", info);
		
		return new ActionForward(path,false);
	}

}
