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

<%-- 버튼 클릭 이벤트 메소드 --%>
<script type="text/javascript" src="/js/cart/list.js"></script>


<style>
	.content-wrapper{
		
	}
</style>
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
			<!-- 
			<section class="content-header">
				<h1>
					장바구니 <small>Cart List</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> MAIN</a></li>
					<li class="active">장바구니</li>
				</ol>
			</section>
			-->
			 
			<%-- MAIN CONTENT --%>
			<!-- Main content -->
			<section class="content container-fluid">

				<div class="row">
					<!-- left column -->
					<div class="box" style="border: none; margin: 100px 0 0 -600px; width: 1000%;">
						<form method="post" action="/order/buyFromCart">
						<div class="btn-container" style="display: inline-block; float: right; margin:20px 10px 5px 5px;">
							<button id="btn_buy_check"  class="btn btn-primary" type="submit" >선택 상품 구매</button>
							<button id="btn_delete_check"  class="btn btn-default" >선택 상품 삭제</button>
						</div>
						<div class="box-body">
							<table class="table table-striped text-center">
								<tr>
									<th><input type="checkbox" id="checkAll" checked="checked"/></th>
									<th>번호</th>
									<th>상품 이미지</th>
									<th>상품명</th>
									<th>판매가</th>
									<th>할인가</th>
									<th>수량</th>
									<th>구매/삭제</th>
								</tr>
								
								<%-- 상품이 존재하지 않는 경우 --%>
								<c:if test="${empty cartProductList}">
									<tr>
										<td colspan="10"> 
											<p style="padding:50px 0px; text-align: center;">장바구니에 담긴 상품이 없습니다.</p>
										</td>
									<tr>
								</c:if>
								
								<%-- 상품이 존재하는 경우,  리스트 출력 --%>
								<%--JSTL 변수 선언 --%>
								<c:set var="i" value="${fn:length(cartProductList)}" />
								<c:forEach items="${cartProductList}" var="cartProductVO">
									<tr>
										<td class="col-md-1">
											<input type="checkbox" name="check" class="check" value="${cartProductVO.cart_code}" checked="checked" >
											<input type="hidden" id="product_num_${cartProductVO.cart_code}" name="product_num" value="${cartProductVO.product_num}" >
											<input type="hidden" name="cart_amount" value="${cartProductVO.cart_amount}" >
											<input type="hidden" name="cart_code" value="${cartProductVO.cart_code}" >
										</td>
										<td class="col-md-1">${i}</td>
										<td class="col-md-2">
											<a href="/product/read?product_num=${cartProductVO.product_num}&cat_code=${cat_code}">
												<img src="/product/displayFile?fileName=${cartProductVO.product_img}" style="width:100px;">
											</a>
										</td>
										<td class="col-md-2">
											<a href="/product/read?product_num=${cartProductVO.product_num}&cat_code=${cat_code}"
												style="color: black;"> ${cartProductVO.product_name} </a>
										</td>
										<td class="col-md-1">
											<p>${cartProductVO.product_price}</p>
											<input type="hidden" name="price_${cartProductVO.cart_code}" value="${cartProductVO.product_price}" /></td>
										<td class="col-md-1">
											<p>${cartProductVO.product_discount}</p>
											<input type="hidden" name="discount_${cartProductVO.cart_code}" value="${cartProductVO.product_discount}" /></td>									
										<td class="col-md-2">
											<input type="number" name="cart_amount_${cartProductVO.cart_code}"
												style="width:60px; height:34px; padding-left:5px;" value="${cartProductVO.cart_amount}" />
											<button type="button" name="btn_modify" class="btn btn-default" value="${cartProductVO.cart_code}" >변경</button>
										</td>
										<td class="col-md-2">
											<button type="button" name="btn_buy" class="btn btn-primary" value="${cartProductVO.cart_code}"
												onclick="clickBuyBtn(${cartProductVO.product_num}, ${cartProductVO.cart_code});">구매</button>
											<button type="button" name="btn_delete" class="btn btn-default" value="${cartProductVO.cart_code}" >삭제</button>
										</td>
										<c:set var="i" value="${i-1}" ></c:set>
									</tr>

								</c:forEach>
							</table>
						</div>
						</form>
						<div class="box-body" style="margin: 7% 10%; padding-bottom:10%; min-width: 600px;">
							<table class="table table-striped text-center" >
								<tr>
									<td class="col-md-1">총 상품금액</td>
									<td class="col-md-1">총 할인 금액</td>
									<td class="col-md-1">결제 예정 금액</td>
								</tr>
								<tr >
									<td class="col-md-1" style="height:50px; text-align: center;"><p id="totalPrice">0</p></td>
									<td class="col-md-1" style="height:50px; text-align: center;"><p id="totalDiscount">0</p></td>
									<td class="col-md-1" style="height:50px; text-align: center;"><p id="totalPD">0</p></td>
								</tr>
							</table>
						</div>
					</div>
				</div>
				<!--/.col (left) -->
			</section>
		</div>
		<!-- /.content -->
	
		
	</div>
	<!-- ./wrapper -->
	
	</div>


<footer>
<!-- Footer Start-->
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
<!-- Footer End-->
</footer>

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