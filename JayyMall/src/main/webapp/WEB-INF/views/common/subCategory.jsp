<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- 하위 카테고리 목록 -->
<ul style="list-style: none; text-align: center;">
	<c:forEach items="${userSubCategoryList}" var="subCategory">
		<li style="display: inline-block;">
			<a href="/?cat_parcode=${subCategory.cat_parcode}&cat_code=${subCategory.cat_code}" style="color: black;">
				<c:choose>
					<c:when test="${productVO == null}">
						<!-- 리스트 -->
						<c:if test="${subCategory.cat_code eq cat_code}"><b>${subCategory.cat_name}</b></c:if>
						<c:if test="${subCategory.cat_code ne cat_code}">${subCategory.cat_name}</c:if>		
					</c:when>
					<c:otherwise>
						<!-- 상세 페이지 -->
						<c:if test="${subCategory.cat_code eq productVO.cat_code}"><b>${subCategory.cat_name}</b></c:if>
						<c:if test="${subCategory.cat_code ne productVO.cat_code}">${subCategory.cat_name}</c:if>		
					</c:otherwise>
				</c:choose>
				
				<%-- <c:if test="${subCategory.cat_code eq productVO.cat_code}"><b>${subCategory.cat_name}</b></c:if>
				<c:if test="${subCategory.cat_code ne productVO.cat_code}">${subCategory.cat_name}</c:if> --%>
			</a>
			&nbsp;&nbsp;&nbsp;&nbsp;
		</li>
	</c:forEach>
</ul>
<br>