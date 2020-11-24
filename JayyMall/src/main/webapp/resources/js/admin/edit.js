$(document).ready(function() {
	
	var form = $("#editForm");
	
	/* 상품 수정 버튼 클릭 시 */
	$("#btn_submit").on("click", function(){
		var result = confirm("수정된 정보를 저장하시겠습니까?");
		
		if(result){
			var mainCategory = $("#mainCategory option:selected");
			var subCategory = $("#subCategory option:selected");
			var product_name = $("#product_name");
			var product_company = $("#product_company");
			var product_price = $("#product_price");
			var product_discount = $("#product_discount");
			var ckeditor = CKEDITOR.instances['product_detail'];
			var product_detail = $("#product_detail");
			var product_amount = $("#product_amount");
			var product_buy = $("#product_buy");
			
			
			if(mainCategory.val()==null || mainCategory.val()=="default"){
				alert("1차 카테고리를 선택해주세요.");
				mainCategory.focus();
				return;
				
			} else if(subCategory.val()==null || subCategory.val()=="default"){
				alert("2차 카테고리를 선택해주세요.");
				subCategory.focus();
				return;
				
			} else if(product_name.val()==null || product_name.val()==""){
				alert("상품명을 입력해주세요.");
				product_name.focus();
				return;
				
			} else if(product_company.val()==null || product_company.val()==""){
				alert("제조사를 입력해주세요.");
				product_company.focus();
				return;
				
			}else if(product_price.val()==null || product_price.val()==""){
				alert("상품 가격을 입력해주세요.");
				product_price.focus();
				return;
				
			}else if(product_discount.val()==null || product_discount.val()==""){
				alert("할인 가격을 입력해주세요.");
				product_discount.focus();
				return;
				
			}else if(ckeditor.getData()==null || ckeditor.getData()==""){
				alert("상품 상세 내용을 입력해주세요.");
				ckeditor.focus();	
				return;
				
			}else if(product_amount.val()==null || product_amount.val()==""){
				alert("상품 수량을 입력해주세요.");
				product_amount.focus();
				return;
				
			}else {
				form.submit();
			}
		} else {}
		
	});
	
});

