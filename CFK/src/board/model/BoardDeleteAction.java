package board.model;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
import dao.BoardDAO;
import vo.BoardVO;

public class BoardDeleteAction implements Action {
	private String path;
	
	public BoardDeleteAction(String path) {
		super();
		this.path = path;
	}

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// board_num 가져오기
		int board_num=Integer.parseInt(req.getParameter("board_num"));
		
		//해당 일치하는 레코드 삭제하기
		BoardDAO dao=new BoardDAO();
		BoardVO vo=dao.getRow(board_num);
		
		String fileName =vo.getBoard_file();
		String saveDir="/boardUpload";
		String uploadPath=req.getServletContext().getRealPath(saveDir);
		int idx=fileName.lastIndexOf(".");
		String _fileName=fileName.substring(0, idx);
		String filePath=uploadPath+"\\"+fileName;
		String filePath2=uploadPath+"\\thumb\\"+_fileName+".png";
		
        File uploadfile=new File(filePath);
        File uploadfile2=new File(filePath2);
        
        uploadfile.delete();
        uploadfile2.delete(); // 파일 삭제
        

		dao.board_delete(board_num);
		
		//삭제후 리스트 이동
		return new ActionForward(path,true);
	}

}
