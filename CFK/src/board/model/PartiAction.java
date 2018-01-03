package board.model;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import action.Action;
import action.ActionForward;
import board.dao.BoardDAO;
import board.vo.BoardVO;

public class PartiAction implements Action
{
	private String path;
	

	public PartiAction(String path)
	{
		super();
		this.path=path;
		
	}


	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws Exception
	{
		String saveDir="/upload";
		String uploadPath=req.getServletContext().getRealPath(saveDir);
		
		int size=5*1024*1024;
		MultipartRequest multi;
		//String videoFile=null, videoFileSize=null;
		
		try
		{
			multi=new MultipartRequest(req, uploadPath, size, "UTF-8",new DefaultFileRenamePolicy());
			/*videoFile=multi.getFilesystemName("videoFile");
			String tmp=videoFile.substring(videoFile.lastIndexOf(".")+1);
			if(tmp.equalsIgnoreCase("mp4"))
			{
				
			}else
			{
				
			}*/
			
			
			BoardVO vo=new BoardVO();
			vo.setBoard_subject(multi.getParameter("board_subject"));
			vo.setBoard_content(multi.getParameter("board_content"));
			vo.setBoard_file(multi.getOriginalFileName((String) multi.getFileNames().nextElement()));
			vo.setBoard_real_file(multi.getFilesystemName((String) multi.getFileNames().nextElement()));
			vo.setBoard_writer(multi.getParameter("user_id"));
			BoardDAO dao=new BoardDAO();
			int result=dao.board_parti(vo);
			
						
			
		}catch(IOException e)
		{
			e.printStackTrace();
		}
		return new ActionForward(path, false);
	}

}
