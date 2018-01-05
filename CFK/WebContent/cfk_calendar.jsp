<%@page import="java.util.Calendar"%>
<%@page import="user.vo.UserVO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
    request.setCharacterEncoding("utf-8");
	
	UserVO vo=(UserVO)session.getAttribute("vo");

    //클라이언트에서 넘어온 정보 받기
    String year_ = request.getParameter("year");
    String month_ = request.getParameter("month");
	    
    //컴퓨터 시스템의 현재 날짜 구하기
    Calendar now = Calendar.getInstance();
    int year = now.get(Calendar.YEAR);
    int month = now.get(Calendar.MONTH)+1;
    int day = now.get(Calendar.DATE);
    
    //클라이언트에서 넘겨준 값이 없을 때 표시하는 값
   	if(year_ != null)
   		year = Integer.parseInt(year_);
    if(month_ != null)
        month = Integer.parseInt(month_);
          
    //출력할 년도와 월로 설정
    now.set(year, month-1, 1);
    //변화된 년도와 월
    year = now.get(Calendar.YEAR);    
    month = now.get(Calendar.MONTH) + 1;
            
  	//해당 월의 마지막 날짜가 언제인지
    int end = now.getActualMaximum(Calendar.DAY_OF_MONTH);
  	//해당 월의 1일이 무슨 요일인지
    int week = now.get(Calendar.DAY_OF_WEEK);
    
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>방청 신청</title>
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
    	
        <center>
        	<form action="aDate.do" method="post" name="select">
        	<input type="hidden" name="select_year" value="<%=year%>">
        	<input type="hidden" name="select_month" value="<%=month%>">
        	<input type="hidden" name="select_day" value=""> <!-- 자바스크립트와 같이 사용해야 값을 넘길 수 있음 -->
        	<input type="hidden" name="user_id" value="<%=vo.getUser_id()%>">
            <table width="200" border="0" cellpadding="1" cellspacing="2">
            	<tr><td align="center"><font size="5"><b>방청일 선택</b></font></td></tr>
                <tr height="30">
                    <td align="center">
                        <a href="cfk_calendar.jsp?year=<%=year%>&month=<%=month-1%>"><font size="3" color="red"><b>◀</b></font></a>	
                        <b><font size="3"><%=year %>년 <%=month %>월</font></b>
                        <a href="cfk_calendar.jsp?year=<%=year%>&month=<%=month+1%>"><font size="3" color="red"><b>▶</b></font></a>
                    </td>
                </tr>
            </table>
            <table width="500" border="0" cellpadding="2" cellspacing="1" bgcolor="#cccccc">
                <tr height="50">
                    <td align="center" bgcolor="#e6e4e6"><font color="red">일</font></td>
                    <td align="center" bgcolor="#e6e4e6"><b>월</b></td>
                    <td align="center" bgcolor="#e6e4e6"><b>화</b></td>
                    <td align="center" bgcolor="#e6e4e6"><b>수</b></td>
                    <td align="center" bgcolor="#e6e4e6"><b>목</b></td>
                    <td align="center" bgcolor="#e6e4e6"><b>금</b></td>
                    <td align="center" bgcolor="#e6e4e6"><font color="blue"><b>토</b></font></td>
                </tr>
                <%
                    int newLine = 0;
                	//달마다 다른 비어있는 앞칸 모두 흰색으로 채우기 위해(공백처리)
                    out.println("<tr height='50'>");
                    for(int i=1; i<week; i++) {
                        out.println("<td bgcolor='white'>&nbsp;</td>");
                        newLine++;
                    }
                    //1일~end 출력
                    String font_color, bg_color;
                    for(int i=1; i<=end; i++) {
                        font_color = (newLine == 0)?"red":(newLine==6?"blue":"black");
                        
                        //오늘 날짜만 하늘색으로 표시
                        if(i==day && month==now.get(Calendar.MONTH+1)) {
                        	bg_color = "#aad0ff";
                        } else {
                        	bg_color = "white";
                        }
                        
                        //금요일 a태그 처리
                        if(newLine == 5) {
                        	out.println("<td align='center' bgcolor="+bg_color+"><a href='#' onclick='select_day("+i+");'><font color="+font_color+"><u><b>"+i+"</b></u></font></a></td>");
                        	newLine++;
                            
                        } else {
                        	out.println("<td align='center' bgcolor="+bg_color+"><font color="+font_color+">"+i+"</font></td>");
                        	newLine++;
                        }
                        
                        //열 초기화
                        if(newLine == 7 && i != end) {
                            out.println("</tr>");
                            out.println("<tr height='50'>");
                            newLine = 0;
                        }
                    }
                    
                    //달마다 다른 비어있는 뒷칸 모두 흰색으로 채우기 위해(공백처리)
                    while(newLine>0 && newLine<7) {
                        out.println("<td bgcolor='white'>&nbsp;</td>");
                        newLine++;    
                    }
                    out.println("</tr>");
                    
                %>
            </table>
            </form>
        </center>
    </body>
</html>