var replyPage = 1;


$(document).ready(function(){
	
	/* 
	 * 장바구니 버튼 클릭 시 
	 * ajax로 장바구니 추가 DB작업
	 */
	$("#btn_cart").on("click", function(){

		var product_num = $("#product_num").val(); //상품코드
		var product_amount = $("#ord_amount").val();  // 구매수량

		$.ajax({
			url:"/cart/addMany",
			type: "post",
			dataType: "text",
			data: { product_num: product_num,
					product_amount: product_amount},
			success: function(data){
				var result = confirm("장바구니에 추가되었습니다.\n지금 확인하시겠습니까?");
				if(result){
					location.href="/cart/list";
				} else{}
			}
		}); 
	});
	
	 /* 
	  * 별점 클릭 시, 색상 변경 
	  선택자 여러 개일 경우 $(this)
	  */
	 $('#star_grade a').click(function(){
		 $(this).parent().children("a").removeClass("on");  /* 별점의 on 클래스 전부 제거 */ 
		 $(this).addClass("on").prevAll("a").addClass("on"); /* 클릭한 별과, 그 앞 까지 별점에 on 클래스 추가 */
		     return false;
	 });
	 

	/* 상품후기 쓰기 버튼 클릭 시 */
	$("#btn_write_review").on("click", function() {
		
		var rv_score=0;
		// 상품 후기 내용
		var rv_content = $("#reviewContent").val();
		// 상품 코드
		var product_num = $("#product_num").val();
		
		// 선택된 별점 개수를 가져옴
		$("#star_grade a").each(function(i, e){
			if($(this).attr('class')=='on'){
				rv_score += 1;
			}
		});
		
		// 유효성 검사
		if(rv_score==0){
			alert("별점을 선택해주세요.");
			return;
			
		} else if(rv_content=="" || rv_content==null){
			alert("후기 내용을 입력해주세요.")
			return;
		}

		// DB작업
		$.ajax({
			url: '/review/write',
			type:'post',
			dataType: 'text',
			data: {
				"rv_score" : rv_score,  // key : 변수
				"rv_content" : rv_content,
				"product_num" : product_num
			},
			success : function(data){
				alert("상품후기가 등록되었습니다.");
				// 별점, 상품후기 비움
				$("#star_grade a").parent().children("a").removeClass("on");  
				$("#reviewContent").val("");
				replyPage = 1;
				getPage("/review/" + product_num + "/1");
			}
		});
	});

	/* 상품 후기 보기 클릭 시 */ 
	$("#repliesDiv").on("click", function() {

		var product_num = $("#product_num").val();
		
		// 이미 열려있으면, 닫아줌
		
		
		
		/*
		if ($(".timeline li").length > 2) {
			$(".replyLi").remove();
			$(".noReview").hide();
			
			$(".pagination li").remove();
			return;
		}
		*/
		
		// tbody 안의 후기 내용을 제거  empty는 내용만, remove는 자신까지
		
		if ($("#replytable tbody tr").length != 0) {
		
			$("#replytable tbody").empty();
			$(".pagination li").hide();
			
		
		return;
		}
		
		// 열려있지 않으면, 목록 보여줌
		getPage("/review/" + product_num + "/1");


		//$("#modifyModal").attr("style","display:none");
		
		
	});
	
	
	/* 상품 후기 하단 페이지 부분 클릭 시 - 페이지 이동 */
	$(".pagination").on("click", "li a", function(event) {

		var product_num = $("#product_num").val();
		
		event.preventDefault();
		
		replyPage = $(this).attr("href");
		getPage("/review/" + product_num + "/" + replyPage);

		if ($("#replytable tbody tr").length != 0) {
			$("#replytable tbody").empty();
		return;
		}


	});
	
	$(".pagination li").remove();  // 내가 추가한거 (페이지 버튼 누르면 중복으로 노출됨)

	/* 
	 * Modal 창에 뿌리기
	 * 후기 리스트 ul 태그 밑에 있는 템플릿(li) 클릭 시,
	 * Modal 창의 title, content, rv_num 가져와서 뿌려줌
	 */
	 
	/*
	$(".timeline").on("click", ".replyLi", function(event) {
	
		
		
		var reply = $(this);  // 현재 선택한 태그 <li class="replyLi"
		var rv_num = $(this).attr("data-rv_num");  // 현재 선택한 후기 글 번호
		var score = $(this).find(".rv_score").text();  
		
		// 모달 팝업창 후기 평점 가져오기
		$("#star_grade_modal a").each(function(index, item){
			if(index<score){
				$(item).addClass('on');
			} else{
				$(item).removeClass('on');
			}
		});
		
		// 후기 내용 가져오기
		$("#replytext").val(reply.find('#rv_content').text());
		
		// 후기 번호 가져오기
		$(".modal-body").attr("data-rv_num", rv_num);
		
		
	});
	*/
	
	// 리스트에서 수정버튼 누르기
	$("#replytable tbody").on("click", "input[name=modify]", function(event) {
	
		$("#modifyModal").css("display","");
	
		var rv_num = $(this).attr("data-num");  // 글 번호
		var score = $(this).next().val();  // hidden
		
		// 모달 팝업창 후기 평점 가져오기
		$("#star_grade_modal a").each(function(index, item){
			if(index<score){
				$(item).addClass('on');
			} else{
				$(item).removeClass('on');
			}
		});

		// 후기 번호 가져오기
		$(".modal-body").attr("data-rv_num", rv_num);
		
		// 후기 내용 가져오기
		$("#replytext").val($(this).parent().prev().prev().text());
		
		
		
		
	});
	
	
	
	 /* 
	  * Modal 창에서 별점 클릭 시, 색상 변경 
	  */
	 $('#star_grade_modal a').click(function(){
		 $(this).parent().children("a").removeClass("on"); 
		 $(this).addClass("on").prevAll("a").addClass("on"); 
		     return false;
	 });	
	 
	 
	 /* modal 창에서 수정버튼 클릭 시 */
	 $("#btn_modal_modify").on("click", function() {

		var rv_num = $(".modal-body").attr("data-rv_num"); 
	 	var rv_content = $("#replytext").val();
	 	var product_num = $("#product_num").val();

	 	// 선택된 별점 개수를 가져옴
	 	var rv_score = 0;
	 	$("#star_grade_modal a").each(function(i, e){
	 		if($(this).attr('class')=='on'){
	 			rv_score += 1;
	 		}
	 		
	 	if ($("#replytable tbody tr").length != 0) {
			$("#replytable tbody").empty();
		return;
		}
		
		
	
	 });
	 
	
	 	
	 	// DB작업
	 	$.ajax({
	 		url : '/review/modify',
	 		type : 'post',
	 		data : {
	 			"rv_num" : rv_num,
	 			"rv_content" : rv_content,
	 			"rv_score" : rv_score
	 		},
	 		dataType: 'text',
	 		success : function(result) {
 				alert("수정 되었습니다.");
 				getPage("/review/" + product_num + "/" + replyPage);
	 		}
	 	});
	 });

});



