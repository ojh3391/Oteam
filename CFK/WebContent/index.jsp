
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
		</script>
        
    </head>
    
    <body onload="Popupopen();">
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
                            <li class="active"><a href="test.jsp">Challenge Fashion King!!</a></li>
                            <li><a href="test.jsp">함께하기</a></li>
                            <li><a href="qList.do#portfolio">투표하기</a></li>
                            <li><a href="parti.jsp">참가신청</a></li>
                            <li><a href="cfk_attend.jsp">방청신청</a></li>
                            <li><a href="#price">응원하기</a></li>
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
                            <img style="border-radius:50px;" src="./Resources/images/Slider02.png" width="320" alt="image02">
                        </div>
                    </div>
                    <!-- End second slide -->
                    <!-- Start third slide -->
                    <div class="da-slide">
                        <h2>Challenge Fashion King!!</h2>
                        <h4>Customizable</h4>
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
                   	</form>
                   		 	<button class="message-btn" onclick="location.href='register.html'">회원 가입</button>
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
          		 	<%} %>       
                </div>
            </div>
        </div>
        <!-- Service section end -->     
        <!-- Portfolio section start -->
        <div class="section secondary-section " id="portfolio">
            <div class="triangle"></div>
            <div class="container">
                <div class="title">
                    <!-- <font size="10" color="black" face="휴먼둥근헤드라인">2018년! 전 세계를 뒤흔들 <font size="11" color="red">패션</font>전쟁이 시작된다!</font> -->
                    <h1><font size="10" face="휴먼둥근헤드라인">2018년! 전 세계를 뒤흔들 <font size="11" color="red">패션</font>전쟁이 시작된다!</font></h1>
                    <p>매주 금요일 저녁 7시!!</p>
                </div>
                <ul class="nav nav-pills">
                    <li class="filter" data-filter="all">
                        <a href="#noAction">All</a>
                    </li>
                    <li class="filter" data-filter="web">
                        <a href="#noAction">투표수</a>
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
                <!-- Start details for portfolio project 1 -->
                <div id="single-project">
                    <div id="slidingDiv" class="toggleDiv row-fluid single-project">
                        <div class="span6">
                            <img src="./Resources/images/Portfolio01.png" alt="project 1" />
                        </div>
                        <div class="span6">
                            <div class="project-description">
                                <div class="project-title clearfix">
                                    <h3>Webste for Some Client</h3>
                                    <span class="show_hide close">
                                        <i class="icon-cancel"></i>
                                    </span>
                                </div>
                                <div class="project-info">
                                    <div>
                                        <span>Client</span>Some Client Name</div>
                                    <div>
                                        <span>Date</span>July 2013</div>
                                    <div>
                                        <span>Skills</span>HTML5, CSS3, JavaScript</div>
                                    <div>
                                        <span>Link</span>http://examplecomp.com</div>
                                </div>
                                <p>Believe in yourself! Have faith in your abilities! Without a humble but reasonable confidence in your own powers you cannot be successful or happy.</p>
                            </div>
                        </div>
                    </div>
                    <!-- End details for portfolio project 1 -->
                    <!-- Start details for portfolio project 2 -->
                    <div id="slidingDiv1" class="toggleDiv row-fluid single-project">
                        <div class="span6">
                            <img src="./Resources/images/Portfolio02.png" alt="project 2">
                        </div>
                        <div class="span6">
                            <div class="project-description">
                                <div class="project-title clearfix">
                                    <h3>Webste for Some Client</h3>
                                    <span class="show_hide close">
                                        <i class="icon-cancel"></i>
                                    </span>
                                </div>
                                <div class="project-info">
                                    <div>
                                        <span>Client</span>Some Client Name</div>
                                    <div>
                                        <span>Date</span>July 2013</div>
                                    <div>
                                        <span>Skills</span>HTML5, CSS3, JavaScript</div>
                                    <div>
                                        <span>Link</span>http://examplecomp.com</div>
                                </div>
                                <p>Life is a song - sing it. Life is a game - play it. Life is a challenge - meet it. Life is a dream - realize it. Life is a sacrifice - offer it. Life is love - enjoy it.</p>
                            </div>
                        </div>
                    </div>
                    <!-- End details for portfolio project 2 -->
                    <!-- Start details for portfolio project 3 -->
                    <div id="slidingDiv2" class="toggleDiv row-fluid single-project">
                        <div class="span6">
                            <img src="./Resources/images/Portfolio03.png" alt="project 3">
                        </div>
                        <div class="span6">
                            <div class="project-description">
                                <div class="project-title clearfix">
                                    <h3>Webste for Some Client</h3>
                                    <span class="show_hide close">
                                        <i class="icon-cancel"></i>
                                    </span>
                                </div>
                                <div class="project-info">
                                    <div>
                                        <span>Client</span>Some Client Name</div>
                                    <div>
                                        <span>Date</span>July 2013</div>
                                    <div>
                                        <span>Skills</span>HTML5, CSS3, JavaScript</div>
                                    <div>
                                        <span>Link</span>http://examplecomp.com</div>
                                </div>
                                <p>How far you go in life depends on your being tender with the young, compassionate with the aged, sympathetic with the striving and tolerant of the weak and strong. Because someday in your life you will have been all of these.</p>
                            </div>
                        </div>
                    </div>
                    <!-- End details for portfolio project 3 -->
                    <!-- Start details for portfolio project 4 -->
                    <div id="slidingDiv3" class="toggleDiv row-fluid single-project">
                        <div class="span6">
                            <img src="./Resources/images/Portfolio04.png" alt="project 4">
                        </div>
                        <div class="span6">
                            <div class="project-description">
                                <div class="project-title clearfix">
                                    <h3>Project for Some Client</h3>
                                    <span class="show_hide close">
                                        <i class="icon-cancel"></i>
                                    </span>
                                </div>
                                <div class="project-info">
                                    <div>
                                        <span>Client</span>Some Client Name</div>
                                    <div>
                                        <span>Date</span>July 2013</div>
                                    <div>
                                        <span>Skills</span>HTML5, CSS3, JavaScript</div>
                                    <div>
                                        <span>Link</span>http://examplecomp.com</div>
                                </div>
                                <p>Life's but a walking shadow, a poor player, that struts and frets his hour upon the stage, and then is heard no more; it is a tale told by an idiot, full of sound and fury, signifying nothing.</p>
                            </div>
                        </div>
                    </div>
                    <!-- End details for portfolio project 4 -->
                    <!-- Start details for portfolio project 5 -->
                    <div id="slidingDiv4" class="toggleDiv row-fluid single-project">
                        <div class="span6">
                            <img src="./Resources/images/Portfolio05.png" alt="project 5">
                        </div>
                        <div class="span6">
                            <div class="project-description">
                                <div class="project-title clearfix">
                                    <h3>Webste for Some Client</h3>
                                    <span class="show_hide close">
                                        <i class="icon-cancel"></i>
                                    </span>
                                </div>
                                <div class="project-info">
                                    <div>
                                        <span>Client</span>Some Client Name</div>
                                    <div>
                                        <span>Date</span>July 2013</div>
                                    <div>
                                        <span>Skills</span>HTML5, CSS3, JavaScript</div>
                                    <div>
                                        <span>Link</span>http://examplecomp.com</div>
                                </div>
                                <p>We need to give each other the space to grow, to be ourselves, to exercise our diversity. We need to give each other space so that we may both give and receive such beautiful things as ideas, openness, dignity, joy, healing, and inclusion.</p>
                            </div>
                        </div>
                    </div>
                    <!-- End details for portfolio project 5 -->
			
                    <ul id="portfolio-grid" class="thumbnails row">
                    <%
            			for(BoardVO bo:rank){ 
           			 %>
                        <li class="span3 mix web">
                            <div class="thumbnail">
                                <img src="/CFK/boardUpload/thumb/<%=bo.getBoard_thumbnail() %>" alt="project 1">
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
                                <img src="/CFK/boardUpload/thumb/<%=bo1.getBoard_thumbnail() %>" alt="project 2">
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
                                <img src="/CFK/boardUpload/thumb/<%=bo2.getBoard_thumbnail() %>" alt="project 3">
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
                                <img src="/CFK/boardUpload/thumb/<%=bo3.getBoard_thumbnail() %>" alt="project 4">
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
                                <img src="/CFK/boardUpload/thumb/<%=bo4.getBoard_thumbnail() %>" alt="project 5">
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
                                <img src="/CFK/boardUpload/thumb/<%=bo5.getBoard_thumbnail() %>" alt="project 6">
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
                                <img src="/CFK/boardUpload/thumb/<%=bo6.getBoard_thumbnail() %>" alt="project 7">
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
                                <img src="/CFK/boardUpload/thumb/<%=bo7.getBoard_thumbnail() %>" alt="project 8">
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
                <%--     <li class="span3 mix web">
                            <div class="thumbnail">
                                <img src="/CFK/boardUpload/thumb/<%=bo.getBoard_thumbnail() %>" alt="project 4">
                                <a href="#single-project" class="show_hide more" rel="#slidingDiv3">
                                    <i class="icon-plus"></i>	
                                </a>
                                <h3><%=bo.getBoard_vote() %></h3>
                                <p>Thumbnail caption...</p>
                                <h2><%=bo.getBoard_writer() %></h2>
                                <div class="mask"></div>
                            </div>
                        </li>
                        <li class="span3 mix photo">
                            <div class="thumbnail">
                                <img src="/CFK/boardUpload/thumb/<%=bo.getBoard_thumbnail() %>" alt="project 5">
                                <a href="#single-project" class="show_hide more" rel="#slidingDiv4">
                                    <i class="icon-plus"></i>
                                </a>
                                <h3><%=bo.getBoard_vote() %></h3>
                                <p>Thumbnail caption...</p>
                                <h2><%=bo.getBoard_writer() %></h2>
                                <div class="mask"></div>
                            </div>
                        </li> --%>
                         
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
                            <img src="./Resources/images/min.jpg" alt="team 1">
                            <h3>Min</h3>
                            
                            <div class="mask">
                                <h2>2017년 우승자</h2>
                                <p>When you stop expecting people to be perfect, you can like them for who they are.</p>
                            </div>
                        </div>
                    </div>
                    <div class="span4" id="second-person">
                        <div class="thumbnail">
                            <img src="./Resources/images/Team2.png" alt="team 1">
                            <h3>Gong</h3>
                            
                            <div class="mask">
                                <h2>2017년 준우승</h2>
                                <p>When you stop expecting people to be perfect, you can like them for who they are.</p>
                            </div>
                        </div>
                    </div>
                    <div class="span4" id="third-person">
                        <div class="thumbnail">
                            <img src="./Resources/images/Team3.png" alt="team 1">
                            <h3>Oh</h3>
                            
                            <div class="mask">
                                <h2>대표이사</h2>
                                <p>When you stop expecting people to be perfect, you can like them for who they are.</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="about-text centered">
                    <h3>About Us</h3>
                    <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi.</p>
                </div>
                
           
                <div class="triangle"></div>
                <div class="container">
                    <div class="title">
                        <h1>Best 응원 메시지</h1>
                        <p>Duis mollis placerat quam, eget laoreet tellus tempor eu. Quisque dapibus in purus in dignissim.</p>
                    </div>
                    <div class="row">
                        <div class="span4">
                            <div class="testimonial">
                                <p>"I've worked too hard and too long to let anything stand in the way of my goals. I will not let my teammates down and I will not let myself down."</p>
                                <div class="whopic">
                                    <div class="arrow"></div>
                                    <img src="./Resources/images/Client1.png" class="centered" alt="client 1">
                                    <strong>John Doe
                                        <small>Client</small>
                                    </strong>
                                </div>
                            </div>
                        </div>
                        <div class="span4">
                            <div class="testimonial">
                                <p>"In motivating people, you've got to engage their minds and their hearts. I motivate people, I hope, by example - and perhaps by excitement, by having productive ideas to make others feel involved."</p>
                                <div class="whopic">
                                    <div class="arrow"></div>
                                    <img src="./Resources/images/Client2.png" class="centered" alt="client 2">
                                    <strong>John Doe
                                        <small>Client</small>
                                    </strong>
                                </div>
                            </div>
                        </div>
                        <div class="span4">
                            <div class="testimonial">
                                <p>"Determine never to be idle. No person will have occasion to complain of the want of time who never loses any. It is wonderful how much may be done if we are always doing."</p>
                                <div class="whopic">
                                    <div class="arrow"></div>
                                    <img src="./Resources/images/Client3.png" class="centered" alt="client 3">
                                    <strong>John Doe
                                        <small>Client</small>
                                    </strong>
                                </div>
                            </div>
                        </div>
                    </div>
                    <p class="testimonial-text">
                        "Perfection is Achieved Not When There Is Nothing More to Add, But When There Is Nothing Left to Take Away"
                    </p>
                </div>
            </div>
        </div>
        
        
        <!-- Contact section start -->
        <div id="contact" class="contact">
            <div class="section secondary-section">
                <div class="container">
                    <div class="title">
                        <h1>Contact Us</h1>
                        <p>오라~ 패션의 메카로~ !</p>
                    </div>
                </div>
                <div class="container">
                <div class="map-wrapper">
                    <div class="map-canvas" id="map-canvas">Loading map...</div>
                </div>    
                </div>
                <div class="container">
                    <div class="span9 center contact-info">
                        <p>123 Fifth Avenue, 노원</p>
                        <p class="info-mail">CFK@somemail.com</p>
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