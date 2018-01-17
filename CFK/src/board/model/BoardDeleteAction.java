package board.model;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
import dao.BoardDAO;
import dao.UserDAO;
import vo.BoardVO;
import vo.UserVO;

public class BoardDeleteAction implements Action {
	
	private String path;
	
	public BoardDeleteAction(String path) {
		super();
		this.path = path;
	}
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		
		int board_num=Integer.parseInt(req.getParameter("board_num"));
		System.out.println(board_num);
	
		//해당 일치하는 레코드 삭제하기
		BoardDAO dao1=new BoardDAO();
		BoardVO vo=dao1.getRow(board_num);
		
		String fileName =vo.getBoard_file();
		String uploadPath=req.getServletContext().getRealPath("/boardUpload");
		String uploadPath1=req.getServletContext().getRealPath("/thumb");
		int idx=fileName.lastIndexOf(".");
		String _fileName=fileName.substring(0, idx);
		String filePath=uploadPath+"\\"+fileName;
		String filePath2=uploadPath1+"\\"+_fileName+".jpg";
		
        File uploadfile=new File(filePath);
        File uploadfile2=new File(filePath2);
        
        uploadfile.delete();
        uploadfile2.delete(); // 파일 삭제
        
        String board_writer=vo.getBoard_writer();
        
		dao1.board_delete(board_num, board_writer);
		
		return new ActionForward(path,false);
	
	
	}

}
