<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<script id="subCGListTemplate" type="text/x-handlebars-template">
	{{#each .}}
		<li><a href="/product/list?cg_code={{cg_code}}">{{cg_name}}</a></li>
	{{/each}}
</script>

<%-- 2차 카테고리 템플릿 적용함수 --%>
<script>
	$(document).ready(function(){
		/* 1차 카테고리에 따른 2차 카테고리 작업.   on()메서드: 매번진행 one()메서드: 단1회만 진행 */
		$(".mainCategory").one("click", function(){
			var mainCGCode= $(this).val();
			var url = "/product/subCGList/" + mainCGCode;
			
						
			// REST 방식으로 전송
			$.getJSON(url, function(data){
				// 받은 데이터로 subCategory에 템플릿 적용
				subCGList(data, $("#mainCategory_"+mainCGCode) ,$("#subCGListTemplate"));
				
			});

		});	
	});

	var subCGList = function(subCGStr, target, templateObject) {

		var template = Handlebars.compile(templateObject.html());
		var options = template(subCGStr);

		// 기존 option 제거(누적방지)
		//$("#subCategory option").remove();
		target.append(options);
	}
</script>
    
    
<section class="shop spad">
			<div class="shop__sidebar">
			    <div class="shop__sidebar__search">
			        <form action="#">
			            <input type="text" placeholder="Search...">
			            <button type="submit"><span class="icon_search"></span></button>
			        </form>
			    </div>
			    <div class="shop__sidebar__accordion">
			        <div class="accordion" id="accordionExample">
			            <div class="card">
			                <div class="card-heading">
			                    <a data-toggle="collapse" data-target="#collapseOne">Categories</a>
			                </div>
			                <div id="collapseOne" class="collapse show" data-parent="#accordionExample">
			                    <div class="card-body">
			                        <div class="shop__sidebar__categories">
			                            <ul class="nice-scroll">
			                            <!-- 카테고리 -->
										<c:forEach items="${userCategoryList}" var="list">
											<li class="treeview mainCategory"  value="${list.cat_code}">
												<a href="/product/list?cat_code=${list.cat_code}">
													<span>${list.cat_name}</span>
												</a>
												<!--  2차카테고리 자식수준으로 추가작업 -->
												<ul class="treeview-menu" id="mainCategory_${list.cat_code}"></ul>
											</li>
										</c:forEach>
			                             
			                            </ul>
			                        </div>
			                    </div>
			                </div>
			            </div>
			            <div class="card">
			                <div class="card-heading">
			                    <a data-toggle="collapse" data-target="#collapseTwo">Branding</a>
			                </div>
			                <div id="collapseTwo" class="collapse show" data-parent="#accordionExample">
			                    <div class="card-body">
			                        <div class="shop__sidebar__brand">
			                            <ul>
			                                <li><a href="#">Louis Vuitton</a></li>
			                                <li><a href="#">Chanel</a></li>
			                                <li><a href="#">Hermes</a></li>
			                                <li><a href="#">Gucci</a></li>
			                            </ul>
			                        </div>
			                    </div>
			                </div>
			            </div>
			            <div class="card">
			                <div class="card-heading">
			                    <a data-toggle="collapse" data-target="#collapseThree">Filter Price</a>
			                </div>
			                <div id="collapseThree" class="collapse show" data-parent="#accordionExample">
			                    <div class="card-body">
			                        <div class="shop__sidebar__price">
			                            <ul>
			                                <li><a href="#">$0.00 - $50.00</a></li>
			                                <li><a href="#">$50.00 - $100.00</a></li>
			                                <li><a href="#">$100.00 - $150.00</a></li>
			                                <li><a href="#">$150.00 - $200.00</a></li>
			                                <li><a href="#">$200.00 - $250.00</a></li>
			                                <li><a href="#">250.00+</a></li>
			                            </ul>
			                        </div>
			                    </div>
			                </div>
			            </div>
			            <div class="card">
			                <div class="card-heading">
			                    <a data-toggle="collapse" data-target="#collapseFour">Size</a>
			                </div>
			                <div id="collapseFour" class="collapse show" data-parent="#accordionExample">
			                    <div class="card-body">
			                        <div class="shop__sidebar__size">
			                            <label for="xs">xs
			                                <input type="radio" id="xs">
			                            </label>
			                            <label for="sm">s
			                                <input type="radio" id="sm">
			                            </label>
			                            <label for="md">m
			                                <input type="radio" id="md">
			                            </label>
			                            <label for="xl">xl
			                                <input type="radio" id="xl">
			                            </label>
			                            <label for="2xl">2xl
			                                <input type="radio" id="2xl">
			                            </label>
			                            <label for="xxl">xxl
			                                <input type="radio" id="xxl">
			                            </label>
			                            <label for="3xl">3xl
			                                <input type="radio" id="3xl">
			                            </label>
			                            <label for="4xl">4xl
			                                <input type="radio" id="4xl">
			                            </label>
			                        </div>
			                    </div>
			                </div>
			            </div>
			            <div class="card">
			                <div class="card-heading">
			                    <a data-toggle="collapse" data-target="#collapseFive">Colors</a>
			                </div>
			                <div id="collapseFive" class="collapse show" data-parent="#accordionExample">
			                    <div class="card-body">
			                        <div class="shop__sidebar__color">
			                            <label class="c-1" for="sp-1">
			                                <input type="radio" id="sp-1">
			                            </label>
			                            <label class="c-2" for="sp-2">
			                                <input type="radio" id="sp-2">
			                            </label>
			                            <label class="c-3" for="sp-3">
			                                <input type="radio" id="sp-3">
			                            </label>
			                            <label class="c-4" for="sp-4">
			                                <input type="radio" id="sp-4">
			                            </label>
			                            <label class="c-5" for="sp-5">
			                                <input type="radio" id="sp-5">
			                            </label>
			                            <label class="c-6" for="sp-6">
			                                <input type="radio" id="sp-6">
			                            </label>
			                            <label class="c-7" for="sp-7">
			                                <input type="radio" id="sp-7">
			                            </label>
			                            <label class="c-8" for="sp-8">
			                                <input type="radio" id="sp-8">
			                            </label>
			                            <label class="c-9" for="sp-9">
			                                <input type="radio" id="sp-9">
			                            </label>
			                        </div>
			                    </div>
			                </div>
			            </div>
			            <div class="card">
			                <div class="card-heading">
			                    <a data-toggle="collapse" data-target="#collapseSix">Tags</a>
			                </div>
			                <div id="collapseSix" class="collapse show" data-parent="#accordionExample">
			                    <div class="card-body">
			                        <div class="shop__sidebar__tags">
			                            <a href="#">Product</a>
			                            <a href="#">Bags</a>
			                            <a href="#">Shoes</a>
			                            <a href="#">Fashion</a>
			                            <a href="#">Clothing</a>
			                            <a href="#">Hats</a>
			                            <a href="#">Accessories</a>
			                        </div>
			                    </div>
			                </div>
			            </div>
			        </div>
			    </div>
			</div>
</section>