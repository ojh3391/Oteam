<%@page import="vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	UserVO vo=(UserVO)request.getAttribute("rs");

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
        		<h1>MY PAGE</h1>            	                                
        		</div>
        		<form action="update_page.do" method="post">
        		<input type="hidden" name="user_id" value="<%=vo.getUser_id()%>">
				<input type="hidden" name="user_passwd" value="<%=vo.getUser_passwd()%>">
					<table align="center" border="2" bordercolor="#FECE1A" >			
						<tr>
							<td valign="middle" align="center" colspan="2" bgcolor="beige" height="50"><font size="5" color="black"><strong>기 본 정 보</strong> </font> </td>
						</tr>
						<tr align="center" >
							<td valign="middle" width="350" height="50" bgcolor="#C0C0C0"><font size="5" color="black"><strong>아이디</strong></font></td>
							<td valign="middle" width="550" height="50" bgcolor="#C0C0C0"><font size="5" color="blue"><%=vo.getUser_id() %></font></td>
						</tr>				
						<tr align="center">
							<td valign="middle" width="350" height="50" bgcolor="beige"><font size="5" color="black"><strong>이름</strong></font></td>
							<td valign="middle" width="550" height="50" bgcolor="beige"><font size="5" color="blue"><%=vo.getUser_name() %></font></td>
						</tr>								
						<tr align="center">
							<td valign="middle" width="350" height="50" bgcolor="#C0C0C0"><font size="5" color="black"><strong>전화번호</strong></font></td>
							<td valign="middle" width="550" height="50" bgcolor="#C0C0C0"><font size="5" color="blue"><%=vo.getUser_tel() %></font></td>
						</tr>
						<tr align="center">
							<td valign="middle" width="350" height="50" bgcolor="beige"><font size="5" color="black"><strong>주소</strong></font></td>
							<td valign="middle" width="550" height="50" bgcolor="beige"><font size="5" color="blue"><%=vo.getUser_addr() %></font></td>
						</tr>				
						<tr align="center">
							<td valign="middle" width="350" height="50" bgcolor="#C0C0C0" ><font size="5" color="black"><strong>이메일</strong></font></td>
							<td valign="middle" width="550" height="50" bgcolor="#C0C0C0"><font size="5" color="blue"><%=vo.getUser_email() %></font></td>
						</tr>				
						<tr>
							<td bgcolor="beige" align="center" colspan="2" class="btn_align">
								<input class="message-btn" type="submit" value="수정하기" >												
							</td>
						</tr>
					</table>		
				</form>		
				<table align="center" border="2" bordercolor="#FECE1A" >			
					<tr align="center">
						<td valign="middle" align="center" colspan="2" bgcolor="beige" height="50"><font size="5" color="black"><strong>추 가 정 보</strong> </font> </td>
					</tr>
					<%if(vo.getUser_attend_date()==null){ %>
					<tr align="center">
						<td valign="middle" width="350" height="50" bgcolor="#C0C0C0"><font size="5" color="black"><strong>방청날짜</strong></font></td>
						<td valign="middle" width="550" height="50" bgcolor="#C0C0C0"><font size="5" color="blue">신청 내역이 없습니다 --> <a href="cfk_attend.jsp">신청하러가기</a></font></td>
					</tr>
					<%}else{%>
					<tr align="center">
						<td valign="middle" width="350" height="50" bgcolor="#C0C0C0"><font size="5" color="black"><strong>방청날짜</strong></font></td>
						<td valign="middle" width="550" height="50" bgcolor="#C0C0C0"><font size="5" color="blue"><%=vo.getUser_attend_date() %>----> <a href="cfk_attend.jsp" >신청변경하기</a></font></td>
					</tr>
					<%} %>
					<%if(!(vo.getUser_check_vote()==0)){ %>
					<tr align="center">
						<td valign="middle" width="350" height="50" bgcolor="beige"><font size="5" color="black"><strong>남은 투표수</strong></font></td>
						<td valign="middle" width="550" height="50" bgcolor="beige"><font size="5" color="blue"><%=vo.getUser_check_vote() %>번  ----> <a href="qList.do">투표하기</a></font></td>
					</tr>
					<%}else{%>
					<tr align="center">
						<td valign="middle" width="350" height="50" bgcolor="beige"><font size="5" color="black"><strong>남은 투표수</strong></font></td>
						<td valign="middle" width="550" height="50" bgcolor="beige"><font size="5" color="blue">투표권을 모두 소진하셨습니다</font></td>
					</tr>
					<%} %>
					<tr align="center">
						<td valign="middle" width="350" height="50" bgcolor="#C0C0C0"><font size="5" color="black"><strong>전화번호</strong></font></td>
						<td valign="middle" width="550" height="50" bgcolor="#C0C0C0"><font size="5" color="blue"></font></td>
					</tr>
					<tr align="center">
						<td valign="middle" width="350" height="50" bgcolor="beige"><font size="5" color="black"><strong>주소</strong></font></td>
						<td valign="middle" width="550" height="50" bgcolor="beige"><font size="5" color="blue"></font></td>
					</tr>				
					<tr align="center">	
						<td valign="middle" width="350" height="50" bgcolor="#C0C0C0"><font size="5" color="black"><strong>이메일</strong></font></td>
						<td valign="middle" width="550" height="50" bgcolor="#C0C0C0"><font size="5" color="blue"></font></td>
					</tr>
					<tr>
						<td bgcolor="beige" align="center" colspan="2" class="btn_align">
							<input class="message-btn" type="button" value="메인으로" onclick="location.href='index.jsp'">												
						</td>
					</tr>											
				</table>		
        	</div>
        </div>
        
        <jsp:include page="board_bottom.jsp"></jsp:include>
    </body>
</html>