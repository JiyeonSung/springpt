<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<%@include file="/WEB-INF/views/include/plugin_js.jsp"%>
<%@include file="/WEB-INF/views/include/header2.jsp"%>
<head>

<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script type="text/javascript" src="/js/admin/order_list.js"></script>

<script id="template" type="text/x-handlebars-template">
	{{#each .}}
		<tr class="orderDetails">
			<td>{{null}}</td>
			<td><img src="/admin/order/displayFile?fileName={{product_img}}" ></td>
			<td>{{product_name}}</td>
			<td>{{product_price}}원</td>
			<td>{{product_discount}}원</td>
			<td>{{ord_amount}}개</td>
			<td>{{ord_price}}원</td>
		</tr>
	{{/each}}
</script>

<%-- 버튼 클릭 이벤트 메소드 --%>
<script>
	$(document).ready(function(){
		
		$("#orderlisttable td.orderdetailview").on("click", function(){
			// alert();
			
			$("#ordertable").show();
			
			
		});
		
		
		/* 검색 버튼 클릭 시 */
		$("#btn_search").on("click", function(){
			self.location = "list"
				+ '${pm.makeQuery(1)}'
				+ "&searchType="
				+ $("select option:selected").val()
				+ "&keyword=" + $('#keyword').val();
		});

		
		/* 전체 선택 체크박스 클릭 시 */
		$("#checkAll").on("click", function(){
			// 전체선택 클릭 여부로 다른 체크박스 체크
			$(".check").prop('checked', this.checked);
		});
		
		/* 체크박스 중 선택안된 체크박스 존재 시 전체선택 해제 */ 
		$(".check").on("click", function(){
			$("#checkAll").prop('checked', false);
		});

		
		
		/* 선택 주문 삭제 버튼 클릭 시 */
		$("#btn_delete_check").on("click", function(){

			// 체크여부 유효성 검사
			if($("input[name='check']:checked").length==0){
				alert("삭제할 주문을 선택해주세요.");
				return;
			}
		
			// 체크 된 주문이 존재할 경우 진행
			var result = confirm("선택한 주문을 삭제하시겠습니까?");
			if(result){
				
				var checkArr = [];
				var memArr = [];
				
				// 체크 된 상품의 value(ord_num)을 가져옴
				$("input[name='check']:checked").each(function(i){
					var ord_num = $(this).val();
					var mem_id = $("input[name='mem_"+ord_num+"']").val();
					
					checkArr.push(ord_num);
					memArr.push(mem_id);
				});
				
				$.ajax({
					url: '/admin/order/deleteChecked',
					type: 'post',
					dataType: 'text',
					data: {
							checkArr : checkArr
						   },
					success : function(data) {
						alert("삭제가 완료되었습니다.");
						location.href = "/admin/order/list${pm.makeSearch(pm.cri.page)}";
					}
				});
			} else{}
		});

		/* 주문 리스트 - 삭제 버튼 클릭 시 */
		$("button[name=btn_delete]").on("click", function(){
			var result = confirm("이 주문을 삭제하시겠습니까?");
			if(result){
				$(this).parent().submit();  // dom 기능 메서드
				$(".deleteForm").submit();  // 다른 데이터가 삭제가 된다. (버그)				
			} else{}
		});
		 
	});
</script>

<%-- 메시지 처리 --%>
<script>
	if ("${msg}" == "DELETE_SUCCESS") {
		alert("주문 삭제가 완료되었습니다.");
	}
</script>

</head>

<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">
		<!-- Main Header -->
		<%@include file="/WEB-INF/views/include/main_header_admin.jsp"%>

		<!-- Left side column. contains the logo and sidebar -->
		<%@include file="/WEB-INF/views/include/left_admin.jsp"%>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>
					Admin Page <small>Member List</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> 회원 관리</a></li>
					<li class="active">회원 목록</li>
				</ol>
			</section>

			<%-- MAIN CONTENT --%>
			<!-- Main content -->
			<section class="content container-fluid">

				<!--------------------------
		        | Your Page Content Here |
		        -------------------------->

				<div class="row">
					<!-- left column -->
					<%-- 검색 조건 설정 및 페이지 이동에도 해당 값 유지 --%>
					<div class="col-md-12">
						<div class="row text-center">
							<div style="display: inline-block; float: left; margin-left:15px;">
							<select name="searchType" style="width:180px; height:26px;">
								<option value="null"
									<c:out value="${cri.searchType == null?'selected':''}"/>>검색조건 선택</option>
								<option value="num"
									<c:out value="${cri.searchType eq 'name'?'selected':''}"/>>주문 번호</option>
								<option value="id"
									<c:out value="${cri.searchType eq 'detail'?'selected':''}"/>>회원 ID</option>
								<option value="name"
									<c:out value="${cri.searchType eq 'company'?'selected':''}"/>>회원 이름</option>
								<option value="num_id"
									<c:out value="${cri.searchType eq 'name_detail'?'selected':''}"/>>주문번호+ID</option>
								<option value="num_name"
									<c:out value="${cri.searchType eq 'name_company'?'selected':''}"/>>주문번호+이름</option>
								<option value="all"
									<c:out value="${cri.searchType eq 'all'?'selected':''}"/>>주문번호+ID+이름</option>
							</select> 
							<input type="text" name='keyword' id="keyword" style="width:250px; padding-left:5px;" value='${cri.keyword}' />
							<button id="btn_search" class="btn btn-default">검색</button>
							</div>
							<div style="display: inline-block; float: right; margin-right:15px;">
							<button id="btn_delete_check"  class="btn btn-default" >선택 주문 삭제</button>
						</div>
						</div>
						<br>

						<div class="box" style="border: none;">
							<div class="box-body">
								<table class="table table-striped text-center" id="orderlisttable">
									<tr>
										<th><input type="checkbox" id="checkAll" /></th>
										<th>주문번호</th>
										<th>ID</th>
										<th>이름</th>
										<th>전화번호</th>
										<th>가격</th>
										<th>구매일</th>
										<th>주문 삭제</th>
									</tr>
									
									<%-- 회원 리스트 출력 --%>
									<c:if test="${empty orderList}">
										<tr>
											<td colspan="10"> 
												<p style="padding:50px 0px; text-align: center;"><td colspan="10"> 
											<p style="padding:50px 0px; text-align: center;">주문이 존재하지 않습니다.</p>
										</td></p>
											</td>
										<tr>
									</c:if>
									
									
									<!-- ord_num, mem_id, ord_name, ord_tel, ord_total_price, ord_date -->
									<%-- 회원이 존재하는 경우,  리스트 출력 --%>
									<c:forEach items="${orderList}" var="orderVO">
										<tr>
											<td><input type="checkbox" name="check" class="check" value="${orderVO.ord_num}" style=""></td>											
											<td class="col-md-1 orderdetailview" style="cursor:pointer;">${orderVO.ord_num}</td>											
											<td class="col-md-1">${orderVO.mem_id}</td>											
											<td class="col-md-2">${orderVO.ord_name}</td>											
											<td class="col-md-2">${orderVO.ord_tel}</td>
											<td class="col-md-2">${orderVO.ord_total_price}</td>
											<td class="col-md-2">${orderVO.ord_date}</td>
											<td class="col-md-2">
												<form class="deleteForm" method="post"
													action="/admin/order/delete${pm.makeSearch(pm.cri.page)}">
													<!-- 회원 코드 -->
													<input type="hidden" name="ord_num"
														value="${orderVO.ord_num}">
													<button type="button" name="btn_delete" class="btn btn-danger">삭제</button>
												</form>
											</td>
										</tr>
									</c:forEach>
								</table>
								
								<%-- Modal : 주문 상세 팝업 --%>
								<%-- 
								<div id="modifyModal" style="display:none;">
								  <div class="modal-dialog">
								    <!-- Modal content-->
								    <div class="modal-content">
								      <div class="modal-header" id="replytable">
								        <button type="button" class="close" data-dismiss="modal">&times;</button>
								        <div class="modal-title">
											<tr style="background-color: aliceBlue;">
												<td colspan="7" style="text-align:left;">
											        <b>주문날짜: <fmt:formatDate value="${order.ord_date}" pattern="yyyy/MM/dd HH:mm:ss"/>
													(주문번호: ${order.ord_num} )</b>
												</td>
												<tr style="background-color: whitesmoke;">
													<th>IMAGE</th>
													<th>NAME</th>
													<th>PRICE 할인 전 가격</th>
													<th>DISCOUNT 할인 가격</th>
													<th>AMOUNT</th>	
													<th>TOTAL 최종 가격</th>
												</tr>
												<tr>
													<td>
														<a href="/product/read?product_num=${product.product_num}">
															<img src="/product/displayFile?fileName=${product.product_img}" style="width:100px;">
														</a>
													</td>
													<td>
														<a href="/product/read?product_num=${product.product_num}" style="color: black;">
															${product.product_name}
														</a>
													</td>
													<td>
														<p><fmt:formatNumber value="${product.product_price}" pattern="###,###,###" /></p>
													</td>
													<td>
														<p><fmt:formatNumber value="${product.ord_price}" pattern="###,###,###" /></p>
													</td>
													<td>
														<p>${product.ord_amount}</p>
													</td>
													<td>
														<p><fmt:formatNumber value="${product.ord_price * product.ord_amount}" pattern="###,###,###" /></p>
													</td>
												</tr>
												<tr style="background-color: whitesmoke;"><b>주문 정보</b>
													<th>NAME</th>
													<th>TEL</th>
													<th>ADRESS</th>
												</tr>
												<tr>
													<td>
														<input type="text" class="form-control" value="${order.ord_name}" readonly>
													</td>
													<td>
														<input type="tel" class="form-control" value="${order.ord_tel}" readonly>
													</td>
													<td>
														<input type="text" id="sample2_postcode" name="ord_zipcode" class="form-control" value = "${order.ord_zipcode}" 
															style="width:calc(100% - 128px); margin-right: 5px; display: inline-block;" placeholder="우편번호" readonly>
														<input type="button" onclick="sample2_execDaumPostcode()" id="btn_postCode" class="btn btn-default" value="우편번호 찾기"
															disabled="disabled"><br>
														<input type="text" id="sample2_address" name="ord_basicadd" class="form-control" value = "${order.ord_basicadd}" 
															placeholder="주소" style=" margin:3px 0px;" readonly>
														<input type="text" id="sample2_detailAddress" name="ord_detailadd" class="form-control" 
															value = "${order.ord_detailadd}" placeholder="상세주소" readonly >
														<input type="hidden" id="sample2_extraAddress" class="form-control" placeholder="참고항목">
													</td>
												</tr>
											</tr>
								        </div>
								      </div>
								      <div class="modal-body" data-ord_num>
								        <p><input type="text" id="replytext" class="form-control"></p>
								      </div>
								      <div class="modal-footer">
								        <button type="button" class="btn btn-default" data-dismiss="modal">CLOSE</button>
								      </div>
								    </div>
								  </div>
								</div>
								--%>
							</div>
							<!-- /.box-body -->


							<div class="box-footer">

								<div class="text-center">
									<ul class="pagination">

										<c:if test="${pm.prev}">
											<li><a href="list${pm.makeSearch(pm.startPage-1)}">&laquo;</a>
											</li>
										</c:if>

										<c:forEach begin="${pm.startPage}" end="${pm.endPage}"
											var="idx">
											<li <c:out value="${pm.cri.page == idx?'class =active':''}"/>>
												<a href="list${pm.makeSearch(idx)}">${idx}</a>
											</li>
										</c:forEach>

										<c:if test="${pm.next && pm.endPage > 0}">
											<li><a href="list${pm.makeSearch(pm.endPage +1)}">&raquo;</a>
											</li>
										</c:if>

									</ul>
								</div>

							</div>
							<!-- /.box-footer-->
						</div>
					</div>
					<!--/.col (left) -->
				
				</div>

			</section>
		</div>
		<!-- /.content -->
		<!-- /.content-wrapper -->

		<!-- Main Footer -->
		<%@include file="/WEB-INF/views/include/footer.jsp"%>

		<!-- Control Sidebar -->
		<aside class="control-sidebar control-sidebar-dark">
			<!-- Create the tabs -->
			<ul class="nav nav-tabs nav-justified control-sidebar-tabs">
				<li class="active"><a href="#control-sidebar-home-tab"
					data-toggle="tab"><i class="fa fa-home"></i></a></li>
				<li><a href="#control-sidebar-settings-tab" data-toggle="tab"><i
						class="fa fa-gears"></i></a></li>
			</ul>
			<!-- Tab panes -->
			<div class="tab-content">
				<!-- Home tab content -->
				<div class="tab-pane active" id="control-sidebar-home-tab">
					<h3 class="control-sidebar-heading">Recent Activity</h3>
					<ul class="control-sidebar-menu">
						<li><a href="javascript:;"> <i
								class="menu-icon fa fa-birthday-cake bg-red"></i>

								<div class="menu-info">
									<h4 class="control-sidebar-subheading">Langdon's Birthday</h4>

									<p>Will be 23 on April 24th</p>
								</div>
						</a></li>
					</ul>
					<!-- /.control-sidebar-menu -->

					<h3 class="control-sidebar-heading">Tasks Progress</h3>
					<ul class="control-sidebar-menu">
						<li><a href="javascript:;">
								<h4 class="control-sidebar-subheading">
									Custom Template Design <span class="pull-right-container">
										<span class="label label-danger pull-right">70%</span>
									</span>
								</h4>

								<div class="progress progress-xxs">
									<div class="progress-bar progress-bar-danger"
										style="width: 70%"></div>
								</div>
						</a></li>
					</ul>
					<!-- /.control-sidebar-menu -->

				</div>
				<!-- /.tab-pane -->
				<!-- Stats tab content -->
				<div class="tab-pane" id="control-sidebar-stats-tab">Stats Tab
					Content</div>
				<!-- /.tab-pane -->
				<!-- Settings tab content -->
				<div class="tab-pane" id="control-sidebar-settings-tab">
					<form method="post">
						<h3 class="control-sidebar-heading">General Settings</h3>

						<div class="form-group">
							<label class="control-sidebar-subheading"> Report panel
								usage <input type="checkbox" class="pull-right" checked>
							</label>

							<p>Some information about this general settings option</p>
						</div>
						<!-- /.form-group -->
					</form>
				</div>
				<!-- /.tab-pane -->
			</div>
		</aside>
		<!-- /.control-sidebar -->
		<!-- Add the sidebar's background. This div must be placed immediately after the control sidebar -->
		<div class="control-sidebar-bg"></div>
	</div>
	<!-- ./wrapper -->

</body>
</html>