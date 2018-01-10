
<%@page import="board.vo.PageVO"%>
<%@page import="board.vo.BoardVO"%>
<%@page import="java.util.Vector"%>
<%@page import="user.vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	Vector<BoardVO> rank=(Vector<BoardVO>)request.getAttribute("rank");
	Vector<BoardVO> rank1=(Vector<BoardVO>)request.getAttribute("rank1");
	Vector<BoardVO> rank2=(Vector<BoardVO>)request.getAttribute("rank2");
	Vector<BoardVO> rank3=(Vector<BoardVO>)request.getAttribute("rank3");
	Vector<BoardVO> rank4=(Vector<BoardVO>)request.getAttribute("rank4");
	Vector<BoardVO> rank5=(Vector<BoardVO>)request.getAttribute("rank5");
	Vector<BoardVO> rank6=(Vector<BoardVO>)request.getAttribute("rank6");
	Vector<BoardVO> rank7=(Vector<BoardVO>)request.getAttribute("rank7");
	
	Vector<BoardVO> list=(Vector<BoardVO>)request.getAttribute("list");
	//페이지나누기를 위한 정보
	PageVO info=(PageVO)request.getAttribute("info");
	int total_page=info.getTotalPage();
	int current_page=info.getPage();
	int endPage=info.getEndPage();
	int startPage=info.getStartPage();
	int totalRows=info.getTotoalRows();
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
        <link rel="stylesheet" type="text/css" href="./Resources/css/bootstrap.css" />
        <link rel="stylesheet" type="text/css" href="./Resources/css/bootstrap-responsive.css" />
        <link rel="stylesheet" type="text/css" href="./Resources/css/style.css" />
        <link rel="stylesheet" type="text/css" href="./Resources/css/pluton.css" />
        <!--[if IE 7]>
            <link rel="stylesheet" type="text/css" href="./Resources/css/pluton-ie7.css" />
        <![endif]-->
        <link rel="stylesheet" type="text/css" href="./Resources/css/jquery.cslider.css" />
        <link rel="stylesheet" type="text/css" href="./Resources/css/jquery.bxslider.css" />
        <link rel="stylesheet" type="text/css" href="./Resources/css/animate.css" />
        <!-- Fav and touch icons -->
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="./Resources/images/ico/apple-touch-icon-144.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="./Resources/images/ico/apple-touch-icon-114.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="./Resources/images/apple-touch-icon-72.png">
        <link rel="apple-touch-icon-precomposed" href="./Resources/images/ico/apple-touch-icon-57.png">
        <link rel="shortcut icon" href="./Resources/images/logo1.png">
        
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
		   		window.open("popup.html", "notice", "width=500, height=615, top=0, left=0, location=no, scrollbars=yes");
			}
		}
		//
			
		// 디데이 function
		var countDown = new Date("Jan 18, 2018 23:59:59").getTime();

		function msg_time() {	
			var now = new Date().getTime();		//현재 날짜
			var distance = countDown - now;		//d-day와 현재날짜 차이
			
			// 남은 시간 계산
			days = Math.floor(distance / (1000*60*60*24))+"일 ";
			hours = Math.floor((distance % (1000*60*60*24)) / (1000*60*60))+"시 ";
			minutes = Math.floor((distance % (1000*60*60)) / (1000*60))+"분 ";	
			seconds = Math.floor((distance % (1000*60)) / (1000))+"초";
			
			var msg = "<font color='black' size='5px'>D-DAY </font><font color='red' size='5px' text-align:center>"+days+hours+minutes+seconds+"</font>";
			
			// div 영역에 보여줌 
			document.getElementById("ViewTimer").innerHTML = msg;
			
			//distance--;					// 기간을 현재 날짜로 안가져올 경우의 1초씩 감소
			
			if (distance < 0) {			// 시간이 종료 되었으면..
				clearInterval(tid);		// 타이머 해제
				//alert("종료");
			} 
			
		}

		function TimerStart(){ tid=setInterval('msg_time()', 1000) };
		//
		</script>
        
    </head>
    
    <body onload="Popupopen(); TimerStart();">
        <div class="navbar">
            <div class="navbar-inner">
                <div class="container">
                    <a href="#" class="brand">
                        <img src="./Resources/images/logo.png" width="120" height="40" alt="Logo" />
                        <!-- This is website logo -->
                    </a>
                    <!-- Navigation button, visible on small resolution -->
                    <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                        <i class="icon-menu"></i>
                    </button>
                    <!-- Main navigation -->
                    <div class="nav-collapse collapse pull-right">
                        <ul class="nav" id="top-navigation">
                            <li class="active"><a href="index.jsp">Challenge Fashion King!!</a></li>
                            <li><a href="#service">함께하기</a></li>
                            <li><a href="qList.do#portfolio">투표하기</a></li>
                            <li><a href="parti.jsp#service">참가신청</a></li>
                            <li><a href="cfk_attend.jsp">방청신청</a></li>
                            <li><a href="fashion2018.jsp">패션트렌드</a></li>
                            <li><a href="#contact">패션쇼</a></li>
                        </ul>
                    </div>
                    <!-- End main navigation -->
                </div>
            </div>
        </div>
        <!-- Start home section -->
        <div id="home">
            <!-- Start cSlider s-->
            <div id="da-slider" class="da-slider">
                <div class="triangle"></div>
                <!-- mask elemet use for masking background image -->
                <div class="mask"></div>
                <!-- All slides centred in container element -->
                <div class="container">
                    <!-- Start first slide -->
                    <div class="da-slide">
                        <h2 class="fittext2">오팀장과 형님들</h2>
                        <h4>Clean & responsive</h4>
                        <p>When she reached the first hills of the Italic Mountains, she had a last view back on the skyline of her hometown Bookmarksgrove, the headline of Alphabet Village and the subline of her own road, the Line Lane.</p>
                        <a href="#" class="da-link button">Read more</a>
                        <div class="da-img">
                            <img style="border-radius:50px;" src="./Resources/images/Slider01.jpg" alt="image01" width="320" >
                        </div>
                    </div>
                    <!-- End first slide -->
                    <!-- Start second slide -->
                    <div class="da-slide">
                        <h2>최고의 멘토 군단</h2>
                        <h4>Easy to use</h4>
                        <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean.</p>
                        <a href="#" class="da-link button">Read more</a>
                        <div class="da-img">
                            <img style="border-radius:50px;" src="./Resources/images/Slider02.png" width="700" alt="image02">
                        </div>
                    </div>
                    <!-- End second slide -->
                    <!-- Start third slide -->
                    <div class="da-slide">
                        <h2>Challenge Fashion King!!</h2>
                        <h4>Season 2</h4>
                        <p>A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth.</p>
                        <a href="#" class="da-link button">Read more</a>
                        <div class="da-img">
                            <img style="border-radius:50px;" src="./Resources/images/Slider03.jpg" width="320" alt="image03">
                        </div>
                    </div>
                    <!-- Start third slide -->
                    <!-- Start cSlide navigation arrows -->
                    <div class="da-arrows">
                        <span class="da-arrows-prev"></span>
                        <span class="da-arrows-next"></span>
                    </div>
                    <!-- End cSlide navigation arrows -->
                </div>
            </div>
        </div>
        <!-- End home section -->
        <!-- Service section start -->
        <div class="section primary-section" id="service">
            <div class="container">
                <!-- Start title section -->
                <div class="title">
                    <h1>Join Us!</h1>
                    <!-- Section's title goes here -->
                    <p>회원가입 하시면 많은 혜택을 누리실 수 있습니다.</p>
                    <!--Simple description for section goes here. -->
                </div>
                <div class="row-fluid">
                    <div class="span4">
                        <div class="centered service">
                            <div class="circle-border zoom-in">
                                <img class="img-circle" src="./Resources/images/Service1.png" alt="service 1">
                            </div>
                            <h3>투표하세요!</h3>
                            <p>We Create Modern And Clean Theme For Your Business Company.</p>
                        </div>
                    </div>
                    <div class="span4">
                        <div class="centered service">
                            <div class="circle-border zoom-in">
                                <img class="img-circle" src="./Resources/images/Service2.png" alt="service 2" />
                            </div>
                            <h3>참가하세요!</h3>
                            <p>We Create Modern And Powerful Theme With Lots Animation And Features</p>
                        </div>
                    </div>
                    <%
					UserVO vo=(UserVO)session.getAttribute("vo");
                    		
					if(vo==null){ %>
                    <!-- 로그인 섹션 스타트 -->
        			<div class="span4">
            			<h3>로그인</h3>
                		<form action="login.do" method="post">
                			<div class="control-group">
                    			<div class="controls">
                        			<input class="span12" type="text" name="user_id" placeholder="* 당신의 아이디..." required/>
                           		 
                       		 </div>
                   		 </div>
                		<div class="control-group">
                			<div class="controls">
                   		 	<input class="span12" type="password" name="user_passwd" placeholder="* 당신의 비밀번호..." required/>
                   		 	
                			</div>
               		 </div>    
               		 
                   		 	<button class="message-btn" type="submit">로그인</button>
                   		 	<button class="message-btn" onclick="location.href='register.html'">회원 가입</button>
                   	</form>
                   	</div>
               		</div>
                		
          		 	</div>
        			<!-- 로그인 섹션 종료 -->
        			<%
					}else{ %> 
					<div class="span4">
						<img src="./Resources/images/logo.png" width="120" height="40" alt="Logo" />
            			<h3><font color="red">▶로그인 되셨습니다◀</font></h3>
                      		<div class="control-group">
                    			<div class="controls">
                        			<h3>웰컴이다. <font color="white"><%=vo.getUser_name()%></font> (이)여~.</h3>
                        			<h3>패션의 메카에 온걸 환영한다.</h3>
                           		 </div>
                   		 </div>
               		 <div class="control-group">
                			<div class="controls">
                   		 	<button class="message-btn" onclick="location.href='cfk_user_modify.jsp'">정보 수정</button>
                   		 	<button class="message-btn" onclick="location.href='logout.do'">로그 아웃</button>
                   		</div>
               		 </div>
                	</div>
                	</div>	
          		 	
          		 	<%} %>       
                </div>
        <!-- Service section end -->     
        <!-- Portfolio section start -->
        <div class="section secondary-section " id="portfolio">
            <div class="triangle"></div>
            <div class="container">
                <div class="title">
                    <!-- <font size="10" color="black" face="휴먼둥근헤드라인">2018년! 전 세계를 뒤흔들 <font size="11" color="red">패션</font>전쟁이 시작된다!</font> -->
                    <h1><font size="10" face="휴먼둥근헤드라인">2018년! 전 세계를 뒤흔들 <font size="11" color="red">패션</font>전쟁이 시작된다!</font></h1>
                    <div id="ViewTimer"></div>
                    <p>매주 금요일 저녁 7시!!</p>
                    <p></p>
                    
                    <img src="./Resources/images/순위1.PNG" class="centered" alt="rank">
                </div>
                <ul class="nav nav-pills">


                    <li class="filter" data-filter="web">
                        <a href="#noAction">전체</a>
                    </li>
                    <li class="filter" data-filter="photo">
                        <a href="#noAction">남성</a>
                    </li>
                    <li class="filter" data-filter="identity">
                        <a href="#noAction">여성</a>
                    </li>
                    <li class="filter" data-filter="seokyoung">
                        <a href="#noAction">서울경기</a>
                    </li>
                    <li class="filter" data-filter="kangwon">
                        <a href="#noAction">강원</a>
                    </li>
                    <li class="filter" data-filter="chungcheong">
                        <a href="#noAction">충청</a>
                    </li>
                    <li class="filter" data-filter="honam">
                        <a href="#noAction">호남 제주</a>
                    </li>
                    <li class="filter" data-filter="youngnam">
                        <a href="#noAction">영남</a>
                    </li>
                </ul>
			
                    <ul id="portfolio-grid" class="thumbnails row">
                    <%
            			for(BoardVO bo:rank){ 
           			 %>
                        <li class="span3 mix web">
                            <div class="thumbnail">
                                <img src="/CFK/thumb/<%=bo.getBoard_thumbnail() %>" alt="project 1">
                                <h3><%=bo.getBoard_vote() %></h3>
                                <p>Thumbnail caption...</p>
                                <div class="mask">
                                <h2><%=bo.getBoard_writer() %></h2>
                                <a href="qHitUpdate.do?board_num=<%=bo.getBoard_num()%>&page=<%=current_page%>">
                              	<h2><i class="icon-plus"></i></h2></a>
                                </div>
                             </div>
                        </li>
                       <%} %>        
                                
                                
                        
                       
                    <%
            			for(BoardVO bo1:rank1){ 
           			 %>    
                        <li class="span3 mix photo">
                            <div class="thumbnail">
                                <img src="/CFK/thumb/<%=bo1.getBoard_thumbnail() %>" alt="project 2">
                                <h3><%=bo1.getBoard_vote() %></h3>
                                <p>Thumbnail caption...</p>
                                <div class="mask">
                                <h2><%=bo1.getBoard_writer() %></h2>
                                <a href="qHitUpdate.do?board_num=<%=bo1.getBoard_num()%>&page=<%=current_page%>">
                              	<h2><i class="icon-plus"></i></h2></a>
                                </div>
                            </div>
                         </li>   
                            <%} %>
                      <%
            			for(BoardVO bo2:rank2){ 
           			 %>
                    
                        <li class="span3 mix identity">
                            <div class="thumbnail">
                                <img src="/CFK/thumb/<%=bo2.getBoard_thumbnail() %>" alt="project 3">
                                <h3><%=bo2.getBoard_vote() %></h3>
                                <p>Thumbnail caption...</p>
                                <div class="mask">
                                <h2><%=bo2.getBoard_writer() %></h2>
                                <a href="qHitUpdate.do?board_num=<%=bo2.getBoard_num()%>&page=<%=current_page%>">
                              	<h2><i class="icon-plus"></i></h2></a>
                                </div>
                            </div>
                    	</li>
                		<%} %>
                	<%
            			for(BoardVO bo3:rank3){ 
           			 %>
                    
                        <li class="span3 mix seokyoung">
                            <div class="thumbnail">
                                <img src="/CFK/thumb/<%=bo3.getBoard_thumbnail() %>" alt="project 4">
                                <h3><%=bo3.getBoard_vote() %></h3>
                                <p>Thumbnail caption...</p>
                                <div class="mask">
                                <h2><%=bo3.getBoard_writer() %></h2>
                                <a href="qHitUpdate.do?board_num=<%=bo3.getBoard_num()%>&page=<%=current_page%>">
                              	<h2><i class="icon-plus"></i></h2></a>
                                </div>
                            </div>
                    	</li>
                		<%} %>
                		
                		<%
            			for(BoardVO bo4:rank4){ 
           			 %>
                    
                        <li class="span3 mix kangwon">
                            <div class="thumbnail">
                                <img src="/CFK/thumb/<%=bo4.getBoard_thumbnail() %>" alt="project 5">
                                <h3><%=bo4.getBoard_vote() %></h3>
                                <p>Thumbnail caption...</p>
                                <div class="mask">
                                <h2><%=bo4.getBoard_writer() %></h2>
                                <a href="qHitUpdate.do?board_num=<%=bo4.getBoard_num()%>&page=<%=current_page%>">
                              	<h2><i class="icon-plus"></i></h2></a>
                                </div>
                            </div>
                    	</li>
                		<%} %>
                		
                		<%
            			for(BoardVO bo5:rank5){ 
           			 %>
                    
                        <li class="span3 mix chungcheong">
                            <div class="thumbnail">
                                <img src="/CFK/thumb/<%=bo5.getBoard_thumbnail() %>" alt="project 6">
                                <h3><%=bo5.getBoard_vote() %></h3>
                                <p>Thumbnail caption...</p>
                                <div class="mask">
                                <h2><%=bo5.getBoard_writer() %></h2>
                                <a href="qHitUpdate.do?board_num=<%=bo5.getBoard_num()%>&page=<%=current_page%>">
                              	<h2><i class="icon-plus"></i></h2></a>
                                </div>
                            </div>
                    	</li>
                		<%} %>	
                		
                		<%
            			for(BoardVO bo6:rank6){ 
           			 %>
                    
                        <li class="span3 mix honam">
                            <div class="thumbnail">
                                <img src="/CFK/thumb/<%=bo6.getBoard_thumbnail() %>" alt="project 7">
                                <h3><%=bo6.getBoard_vote() %></h3>
                                <p>Thumbnail caption...</p>
                                <div class="mask">
                                <h2><%=bo6.getBoard_writer() %></h2>
                                <a href="qHitUpdate.do?board_num=<%=bo6.getBoard_num()%>&page=<%=current_page%>">
                              	<h2><i class="icon-plus"></i></h2></a>
                                </div>
                            </div>
                    	</li>
                		<%} %>
                		
                		<%
            			for(BoardVO bo7:rank7){ 
           			 %>
                    
                        <li class="span3 mix youngnam">
                            <div class="thumbnail">
                                <img src="/CFK/thumb/<%=bo7.getBoard_thumbnail() %>" alt="project 8">
                                <h3><%=bo7.getBoard_vote() %></h3>
                                <p>Thumbnail caption...</p>
                                <div class="mask">
                                <h2><%=bo7.getBoard_writer() %></h2>
                                <a href="qHitUpdate.do?board_num=<%=bo7.getBoard_num()%>&page=<%=current_page%>">
                              	<h2><i class="icon-plus"></i></h2></a>
                                </div>
                            </div>
                    	</li>
                		<%} %>	
                
                         
                    </ul>
                    
                </div>
            </div>
        </div>
        <!-- Portfolio section end -->
        <!-- About us section start -->
        <div class="section primary-section" id="about">
            <div class="triangle"></div>
            <div class="container">
                <div class="title">
                    <h1>우리의 멘토군단</h1>
                    <p>작년 수상자를 필두로 한 세계 최강의 멘토 군단</p>
                </div>
                <div class="row-fluid team">
                    <div class="span4" id="first-person">
                        <div class="thumbnail">
                            <img src="./Resources/images/Team1.jpg" alt="team 1">
                            <h3>Min</h3>
                            
                            <div class="mask">
                                <h2>2017년 우승자</h2>
                                <p>When you stop expecting people to be perfect, you can like them for who they are.</p>
                            </div>
                        </div>
                    </div>
                    <div class="span4" id="second-person">
                        <div class="thumbnail">
                            <img src="./Resources/images/Team2.jpg" alt="team 1">
                            <h3>Gong</h3>
                            
                            <div class="mask">
                                <h2>2017년 준우승</h2>
                                <p>When you stop expecting people to be perfect, you can like them for who they are.</p>
                            </div>
                        </div>
                    </div>
                    <div class="span4" id="third-person">
                        <div class="thumbnail">
                            <img src="./Resources/images/Team3.jpg" alt="team 1">
                            <h3>Park</h3>
                            
                            <div class="mask">
                                <h2>마스터 심사위원</h2>
                                <p>When you stop expecting people to be perfect, you can like them for who they are.</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="about-text centered">
                    <h3>"옷만으로 패션이 완성되는 것은 아니다 옷을 입은 사람의 가치가 살아나야 한다"</h3>
                    <p>COCO CHANEL</p>
                </div>
                
           
                
                <div class="container">
                    <div class="title">
                        <h1>Best 응원 메시지</h1>
                        <p>CHALLENGE FASHION KING의 방영을 축하하기 위한 유명 연예인들의 축하메시지</p>
                    </div>
                    <div class="row">
                        <div class="span4">
                            <div class="testimonial">
                                <p>"CFK의 방영을 진심으로 축하드립니다. 아직은 저에게 안되겠지만 그래도 저의 후배, 새로운 패션리더의 출현을 지켜보겠습니다. "</p>
                                <div class="whopic">
                                    <div class="arrow"></div>
                                    <img src="./Resources/images/차승원.jpg" class="centered" alt="client 1">
                                    <strong>차승원
                                        <small>차줌마</small>
                                    </strong>
                                </div>
                            </div>
                        </div>
                        <div class="span4">
                            <div class="testimonial">
                                <p>"하하하!! 저와 같은 패션스타가 탄생되는 건가요? 진심으로 축하드리고 다음 회차 MC는 제가 맡겠습니다! "</p>
                                <div class="whopic">
                                    <div class="arrow"></div>
                                    <img src="./Resources/images/유재석.jpg" class="centered" alt="client 2">
                                    <strong>유 재 석
                                        <small>메뚜기</small>
                                    </strong>
                                </div>
                            </div>
                        </div>
                        <div class="span4">
                            <div class="testimonial">
                                <p>"CHALLENGE FASHION KING 방영을 진심으로 축하드려요~!! 새로운 패션스타와 함께 런웨이 무대에 함께 서고 싶네요~~"</p>
                                <div class="whopic">
                                    <div class="arrow"></div>
                                    <img src="./Resources/images/한혜진.jpg" class="centered" alt="client 3">
                                    <strong>한혜진
                                        <small>달심</small>
                                    </strong>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        
        <!-- Contact section start -->
        <div id="contact" class="contact">
            <div class="section secondary-section">
            <div class="triangle"></div>
                <div class="container">
                    <div class="title">
                        <h1>THE FIRST SHOW</h1><br>
                        <font size="10" color="black" face="휴먼둥근헤드라인">2018년 1월 19일 금요일 저녁 8시<br><br>지상 최강의<font size="11" color="red">패션쇼</font>가 열린다!</font>
                        <p>오라~ 패션의 메카로~ !</p>
                        <img src="./Resources/images/show.PNG" class="centered" alt="show">
                    </div>
                </div>
                <div class="container">
                <div class="map-wrapper">
                     <p align="center"><iframe src="map.html" frameborder="0" width="1000px" height="700px" id="" title="방청권 신청 프레임"></iframe></p>
                </div>    
                </div>
                <div class="container">
                    <div class="span9 center contact-info">
                        <p>123 Fifth Avenue, 노원</p>
                        <p class="info-mail">CFK@OJIMA.com</p>
                        <p>+11 234 567 890</p>
                        <p>+11 286 543 850</p>
                    </div>
                </div>
            </div>
        </div>
        <!-- Contact section edn -->
        <div class="section third-section">
            <div class="container centered">
                <div class="sub-section">
                    <div class="title clearfix">
                        <div class="pull-left">
                            <h3>Our Clients</h3>
                        </div>
                        <ul class="client-nav pull-right">
                            <li id="client-prev"></li>
                            <li id="client-next"></li>
                        </ul>
                    </div>
                    <ul class="row client-slider" id="clint-slider">
                        <li>
                            <a href="">
                                <img src="./Resources/images/clients/ClientLogo07.png" alt="client logo 1">
                            </a>
                        </li>
                        <li>
                            <a href="">
                                <img src="./Resources/images/clients/ClientLogo01.png" alt="client logo 2">
                            </a>
                        </li>
                        <li>
                            <a href="">
                                <img src="./Resources/images/clients/ClientLogo02.png" alt="client logo 3">
                            </a>
                        </li>
                        <li>
                            <a href="">
                                <img src="./Resources/images/clients/ClientLogo03.png" alt="client logo 4">
                            </a>
                        </li>
                        <li>
                            <a href="">
                                <img src="./Resources/images/clients/ClientLogo04.png" alt="client logo 5">
                            </a>
                        </li>
                        <li>
                            <a href="">
                                <img src="./Resources/images/clients/ClientLogo05.png" alt="client logo 6">
                            </a>
                        </li>
                        <li>
                            <a href="">
                                <img src="./Resources/images/clients/ClientLogo06.png" alt="client logo 7">
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <!-- Footer section start -->
        <div class="footer">
            <p>&copy; 2017 Theme by <a href="http://www.graphberry.com">Oh!Bro~ Corp.</a></p>
        </div>
        <!-- Footer section end -->
        <!-- ScrollUp button start -->
        <div class="scrollup">
            <a href="#">
                <i class="icon-up-open"></i>
            </a>
        </div>
        <!-- ScrollUp button end -->
        <!-- Include javascript -->
        <script src="./Resources/js/jquery.js"></script>
        <script type="text/javascript" src="./Resources/js/jquery.mixitup.js"></script>
        <script type="text/javascript" src="./Resources/js/bootstrap.js"></script>
        <script type="text/javascript" src="./Resources/js/modernizr.custom.js"></script>
        <script type="text/javascript" src="./Resources/js/jquery.bxslider.js"></script>
        <script type="text/javascript" src="./Resources/js/jquery.cslider.js"></script>
        <script type="text/javascript" src="./Resources/js/jquery.placeholder.js"></script>
        <script type="text/javascript" src="./Resources/js/jquery.inview.js"></script>
        <!-- Load google maps api and call initializeMap function defined in app.js -->
        <script async="" defer="" type="text/javascript" src="https://maps.googleapis.com/maps/api/js?sensor=false&callback=initializeMap"></script>
        <!-- css3-mediaqueries.js for IE8 or older -->
        <!--[if lt IE 9]>
            <script src="./Resources/js/respond.min.js"></script>
        <![endif]-->
        <script type="text/javascript" src="./Resources/js/app.js"></script>
    </body>
</html>