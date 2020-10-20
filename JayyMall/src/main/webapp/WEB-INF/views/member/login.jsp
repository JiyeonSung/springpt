<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<!-- Offcanvas Menu Begin -->
<%@ include file="/WEB-INF/views/common/offcanvas.jsp" %>
<!-- Offcanvas Menu End -->

<!-- Header Section Begin -->
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<!-- Header Section End -->

<head>

<title>JayyMall | Template - MEMBER LOGIN</title>
<script type="text/javascript" src="/resources/js/member/login.js"></script>
<script>
	if("${msg}"=="LOGIN_FAIL"){	
		alert("로그인에 실패하였습니다.\n아이디와 비밀번호를 다시 확인해주세요.");
	}
</script>


    <meta charset="UTF-8">
    <meta name="description" content="Male_Fashion Template">
    <meta name="keywords" content="Male_Fashion, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>JayyMall | Template</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;600;700;800;900&display=swap"
    rel="stylesheet">

    <!-- Css Styles -->
    <%@ include file="/WEB-INF/views/common/bootcss.jsp" %>
    
</head>

<body>
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

    <!-- Login Section Begin -->
    <!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				
				<ol class="breadcrumb">
					<li><a href="/"><i class="fa fa-dashboard"></i>Main</a></li>
					<li>Login</li>
				</ol>
			</section>

			<%-- Main content 로그인 UI --%>
			<section class="content container-fluid">
				<div class="container" style="width: 450px; height:620px; background-color: white; margin-top:30px;">
					<form id="loginForm" class="form-signin" action="/member/loginPost" method="post" style="padding:50px 30px;">
						<h2 class="form-signin-heading">Please sign in</h2>
						<br><br>
						<label for="inputId" class="sr-only">Id</label> 
						<input type="text" id="mem_id" name="mem_id" class="form-control" style="margin-bottom: 15px"
							placeholder="Id" required autofocus> 
						<label for="inputPassword" class="sr-only">Password</label> 
						<input type="password" id="mem_pw" name="mem_pw" class="form-control"
							placeholder="Password" required>
						<br><br>
						<div class="checkbox">
							<label> <input type="checkbox" name="useCookie" />
								Remember me
							</label>
						</div>
						<button id="btn_login" class="site-btn" type="submit"  >
							Sign in
						</button>
					</form>
				</div>
			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->
    <!-- Login Section End -->

    <!-- Footer Section Begin -->
    <%@ include file="/WEB-INF/views/common/footer.jsp" %>
    <!-- Footer Section End -->

    <!-- Search Begin -->
    <%@ include file="/WEB-INF/views/common/search.jsp" %>
    <!-- Search End -->

<!-- Js Plugins -->
<script src="/resources/js/js/jquery-3.3.1.min.js"></script>
<script src="/resources/js/js/bootstrap.min.js"></script>
<script src="/resources/js/js/jquery.nice-select.min.js"></script>
<script src="/resources/js/js/jquery.nicescroll.min.js"></script>
<script src="/resources/js/js/jquery.magnific-popup.min.js"></script>
<script src="/resources/js/js/jquery.countdown.min.js"></script>
<script src="/resources/js/js/jquery.slicknav.js"></script>
<script src="/resources/js/js/mixitup.min.js"></script>
<script src="/resources/js/js/owl.carousel.min.js"></script>
<script src="/resources/js/js/main.js"></script>

</body>

</html>