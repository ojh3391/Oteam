<%@page import="vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	UserVO vo=(UserVO)session.getAttribute("vo");

	if((UserVO)session.getAttribute("vo")==null) {
	   	out.println("<script>");
   		out.println("alert('회입가입 후 이용할 수 있네! 어서 가입하게!');");
   		out.println("history.back();");
   		out.println("</script>");
   		out.flush();

	}
%>
<!DOCTYPE html>
<html>
	<head>
		<script>
			//파일 업로드시 50Mb이상일 경우 경고창
			//파일 업로드시 50Mb 이상일 경우	
			function sizecheck(file)
			{
				var form=document.upload;
				if(!form.board_subject.value)
				{
					alert("제목을 입력하세요");
					return false;
				}else if(!form.board_content.value)
				{
					alert("내용을 입력하세요");
					return false;
				}else if(!form.board_file.value)
				{
					alert("파일을 선택하세요");
					return false;
				}else
				{
					var maxSize=50*1024*1024
					var fileSize=0;
				
					fileSize=file.files[0].size;
					if(fileSize>maxSize)
					{
						alert("50MB 이하 파일로 올리시오")
						return;
					}
					document.upload.submit();
				}
			}
			
		</script>
	
    </head>
    <body>
    	<jsp:include page="../board_top.jsp"></jsp:include>
        <div class="section secondary-section" id="service">
            <div class="container">
      			<div class="title">
        		<h1>참가신청</h1>
                <p>패션킹에 도전해 보세요!!</p>        
        		</div>
        		<form action="/CFK/Enter.do" method="post" enctype="multipart/form-data" name="upload">
       			<input type="hidden" name="user_id" value="<%=vo.getUser_id() %>">
					<table align="center">		
						<tr>
							<td><p><font color="black">제목</font></p></td>
							<td><input class="span5" type="text" name="board_subject" maxlength="50" required></td>
						</tr>
						<tr>
							<td><p><font color="black">내용</font></p></td>
							<td><textarea class="span5" name="board_content" cols='60' rows='15' maxlength="2000" required></textarea></td>
						</tr>
						<tr>
							<td><p><font color="black">파일첨부</font></p></td>
							<td><input type="file" name="board_file" required></td>
						</tr>
						<tr>
							<td align="center" colspan="2" class="btn_align">
								<input class="message-btn" type="button" onclick="sizecheck(this.form.board_file)" value="신청하기" >
								<input class="message-btn" type="reset" value="새로입력">
								<input class="message-btn" type="button" value="취소" onclick="javascript:history.back();">
							</td>
						</tr>
					</table>
				</form>
        	</div>
		</div>
        <jsp:include page="../board_bottom.jsp"></jsp:include>
    </body>
</html>