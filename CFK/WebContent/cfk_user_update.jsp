
<%@page import="user.vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
UserVO vo=(UserVO)request.getAttribute("rs");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
    </head>
     
        <body>
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
                            <li><a href="index.jsp#service">함께하기</a></li>
                            <li><a href="qList.do#portfolio">투표하기</a></li>
                            <li><a href="parti.jsp">참가신청</a></li>
                            <li><a href="#clients">방청시청</a></li>
                            <li><a href="fashion2018.jsp">패션트렌드</a></li>
                            <li><a href="index.jsp#contact">패션쇼</a></li>
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
        
        
        
            <div class="section secondary-section" id="service">
            <div class="container">
      
        <div class="title">
        	<h1>정보수정</h1>
            	<!-- Section's title goes here -->
                <p>업데이트 된 정보를 입력하시오.</p>
                <!--Simple description for section goes here. -->
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
					<td align="center"><select name="user_area" class="span5">
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
						</select></td>
					
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