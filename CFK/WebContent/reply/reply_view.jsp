<%@page import="java.io.PrintWriter"%>
<%@page import="vo.PageVO"%>
<%@page import="vo.UserVO"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="vo.BoardVO"%>
<%@page import="vo.ReplyVO"%>
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
	
	//댓글 페이지 정보
	int total_page=info.getTotalPage();
	int current_page=info.getPage();
	int endPage=info.getEndPage();
	int startPage=info.getStartPage();
	int totalRows=info.getTotoalRows();
	int hap=0;
	
	//익스 한글 깨짐 처리
	String agent=request.getHeader("User-Agent");
	String fileName=vo1.getBoard_real_file();
	String user_id=vo2.getUser_id();
	
	boolean ieBrowser=(agent.indexOf("Trident")>-1);
	if(ieBrowser) {
		fileName=URLEncoder.encode(fileName,"UTF-8").replaceAll("\\+","%20");
		user_id=URLEncoder.encode(user_id,"UTF-8").replaceAll("\\+", "%20");
	}
%>
<!DOCTYPE html>
<html>
	<head>
    </head>
    <body>
    	<jsp:include page="../board_top.jsp"></jsp:include>
        
        <!-- 댓글 폼 시작 -->
     	<div class="section primary-section" id="about">
           	<div class="container">
            	<ul class="thumbnails row">
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
                       		<form action="Vote.do" method="post">
                       		<input type="hidden" name="user_id" value="<%=vo2.getUser_id() %>">	
                       		<input type="hidden" name="board_num" value="<%=vo1.getBoard_num() %>">	
                       		<input type="hidden" name="page" value="<%=current_page %>">
                       			<div align="center">
                       				<button class="button button-sp" >투표</button>
                       			</div>		
                       		</form>
                    	</div>
                	</td>
				</div>
			</ul>                       
            <div align="center">
            	<%if(vo1.getBoard_writer().equals(vo2.getUser_id())) {%>
             		<button class="message-btn" onclick="location.href='/CFK/board/board_change_pwd.jsp?board_num=<%=vo1.getBoard_num() %>'">수정</button>
               		<button class="message-btn" onclick="location.href='/CFK/board/board_delete_pwd.jsp?board_num=<%=vo1.getBoard_num() %>'">삭제</button>
              		<button class="message-btn"  onclick="location.href='List.do'">목록</button>
            	<%}else{%>
               		<button class="message-btn"  onclick="location.href='List.do'">목록</button>
            	<%} %>
            </div>
		</div>
        <div class="container">
        	<div class="title">
            	<h1>응원 메시지를 남겨주세요</h1>
                <form action="/CFK/reply/reply_pwd.jsp?board_num=<%=vo1.getBoard_num() %>" method="post">
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
                                	<font color="white"><span>댓글 쓰기</span></font>
                                	</a>
                                	<%if(vo.getReply_writer().equals(vo2.getUser_id())) {%>
                                		<a href="" class="more show_hide" rel="#sliding<%=vo.getReply_num()%>" >
                                        	<font color="white"><span class="icon-plus">댓글 수정</span></font>
                                    	</a>
                                    	<a href="/CFK/reply/reply_delete.jsp?board_num=<%=vo1.getBoard_num() %>&reply_num=<%=vo.getReply_num()%>&reply_re_ref=<%=vo.getReply_re_ref()%>&reply_re_lev=<%=vo.getReply_re_lev()%>&reply_re_seq=<%=vo.getReply_re_seq()%>" >
                                        	<font color="white"><span class="icon-cancel">댓글 삭제</span></font>
                                    	</a>
                                	<%}%>                                    
								</div>                               
                        	</div>
                                
                          </div>
                       </div>
               		</div>
                    	<!-- 댓글 등록 폼 -->
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
                  		<!-- 댓글 수정 폼 -->
                  		<div class="container">	
                    		<div id="sliding<%=vo.getReply_num()%>" class="toggleDiv row-fluid single-project" align="right">
                    			<form action="/CFK/reply/reply_update_pwd.jsp?reply_num=<%=vo.getReply_num()%>" method="post">
                    			<input type="hidden" name="board_num" value="<%=vo1.getBoard_num()%>">      
                        		<p>답글    
                        		<input class="span9" type="text" value="<%=vo.getReply_content() %>" name="reply_content" required>
                        		<button class="message-btn">수정</button>
                        		<span class="show_hide close" style="color:red !important;">
                        		<i class="icon-cancel"></i></span>
                        		</p>         
                    			</form> 
                   			</div>
                  		</div>            
                    <%}%>
				</div>
                <div align="center">					
					<%
					//페이지 하단 페이지 나오기
					for(int i=startPage;i<=endPage;i++){
						if(i==current_page){
						%>
							<font color="red">[<%=i %>]</font>
						<%}else{%>	
							<a href="View.do?page=<%=i %>&board_num=<%=vo1.getBoard_num()%>"><font color="yellow"><%=i %></font></a>
							
						<%}
					}
					%>
				</div>
			</div> 
			     
        </div>
 		<jsp:include page="../board_bottom.jsp"></jsp:include>
    </body>
</html>