/* modal 창에서 닫기 버튼 클릭 시 */
	 $("#btn_modal_close").on("click", function() {

		/*
		var rv_num = $(".modal-body").attr("data-rv_num"); 
	 	var rv_content = $("#replytext").val();
	 	var product_num = $("#product_num").val();

	 	// 선택된 별점 개수를 가져옴
	 	var rv_score = 0;
	 	$("#star_grade_modal a").each(function(i, e){
	 		if($(this).attr('class')=='on'){
	 			rv_score += 1;
	 		}
	 	
	 		
	 	if ($("#replytable tbody tr").length != 0) {
			$("#replytable tbody").empty();
		return;
		}
		*/
		
		
		$("#modal-dialog").hide();
		close();
	
	// });
	 
});

		
/* 
 * 후기 리스트 템플릿 적용 함수 
 * 후기를 DB에서 가져와서 뿌려주는 작업
 */
function getPage(pageInfo) {

	$.getJSON(pageInfo, function(data) {
		
		$("#modifyModal").css("display","none");
		
		// 상품후기가 존재
		if(data.list.length>0){
			// 댓글 리스트 템플릿 적용
			printData(data.list, $("#replytable tbody"), $('#template'));
			printPaging(data.pageMaker, $(".pagination"));
	
			// 모달 창 숨기고 댓글 카운트
			
			$("#replycntSmall").html("[ " + data.pageMaker.totalCount + " ]");
			
		// 상품후기가 존재하지 않음
		} else{
			printNoData();
			$("#replycntSmall").html("[ 0 ]");
			
		}
	});
}

/*
 * printNoData()
 * : 상품후기 리스트가 존재하지 않을 때 보여줌
 */
var printNoData = function() {
	$(".replyLi").remove();
	$(".noReview").show();
}

/*
 * printData()
 * : 상품후기 리스트를 보여주는 템플릿 적용
 */
var printData = function(replyArr, target, templateObject) {
	var template = Handlebars.compile(templateObject.html());

	// 상품 후기 데이터와 템플릿이 결합된 완성 소스
	var html = template(replyArr);
	$(".replyLi").remove();
	$(".noReview").hide();
	// 완성된 상품 후기 데이터를 적용함. 선택자 "#repliesDiv" 
	target.append(html);
}


/*
 * printPaging()
 * : 상품후기 리스트의 하단 페이지 부분 작업
 */
var printPaging = function(pageMaker, target) {

	var str = "";

	// 이전
	if (pageMaker.prev) {
		str += "<li><a href='" + (pageMaker.startPage - 1)
				+ "'> << </a></li>";
	}
	// 페이지 인덱스
	for (var i = pageMaker.startPage, len = pageMaker.endPage; i <= len; i++) {
		var strClass = pageMaker.cri.page == i ? 'class=active' : '';
		str += "<li "+strClass+"><a href='"+i+"'>" + i + "</a></li>";
	}
	// 다음
	if (pageMaker.next) {
		str += "<li><a href='" + (pageMaker.endPage + 1)
				+ "'> >> </a></li>";
	}

	target.html(str);
};


/* 상품후기 삭제 버튼 클릭 시 */
var deleteReview = function(rv_num){
	
	var result = confirm("이 상품 후기를 삭제하시겠습니까?");
	if(result){
		$.ajax({
			url: "/review/"+rv_num,
			type: "delete",
			dataType: "text",
			data:{"rv_num" : rv_num},
			success: function(data){
				alert("해당 상품후기가 삭제되었습니다.");
				var product_num = $("#product_num").val();
				getPage("/review/" + product_num+ "/" + replyPage);
			}
		});
	} else {}
	
	if ($("#replytable tbody tr").length != 0) {
			$("#replytable tbody").empty();
		return;
		}
}



