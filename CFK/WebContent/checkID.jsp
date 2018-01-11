<%@page import="java.net.URLDecoder"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="dao.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중복확인</title>
<script type="text/javascript">

	//중복이므로 text 비우고 창 닫기
	function backValue() {
		opener.document.userInfo.user_id.value = null;
		window.close();
	}
	//중복아니므로 창 그냥 닫기
	function sendValue() {
		//아이디 중복체크 결과를 check_id로 전달		
		opener.document.userInfo.idReduplication.value="check_id";
		
		if(opener != null) {
			window.close();
		}
	}
	
</script>
</head>
<body bgcolor="#FCCE1A">
	<%
		String user_id1 = request.getParameter("user_id");
		String agent=request.getHeader("User-Agent");
	
		boolean ieBrowser=(agent.indexOf("Trident")>-1);
		
		String user_id=URLDecoder.decode((URLDecoder.decode(user_id1, "8859_1")), "UTF-8");
	
		UserDAO dao = new UserDAO();
		boolean result = dao.user_check_reduplication(user_id);
		
		if(result==true) { %>
		<div style="text-align:center"><font size="2px"><b><font color="red" size="4px"><%=user_id%></font><br>이미 사용중인 ID입니다.</b></font></div>
		<br><div style="text-align:center"><input type="button" value="취소하기" onclick="backValue();"></div>
		<%} else { %>
		<div style="text-align:center"><font size="2px"><b><font color="red" size="4px"><%=user_id%></font><br>사용가능한 ID입니다.</b></font></div>
		<br><div style="text-align:center"><input type="button" value="사용하기" onclick="sendValue();"></div>
		<%} %>
		
		
</body>
</html>