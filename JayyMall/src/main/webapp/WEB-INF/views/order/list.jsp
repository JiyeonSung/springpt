<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

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
	

<body class="hold-transition skin-blue sidebar-mini">

	<!-- breadcrumb Start-->
	<%@ include file="/WEB-INF/views/common/breadcrumb.jsp" %>

	<div class="container">
	<div class="row">
	
		<div class="col-lg-3">
		
		<!-- Left side column. contains the logo and sidebar -->
		<%@include file="/WEB-INF/views/common/leftcon.jsp"%>
		</div>
		
		<!-- Content Wrapper. Contains page content -->
		<div class="col-lg-9">
		
		<%@ include file="/WEB-INF/views/common/shopalign.jsp" %>
		
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>
					주문목록 <small>Order List</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> MAIN</a></li>
					<li class="active">주문목록</li>
				</ol>
			</section>

			<%-- MAIN CONTENT --%>
			<!-- Main content -->
			<section class="content container-fluid">

				<div class="row">
					<!-- left column -->
					<div class="box" style="border: none; padding: 10px 30px;">
						<div class="box-body">
							<table class="table text-center">
								<%-- 상품이 존재하지 않는 경우 --%>
								<c:if test="${empty orderList}">
									<tr>
										<td colspan="10"> 
											<p style="padding:50px 0px; text-align: center;">주문하신 상품이 없습니다.</p>
										</td>
									<tr>
								</c:if>
								
								<%-- 상품이 존재하는 경우,  리스트 출력 --%>
								<c:forEach items="${orderList}" var="orderVO" varStatus="status">
									<c:if test="${status.index==0 || orderVO.ord_num != code}">
									<tr style="background-color: aliceBlue;" >
										<td colspan="5" style="text-align:left;">
											<b>주문날짜: <fmt:formatDate value="${orderVO.ord_date}" pattern="yyyy/MM/dd HH:mm:ss"/>
											(주문번호: ${orderVO.ord_num} ) </b>
										</td>
										<td> 
											<button class="btn btn-primary" onclick="location.href='/order/read?ord_num=${orderVO.ord_num}';">
											주문 상세보기</button> 
										</td>
									<tr>
									<tr style="background-color: whitesmoke;">
										<td>IMAGE</td>
										<td>NAME</td>
										<td>PRICE</td>
										<td>AMOUNT</td>
										<td>TOTAL</td>
										<td>REVIEW</td>
									</tr>
									</c:if>
									<c:set var="code" value="${orderVO.ord_num}">	</c:set>
									<tr>
										<td class="col-md-2">
											<a href="/product/read?product_num=${orderVO.product_num}">
												<img src="/product/displayFile?fileName=${orderVO.product_img}" style="width:100px;">
											</a>
										</td>
										<td class="col-md-2">
											<a href="/product/read?product_num=${orderVO.product_num}"
												style="color: black;"> ${orderVO.product_name} </a>
										</td>
										<td class="col-md-1">
											<fmt:formatNumber value="${orderVO.ord_price}" pattern="###,###,###" /></p>
											
										<td class="col-md-1">
											<p>${orderVO.ord_amount}</p>
										</td>
										<td class="col-md-1">
											<fmt:formatNumber value="${orderVO.ord_price * orderVO.ord_amount}" pattern="###,###,###" /></p>
										</td>
										<td class="col-md-2">
											
											<button type="button" class="btn btn-flat" 
												onclick="location.href='/product/read?product_num=${orderVO.product_num}';" value="${orderVO.product_num}" >상품후기 쓰기</button>
										</td>
									</tr>
								</c:forEach>
							</table>
						</div>
					</div>
				</div>
				<!--/.col (left) -->
			</section>
		</div>
		<!-- /.content -->
		<!-- /.content-wrapper -->

		<!-- Main Footer -->
		<%@include file="/WEB-INF/views/include/footer.jsp"%>

		</div>
	</div>
	<!-- ./wrapper -->

</body>
</html>