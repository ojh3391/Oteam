<%@page import="vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	UserVO vo=(UserVO)request.getAttribute("vo");
%>    
<!DOCTYPE html>
<html>
<style>
	.highlighted-box {
    background:#F4F8F9;
    padding:20px 30px;
}
.highlighted-box h1 {
    margin:0px;
}
.highlighted-box h1, .highlighted-box p {
    color: #181A1C !important;
}
</style>
<head>
<meta charset="UTF-8">
<title>방청 신청 날짜 확인</title>
</head>
<body>
	<div class="highlighted-box center">
		<font style="text-align: center;">
			<h3><%=vo.getUser_id() %>님,</h3>
			<p><b><%=vo.getUser_attend_date() %></b> 날짜로 방청신청이 <b>완료</b>되었습니다.</p>	  
			<h3><a href="board_attend_calendar.jsp">돌아가기</a></h3>
		</font>
	</div>
</body>
</html>