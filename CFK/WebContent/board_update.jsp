<%@page import="board.vo.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	BoardVO vo=(BoardVO)request.getAttribute("vo");
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
        		<h1>수정하기</h1>            	
                <p>패션킹에 도전해 보세요!!</p>                	
        		</div>
        		<form action="board_update.do" method="post" enctype="multipart/form-data">
        		<input type="hidden" name="user_id" value="<%=vo.getBoard_writer() %>">
        		<input type="hidden" name="board_file" value="<%=vo.getBoard_file() %>">
        		<input type="hidden" name="board_real_file" value="<%=vo.getBoard_real_file() %>">
        		<input type="hidden" name="board_thumbnail" value="<%=vo.getBoard_thumbnail() %>">
        		<input type="hidden" name="board_num" value="<%=vo.getBoard_num()%>">
					<table align="center">				
						<tr>
							<td><p><font color="black">제목</font></p></td>
							<td><input class="span5" type="text" name="board_subject" maxlength="50" value="<%=vo.getBoard_subject()%>" required></td>
						</tr>
						<tr>
							<td><p><font color="black">내용</font></p></td>
							<td><textarea class="span5" name="board_content" cols='60' rows='15' maxlength="2000" required><%=vo.getBoard_content()%></textarea></td>
						</tr>
						<tr>
							<td><p><font color="black">파일첨부</font></p></td>
							<td><input type="file" name="board_file"></td>
						</tr>
						<tr>
							<p><font color="black">※기존 영상 파일 변경 원하시면 파일 첨부 해주세요~</font></p>
						</tr>
						<tr>
							<td align="center" colspan="2" class="btn_align">
								<input class="message-btn" type="submit" value="수정하기" >						
								<input class="message-btn" type="button" value="취소" onclick="javascript:history.back();">
							</td>
						</tr>
					</table>
				</form>
        	</div>
        </div>

        <jsp:include page="board_bottom.jsp"></jsp:include>
    </body>
</html>