<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html class="no-js" lang="zxx">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>JayyMall | Teamplate</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <!-- CSS here -->
    <%@include file="/WEB-INF/views/common/bootcss.jsp"%>
	<%@include file="/WEB-INF/views/include/plugin_js.jsp"%>
	<%@include file="/WEB-INF/views/include/header.jsp"%>
	<!-- Main Header -->
	<%@include file="/WEB-INF/views/common/header.jsp"%>
	
<%-- 버튼 클릭 이벤트 --%>
<script type="text/javascript" src="/js/order/orderComplete.js"></script>
</head>

<body class="hold-transition skin-blue sidebar-mini">
	
	<!-- breadcrumb Start-->
	<%@ include file="/WEB-INF/views/common/breadcrumb.jsp" %>

	<div class="container">
	<div class="row">
	
		<div class="col-lg-3">
        <%@include file="/WEB-INF/views/common/leftcon.jsp"%>
		</div>

		<!-- Content Wrapper. Contains page content -->
		<div class="col-lg-9">
		
		<%@ include file="/WEB-INF/views/common/shopalign.jsp" %>
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>상품구매 <small>주문내역</small></h1>
			</section>

			
			<%-- MAIN CONTENT --%> 
			<section class="content container-fluid">
				<div class="box" style="border: none; padding:200px 50px; text-align: center;">
					<div class="box-body">
						<h3>해당 상품의 주문이 완료되었습니다.</h3><br>
						<button type="button" id="btn_orderList" class="btn btn-primary">주문내역 확인</button>
						<button type="button" id="btn_main" class="btn btn-default">쇼핑 계속하기</button>
					</div>
				</div>
			</section>
		</div>			

		<!-- Main Footer -->
		<%@include file="/WEB-INF/views/include/footer.jsp" %>
	</div>
	</div>
	<!-- ./wrapper -->

</body>
</html>