<%@page import="vo.PageVO"%>
<%@page import="vo.BoardVO"%>
<%@page import="java.util.Vector"%>
<%@page import="vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	//rank 정보 가져오기
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
    </head>
    <body>
    	<jsp:include page="../board_top.jsp"></jsp:include>
        <div class="section primary-section" id="service">
		<div class="container">
        	<!-- Start title section -->
            <div class="title">
            	<h1>Join Us!</h1>
                    <p>회원가입 하시면 많은 혜택을 누리실 수 있습니다.</p>
            </div>
            <div class="row-fluid">
            	<div class="span4">
                    <div class="centered service">
                        <div class="circle-border zoom-in">
                            <img class="img-circle" src="/CFK/images/background/Service1.png">
                        </div>
                        <h3>투표하세요!</h3>
                        <p>Please Vote for our sensual and fashionable fashion leader.</p>
                    </div>
                </div>
                <div class="span4">
                    <div class="centered service">
	                    <div class="circle-border zoom-in">
                        	<img class="img-circle" src="/CFK/images/background/Service2.png">
                        </div>
                        <h3>참가하세요!</h3>
                            <p>We Create Modern And Fantastic Fashion For Your Future.</p>
                    </div>
                </div>
                
                <!-- 로그인 체크 -->
                <%
					UserVO vo=(UserVO)session.getAttribute("vo");
                    		
					if(vo==null){ 
				%>
    			<div class="span4">
            		<h3>로그인</h3>
                	<form action="login.do" method="post">
                		<div class="control-group">
                    		<div class="controls">
                       			<input class="span12" type="text" name="user_id" placeholder="* 당신의 아이디...">	 
                       		</div>
                   		</div>
                		<div class="control-group">
                			<div class="controls">
                   		 		<input class="span12" type="password" name="user_passwd" placeholder="* 당신의 비밀번호...">
                			</div>
               		 	</div>     
                   		 <button class="message-btn" type="submit">로그인</button>
                   		 <button class="message-btn" type="button" onclick="location.href='/CFK/user/user_insert.jsp'">회원 가입</button>
                   	</form>
                </div>
        
        		<%
					}else{ 
				%> 
				<div class="span4">
					<img src="/CFK/images/background/logo.png" width="120" height="40" alt="Logo" />
            		<h3><font color="red">▶로그인 되셨습니다◀</font></h3>
                   		<div class="control-group">
                   			<div class="controls">
                       			<h3>웰컴이다. <font color="white"><%=vo.getUser_name()%></font> (이)여~.</h3>
                       			<h3>패션의 메카에 온걸 환영한다.</h3>
                       		 </div>
                		</div>
               		<div class="control-group">
                		<div class="controls">
                   		 	<button class="message-btn" onclick="location.href='/CFK/user/user_page_pwd.jsp'">MY PAGE</button>
                   		 	<button class="message-btn" onclick="location.href='logout.do'">로그 아웃</button>
                   		</div>
               		</div>
                </div>
          		<%} %>  
        	</div>  		 	     
        </div>
        </div>
        
        <!-- Portfolio section start -->
        <div class="section secondary-section " id="portfolio">
        	<div class="triangle"></div>
            <div class="container">
                <div class="title">
                    <h1><font size="10" face="휴먼둥근헤드라인">2018년! 전 세계를 뒤흔들 <font size="11" color="red">패션</font>전쟁이 시작된다!</font></h1>
                    <div id="ViewTimer"></div>
                    
                    <p></p>                    
                    <img src="/CFK/Resources/images/순위1.PNG" class="centered" alt="rank">
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
                                <h3>득표수=<%=bo.getBoard_vote() %></h3>
                                <p>ID : <%=bo.getBoard_writer() %></p>
                                <div class="mask">
                                <h2>&nbsp;</h2>
                                <a href="HitUpdate.do?board_num=<%=bo.getBoard_num()%>&page=<%=current_page%>">
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
                                <h3>득표수=<%=bo1.getBoard_vote() %></h3>
                                <p>ID : <%=bo1.getBoard_writer() %></p>
                                <div class="mask">
                                <h2>&nbsp;</h2>
                                <a href="HitUpdate.do?board_num=<%=bo1.getBoard_num()%>&page=<%=current_page%>">
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
                                <h3>득표수=<%=bo2.getBoard_vote() %></h3>
                                <p>ID : <%=bo2.getBoard_writer() %></p>
                                <div class="mask">
                                <h2>&nbsp;</h2>
                                <a href="HitUpdate.do?board_num=<%=bo2.getBoard_num()%>&page=<%=current_page%>">
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
                                <h3>득표수=<%=bo3.getBoard_vote() %></h3>
                                <p>ID : <%=bo3.getBoard_writer() %></p>
                                <div class="mask">
                                <h2>&nbsp;</h2>
                                <a href="HitUpdate.do?board_num=<%=bo3.getBoard_num()%>&page=<%=current_page%>">
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
                                <h3>득표수=<%=bo4.getBoard_vote() %></h3>
                                <p>ID : <%=bo4.getBoard_writer() %></p>
                                <div class="mask">
                                <h2>&nbsp;</h2>
                                <a href="HitUpdate.do?board_num=<%=bo4.getBoard_num()%>&page=<%=current_page%>">
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
                                <h3>득표수=<%=bo5.getBoard_vote() %></h3>
                                <p>ID : <%=bo5.getBoard_writer() %></p>
                                <div class="mask">
                                <h2>&nbsp;</h2>
                                <a href="HitUpdate.do?board_num=<%=bo5.getBoard_num()%>&page=<%=current_page%>">
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
                                <h3>득표수=<%=bo6.getBoard_vote() %></h3>
                                <p>ID : <%=bo6.getBoard_writer() %></p>
                                <div class="mask">
                                <h2>&nbsp;</h2>
                                <a href="HitUpdate.do?board_num=<%=bo6.getBoard_num()%>&page=<%=current_page%>">
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
                                <h3>득표수=<%=bo7.getBoard_vote() %></h3>
                                <p>ID : <%=bo7.getBoard_writer() %></p>
                                <div class="mask">
                                <h2>&nbsp;</h2>
                                <a href="HitUpdate.do?board_num=<%=bo7.getBoard_num()%>&page=<%=current_page%>">
                              	<h2><i class="icon-plus"></i></h2></a>
                                </div>
                            </div>
                    	</li>
                	<%} %>	                         
                    </ul>  
             </div>
        </div>

        <!-- Contact section start -->
        <div id="contact" class="contact">
            <div class="section primary-section">
            <div class="triangle"></div>
                <div class="container">
                    <div class="title">
                        <h1>THE FIRST SHOW</h1><br>
                        <font size="10" color="white" face="휴먼둥근헤드라인">2018년 1월 19일 금요일 저녁 8시<br><br>지상 최강의<font size="11" color="red">패션쇼</font>가 열린다!</font>
                        <p>가즈아~ 패션의 메카로~ !</p>
                    </div>
                </div>
                <div class="container">
                	<div class="map-wrapper">
                		<div style="width:50%;float:left;"><img src="/CFK/images/background/show.PNG" width="500" alt="show">
                	   		<video id="video" poster="/CFK/images/min.jpg" webkit-playsline playsline data-video="/CFK/boardUpload/min.mp4" style="margin-top:50px;" width="500" height="300" loop preload>
                            	<source src="/CFK/boardUpload/min.mp4" >
                        	</video>
                        </div> 
                    	<div style="width:50%;float:left;">
                    	<iframe src="map.html" frameborder="0" width="585px" height="604px" id="" title="방청권 신청 프레임"></iframe>
                    	</div>
                    	
                	</div>    
                </div>
                <div class="container">
                    <div class="span9 center contact-info">
                        <p>123 Fifth Avenue, 노원</p>
                        <p class="info-mail"><font color="white">CFK@OJIMA.com</font></p>
                        <p>+11 234 567 890</p>
                        <p>+11 286 543 850</p>
                    </div>
                </div>
            </div>
        </div>
        
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
                            <img src="/CFK/images/clients/ClientLogo07.png" alt="client logo 1">                           
                        </li>
                        <li>                            
                            <img src="/CFK/images/clients/ClientLogo01.png" alt="client logo 2">                            
                        </li>
                        <li>                            
                            <img src="/CFK/images/clients/ClientLogo02.png" alt="client logo 3">                            
                        </li>
                        <li>                            
                            <img src="/CFK/images/clients/ClientLogo03.png" alt="client logo 4">                            
                        </li>
                        <li>                            
                            <img src="/CFK/images/clients/ClientLogo04.png" alt="client logo 5">                            
                        </li>
                        <li>                            
                            <img src="/CFK/images/clients/ClientLogo05.png" alt="client logo 6">                          
                        </li>
                        <li>                            
                            <img src="/CFK/images/clients/ClientLogo06.png" alt="client logo 7">                            
                        </li>
                    </ul>
                </div>
            </div>
        </div>
		<jsp:include page="../board_bottom.jsp"></jsp:include>
    </body>
</html>