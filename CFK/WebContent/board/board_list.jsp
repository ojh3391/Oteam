<%@page import="vo.NotifyVO"%>
<%@page import="vo.PageVO"%>
<%@page import="vo.BoardVO"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	//리스트 정보 
	Vector<BoardVO> list=(Vector<BoardVO>)request.getAttribute("list");
	Vector<NotifyVO> notiList=(Vector<NotifyVO>)request.getAttribute("notiList");
	//페이지나누기를 위한 정보
	PageVO info=(PageVO)request.getAttribute("info");
	int total_page=info.getTotalPage();
	int current_page=info.getPage();
	int endPage=info.getEndPage();
	int startPage=info.getStartPage();
	int totalRows=info.getTotoalRows();
%> 
<html>

	<head>
    	<meta charset=utf-8>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>오팀장과 형님들</title>
        
        <!-- Load Roboto font -->
        <link href='http://fonts.googleapis.com/css?family=Roboto:400,300,700&amp;subset=latin,latin-ext' rel='stylesheet' type='text/css'>
        
        <!-- Load css styles -->
        <link rel="stylesheet" type="text/css" href="/CFK/Resources/css/bootstrap.css" />
        <link rel="stylesheet" type="text/css" href="/CFK/Resources/css/bootstrap-responsive.css" />
        <link rel="stylesheet" type="text/css" href="/CFK/Resources/css/style.css" />
        <link rel="stylesheet" type="text/css" href="/CFK/Resources/css/pluton.css" />
        <link rel="stylesheet" type="text/css" href="/CFK/Resources/css/jquery.cslider.css" />
        <link rel="stylesheet" type="text/css" href="/CFK/Resources/css/jquery.bxslider.css" />
        <link rel="stylesheet" type="text/css" href="/CFK/Resources/css/animate.css" />
        
        <!-- popvideo -->
        <link rel="stylesheet" href="/CFK/Resources/css/jquery.popVideo.css"/>

        <!-- Fav and touch icons -->
        <link rel="shortcut icon" href="/CFK/images/slider/logo1.png">
        
        <script type="text/javascript">
        
        // 팝업 function
        function cookieVal(cookieName) {
        	thisCookie = document.cookie.split("; ");
        	for(i=0; i<thisCookie.length; i++) {
        		if(cookieName == thisCookie[i].split("=")[0]){
        			return thisCookie[i].split("=")[1];
        		}
        	}
        	return "x";
        }
        
		function Popupopen() {
			if(cookieVal("notice")!="1") {
		   		window.open("/CFK/popup.html", "notice", "width=500, height=615, top=0, left=0, location=no, scrollbars=yes");
			}
		}
			
		// 디데이 function
		var countDown = new Date("Jan 19, 2018 23:59:59").getTime();

		function msg_time() {	
			var now = new Date().getTime();		//현재 날짜
			var distance = countDown - now;		//d-day와 현재날짜 차이
			
			// 남은 시간 계산
			days = Math.floor(distance / (1000*60*60*24))+"일 ";
			hours = Math.floor((distance % (1000*60*60*24)) / (1000*60*60))+"시 ";
			minutes = Math.floor((distance % (1000*60*60)) / (1000*60))+"분 ";	
			seconds = Math.floor((distance % (1000*60)) / (1000))+"초";
			
			var msg = "<p><font color='white' size='3px'>D-DAY </font><font color='red' size='3px' text-align:center>"+days+hours+minutes+seconds+"</font></p>";
			
			// div 영역에 보여줌 
			document.getElementById("ViewTimer").innerHTML = msg;
			
			//distance--;					// 기간을 현재 날짜로 안가져올 경우의 1초씩 감소
			
			if (distance < 0) {			// 시간이 종료 되었으면..
				clearInterval(tid);		// 타이머 해제
				//alert("종료");
			} 
			
		}

		function TimerStart(){ tid=setInterval('msg_time()', 1000) };
		</script>
    </head>
    
    <body onload="Popupopen(); TimerStart();">
        <div class="navbar">
            <div class="navbar-inner">
                <div class="container">
                
                     <!-- This is website logo -->
                    <a href="#" class="brand">
                        <img src="/CFK/images/background/logo.png" width="120" height="40" alt="Logo" />   
                    </a>
                    
                    <!-- Navigation button, visible on small resolution -->
                    <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                        <i class="icon-menu"></i>
                    </button>
                    
                    <!-- Main navigation -->
                    <div class="nav-collapse collapse pull-right">
                        <ul class="nav" id="top-navigation">
                        	<li><div id="ViewTimer"></div></li>
                            <li class="active"><a href="/CFK/index.jsp">Challenge Fashion King!!</a></li>
                            <li><a href="/CFK/Rank.do#service">함께하기</a></li>
                            <li><a href="/CFK/List.do#portfolio">투표하기</a></li>
                            <li><a href="/CFK/board/board_enter.jsp#service">참가신청</a></li>
                            <li><a href="/CFK/board/board_attend.jsp">방청신청</a></li>
                            <li><a href="/CFK/board/board_fashion.jsp">패션트렌드</a></li>
                            <li><a href="/CFK/index.jsp#contact">패션쇼</a></li>
                        </ul>
                    </div>
                  
                </div>
            </div>
        </div>

        <!-- 공지 사항 -->
        <div class="section third-section">
            <div class="container newsletter">
                <div class="sub-section">
                    <div class="title clearfix">
                        <div class="pull-left">
                            <h3>공지 사항</h3>
                        </div>
                    </div>
                </div>
                <div class="row-fluid">
                    <div class="span12">
                    	<%
                    	for(NotifyVO vo : notiList){
                    	%>
                        <p>●<%=vo.getNotify_content() %>. 작성일:<%=vo.getNotify_date() %></p>
                        <%
                    	}
                        %>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- 게시판 -->
        <div class="section secondary-section" id="portfolio">
            <div class="container">
 				<div class="title">
                    <h1><font size="10" face="휴먼둥근헤드라인">전쟁이다! 투표하시라!</font></h1>
                </div>
                	<ul class="nav nav-pills">
                
                	<%
					//페이지 상단 페이지 나오기
					for(int i=startPage;i<=endPage;i++){
						if(i==current_page){
						%><li class="filter">
              	          <a href="List.do?page=<%=i %>"><%=i %></a>
             	 	      </li><%
						}else{
						%><li class="filter">
          	              <a href="List.do?page=<%=i %>"><%=i %></a>
           		          </li><%
						}
					}
					%>    
         	        </ul>
         	        
             	    <ul id="portfolio-grid" class="thumbnails row">
					<%
					//글번호 다시매기기
					for(BoardVO vo:list){
					%>                	
                    	<li class="span12 mix web">
                        	<div style="border-radius:50px;" class="thumbnail">
                             	<img src="/CFK/thumb/<%=vo.getBoard_thumbnail() %>">
                             	<h3>조회=<%=vo.getBoard_readcount()%></h3>
                              	<p><%=vo.getBoard_date()%></p>
                             	<div class="mask">
                             	<h2><%=vo.getBoard_writer()%></h2>
                              	<a href="HitUpdate.do?board_num=<%=vo.getBoard_num()%>&page=1">
                             	<h2><i class="icon-plus"></i></h2></a>
                             	</div>
                        	</div>
                     	</li>
                    <%}%>
                    </ul>
            </div>
        </div>
        <jsp:include page="../board_bottom.jsp"></jsp:include>
	</body>
</html>