package board.model;



import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import action.Action;
import action.ActionForward;
import dao.BoardDAO;
import vo.BoardVO;


public class BoardUpdateAction implements Action {
	private String path;
	
	public BoardUpdateAction(String path) {
		super();
		this.path = path;
	}

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// qna_board_modify.jsp 정보 끌고오기
		// board_subject, board_content , board_file
		// board_num,board_pass
		
		String uploadPath=req.getServletContext().getRealPath("/boardUpload");
		String uploadPath2=req.getServletContext().getRealPath("/thumb");
		
		
		// 파일 업로드 사이즈 제한
		int size=50*1024*1024;
	
		MultipartRequest multi;
		multi=new MultipartRequest(req, uploadPath, size,"UTF-8",new DefaultFileRenamePolicy());
		BoardVO vo=new BoardVO();
		int board_num=Integer.parseInt(multi.getParameter("board_num"));
		
		if(multi.getOriginalFileName((String) multi.getFileNames().nextElement())!=null) {
			
			String fileName1 =multi.getParameter("board_file");
			String saveDir1="/boardUpload";
			String uploadPath1=req.getServletContext().getRealPath(saveDir1);
			int idx1=fileName1.lastIndexOf(".");
			String _sfileName=fileName1.substring(0, idx1);
			String filePath3=uploadPath1+"\\"+fileName1;
			String filePath4=uploadPath2+"\\"+_sfileName+".jpg";

		
			
	        File uploadfile=new File(filePath3);
	        File uploadfile2=new File(filePath4);
	        
	        uploadfile.delete();
	        uploadfile2.delete(); // 파일 삭제
			
			vo.setBoard_num(board_num);
			vo.setBoard_subject(multi.getParameter("board_subject"));
			vo.setBoard_content(multi.getParameter("board_content"));
			vo.setBoard_file(multi.getOriginalFileName((String) multi.getFileNames().nextElement()));
			vo.setBoard_real_file(multi.getFilesystemName((String) multi.getFileNames().nextElement()));
			vo.setBoard_writer(multi.getParameter("user_id"));
			
			//동영상 썸네일 이미지 추출
			//Enumeration<String> names=multi.getFileNames();
			//String fileName=multi.getOriginalFileName(names.nextElement());
			String fileName=multi.getFilesystemName((String) multi.getFileNames().nextElement());
			int idx=fileName.lastIndexOf(".");
			String _fileName=fileName.substring(0, idx);
			
			String filePath=uploadPath+"\\"+fileName;
			String filePath2=uploadPath2+"\\"+_fileName+".jpg";

			String thumb=_fileName+".jpg";
			vo.setBoard_thumbnail(thumb);
			
			
			String[] cmd=new String[] {"C:\\ffmpeg.exe","-i",filePath,"-ss","00:00:05","-vframes","1","-an","-s","300*200",filePath2};
			
			try
			{
				Process p=new ProcessBuilder(cmd).start();
				p.waitFor();
				
			}catch(Exception e)
			{
				
				e.printStackTrace();
			}
			
			BoardDAO dao=new BoardDAO();
			dao.board_update(vo);
		}else {
			vo.setBoard_num(board_num);
			vo.setBoard_subject(multi.getParameter("board_subject"));
			vo.setBoard_content(multi.getParameter("board_content"));
			vo.setBoard_writer(multi.getParameter("user_id"));
			vo.setBoard_file(multi.getParameter("board_file"));
			vo.setBoard_real_file(multi.getParameter("board_real_file"));
			vo.setBoard_thumbnail(multi.getParameter("board_thumbnail"));
			BoardDAO dao=new BoardDAO();
			dao.board_update(vo);
		}

		path+="?board_num="+board_num;
			
	
		return new ActionForward(path, false);
}
}	
