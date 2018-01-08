<%@page import="board.vo.PageVO"%>
<%@page import="board.vo.BoardVO"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	
	Vector<BoardVO> list=(Vector<BoardVO>)request.getAttribute("list");
	//페이지나누기를 위한 정보
	PageVO info=(PageVO)request.getAttribute("info");
	int total_page=info.getTotalPage();
	int current_page=info.getPage();
	int endPage=info.getEndPage();
	int startPage=info.getStartPage();
	int totalRows=info.getTotoalRows();
%> 
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
        <!-- Newsletter section start -->
        <div class="section third-section">
            <div class="container newsletter">
                <div class="sub-section">
                    <div class="title clearfix">
                        <div class="pull-left">
                            <h3>공지 사항</h3>
                        </div>
                    </div>
                </div>
                <div class="row-fluid">
                    <div class="span12">
                        <p>가라가라 갇혀 확갇혀 내안에 갇혀 확갇혀 가라가라 갇혀 확갇혀 사랑안에 갇혀 확갇혀 소리없이 보내리~라 말이없이 보내리~라 그리워지리라 니~가 소리없이 보내리~라 말이없이 보내리~라 그리워지리라 니~가 악해지지마 헤어져도 우린 이대로 갈 수 없어 커져가는 응어리를 버려야해 떠나가려 해~</p>
                    </div>
                </div>
            </div>
        </div>
        <!-- Newsletter section end -->
        <div class="section secondary-section" id="portfolio">
            <div class="container">
           
                <div class="title">
         
                    <h1><font size="10" face="휴먼둥근헤드라인">전쟁이 시작된다! 투표하시라!</font></h1>
                    <p>매주 금요일 저녁 7시!!</p>
                </div>
                <ul class="nav nav-pills">
                
                <%
			
				//페이지 상단 페이지 나오기
				for(int i=startPage;i<=endPage;i++){
					if(i==current_page){
					%><li class="filter">
                        <a href="qList.do?page=<%=i %>"><%=i %></a>
                    </li><%
					
				}else{
					%><li class="filter">
                        <a href="qList.do?page=<%=i %>"><%=i %></a>
                    </li><%
				}
				}
			
			
				%>    
                </ul>
                <ul id="portfolio-grid" class="thumbnails row">
<%
		//글번호 다시매기기
		
		for(BoardVO vo:list){
%>                	
                 
                     <li class="span12 mix web">
                         <div class="thumbnail">
                              <img src="/CFK/boardUpload/thumb/<%=vo.getBoard_thumbnail() %>">
                              <h3><%=vo.getBoard_readcount()%></h3>
                              <p><%=vo.getBoard_date()%></p>
                              <div class="mask">
                              <h2><%=vo.getBoard_writer()%></h2>
                              <a href="qHitUpdate.do?board_num=<%=vo.getBoard_num()%>&page=<%=current_page%>">
                              <h2><i class="icon-plus"></i></h2></a>
                              </div>
                        </div>
                      </li>
                   
                   <%		}%>
                   </ul>
            	</div>
            </div>
        
        <!-- Portfolio section end -->
        
        
        
        
        
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

</body>
</html>