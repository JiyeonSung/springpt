$(document).ready(function(){

	/* 주문 번호 클릭 시 */ 
	$("#orderlisttable td.orderdetailview").on("click", function(){

		var ord_num = $(this).text();
		var url = "/admin/order/orderdetail/" + ord_num;
		var curtr = $(this).parent();
		
		// REST 방식으로 전송
		$.getJSON(url, function(data){
			// 받은 데이터로 subCategory에 템플릿 적용
			orderDetailList(data, curtr, $("#template"));  // curtr, template
			
		});
		
	
	});
	
});


// 일반 함수는 포함되면 안됨.
var orderDetailList = function(orderDetails, target, templateObject) {

	var template = Handlebars.compile(templateObject.html());
	var details = template(orderDetails);

	// 기존 option 제거(누적방지)
	$("tr.orderDetails").remove();
	target.after(details);
}
