<%@page import="java.io.PrintWriter"%>
<%@page import="board.vo.PageVO"%>
<%@page import="user.vo.UserVO"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="board.vo.BoardVO"%>
<%@page import="reply.vo.ReplyVO"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
if((UserVO)session.getAttribute("vo")==null) {
	out.println("<script>");
	out.println("alert('회입가입 후 이용할 수 있네! 어서 가입하게!');");
	out.println("history.back();");
	out.println("</script>");
	out.close();
}
	

	BoardVO vo1=(BoardVO)request.getAttribute("vo");
	UserVO vo2=(UserVO)session.getAttribute("vo");
	Vector<ReplyVO> list=(Vector<ReplyVO>)request.getAttribute("list");
	PageVO info=(PageVO)request.getAttribute("info");
	int total_page=info.getTotalPage();
	int current_page=info.getPage();
	int endPage=info.getEndPage();
	int startPage=info.getStartPage();
	int totalRows=info.getTotoalRows();
	int hap=0;
	
	
	String agent=request.getHeader("User-Agent");
	String fileName=vo1.getBoard_real_file();
	boolean ieBrowser=(agent.indexOf("Trident")>-1);
	
	if(ieBrowser) {
		fileName=URLEncoder.encode(fileName,"UTF-8").replaceAll("\\+","%20");
	}
	
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
                            <li><a href="cfk_attend.jsp">방청시청</a></li>
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
        
        
        <!-- 댓글 폼 시작 -->
     	
     		<div class="section primary-section" id="about">
            	<div class="container">
                    <ul id="" class="thumbnails row">
                    <div>
                  	<td>
                  		<div  class="single-project">
                        <div class="span6" style="margin: 15px;">
                            <video width="600" height="400" controls autoplay>
                            	<source src="/CFK/boardUpload/<%=fileName%>">
                            </video>
                        </div>
                        
                        <div class="span6">
                            <div class="project-description">
                                <div class="project-title clearfix">
                                    <h3><%=vo1.getBoard_subject() %></h3>
                                </div>
                                <div class="project-info">
                                    <div>
                                        <span>Name</span><%=vo1.getBoard_writer() %></div>
                                    <div>
                                        <span>Date</span><%=vo1.getBoard_date() %></div>
                                    <div>
                                        <span>Link</span><%=vo1.getBoard_file() %></div>
                                </div>
                                <table class='scrolltable'><tr><td><p><%=vo1.getBoard_content() %></p></td></tr></table>
                            </div>
                        </div>
                    	</div>
               			<div class="span5">
                        	<ul class="skills">
            					
                            	<li>
                                	<span class="bar" data-width="<%=vo1.getBoard_vote()%>%"></span>
                                	<h3>득표수 <%=vo1.getBoard_vote()%>%</h3>
                            	</li>
                        	</ul>
                        	<div align="center">
                        		<button class="button button-sp" onclick="location.href='qVote.do?board_num=<%=vo1.getBoard_num()%>&user_id=<%=vo2.getUser_id() %>&page=<%=current_page%>'">투표</button>
                        	</div>		
                        	
                    	</div>
                    	<div>
                    		
                    	</div>
                    </td>
                    </div>
                    </ul>                       
                    	<div align="center">
                    		<%if(vo1.getBoard_writer().equals(vo2.getUser_id())) {%>
                    		<button class="message-btn" onclick="location.href='cfk_board_pwd2.jsp?board_num=<%=vo1.getBoard_num() %>'">수정</button>
                    		<button class="message-btn" onclick="location.href='cfk_board_pwd.jsp?board_num=<%=vo1.getBoard_num() %>'">삭제</button>
                    		<button class="message-btn"  onclick="location.href='qList.do'">목록</button>
                    		<%}else{%>
                    		<button class="message-btn"  onclick="location.href='qList.do'">목록</button>
                    		<%} %>
                    	</div>
                    </div>
                  <div class="container">
               		<div class="title">
                        <h1>응원 메시지를 남겨주세요</h1>
                    <form action="cfk_reply_pwd.jsp?board_num=<%=vo1.getBoard_num() %>" method="post">
                        <p>응원댓글    
                        <input class="span9" type="text" name="reply_content" required>
                        <button class="message-btn">등록</button></p>
                    </form>
                    <h3 align="left">총 댓글 수 : <%=totalRows %> 개</h3>
                    </div>
                  </div> 
                   
                    <div style="margin-top:-80px;" class="container">
                    <%
					for(ReplyVO vo:list){
					%>
					  	<div class="container">
					  		<div class="span11">
						<%
						if(vo.getReply_re_lev()!=0){
							for(int j=0;j<=vo.getReply_re_lev()*1;j++){
								hap=30+(j*20);
							}
						%><div style="margin-top:-50px; margin-left:<%=hap%>px;" class="testimonial">
						  <p>RE : <%=vo.getReply_content() %></p>
						<% 	
						}else{ %>
						  <div style="margin-top:-30px;" class="testimonial">
                          <p><%=vo.getReply_content() %></p>
						<%	
						}
					
						%> 
						             	
                    	
                          
                                <div class="whopic">
                                    <div class="arrow"></div>
                                    <strong><%=vo.getReply_writer() %>
                                    <small><%=vo.getReply_date() %></small>
                                    </strong>
                                    <div>
                                    <a href="" class="more show_hide" rel="#slidingDiv<%=vo.getReply_num()%>">
                                        <font color="white"><span class="icon-plus">답글 쓰기</span></font>
                                    </a>
                                    <%if(vo.getReply_writer().equals(vo2.getUser_id())) {%>
                                    <a href="cfk_reply_delete.jsp?board_num=<%=vo1.getBoard_num() %>&reply_num=<%=vo.getReply_num()%>&reply_re_ref=<%=vo.getReply_re_ref()%>&reply_re_lev=<%=vo.getReply_re_lev()%>&reply_re_seq=<%=vo.getReply_re_seq()%>" >
                                        <font color="white"><span class="icon-cancel">댓글 삭제</span></font>
                                    </a>
                                    <%}%>                                    
									</div>                               
                                </div>
                                
                            </div>
                    	</div>
                    	</div>
                    	
                   		<div class="container">	
                    	<div id="slidingDiv<%=vo.getReply_num()%>" class="toggleDiv row-fluid single-project" align="right">
                    	<form action="cfk_reply_pwd2.jsp?reply_num=<%=vo.getReply_num()%>" method="post">
                        <p>답글    
                        <input class="span9" type="text" name="reply_content" required>
                        <button class="message-btn">등록</button>
                        <span class="show_hide close" style="color:red !important;">
                        <i class="icon-cancel"></i></span>
                        </p>
                        <input type="hidden" name="reply_re_ref" value="<%=vo.getReply_re_ref()%>">
						<input type="hidden" name="reply_re_lev" value="<%=vo.getReply_re_lev()%>">
						<input type="hidden" name="reply_re_seq" value="<%=vo.getReply_re_seq()%>">
						<input type="hidden" name="board_num" value="<%=vo1.getBoard_num()%>">                 
                    	</form> 
                   		</div>
                  		</div>
                    
                    <%}%>
                    </div>
                    
                    
 
                    
                    
                    
                    <div align="center">
					
					<%
					//페이지 하단 페이지 나오기
					for(int i=startPage;i<=endPage;i++){
						if(i==current_page){%>
							<font color="red">[<%=i %>]</font>
						<%	
						}else{%>
							<a href="qView.do?page=<%=i %>&board_num=<%=vo1.getBoard_num()%>"><font color="yellow"><%=i %></font></a>
						<%	
						}
					}
					%>
					</div>     
            </div> 
       
                       
        <!-- 댓글 폼 끝 --> 
         
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
