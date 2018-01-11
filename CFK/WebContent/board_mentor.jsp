<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    
    <head>
        <meta charset=utf-8>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>오팀장과 형님들</title>
        <!-- Load Roboto font -->
        <link href='http://fonts.googleapis.com/css?family=Roboto:400,300,700&amp;subset=latin,latin-ext' rel='stylesheet' type='text/css'>
        <!-- Load css styles -->
        <link rel="stylesheet" type="text/css" href="../Resources/css/bootstrap.css" />
        <link rel="stylesheet" type="text/css" href="../Resources/css/bootstrap-responsive.css" />
        <link rel="stylesheet" type="text/css" href="../Resources/css/style.css" />
        <link rel="stylesheet" type="text/css" href="../Resources/css/pluton.css" />
        <!-- popvideo -->
        <link rel="stylesheet" href="../Resources/css/jquery.popVideo.css"/>
        <!--[if IE 7]>
            <link rel="stylesheet" type="text/css" href="../Resources/css/pluton-ie7.css" />
        <![endif]-->
        <link rel="stylesheet" type="text/css" href="../Resources/css/jquery.cslider.css" />
        <link rel="stylesheet" type="text/css" href="../Resources/css/jquery.bxslider.css" />
        <link rel="stylesheet" type="text/css" href="../Resources/css/animate.css" />
        <!-- Fav and touch icons -->
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="../Resources/images/ico/apple-touch-icon-144.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="../Resources/images/ico/apple-touch-icon-114.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="../Resources/images/apple-touch-icon-72.png">
        <link rel="apple-touch-icon-precomposed" href="../Resources/images/ico/apple-touch-icon-57.png">
        <link rel="shortcut icon" href="../Resources/images/logo1.png">
        
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
		   		window.open("../popup.html", "notice", "width=500, height=615, top=0, left=0, location=no, scrollbars=yes");
			}
		}
			
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
		
		</script>
        
    </head>
    
    <body onload="Popupopen(); TimerStart();">
        <div class="navbar">
            <div class="navbar-inner">
                <div class="container">
                    <a href="#" class="brand">
                        <img src="../Resources/images/logo.png" width="120" height="40" alt="Logo" />
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
                            <img style="border-radius:50px;" src="../Resources/images/Slider01.jpg" alt="image01" width="320" >
                        </div>
                    </div>
                    <!-- End first slide -->
                    <!-- Start second slide -->
                    <div class="da-slide">
                        <h2>최고의 멘토 군단</h2>
                        <h4>Easy to use</h4>
                        <p>더 많은 정보를 원하시면 아래를 클릭클릭~!</p>
                        <font color="yellow"><a href="board_mentor.jsp" class="da-link button">▶Click◀</a></font>
                        <div class="da-img">
                            <img style="border-radius:50px;" src="../Resources/images/Slider02.png" width="700" alt="image02">
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
                            <img style="border-radius:50px;" src="../Resources/images/Slider03.jpg" width="320" alt="image03">
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
                    	<img src="../Resources/images/Team1.jpg" alt="team 1">
                            <h3>Mr.Min</h3>
                            
                            <div class="mask">
                                <h2>2017년 우승자</h2>
                                <p>When you stop expecting people to be perfect, you can like them for who they are.</p>
                            </div>
                        </div>
                    </div>
                            
                    <div class="span4" id="second-person">
                        <div class="thumbnail">
                            <img src="../Resources/images/Team2.jpg" alt="team 1">
                            <h3>Mr.Suck</h3>
                            
                            <div class="mask">
                                <h2>2017년 준우승자</h2>
                                <p>When you stop expecting people to be perfect, you can like them for who they are.</p>
                            </div>
                        </div>
                    </div>
                    <div class="span4" id="third-person">
                        <div class="thumbnail">
                            <img src="../Resources/images/Team3.jpg" alt="team 1">
                            <h3>Ms.Park</h3>
                            
                            <div class="mask">
                                <h2>마스터 심사위원</h2>
                                <p>When you stop expecting people to be perfect, you can like them for who they are.</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="about-text centered">
                    <h3>"옷만으로 패션이 완성되는 것은 아니다 옷을 입은 사람의 가치가 살아나야 한다"</h3>
                    <p>-COCO CHANEL-</p>
                </div>
                
                <div class="container">
                    <div class="title">
                        <h1>작년 우승자와의 만남</h1>
                        
                        <p>인터뷰</p>
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
                                    <img src="../Resources/images/차승원.jpg" class="centered" alt="client 1">
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
                                    <img src="../Resources/images/유재석.jpg" class="centered" alt="client 2">
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
                                    <img src="../Resources/images/한혜진.jpg" class="centered" alt="client 3">
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
        <script type="text/javascript" src="http://code.jquery.com/jquery-3.2.0.min.js" ></script>
		<script type="text/javascript" src="../js/video-hover.js"></script>
        <script src="../Resources/js/jquery.js"></script>
        <script src="../Resources/js/jquery.popVideo.js"></script>
        <script type="text/javascript" src="../Resources/js/jquery.mixitup.js"></script>
        <script type="text/javascript" src="../Resources/js/bootstrap.js"></script>
        <script type="text/javascript" src="../Resources/js/modernizr.custom.js"></script>
        <script type="text/javascript" src="../Resources/js/jquery.bxslider.js"></script>
        <script type="text/javascript" src="../Resources/js/jquery.cslider.js"></script>
        <script type="text/javascript" src="../Resources/js/jquery.placeholder.js"></script>
        <script type="text/javascript" src="../Resources/js/jquery.inview.js"></script>
        <script type="text/javascript" src="../Resources/js/app.js"></script>
        <script>
   			 $('#video').on('mouseenter',function() {
        $('#video').popVideo({
            playOnOpen: true,
            title: "jQueryScript.net Demo Page",
          closeOnEnd: true,
            pauseOnClose: true,
        }).open()
    });
</script>
    </body>
</html>