<%@page import="java.util.Vector"%>
<%@page import="vo.ReplyVO"%>
<%@page import="vo.BoardVO"%>
<%@page import="vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	UserVO vo=(UserVO)request.getAttribute("rs");
	BoardVO vo1=(BoardVO)request.getAttribute("vo1");
	Vector<ReplyVO> list=(Vector<ReplyVO>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<style>
.scrolltbody {
    display: block;
    width: 750px;
   /*  border-collapse: collapse;
    border: 2px solid #000; */
}
.scrolltbody th { border: 1px solid #000; background: pink; }
.scrolltbody td { border: 1px solid #000; border-top: 0; }
.scrolltbody tbody {
    display: block;
    height: 150px;
    overflow: auto;
}
.scrolltbody th:nth-of-type(1), .scrolltbody td:nth-of-type(1) { width: 650px; }
.scrolltbody th:nth-of-type(2), .scrolltbody td:nth-of-type(2) { width: 0px; }
.scrolltbody th:nth-of-type(3), .scrolltbody td:nth-of-type(3) { width: 00px; }
.scrolltbody th:last-child { width: 100px; }
.scrolltbody td:last-child { width: calc( 150px - 19px );  }
</style>
	<head>
    </head>
    <body>
    	<jsp:include page="../board_top.jsp"></jsp:include>
    	
        <div class="section secondary-section" id="service">
            <div class="container">
        		<div class="title">
        		<h1><strong>MY PAGE</strong></h1>            	                                
        		</div>
        		<form action="update_page.do" method="post">
        		<input type="hidden" name="user_id" value="<%=vo.getUser_id()%>">
				<input type="hidden" name="user_passwd" value="<%=vo.getUser_passwd()%>">
				<div style="float: left; width: 35%;">
					<table align="left" border="2" bordercolor="#FECE1A" >			
						<tr>
							<td valign="middle" align="center" colspan="2" bgcolor="#272b2e" height="50"><font size="5" color="black"><font color="white"><strong>기 본 정 보</strong></font> </font> </td>
						</tr>
						<tr align="center" >
							<td valign="middle" width="150" height="45" bgcolor="#C0C0C0"><font size="3" color="black"><strong>아이디</strong></font></td>
							<td valign="middle" width="250" height="45" bgcolor="#C0C0C0"><font size="3" color="black"><%=vo.getUser_id() %></font></td>
						</tr>				
						<tr align="center">
							<td valign="middle" width="150" height="45" bgcolor="beige"><font size="3" color="black"><strong>이름</strong></font></td>
							<td valign="middle" width="250" height="45" bgcolor="beige"><font size="3" color="black"><%=vo.getUser_name() %></font></td>
						</tr>								
						<tr align="center">
							<td valign="middle" width="150" height="45" bgcolor="#C0C0C0"><font size="3" color="black"><strong>지역</strong></font></td>
							<td valign="middle" width="250" height="45" bgcolor="#C0C0C0"><font size="3" color="black"><%=vo.getUser_area() %></font></td>
						</tr>
						<tr align="center">
							<td valign="middle" width="150" height="45" bgcolor="beige"><font size="3" color="black"><strong>주소</strong></font></td>
							<td valign="middle" width="250" height="45" bgcolor="beige"><font size="3" color="black"><%=vo.getUser_addr() %></font></td>
						</tr>				
						<tr align="center">
							<td valign="middle" width="150" height="45" bgcolor="#C0C0C0" ><font size="3" color="black"><strong>나이</strong></font></td>
							<td valign="middle" width="250" height="45" bgcolor="#C0C0C0"><font size="3" color="black"><%=vo.getUser_age() %></font></td>
						</tr>
						<tr align="center">
							<td valign="middle" width="150" height="45" bgcolor="beige" ><font size="3" color="black"><strong>전화번호</strong></font></td>
							<td valign="middle" width="250" height="45" bgcolor="beige"><font size="3" color="black"><%=vo.getUser_tel() %></font></td>
						</tr>
						<tr align="center">
							<td valign="middle" width="150" height="45" bgcolor="#C0C0C0" ><font size="3" color="black"><strong>이메일</strong></font></td>
							<td valign="middle" width="250" height="45" bgcolor="#C0C0C0"><font size="3" color="black"><%=vo.getUser_email() %></font></td>
						</tr>
						<tr align="center">
							<td valign="middle" width="150" height="45" bgcolor="beige" ><font size="3" color="black"><strong>성별</strong></font></td>
							<td valign="middle" width="250" height="45" bgcolor="beige"><font size="3" color="black"><%=vo.getUser_gender() %>자</font></td>
						</tr>			
						<tr >
							<td valign="middle" width="400" height="40" bgcolor="#272b2e" colspan="2" align="center" class="btn_align">
								<input class="message-btn" type="submit" value="수정하기" >												
								<input class="message-btn" type="button" value="메인으로" onclick="location.href='index.jsp'">											
							</td>
						</tr>
					</table>	
					</div>
				</form>	
				<div style=" float: right; width: 64%;">
				<table align="right">			
					<tr align="center">
						<td valign="middle" align="center" colspan="3" bgcolor="#272b2e" height="50"><font size="5" color="white"><strong>추 가 정 보</strong> </font> </td>
					</tr>
					<%if(vo.getUser_attend_date()==null){ %>
					<tr align="center">
						<td valign="middle" width="200" height="40" bgcolor="#C0C0C0"><font size="3" color="black"><strong>방청날짜</strong></font></td>
						<td valign="middle" width="500" height="40" bgcolor="#C0C0C0"><font size="3" color="black">신청 내역이 없습니다 --> <a href="/CFK/board/board_enter.jsp"><font color="red"><ins>신청하러가기</ins></font></a></font></td>
					</tr>
					<%}else{%>
					<tr align="center">
						<td valign="middle" width="200" height="40" bgcolor="#C0C0C0"><font size="3" color="black"><strong>방청날짜</strong></font></td>
						<td valign="middle" width="500" height="40" bgcolor="#C0C0C0"><font size="3" color="black"><%=vo.getUser_attend_date() %>----> <a href="/CFK/board/board_enter.jsp" ><font color="red"><ins>신청변경하기</ins></font></a></font></td>
					</tr>
					<%} %>
					<%if(!(vo.getUser_check_vote()==0)){ %>
					<tr align="center">
						<td valign="middle" width="200" height="40" bgcolor="beige"><font size="3" color="black"><strong>남은 투표수</strong></font></td>
						<td valign="middle" width="500" height="40" bgcolor="beige"><font size="3" color="black"><%=vo.getUser_check_vote() %>번  ----> <a href="/CFK/List.do"><font color="red"><ins>투표하기</ins></font></a></font></td>
					</tr>
					<%}else{%>
					<tr align="center">
						<td valign="middle" width="200" height="40" bgcolor="beige"><font size="3" color="black"><strong>남은 투표수</strong></font></td>
						<td valign="middle" width="500" height="40" bgcolor="beige"><font size="3" color="black">투표권을 모두 소진하셨습니다</font></td>
					</tr>
					<%} %>
					<%if(!(vo.getUser_check_parti()==1)){ %>
					<tr align="center">
						<td valign="middle" width="200" height="40" bgcolor="#C0C0C0"><font size="3" color="black"><strong>My 게시판의 조회수</strong></font></td>
						<td valign="middle" width="500" height="40" bgcolor="#C0C0C0"><font size="3" color="black"><%=vo1.getBoard_readcount() %> 회</font></td>
					</tr>
					<tr align="center">
						<td valign="middle" width="200" height="40" bgcolor="beige"><font size="3" color="black"><strong>My 게시판의 제목</strong></font></td>
						<td valign="middle" width="500" height="40" bgcolor="beige"><font size="3" color="black"><%=vo1.getBoard_subject() %>----> <a href="/CFK/View.do?board_num=<%=vo1.getBoard_num() %>"><font color="red"><ins>My신청게시판</ins></font></a></font></td>
					</tr>
					
					<tr >
					
						<td align="center" width="200" height="30" bgcolor="#C0C0C0"><font size="3" color="black"><strong>내가 받은 투표수</strong></font></td>
						
						<td valign="middle" width="500" height="30" bgcolor="#C0C0C0">
						<div class="span5">
						<ul class="skills"> 
                           		<li>
                               		<span class="bar" data-width="<%=vo1.getBoard_vote()%>%"></span>
                               		<h3>득표수 <%=vo1.getBoard_vote()%>%</h3>
                           		</li>
                       		</ul>
                       		</div>	
						</td>
						
					</tr>
								
					<%}else{%>
					<tr align="center">	
						<td valign="middle" width="200" height="40" bgcolor="#C0C0C0"><font size="3" color="black"><strong>참가신청 여부</strong></font></td>
						<td valign="middle" width="500" height="40" bgcolor="#C0C0C0"><font size="3" color="black">참가하신 내역이 없습니다. </font></td>
					</tr>
					
					<%} %>
					<tr height="40" align="right">
						
						<th valign="middle" width="500" bgcolor="#272b2e"><font color="black"><font color="white">내가 쓴 댓글 내용</font></font></th>
						<th valign="middle" width="200" bgcolor="#272b2e"><font color="black"><font color="white">댓글 쓴 날짜&ensp;&ensp;&ensp;</font></font></th>
						
					</tr> 
				</table>
				
				<table class='scrolltbody' align="right" >		
					<% for(ReplyVO vo2:list) {%>
					<tr height="40" >
						
						<td valign="middle" width="600" height="40" bgcolor="beige"><font size="3" color="black">&ensp;&ensp;Re : <%=vo2.getReply_content() %> ----> <a href="View.do?board_num=<%=vo2.getReply_board_num() %>"><font color="red"><ins>댓글목록으로..</ins></font></a></font><td>
						<td align="center" width="150" height="40" bgcolor="beige"><font size="3" color="black"><strong><%=vo2.getReply_date() %></strong></font></td>
						
					</tr>
					<%} %>
					</table>
				</div>	
        	</div>
        </div>
        
        <jsp:include page="../board_bottom.jsp"></jsp:include>
    </body>
</html>