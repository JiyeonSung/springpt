<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Male_Fashion Template">
    <meta name="keywords" content="Male_Fashion, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Male-Fashion | Template</title>

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

    <!-- Offcanvas Menu Begin -->
    <%@ include file="/WEB-INF/views/common/offcanvas.jsp" %>
    <!-- Offcanvas Menu End -->

    <!-- Header Section Begin -->
    <%@include file="/WEB-INF/views/common/header.jsp"%>
    <!-- Header Section End -->

    <!-- Breadcrumb Section Begin -->
    <%@ include file="/WEB-INF/views/common/breadcrumb.jsp" %>
    <!-- Breadcrumb Section End -->

    <!-- Shopping Cart Section Begin -->
    <%@ include file="/WEB-INF/views/common/shopcart.jsp" %>
    <!-- Shopping Cart Section End -->

    <footer>
    <!-- Footer Start-->
  <%@ include file="/WEB-INF/views/common/footer.jsp" %>
<!-- Footer End-->
</footer>

<!--? Search model Begin -->
<%@ include file="/WEB-INF/views/common/search.jsp" %>
<!-- Search model end -->

<!-- Scroll Up -->
<div id="back-top" >
    <a title="Go to Top" href="#"> <i class="fas fa-level-up-alt"></i></a>
</div>

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