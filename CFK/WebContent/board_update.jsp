<%@page import="board.vo.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	BoardVO vo=(BoardVO)request.getAttribute("vo");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>참가신청</title>
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
                            <li><a href="cfk_attend.jsp">방청시청</a></li>
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
        
        
        
        
        <div class="section secondary-section" id="service">
            <div class="container">
      
        <div class="title">
        	<h1>수정하기</h1>
            	<!-- Section's title goes here -->
                <p>패션킹에 도전해 보세요!!</p>
                <!--Simple description for section goes here. -->
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