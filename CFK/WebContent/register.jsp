<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
    		//중복체크 버튼
	    	function checkId() {
		    	//한글 아이디 받아오기위해 url에서도 인코딩
		    	url = "checkID.jsp?user_id="+encodeURIComponent(document.userInfo.user_id.value);
		    	//open(주소, 이름, 설정)
		    	open(url, "check", "menubar=no, top=400,left=800,width=300,height=100");
		    	
		    	return true;
	    	}
	    	 
	    	//비어있는 값이 있는지 체크
	    	function checkValue() {
		    	var form = document.userInfo;
		    	if(!form.user_id.value) {
		    		alert("아이디를 입력하세요.");
		    		return false;
		    	} else if(form.idReduplication.value !="check_id"){ 	//아이디 중복체크 여부를 받아와서 처리
		    		alert("아이디 중복체크를 해주세요.");
		    		return false;
		    	} else if(!form.user_passwd.value) {
			    	alert("비밀번호를 입력하세요.");
			    	return false;
	    		} else if(!form.user_name.value) {
			    	alert("이름을 입력하세요.");
			    	return false;
	    		} else if(!form.user_addr.value) {
			    	alert("주소를 입력하세요.");
			    	return false;
	    		} else if(!form.user_tel.value) {
			    	alert("전화번호를 입력하세요.");
			    	return false;
	    		} else if(!form.user_age.value) {
			    	alert("나이를 입력하세요.");
			    	return false;
	    		} else if(!form.user_email.value) {
			    	alert("이메일을 입력하세요.");
			    	return false;
	    		} else if(isNaN(form.user_age.value)){
				    alert("나이는 숫자만 입력가능합니다.");
				    return false;
		    	} else {
		    		form.submit();
		    	}
			}

	    	//중복체크 후 아이디를 새로 입력하는 걸 방지
	    	function CheckInputId() {
	    		document.userInfo.idReduplication.value="uncheck_id";
	    	}
    	</script>
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
                            <li><a href="cfk_attend.jsp">방청신청</a></li>
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
        	<h1>회원가입</h1>
            	<!-- Section's title goes here -->
                <p>회원가입 하시면 많은 혜택을 누리실 수 있습니다.</p>
                <!--Simple description for section goes here. -->
        </div>
        <form action="insert.do" method="post" name="userInfo">
			<table align="center">
				<tr>
					<td><p><font color="black">아이디</font></p></td>
					<td>
						<!-- 중복체크 후 아이디 다시 입력 방지를 위해 user_id는 onkeydown, idReduplication은 hidden으로  -->
						<input type="text" name="user_id" size="10" maxlength="12" onkeydown="CheckInputId()">
					<input type="button" value="중복확인" onClick="checkId(); "/>
					<input type="hidden" name="idReduplication" value="uncheck_id" >
					</td>
				</tr>
				<tr>
					<td><p><font color="black">비밀번호</font></p></td>
					<td><input class="span5" type="password" name="user_passwd" maxlength="12"></td>
				</tr>
				<tr>
					<td><p><font color="black">이름</font></p></td>
					<td><input class="span5" type="text" name="user_name" maxlength="12"></td>
				</tr>
				<tr>
					<td><p><font color="black">지역</font></p></td>
					<td><select name="user_area" class="span5">
						<option >서울.경기</option>
						<option >강원도</option>
						<option >충청권</option>
						<option >호남.제주</option>
						<option >영남권</option>			
						</select>
					</td>
				</tr>
				<tr>
					<td><p><font color="black">주소</font></p></td>
					<td><input class="span5" type="text" name="user_addr" maxlength="12"></td>
				</tr>
				<tr>
					<td><p><font color="black">전화번호</font></p></td>
					<td><input class="span5" type="text" name="user_tel" maxlength="30"></td>
				</tr>
				<tr>
					<td><p><font color="black">나이</font></p></td>
					<td><input class="span5" type="text" name="user_age" maxlength="3"></td>
				</tr>
				<tr>
					<td><p><font color="black">이메일</font></p></td>
					<td><input class="span5" type="email" name="user_email" maxlength="30"></td>
				</tr>
				<tr>
					<td><p><font color="black">성별</font></p></td>
					<td align="center">
						<input type="radio" name="user_gender" value="남"><font color="black">남</font>
						<input type="radio" name="user_gender" value="여"><font color="black">여</font>
					</td>
				</tr>
				<tr>
					<td align="center" colspan="2" class="btn_align">
						<input class="message-btn" type="button" value="가입하기" onclick="checkValue();">
						<input class="message-btn" type="reset" value="새로입력">
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