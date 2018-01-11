package board.model;

import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
import dao.BoardDAO;
import vo.BoardVO;
import vo.PageVO;

public class BoardRankAction implements Action
{
	private String path;
	

	public BoardRankAction(String path)
	{
		super();
		this.path = path;
	}


	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws Exception
	{
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
		//가져온 목록을 request에 담고 페이지 이동
		if(list!=null) {
			req.setAttribute("list", list);
			req.setAttribute("info", info);
		}
		
		
		
		//BoardDAO dao=new BoardDAO();
		
		Vector<BoardVO> rank=dao.getRank();
		Vector<BoardVO> rank1=dao.getMaleRank();
		Vector<BoardVO> rank2=dao.getFemaleRank();
		Vector<BoardVO> rank3=dao.getSeokyoungRank();
		Vector<BoardVO> rank4=dao.getKangwonRank();
		Vector<BoardVO> rank5=dao.getChungcheongRank();
		Vector<BoardVO> rank6=dao.getHonamRank();
		Vector<BoardVO> rank7=dao.getYoungnamRank();
		
		req.setAttribute("rank", rank);
		req.setAttribute("rank1", rank1);	
		req.setAttribute("rank2", rank2);
		req.setAttribute("rank3", rank3);
		req.setAttribute("rank4", rank4);
		req.setAttribute("rank5", rank5);
		req.setAttribute("rank6", rank6);
		req.setAttribute("rank7", rank7);
		
		
		
		return new ActionForward(path, false);
	}

}
