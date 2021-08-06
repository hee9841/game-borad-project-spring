<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title> GAME WEB </title>

    <!-- Custom fonts for this template -->
    <link href="../../resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="../../resources/css/sb-admin-2.min.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="../../resources/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
    
    <script src="https://code.jquery.com/jquery-1.12.4.min.js" type="text/javascript"></script>
</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <jsp:include page="/WEB-INF/views/include/sideBar.jsp"/>	<!-- SideBar include -->
        
        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

               	<jsp:include page="/WEB-INF/views/include/topBar.jsp"/> 	<!-- TopBar include -->
               	
                <!-- Begin Page Content -->
                <div class="container-fluid">
					<div class="container">

			        <div class="card o-hidden border-0 shadow-lg my-5">
			            <div class="card-body p-0">
			                <div class="row">
			                    <div class="col-lg-12">
			                        <div class="p-5">
			                            <table class="table table-striped" width="100%" cellspacing="0">
			                            	<thead>
			                            		<tr class="text-center">
		                                            <th class="table-primary"> 제목 </th>
		                                            <td colspan="3"> ${board.title} </td>
		                                        </tr>
	                                    		<tr class="text-center">
		                                            <th class="table-primary"> 작성자 </th>
		                                            <td colspan="3"> ${board.user_name} </td>
		                                        </tr>
		                                        <tr class="text-center">
		                                            <th class="table-primary"> 작성시간 </th>
		                                            <td> ${board.board_time} </td>
		                                            <th class="table-primary"> 조회수 </th>
		                                            <td> ${board.views} </td>
		                                        </tr>
		                                        <tr class="text-center">
		                                        	<th colspan="4" class="table-primary"> 내용 </th>
		                                        </tr>
			                            	</thead>
		                                    <tbody>
			                                    <td colspan="4"> ${board.content} </td>
		                                    </tbody>
		                                </table>
		                                
		                                <div class="text-right">
		                                    <c:if test="${sessionScope.userInfo.user_id == board.user_id}">
		                                    	<!-- 삭제 버튼 -->
				                                <a href="/board/deleteBoard.do?board_num=${board.board_num}" class="btn btn-danger btn-circle">
			                                        <i class="fas fa-trash"></i>
			                                    </a>
								            	<!-- 수정 버튼 -->
				                                <a href="#" class="btn btn-warning btn-circle">
			                                        <i class="fas fa-edit"></i>
			                                    </a>
								            </c:if>
								            <!-- 목록 버튼 -->
			                                <a href="/board/showList.do?page=${page}" class="btn btn-primary btn-circle">
		                                        <i class="fas fa-list"></i>
		                                    </a>
		                                </div>
			                        </div>
			                    </div>
			                </div>
			            </div>
			        </div>
			    </div>

            <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; GAME WEB 2021</span>
                    </div>
                </div>
            </footer>
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Bootstrap core JavaScript-->
    <script src="../../resources/vendor/jquery/jquery.min.js"></script>
    <script src="../../resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="../../resources/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="../../resources/js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="../../resources/vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="../../resources/vendor/datatables/dataTables.bootstrap4.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="../../resources/js/demo/datatables-demo.js"></script>

</body>
</html>