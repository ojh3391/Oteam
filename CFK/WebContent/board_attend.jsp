<%@page import="user.vo.UserVO"%>
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
	UserVO vo=(UserVO)session.getAttribute("vo");
%>
<!DOCTYPE html>
<html>
	<head>
    </head>
    <body>
    	<jsp:include page="board_top.jsp"></jsp:include>
        <div class="section secondary-section" id="service">
        	<div class="container">
      			<div class="title">
        		<h1><i>매주 <font color="red" size="20"><b>금</b></font>요일 <font color="red" size="20"><b>S</b></font>HOW <font color="red" size="20"><b>S</b></font>TART!</i></h1>
        		</div>
       			<form action="" method="post">
					<table align="center">
						<tr>
							<td>
								<iframe src="board_attend_calendar.jsp" frameborder="0" width="590" height="700" id="iframeTicket" title="방청권 신청 프레임"></iframe>
							</td>
						</tr>
					</table>
				</form>
      	  	</div>
        </div>
        
        <jsp:include page="board_bottom.jsp"></jsp:include>
    </body>
</html>