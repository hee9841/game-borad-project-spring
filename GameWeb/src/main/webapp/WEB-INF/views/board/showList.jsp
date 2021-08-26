<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page isELIgnored="false" %>
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
<style>
	#heading {
		margin:0px;
	}
</style>

<body id="page-top">

	<c:if test="${success > 0}">
		<script type="text/javascript">
			alert('정상적으로 삭제되었습니다 :)');
		</script>
	</c:if>

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

                    <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800"> 잡담방 </h1>
                    </div>

                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                        	<div class="container" id="heading">
                        		<div class="row">
                        			<div class="col-10"><h6 class="m-0 font-weight-bold text-primary"> 게시판 </h6></div>
                        			<div class="col-2"><a class="btn btn-primary btn-sm" href="/board/createBoard.do" role="button">글쓰기</a></div>
                        		</div>
                        	</div>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-hover" width="100%" cellspacing="0">
                                    <thead>
                                        <tr class="text-center">
                                            <th> 번호 </th>
                                            <th> 제목 </th>
                                            <th> 작성자 </th>
                                            <th> 작성시간 </th>
                                            <th> 조회수 </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    	<c:forEach items="${list}" var="boardVO">                                    		
                                    		<tr onClick="location.href='/board/readBoard.do${pageMaker.makeQuery(pageMaker.cri.page)}&board_num=${boardVO.board_num}'" 
                                    				onMouseOver = "window.status='/board/readBoard.do${pageMaker.makeQuery(pageMaker.cri.page)}&board_num=${boardVO.board_num}'" 
                                    				onMouseOut = "window.status=''"
                                    				style="cursor:pointer;">
	                                            <td class="text-center"> ${boardVO.board_num} </td>
	                                            <td> ${boardVO.title} </td>
	                                            <td class="text-center"> ${boardVO.user_name} </td>
	                                            <td class="text-center"> ${boardVO.board_time} </td>
	                                            <td class="text-center"> ${boardVO.views} </td>
	                                        </tr>
                                    	</c:forEach>
                                    </tbody>
                                </table>
                            </div>
                            <nav aria-label="Page navigation example">
                            	<ul class="pagination justify-content-center">                            	
	                            	<c:choose>
	                            		<c:when test="${pageMaker.prev}">
											<li class="page-item">
										    	<a class="page-link" href="/board/showList.do?page=${pageMaker.startPage-1}" tabindex="-1"> &laquo; </a>
										    </li>
	                            		</c:when>
	                            		<c:otherwise>
	                            			<li class="page-item disabled">
										    	<a class="page-link" href="#" tabindex="-1"> &laquo; </a>
										    </li>
	                            		</c:otherwise>
	                            	</c:choose>
	                            	
	                            	<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
	                            		<c:choose>
	                            			<c:when test="${pageMaker.cri.page == idx}">
												<li class="page-item active">
	                            			</c:when>
	                            			<c:otherwise>
	                            				<li class="page-item">
	                            			</c:otherwise>
	                            		</c:choose>
			                            			<a class="page-link" href="/board/showList.do?page=${idx}"> ${idx} </a>
												</li>
	                           		</c:forEach>
	                           		
	                           		<c:choose>
	                            		<c:when test="${pageMaker.next && pageMaker.endPage > 0}">
											<li class="page-item">
										    	<a class="page-link" href="/board/showList.do?page=${pageMaker.endPage + 1}" tabindex="-1"> &raquo; </a>
										    </li>
	                            		</c:when>
	                            		<c:otherwise>
	                            			<li class="page-item disabled">
										    	<a class="page-link" href="#" tabindex="-1"> &raquo; </a>
										    </li>
	                            		</c:otherwise>
	                            	</c:choose>
                           		</ul>
							</nav>
						</div>
                    </div>
                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

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

</body>
</html>