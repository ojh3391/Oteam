<%@page import="vo.ReplyVO"%>
<%@page import="vo.PageVO"%>
<%@page import="java.util.Vector"%>
<%@page import="vo.UserVO"%>
<%@page import="vo.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	BoardVO vo1=(BoardVO)request.getAttribute("vo");
	UserVO vo2=(UserVO)session.getAttribute("vo");
	Vector<ReplyVO> list=(Vector<ReplyVO>)request.getAttribute("list");
	PageVO info=(PageVO)request.getAttribute("info");
	
	//댓글 페이지 정보
	int total_page=info.getTotalPage();
	int current_page=info.getPage();
	int endPage=info.getEndPage();
	int startPage=info.getStartPage();
	int totalRows=info.getTotoalRows();
	int hap=0;
	
	/* //익스 한글 깨짐 처리
	String agent=request.getHeader("User-Agent");
	String fileName=vo1.getBoard_real_file();
	String user_id=vo2.getUser_id();
	
	boolean ieBrowser=(agent.indexOf("Trident")>-1);
	if(ieBrowser) {
		fileName=URLEncoder.encode(fileName,"UTF-8").replaceAll("\\+","%20");
		user_id=URLEncoder.encode(user_id,"UTF-8").replaceAll("\\+", "%20");
	} */
%>    
<!DOCTYPE html>
<html>
<head>
</head>
<body>
<div class="section primary-section" id="about">
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
                                	<font color="white"><span class="icon-plus">댓글 쓰기</span></font>
                                	</a>
                                	<%if(vo.getReply_writer().equals(vo2.getUser_id())) {%>
                                    	<a href="/CFK/reply/reply_delete.jsp?board_num=<%=vo1.getBoard_num() %>&reply_num=<%=vo.getReply_num()%>&reply_re_ref=<%=vo.getReply_re_ref()%>&reply_re_lev=<%=vo.getReply_re_lev()%>&reply_re_seq=<%=vo.getReply_re_seq()%>" >
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
                    			<form action="/CFK/reply/reply_re_pwd.jsp?reply_num=<%=vo.getReply_num()%>" method="post">
                    			<input type="hidden" name="reply_re_ref" value="<%=vo.getReply_re_ref()%>">
								<input type="hidden" name="reply_re_lev" value="<%=vo.getReply_re_lev()%>">
								<input type="hidden" name="reply_re_seq" value="<%=vo.getReply_re_seq()%>">
								<input type="hidden" name="board_num" value="<%=vo1.getBoard_num()%>">     
                        		<p>답글    
                        		<input class="span9" type="text" name="reply_content" required>
                        		<button class="message-btn">등록</button>
                        		<span class="show_hide close" style="color:red !important;">
                        		<i class="icon-cancel"></i></span>
                        		</p>         
                    			</form> 
                   			</div>
                  		</div>      
                    <%}%>
				</div>
			</div>
</div>

        
        <!-- <!-- Include javascript -->
        <script type="text/javascript" src="http://code.jquery.com/jquery-3.2.0.min.js" ></script>
		<script type="text/javascript" src="/CFK/Resources/js/video-hover.js"></script>
        <script src="/CFK/Resources/js/jquery.js"></script>
        <script src="/CFK/Resources/js/jquery.popVideo.js"></script>
        <script type="text/javascript" src="/CFK/Resources/js/jquery.mixitup.js"></script>
        <script type="text/javascript" src="/CFK/Resources/js/bootstrap.js"></script>
        <script type="text/javascript" src="/CFK/Resources/js/modernizr.custom.js"></script>
        <script type="text/javascript" src="/CFK/Resources/js/jquery.bxslider.js"></script>
        <script type="text/javascript" src="/CFK/Resources/js/jquery.cslider.js"></script>
        <script type="text/javascript" src="/CFK/Resources/js/jquery.placeholder.js"></script>
        <script type="text/javascript" src="/CFK/Resources/js/jquery.inview.js"></script>
        <script type="text/javascript" src="/CFK/Resources/js/app.js"></script> -->
        
		
    </body>
</html>