<%@page import="user.vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	UserVO vo=(UserVO)session.getAttribute("vo");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방청 신청 날짜 확인</title>
</head>
<body>
	<b><%=vo.getUser_name() %></b>님,
	<table><tr><td></td></tr></table>
	<%=vo.getUser_attend_date() %>
	<table><tr><td></td></tr></table>
	방청신청이 <b>완료</b>되었습니다.		  
	<h2><a href="cfk_calendar.jsp">돌아가기</a></h2>
</body>
</html>