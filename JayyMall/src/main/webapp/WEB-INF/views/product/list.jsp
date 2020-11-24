<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

<%-- 스타일 처리 --%>
<style>
	ul{
   		list-style:none;
   		padding-left:0px;
    }
    .product{
    	display: inline-block;
    	margin: 10px;
    	padding:22px 40px;
    }
    .description{
    	margin: 10px;
    }
    
</style>

<%-- 버튼 처리 --%>
<script>
	/* 장바구니 버튼 클릭 이벤트 */
	var cart_click = function(product_num){
		$.ajax({
			url: "/cart/add",
			type: "post",
			dataType: "text",
			data: {product_num: product_num},
			success: function(data){
				var result = confirm("장바구니에 추가되었습니다.\n지금 확인하시겠습니까?");
				if(result){
					location.href="/cart/list";
				} else{}
			}
		});
	}

</script>
<!-- Main Header -->
<%@include file="/WEB-INF/views/common/header.jsp"%>

<!-- breadcrumb Start-->
<%@ include file="/WEB-INF/views/common/breadcrumb.jsp" %>
<!-- 
<%@ include file="/WEB-INF/views/common/shopalign.jsp" %>
-->
</head>

<body class="hold-transition skin-blue sidebar-mini">
<div class="container">
	<div class="row">
	
		<div class="col-lg-3">
        <%@include file="/WEB-INF/views/common/leftcon.jsp"%>
		</div>

		<!-- Content Wrapper. Contains page content -->
		<div class="col-lg-9">
			
			<%-- MAIN CONTENT --%> 
			<section class="content container-fluid">
				<%-- 상품 목록 표시 --%>
				<div style="background-color:white; padding: 50px 180px;" class="container text-center">
					<h3>${cat_name}</h3><br>
					<ul class="productList">
						<%-- 상품이 존재하지 않는 경우 --%>
						<c:if test="${empty productList}">
							<span>등록된 상품이 존재하지 않습니다.</span>
						</c:if>
						
						<%-- 상품이 존재하는 경우 --%>
						<c:forEach items="${productList}" var="productVO" >
						<li class="product">
							${productVO.product_num}
							<div class="thumnail">
								<a href="/product/read${pm.makeQuery(pm.cri.page)}&product_num=${productVO.product_num}&cat_code=${cat_code}">
									<img src="/product/displayFile?fileName=${productVO.product_img}" >
								</a>
							</div>
							<div class="description">
								<a href="/product/read${pm.makeQuery(pm.cri.page)}&product_num=${productVO.product_num}&cat_code=${cat_code}" >${productVO.product_name}</a>
								<p>가격: <fmt:formatNumber value="${productVO.product_price}" pattern="###,###,###" />원<br>
								 	할인가: <fmt:formatNumber value="${productVO.product_discount}" pattern="###,###,###" />원</p>
							</div>
							<div class="btnContainer">
								<button class="btn btn-primary" id="btn_buy" type="button" 
									onclick="location.href = '/order/buy?product_num=${productVO.product_num}&ord_amount=1';">구매</button>
								<button class="btn btn-default" id="btn_cart" type="button" 
									onclick="cart_click(${productVO.product_num})">장바구니</button>
							</div>
						</c:forEach>
					</ul>
				</div>
				<%-- 페이지 표시 --%>
				<div class="box-footer container" style="width:100%; min-width:1400px;" class="container text-center">
					<div class="text-center">
						<ul class="pagination">
							<c:if test="${pm.prev}">
								<li><a href="list${pm.makeQuery(pm.startPage-1)}&cat_code=${cat_code}">&laquo;</a>
								</li>
							</c:if>

							<c:forEach begin="${pm.startPage}" end="${pm.endPage}"
								var="idx">
								<li <c:out value="${pm.cri.page == idx?'class =active':''}"/>>
									<a href="list${pm.makeQuery(idx)}&cat_code=${cat_code}">${idx}</a>
								</li>
							</c:forEach>

							<c:if test="${pm.next && pm.endPage > 0}">
								<li><a href="list${pm.makeQuery(pm.endPage +1)}&cat_code=${cat_code}">&raquo;</a>
								</li>
							</c:if>
						</ul>
					</div>
				</div>
			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->
	</div>
	</div>
<footer>
<!-- Footer Start-->
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
<!-- Footer End-->
</footer>

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