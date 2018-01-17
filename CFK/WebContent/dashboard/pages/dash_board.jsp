<%@page import="vo.NotifyVO"%>
<%@page import="java.util.Vector"%>
<%@page import="vo.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%  Vector<BoardVO> list=(Vector<BoardVO>)request.getAttribute("list");
	Vector<NotifyVO> notiList=(Vector<NotifyVO>)request.getAttribute("notiList");
%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>CFK 관리자 페이지</title>

    <!-- Bootstrap Core CSS -->
    <link href="/CFK/dashboard/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="/CFK/dashboard/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- DataTables CSS -->
    <link href="/CFK/dashboard/vendor/datatables-plugins/dataTables.bootstrap.css" rel="stylesheet">

    <!-- DataTables Responsive CSS -->
    <link href="/CFK/dashboard/vendor/datatables-responsive/dataTables.responsive.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="/CFK/dashboard/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="/CFK/dashboard/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
	
	<script>
		function notify_insert()
		{
			document.notify.submit();
			
		}
		
	</script>

</head>

<body>

    <div id="wrapper">

        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="Dashuser.do">CFK 관리자 페이지</a>
            </div>
            <!-- /.navbar-header -->

            <ul class="nav navbar-top-links navbar-right">

                <!-- /.dropdown -->
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="#"><i class="fa fa-user fa-fw"></i> User Profile</a>
                        </li>
                        <li><a href="#"><i class="fa fa-gear fa-fw"></i> Settings</a>
                        </li>
                        <li class="divider"></li>
                        <li><a href="index.html"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                        </li>
                    </ul>
                    <!-- /.dropdown-user -->
                </li>
                <!-- /.dropdown -->
            </ul>
            <!-- /.navbar-top-links -->

            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">


                        <li>
                            <a href="Dashuser.do"><i class="fa fa-user fa-fw"></i> 회원관리</a>
                        </li>
                        <li>
                            <a href="Dashboard.do"><i class="fa fa-table fa-fw"></i> 게시판관리</a>
                        </li>


                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>
	
	
	
        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">게시판관리</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            DataTables Advanced Tables
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                                <thead>
                                    <tr>
                                        <th>번호</th>
                                        <th>작성자</th>
                                        <th>제목</th>
                                        <th>내용</th>
                                        <th>투표수</th>
                                        <th>조회수</th>
                                        <th>작성일</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                
                                <tbody>
								<% for(BoardVO vo: list ){ %>
                                    <tr class="odd gradeX">
                                        <td><%=vo.getBoard_num() %></td>
                                        <td><%=vo.getBoard_writer() %></td>
                                        <td><%=vo.getBoard_subject() %></td>
                                        <td><%=vo.getBoard_content() %></td>
                                        <td><%=vo.getBoard_vote() %></td>
                                        <td><%=vo.getBoard_readcount() %></td>
                                        <td><%=vo.getBoard_date() %></td>
                                        <td>
                                          <button type="button" class="btn btn-danger">삭제</button>
                                        </td>
                                   
                                    </tr>
                                   <%}%>
                                </tbody>
    
                            </table>

                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">공지사항</h1>
                </div>
            <!-- /.row -->


            <div class="row">

                <!-- /.col-lg-6 -->
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                          notifications
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>번호</th>
                                            <th>내용</th>
                                            <th>작성일</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <%for(NotifyVO vo: notiList) {%>    
                                        <tr>
                                            <td><%=vo.getNotify_num() %></td>
                                            <td><%=vo.getNotify_content()%></td>
                                            <td><%=vo.getNotify_date() %></td>
                                            <td>
                                              <button type="button" class="btn btn-danger">삭제</button>
                                            </td>
                                        </tr>
                                     <%} %> 
                                        
                                    </tbody>
                                </table>
                            </div>
                            <!-- /.table-responsive -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-6 -->

            </div>
            <!-- /.row -->

            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header"></h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>


            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">공지사항 등록</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <div class="row">
                <div class="col-lg-6">
                    <div class="panel panel-default">
                    <form action="notify_insert.do" method="post" name="notify">
                        <div class="panel-heading">
							
                            <p align="right"><button type="button" class="btn btn-primary" onclick="notify_insert()">등록</button></p>

                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                          <textarea class="form-control" rows="15" name="notify_content" placeholder="내용" required></textarea>
                            <!-- /.table-responsive -->
                            
                        </div>
                   </form>
                        <!-- /.panel-body -->
                        
                 	</div>
                    <!-- /.panel -->
             	</div>
                <!-- /.col-lg-6 -->


            </div>
	
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->
	
    <!-- jQuery -->
    <script src="/CFK/dashboard/vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="/CFK/dashboard/vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="/CFK/dashboard/vendor/metisMenu/metisMenu.min.js"></script>

    <!-- DataTables JavaScript -->
    <script src="/CFK/dashboard/vendor/datatables/js/jquery.dataTables.min.js"></script>
    <script src="/CFK/dashboard/vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
    <script src="/CFK/dashboard/vendor/datatables-responsive/dataTables.responsive.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="/CFK/dashboard/dist/js/sb-admin-2.js"></script>

    <!-- Page-Level Demo Scripts - Tables - Use for reference -->
    <script>
    $(document).ready(function() {
        $('#dataTables-example').DataTable({
            responsive: true
        });
    });
    </script>

</body>

</html>
