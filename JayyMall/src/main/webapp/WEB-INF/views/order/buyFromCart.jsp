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
<script type="text/javascript" src="/js/order/buyFromCart.js"></script>
</head>

<body class="hold-transition skin-blue sidebar-mini">

	<!-- breadcrumb Start-->
	<%@ include file="/WEB-INF/views/common/breadcrumb.jsp" %>
	
	<div class="container">
	<div class="row">
	
		<div class="col-lg-3">
        	<%@include file="/WEB-INF/views/common/leftcon.jsp"%>
		</div>
		
		<div class="col-lg-9">
		
		<%@ include file="/WEB-INF/views/common/shopalign.jsp" %>
		
		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<!-- 
			<section class="content-header">
				<h1>
					상품구매 <small>주문내역</small>
				</h1>
			</section>
 			-->
			
			<%-- MAIN CONTENT --%> 
			<section class="content container-fluid">
			<div class="row">
				<!-- left column -->
				<div class="box" style="border: none; margin: 100px 0 0 -700px;">
					<form id="orderForm" method="post" action="/order/orderFromCart">
						<div class="box-body" style="padding:30px 10px 100px 10px;">
							<%-- 주문내역 상단 버튼 --%>
							<div class="orderList" style="padding: 0px 40px;">
								<div style="width:100%;">
									<span style="display: inline-block; float: left; margin:20px 10px 5px 0px;">[주문내역]</span>
									<div class="btn-container" style="display: inline-block; float: right; margin:20px 10px 5px 5px;">
										<button id="btn_delete_check"  class="btn btn-default" type="button">선택 상품 삭제</button>
									</div>
								</div>
								<%-- 주문내역 테이블 --%>
								<table class="table table-striped text-center" id="ordertbl">
									<thead id="thead">
										<tr>
											<th><input type="checkbox" id="checkAll" checked="checked"/></th>
											<th>IMAGE</th>
											<th>NAME</th>
											<th>PRICE</th>
											<th>DISCOUNT</th>
											<th>AMOUNT</th>
											<th>TOTAL</th>
										</tr>
										
										<%-- 상품이 존재하지 않는 경우 --%>
										<tr>
											<c:if test="${empty productList}">
												<span>구매할 상품이 존재하지 않습니다.</span>
											</c:if>
										</tr>
									<thead>
									
									<%-- 상품이 존재하는 경우,  리스트 출력 --%>
									<tbody>
									<c:forEach items="${productList}" var="productVO" varStatus="i">
										<tr id="productVO_${productVO.product_num}" class="productRow">
											<td class="col-md-1">
												<input type="checkbox" name="check" class="check" value="${productVO.product_num}" checked="checked" >
												<input type="hidden" id="amount_${productVO.product_num}" name="orderDetailList[${i.index}].ord_amount" value="${amountList[i.index]}" />
												<input type="hidden" name="orderDetailList[${i.index}].product_num" value="${productVO.product_num}" />
												<input type="hidden" name="orderDetailList[${i.index}].ord_price" value="${productVO.product_discount}" />
											</td>
											<td class="col-md-2">
												<a href="/product/read?product_num=${productVO.product_num}&cat_code=${cat_code}">
													<img src="/product/displayFile?fileName=${productVO.product_img}" style="width:100px;">
												</a>
											</td>
											<td class="col-md-2">
												<a href="/product/read?product_num=${productVO.product_num}&cat_code=${cat_code}"
													style="color: black;"> ${productVO.product_name} </a>
											</td>
											<td class="col-md-1">
												<p><fmt:formatNumber value="${productVO.product_price}" pattern="###,###,###" /></p>
												<input type="hidden" name="price" value="${productVO.product_price}" />
												<!-- 
												<input type="hidden" id="price_${productVO.product_num}" value="${productVO.product_price}"  />  -->
											<td class="col-md-1">
												<p><fmt:formatNumber value="${productVO.product_discount}" pattern="###,###,###" /></p>
												<input type="hidden" name="discount" value="${productVO.product_discount}" /> 
											<td class="col-md-1">
												<p>${amountList[i.index]}</p>
												<input type="hidden" name="amount" value="${amountList[i.index]}" /> 
											</td>
											<td class="col-md-1">
												<p><fmt:formatNumber value="${(productVO.product_price - productVO.product_discount) * amountList[i.index]}"  pattern="###,###,###" /></p>
											</td>
										</tr>
									</c:forEach>
									</tbody>
								</table>
								<br><br><br>
							</div>
							<hr><br>
							
							<%-- 주문 정보 --%>
							<div class="orderInfo" style="min-width:1000px;" > 
								<div class="userInfo" style="display:inline-block; float:left; width:60%; padding: 0% 5%;">
									<div class="container" style="width:100%;">
										<span>[주문 정보]</span>
										<div class="form-group" style="width:100%; margin-top:5px;">
											<input type="hidden" class="form-control" id="mem_id" name="mem_id" value="${user.mem_id}">
										</div>
										<div class="form-group">
											<label for="inputName">* 이름</label> <input type="text"
												class="form-control" id="ord_name" name="ord_name" value="${user.mem_name}">
										</div>
										<div class="form-group">
											<label for="inputMobile">* 휴대폰 번호</label> <input type="tel"
												class="form-control" id="ord_tel" name="ord_tel" value="${user.mem_tel}">
										</div>
										<div class="form-group">
											<label for="inputAddr">* 주소</label> <br />
											<input type="text" id="sample2_postcode" name="ord_zipcode" class="form-control" 
												value = "${user.mem_zipcode}"
												style="width:calc(100% - 128px); margin-right: 5px; display: inline-block;" placeholder="우편번호" readonly>
											<input type="button" onclick="sample2_execDaumPostcode()" id="btn_postCode" class="btn btn-default" value="우편번호 찾기"><br>
											<input type="text" id="sample2_address" name="ord_basicadd" class="form-control" 
												value = "${user.mem_basicadd}"
												placeholder="주소" style=" margin:3px 0px;" readonly>
											<input type="text" id="sample2_detailAddress" name="ord_detailadd" class="form-control" 
												value = "${user.mem_detailadd}"
												placeholder="상세주소" >
											<input type="hidden" id="sample2_extraAddress" class="form-control" 
												placeholder="참고항목">
										</div>
									</div>
								</div>
								
								<%-- 결제 방식 선택  및 주문 금액 확인 --%>
								<div class="orderConfirm" style="display:inline-block; width:20%; margin: 0px 5%;">
								<br>
									<%-- 결제 방식 --%>
									<div>
										<span>[결제 방식]</span><br>
										<div class="payment" style="margin-top:10px;">
											<input type="radio" name="payment" value="card" checked="checked">카드 결제
											<input type="radio" name="payment" value="tcash">실시간 계좌이체<br>
											<input type="radio" name="payment" value="phone">휴대폰 결제
											<input type="radio" name="payment" value="cash">무통장 입금
										</div>
									</div>
									<br><br><br>
									
									<%-- 주문 금액 --%>
									<div style="width: 400px;">
										<span>[결제 금액]</span>
										<table class="table text-center" style="margin-top:15px;" >
											<tr>
												<td class="col-md-1">총 상품금액</td>
												<td class="col-md-1" style="height:30px; text-align: center;"><p id="totalPrice">0</p></td>
											</tr>
											<tr>
												<td class="col-md-1">총 할인 금액</td>
												<td class="col-md-1" style="height:30px; text-align: center;">
													<label><p id="totalDiscount">0</p></label>
													<!-- <input type="hidden" id="totalDiscount" name="totalDiscount" value="0"/> -->
													<input type="hidden" id="ord_total_price" name="ord_total_price" value="0"/>
												</td>
											</tr>
											<tr>
												<td class="col-md-1"><label>결제 예정 금액</label></td>
												<td class="col-md-1" style="height:30px; text-align: center;"><p id="totalPD">0</p></td>
											</tr>
											<tr>
												<td class="col-md-1" colspan="2" >
													<button id="btn_submit" class="btn btn-flat" type="button" style="padding: 10px 40px; background-color: grey; color:white;">결제하기</button>
												</td>
											</tr>
										</table>
								
									</div>
								</div>
								
								<!-- Daum 우편번호 API -->
							    <!-- iOS에서는 position:fixed 버그가 있음, 적용하는 사이트에 맞게 position:absolute 등을 이용하여 top,left값 조정 필요 -->
								<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
								<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
								</div>
								
								<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
								<script>
							    // 우편번호 찾기 화면을 넣을 element
							    var element_layer = document.getElementById('layer');
							
							    function closeDaumPostcode() {
							        // iframe을 넣은 element를 안보이게 한다.
							        element_layer.style.display = 'none';
							    }
							
							    function sample2_execDaumPostcode() {
							        new daum.Postcode({
							            oncomplete: function(data) {
							                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
							
							                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
							                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							                var addr = ''; // 주소 변수
							                var extraAddr = ''; // 참고항목 변수
							
							                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
							                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							                    addr = data.roadAddress;
							                } else { // 사용자가 지번 주소를 선택했을 경우(J)
							                    addr = data.jibunAddress;
							                }
							
							                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
							                if(data.userSelectedType === 'R'){
							                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
							                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
							                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
							                        extraAddr += data.bname;
							                    }
							                    // 건물명이 있고, 공동주택일 경우 추가한다.
							                    if(data.buildingName !== '' && data.apartment === 'Y'){
							                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
							                    }
							                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
							                    if(extraAddr !== ''){
							                        extraAddr = ' (' + extraAddr + ')';
							                    }
							                    // 조합된 참고항목을 해당 필드에 넣는다.
							                    document.getElementById("sample2_extraAddress").value = extraAddr;
							                
							                } else {
							                    document.getElementById("sample2_extraAddress").value = '';
							                }
							
							                // 우편번호와 주소 정보를 해당 필드에 넣는다.
							                document.getElementById('sample2_postcode').value = data.zonecode;
							                document.getElementById("sample2_address").value = addr;
							                // 커서를 상세주소 필드로 이동한다.
							                document.getElementById("sample2_detailAddress").focus();
							
							                // iframe을 넣은 element를 안보이게 한다.
							                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
							                element_layer.style.display = 'none';
							            },
							            width : '100%',
							            height : '100%',
							            maxSuggestItems : 5
							        }).embed(element_layer);
							
							        // iframe을 넣은 element를 보이게 한다.
							        element_layer.style.display = 'block';
							
							        // iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
							        initLayerPosition();
							    }
							
							    // 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
							    // resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
							    // 직접 element_layer의 top,left값을 수정해 주시면 됩니다.
							    function initLayerPosition(){
							        var width = 300; //우편번호서비스가 들어갈 element의 width
							        var height = 400; //우편번호서비스가 들어갈 element의 height
							        var borderWidth = 5; //샘플에서 사용하는 border의 두께
							
							        // 위에서 선언한 값들을 실제 element에 넣는다.
							        element_layer.style.width = width + 'px';
							        element_layer.style.height = height + 'px';
							        element_layer.style.border = borderWidth + 'px solid';
							        // 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
							        element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width)/2 - borderWidth) + 'px';
							        element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height)/2 - borderWidth) + 'px';
							    }
								</script>
								
							</div>
						</div>
					</form>
				</div>
			</div>
			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->
		</div>	
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