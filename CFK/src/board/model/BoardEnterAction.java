package board.model;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import action.Action;
import action.ActionForward;
import dao.BoardDAO;
import vo.UserVO;
import vo.BoardVO;

public class BoardEnterAction implements Action
{
	private String path;
	
	public BoardEnterAction(String path)
	{
		super();
		this.path=path;
	}

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws Exception
	{
		
		res.setContentType("text/html;charset=UTF-8");
		PrintWriter out=res.getWriter();
		String uploadPath=req.getServletContext().getRealPath("/boardUpload");
		String uploadPath2=req.getServletContext().getRealPath("/thumb");
		
		int size=50*1024*1024;
		MultipartRequest multi;
		
		try
		{
			multi=new MultipartRequest(req, uploadPath, size, "UTF-8", new DefaultFileRenamePolicy());
			
			String user_id=multi.getParameter("user_id");
			UserVO uo=new UserVO();
			BoardDAO dao=new BoardDAO();
			uo=dao.check_parti(user_id);
			int check=uo.getUser_check_parti();
			if(check==0)
			{
				path="/error/enter_error.jsp";
			}else
			{	
				BoardVO vo=new BoardVO();
				vo.setBoard_subject(multi.getParameter("board_subject"));
				vo.setBoard_content(multi.getParameter("board_content"));
				vo.setBoard_file(multi.getOriginalFileName((String) multi.getFileNames().nextElement()));
				vo.setBoard_real_file(multi.getFilesystemName((String) multi.getFileNames().nextElement()));
				vo.setBoard_writer(multi.getParameter("user_id"));
			
				//동영상 썸네일 이미지  저장경로, 파일명, 확장자 추출
				String fileName=multi.getFilesystemName((String) multi.getFileNames().nextElement());
				int idx=fileName.lastIndexOf(".");
				String _fileName=fileName.substring(0, idx);
				String tmp=fileName.substring(idx+1);
				
				String filePath=uploadPath+"\\"+fileName;
				String filePath2=uploadPath2+"\\"+_fileName+".jpg";
				
				String thumb=_fileName+".jpg";
				vo.setBoard_thumbnail(thumb);
				
				//리눅스 서버에서 프로그램 실행해서 동영상 썸네일 생성
				String[] cmd=new String[] {"/ffmpeg.exe","-i",filePath,"-ss","00:00:05","-vframes","1","-an","-s","300*200",filePath2};
				
				if(!tmp.equalsIgnoreCase("mp4"))
				{
					out.println("<script>");
					out.println("alert('mp4 파일로 올리시오');");
					out.println("history.go(-1);");
					out.println("</script>");
					out.close();
				}else
				{	
					dao.parti_minus(user_id);
					try
					{
						Process p=new ProcessBuilder(cmd).start();
						p.waitFor();
					}catch(Exception e)
					{
						e.printStackTrace();
					}
					dao.board_parti(vo);
				}
			}
		}catch(IOException e)
		{
			e.printStackTrace();
		}
		
		return new ActionForward(path, false);
	}	
}
