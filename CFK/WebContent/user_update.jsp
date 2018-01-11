<%@page import="user.vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	UserVO vo=(UserVO)request.getAttribute("rs");
	UserVO vo1=(UserVO)session.getAttribute("vo");
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
        		<h1>정보수정</h1>            	
                <p>업데이트 된 정보를 입력하시오.</p>                
        		</div>
        		<form action="update.do" method="post">
					<table align="center">									
						<tr>
							<td><p><font color="black">아이디</font></p></td>
							<td><input class="span5" type="text" name="user_id" value="<%=vo.getUser_id() %>" readonly></td>
						</tr>
						<tr>
							<td><p><font color="black">비밀번호</font></p></td>
							<td><input class="span5" type="password" name="user_passwd" required></td>
						</tr>
						<tr>
							<td><p><font color="black">이름</font></p></td>
							<td><input class="span5" type="text" name="user_name" value="<%=vo.getUser_name() %>" readonly></td>
						</tr>
						<tr>
							<td><p><font color="black">지역</font></p></td>
							<td align="center">
								<select name="user_area" class="span5">
							<%if(vo.getUser_area().equals("서울.경기")){ %>
								<option selected="selected">서울.경기</option>
								<option >강원도</option>
								<option >충청권</option>
								<option >호남.제주</option>
								<option >영남권</option>															
							<%}else if(vo.getUser_area().equals("강원도")){ %>					
								<option >서울.경기</option>
								<option selected="selected">강원도</option>
								<option >충청권</option>
								<option >호남.제주</option>
								<option >영남권</option>																				
							<%}else if(vo.getUser_area().equals("충청권")){ %>					
								<option >서울.경기</option>
								<option >강원도</option>
								<option selected="selected">충청권</option>
								<option >호남.제주</option>
								<option >영남권</option>															
							<%}else if(vo.getUser_area().equals("호남.제주")){ %>					
								<option >서울.경기</option>
								<option >강원도</option>
								<option >충청권</option>
								<option selected="selected">호남.제주</option>
								<option >영남권</option>															
							<%}else if(vo.getUser_area().equals("영남권")){ %>					
								<option >서울.경기</option>
								<option >강원도</option>
								<option >충청권</option>
								<option >호남.제주</option>
								<option selected="selected">영남권</option>									
							<%} %>
								</select>
							</td>					
						</tr>
						<tr>
							<td><p><font color="black">주소</font></p></td>
							<td><input class="span5" type="text" name="user_addr" value="<%=vo.getUser_addr() %>"></td>
						</tr>
						<tr>
							<td><p><font color="black">전화번호</font></p></td>
							<td><input class="span5" type="text" name="user_tel" value="<%=vo.getUser_tel() %>"></td>
						</tr>
						<tr>
							<td><p><font color="black">나이</font></p></td>
							<td><input class="span5" type="text" name="user_age" value="<%=vo.getUser_age() %>" readonly></td>
						</tr>
						<tr>
							<td><p><font color="black">이메일</font></p></td>
							<td><input class="span5" type="email" name="user_email" value="<%=vo.getUser_email() %>" ></td>
						</tr>
						<tr>
							<td><p><font color="black">성별</font></p></td>
							<td><input class="span5" type="text" name="user_gender" value="<%=vo.getUser_gender() %>" readonly></td>
						</tr>
						<tr>
							<td align="center" colspan="2" class="btn_align">
								<input class="message-btn" type="submit" value="수정하기">
								<button class="message-btn" onclick="location.href='leave.do?user_id=<%=vo.getUser_id() %>'">탈퇴하기</button>
								<input class="message-btn" type="button" value="취소" onclick="location.href='index.jsp'">
							</td>
						</tr>								
					</table>
				</form>
        	</div>
		</div>
		
        <jsp:include page="board_bottom.jsp"></jsp:include>
    </body>
</html>