<%@page import="vo.UserVO"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

Vector<UserVO> list=(Vector<UserVO>)request.getAttribute("list");

%>
<!DOCTYPE html>
<html>

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

    <!-- -->
    <link rel="stylesheet" href="/CFK/dashboard/css/style.css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

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
                        <li><a href="Rank.do"><i class="fa fa-user fa-fw"></i> HomePage</a>
                        </li>
                        
                        <li class="divider"></li>
                        <li><a href="logout.do"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
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
                    <h1 class="page-header">회원관리</h1>
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
                                        <th>ID</th>
                                        <th>이름</th>
                                        <th>주소</th>
                                        <th>전화번호</th>
                                        <th>나이</th>
                                        <th>Email</th>
                                        <th>성별</th>
                                        <th>방청일</th>
                                        <th>메일전송</th>
                                        <th>회원삭제</th>                                       
                                    </tr>
                                </thead>
                                
                                <tbody>
								<%
									for(UserVO vo:list){
								%>
                                    
                                    <tr class="odd gradeX">

                                        <td><%=vo.getUser_id() %></td>
                                        <td><%=vo.getUser_name() %></td>
                                        <td><%=vo.getUser_addr() %></td>
                                        <td><%=vo.getUser_tel() %></td>
                                        <td><%=vo.getUser_age() %></td>
                                        <td><%=vo.getUser_email() %></td>
                                        <td><%=vo.getUser_gender() %></td>
                                        <%if(!(vo.getUser_attend_date()==null)){ %>
                                        <td><%=vo.getUser_attend_date() %></td>
                                        <%}else{ %>
                                        <td>신청 내역 없음</td>
                                        <%} %>                                    
                                   		<%
                                   		if(vo.getUser_id().equals("admin")) {
                                   		%>
                                   		<td width="90" align="center">
                                   			<form action="dash_mail.do" method="post">
                                   			 <input type="hidden" name="user_id" value="<%=vo.getUser_id()%>">                                            	                    
                                             <input type="submit" class="btn btn-info" value="메일">
                                   			</form>
                                   		</td>
                                   		<td>
                                   		</td>	
                                   		<%
                                   		}else{
                                   		%>
                                   		<td width="90" align="center">
                                   			<form action="dash_mail.do" method="post">
                                   			 <input type="hidden" name="user_id" value="<%=vo.getUser_id()%>">                                            	                    
                                             <input type="submit" class="btn btn-info" value="메일">
                                   			</form>
                                   		</td>
                                   			
                                        <td width="90" align="center">
                                          
                                          <form action="Leave.do" method="post">
                                          <input type="hidden" name="user_id" value="<%=vo.getUser_id()%>">  
                                          <input type="hidden" name="user_passwd" value="<%=vo.getUser_passwd()%>">                    
                                          <input type="submit" class="btn btn-danger" value="삭제">
                                          </form>                                        
                                        </td>
                                        <%
                                   		}
                                        %>                                          
                                   </tr>                                   	
                                 <% } %>
                                        	
                                </tbody>                      
                            </table>

                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->

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
