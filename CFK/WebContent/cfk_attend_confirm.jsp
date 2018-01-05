<%@page import="user.vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	UserVO vo=(UserVO)request.getAttribute("vo");
	
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방청 신청 날짜 확인</title>
</head>
<body>
	<b><%=vo.getUser_id() %></b>님,
	<table><tr><td></td></tr></table>
	<b><%=vo.getUser_attend_date() %></b> 날짜로
	<table><tr><td></td></tr></table>
	방청신청이 <b>완료</b>되었습니다. 당첨내역을 <b>문자메시지</b>로 전송하여 드립니다. 		  
	<h3 style="text-align: center;"><a href="cfk_calendar.jsp">돌아가기</a></h3>
</body>
</html>