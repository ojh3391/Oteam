<%@page import="vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	UserVO vo=(UserVO)session.getAttribute("vo");

	if((UserVO)session.getAttribute("vo")==null) {
		out.println("<script>");
		out.println("alert('회입가입 후 이용할 수 있네! 어서 가입하게!');");
		out.println("history.back();");
		out.println("</script>");
		out.flush();
	}
%>
<!DOCTYPE html>
<html>
	<head>
	<style type="text/css">
            *{padding: 0px; margin: 0px;}  /* 브라우저별 기본 여백 차이가 있기에 작성한다. */
            body{font-size: 9pt;}
            td{font-size: 9pt;}
            a{cusor: pointer; color: #000000; text-decoration: none; font-size: 9pt; line-height: 150%;}
            a:HOVER, a:ACTIVE{font-size: 9pt; color: #F28011; text-decoration: underline;}
        </style>
        
        <script language="javascript" type="text/javascript">
        //달력의 선택한 변수 i를 받아와서 값을 request로 넘기고 submit
        function select_day(day) {
        	var select_day = day;
        	document.select.select_day.value=select_day;
        	var form1 = document.select;
        	if(confirm("기존의 신청내역은 취소됩니다. 새로 신청하시겠습니까?")) {
        		form1.submit();
        	}
        }
       
        </script>
    </head>
    <body>
    	<jsp:include page="../board_top.jsp"></jsp:include>
        <div class="section secondary-section" id="service">
        	<div class="container">
      			<div class="title">
        		<h1><i>매주 <font color="red" size="20"><b>금</b></font>요일 <font color="red" size="20"><b>S</b></font>HOW <font color="red" size="20"><b>S</b></font>TART!</i></h1>
        		</div>
       			<form action="" method="post">
					<table align="center">
						<tr>
							<td>
								<iframe class="container" src="board_attend_calendar.jsp" frameborder="0" width="590" height="700" id="iframeTicket" title="방청권 신청 프레임"></iframe>
							</td>
						</tr>
					</table>
				</form>
      	  	</div>
        </div>
        
        <jsp:include page="../board_bottom.jsp"></jsp:include>
    </body>
</html>