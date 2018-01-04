package board.model;

import java.io.IOException;
import java.util.Enumeration;

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
		
		String saveDir="/boardUpload";
		String uploadPath=req.getServletContext().getRealPath(saveDir);
		
		
		
		int size=50*1024*1024;
		MultipartRequest multi;
		//String videoFile=null, videoFileSize=null;
		
		try
		{
			multi=new MultipartRequest(req, uploadPath, size, "UTF-8", new DefaultFileRenamePolicy());
			
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
			
			//동영상 썸네일 추출
			Enumeration<String> names=multi.getFileNames();
			String fileName=multi.getOriginalFileName(names.nextElement());
			int idx=fileName.lastIndexOf(".");
			String _fileName=fileName.substring(0, idx);
			System.out.println(uploadPath+"\\"+fileName);
			String filePath=uploadPath+"\\"+fileName;
			String filePath2=uploadPath+"\\thumb\\"+_fileName+".png";
			System.out.println(filePath2);
			String thumb=_fileName+".png";
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
			int result=dao.board_parti(vo);
			
						
			
		}catch(IOException e)
		{
			e.printStackTrace();
		}
		return new ActionForward(path, false);
	}

}
