<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<%@include file="/WEB-INF/views/include/plugin_js.jsp"%>
<%@include file="/WEB-INF/views/include/header2.jsp"%>
<head>
<meta charset="UTF-8">

<%-- 버튼 클릭 이벤트 메소드 --%>
<script>
	$(document).ready(function(){
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

		
		
		/* 선택 회원 삭제 버튼 클릭 시 */
		$("#btn_delete_check").on("click", function(){

			// 체크여부 유효성 검사
			if($("input[name='check']:checked").length==0){
				alert("삭제할 회원을 선택해주세요.");
				return;
			}
		
			// 체크 된 회원이 존재할 경우 진행
			var result = confirm("선택한 회원을 삭제하시겠습니까?");
			if(result){
				
				var checkArr = [];\
				
				// 체크 된 상품의 value(mem_id)을 가져옴
				$("input[name='check']:checked").each(function(i){
					var mem_id = $(this).val();\
					
					checkArr.push(mem_id);\
				});
				
				$.ajax({
					url: '/admin/member/deleteChecked',
					type: 'post',
					dataType: 'text',
					data: {
							checkArr : checkArr\
						   },
					success : function(data) {
						alert("삭제가 완료되었습니다.");
						location.href = "/admin/member/list${pm.makeSearch(pm.cri.page)}";
					}
				});
			} else{}
		});

		/* 회원 리스트 - 삭제 버튼 클릭 시 */
		$("button[name=btn_delete]").on("click", function(){
			var result = confirm("이 회원을 삭제하시겠습니까?");
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
		alert("회원 삭제가 완료되었습니다.");
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
								<option value="id"
									<c:out value="${cri.searchType eq 'name'?'selected':''}"/>>회원 ID</option>
								<option value="name"
									<c:out value="${cri.searchType eq 'detail'?'selected':''}"/>>회원 이름</option>
								<option value="nickname"
									<c:out value="${cri.searchType eq 'company'?'selected':''}"/>>회원 닉네임</option>
								<option value="accept"
									<c:out value="${cri.searchType eq 'company'?'selected':''}"/>>회원 수신여부</option>	
								<option value="id_name"
									<c:out value="${cri.searchType eq 'name_detail'?'selected':''}"/>>ID+이름</option>
								<option value="id_nickname"
									<c:out value="${cri.searchType eq 'name_company'?'selected':''}"/>>ID+닉네임</option>
								<option value="all"
									<c:out value="${cri.searchType eq 'all'?'selected':''}"/>>ID+이름+닉네임</option>
							</select> 
							<input type="text" name='keyword' id="keyword" style="width:250px; padding-left:5px;" value='${cri.keyword}' />
							<button id="btn_search" class="btn btn-default">검색</button>
							</div>
							<div style="display: inline-block; float: right; margin-right:15px;">
							<button id="btn_delete_check"  class="btn btn-default" >선택 회원 삭제</button>
						</div>
						</div>
						<br>

						<div class="box" style="border: none;">
							<div class="box-body">
								<table class="table table-striped text-center">
									<tr>
										<th><input type="checkbox" id="checkAll" /></th>
										<th>ID</th>
										<th>이름</th>
										<th>이메일</th>
										<th>수신여부</th>
										<th>전화번호</th>
										<th>닉네임</th>
										<th>가입일</th>
										<th>마지막 로그인</th>
										<th>삭제</th>
									</tr>
									
									<%-- 회원 리스트 출력 --%>
									<c:if test="${empty memberList}">
										<tr>
											<td colspan="10"> 
												<p style="padding:50px 0px; text-align: center;"><td colspan="10"> 
											<p style="padding:50px 0px; text-align: center;">회원이 존재하지 않습니다.</p>
										</td></p>
											</td>
										<tr>
									</c:if>
									
									<%-- 회원이 존재하는 경우,  리스트 출력 --%>
									<c:forEach items="${memberList}" var="memberVO">
										<tr>
											<td><input type="checkbox" name="check" class="check" value="${memberVO.mem_id}" style=""></td>											
											<td class="col-md-1">${memberVO.mem_id}</td>											
											<td class="col-md-1">${memberVO.mem_name}</td>											
											<td class="col-md-2">${memberVO.mem_email}</td>											
											<td class="col-md-1">${memberVO.mem_accept_e}</td>
											<td class="col-md-1">${memberVO.mem_tel}</td>
											<td class="col-md-1">${memberVO.mem_nickname}</td>
											<td class="col-md-2">${memberVO.mem_joindate}</td>
											<td class="col-md-2">${memberVO.mem_lastlogin}</td>
											<td class="col-md-1">
												<form class="deleteForm" method="post"
													action="/admin/member/delete${pm.makeSearch(pm.cri.page)}">
													<!-- 회원 코드 -->
													<input type="hidden" name="mem_id"
														value="${memberVO.mem_id}">
													<button type="button" name="btn_delete" class="btn btn-danger">삭제</button>
												</form>
											</td>
										</tr>

									</c:forEach>
								</table>
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