<%@page import="vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if((UserVO)session.getAttribute("vo")==null) {
		out.println("<script>");
		out.println("alert('회입가입 후 이용할 수 있네! 어서 가입하게!');");
		out.println("history.back();");
		out.println("</script>");
		out.close();
	}

	int board_num=Integer.parseInt(request.getParameter("board_num"));

	UserVO vo=(UserVO)session.getAttribute("vo");
%>
<!DOCTYPE html>
<html>
	<head>
    </head>
    <body>
    	<jsp:include page="../board_top.jsp"></jsp:include>
        <div class="section secondary-section" id="service">
            <div class="container">
        		<div class="title">
        		<h1>비밀번호 확인</h1>
                <p>비밀번호를 정확히 입력하시오.</p>               
        		</div>
        		<form action="../board_delete_pwd.do" method="post">
        		<input type="hidden" name="board_num" value="<%=board_num%>">
					<table align="center">
						<tr>
							<td><p><font color="black">아이디</font></p></td>
							<td><input class="span2" type="text" name="user_id" value="<%=vo.getUser_id() %>" readonly></td>
						</tr>
						<tr>
							<td><p><font color="black">비밀번호</font></p></td>
							<td><input class="span2" type="password" name="user_passwd" required></td>
						</tr>
	
						<tr>
							<td align="center" colspan="2" class="btn_align">
								<input class="message-btn" type="submit" value="삭제" >					
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