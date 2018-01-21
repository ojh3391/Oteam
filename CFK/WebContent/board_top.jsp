<%@page import="vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	UserVO vo=(UserVO)session.getAttribute("vo");
%>    
<!DOCTYPE html>
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
		var countDown = new Date("Jan 26, 2018 23:59:59").getTime();

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
                        	<li style="margin-top: 15px;"><div id="ViewTimer"></div></li>                            
                            <li><a href="/CFK/Rank.do#service">함께하기</a></li>
                            <li><a href="/CFK/List.do#portfolio">투표하기</a></li>
                            <li><a href="/CFK/board/board_enter.jsp#service">참가신청</a></li>
                            <li><a href="/CFK/board/board_attend.jsp">방청신청</a></li>
                            <li><a href="/CFK/board/board_fashion.jsp">패션트렌드</a></li>
                            <li><a href="/CFK/index.jsp#contact">패션쇼</a></li>
                            <%
                            if(vo!=null){
                            %>	
                            	<li><a href="/CFK/Rank.do#service"><font color="yellow"><%=vo.getUser_name() %></font>님 로그인중</a></li>
                            	<li style="margin-top: 16px;"><button style="border-radius:50px;" onclick="location.href='logout.do'">logout</button></li>
                            <%	
                            }
							%>
                        </ul>
                    </div>
                  
                </div>
            </div>
        </div>
        
        <!-- Start home section -->
        <div id="home">
        
            <!-- Start cSlider s-->
            <div id="da-slider" class="da-slider">
                <div class="triangle">
                </div>
                <div class="mask">
                </div>
                <div class="container">
                
                    <!-- Start first slide -->
                    <div class="da-slide">
                        <h2 class="fittext2">오팀장과 형님들</h2>
                        <h4>대우직업능력개발원 3반 (담임:박진경, 부담임:최규리)</h4>
                        <p>Master : 오지훈(29세)<br>Member : 김영봉(34세),김진수(35세),이준영(35세)<br>Guest : 귄민귀(30세),최진호(28세),정지석(최진호 친구)</p>                        
                        <div class="da-img">
                            <img style="border-radius:25px;" src="/CFK/images/slider/Slider01.jpg" width="320">
                        </div>
                    </div>
                    
                    <!-- Start second slide -->
                    <div class="da-slide">
                        <h2>최고의 멘토 군단</h2>
                        <h4>사랑이야~♥</h4>
                        <p>2017 Season 1 우승과 준우승으로 환장의 캐미를 보여준 두사람이 이번엔 최강의 멘토가 되어 돌아 왔다. 이들에 대한 더 많은 정보를 원하시면 아래를 클릭클릭~!</p>
                        <font color="yellow"><a href="/CFK/board/board_mentor.jsp" class="da-link button">▶Click◀</a></font>
                        <div class="da-img">
                            <img style="border-radius:25px;" src="/CFK/images/slider/Slider02.jpg" width="320">
                        </div>
                    </div>
                   
                    <!-- Start third slide -->
                    <div class="da-slide">
                        <h2>Challenge Fashion King!!</h2>
                        <h4>패션으로 전하는 단 하나의 감동</h4>
                        <p>CFK는 각 장르를 대표하는 패션니스트들이 최고의 쇼를 통해 감동의 무대를 선보이는 프로그램으로 <font color="red">'더 넓고, 더 깊은 패션'</font>이라는 캐치 프레이즈 아래 각 장르의 매력을 보여줄 최고의 무대를 선사하고자 합니다.</p>                      
                        <div class="da-img">
                            <img style="border-radius:25px;" src="/CFK/images/slider/Slider03.jpg" width="320" alt="image03">
                        </div>
                    </div>
                    
                    <!-- Start cSlide navigation arrows -->
                    <div class="da-arrows">
                        <span class="da-arrows-prev"></span>
                        <span class="da-arrows-next"></span>
                    </div>
                    
                </div>
            </div>
        </div>
        <!-- End home section -->
	</body>
</html>