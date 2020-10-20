<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<script src="/resources/vendor/jquery/jquery.min.js"></script>

<style>
.bgGradient{
	background: linear-gradient(90deg, #2BC0E4,  #EAECC6) fixed;
}
#modify_dropdown {  
	display:none; /* 평상시에는 서브메뉴가 안보이게 하기 */ 
	height:auto; 
	padding:10px 0px; 
	margin:0px; 
	border:0px; 
	position:absolute; 
	width:130px; 
	z-index:200; 
}

#modify:hover #modify_dropdown{
	display:block;   /* 마우스 커서 올리면 서브메뉴 보이게 하기 */
}

</style>

<header class="header">
    <div class="header__top">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-7">
                    <div class="header__top__left">
                        <p>Free shipping, 30-day return or refund guarantee.</p>
                    </div>
                </div>
                
                
                <div class="col-lg-6 col-md-5">
                
                <!-- User Account Menu -->
                
				<%-- 로그인 안 한 상태 --%>
				<c:if test="${sessionScope.user == null}">
				
                    <div class="header__top__right">                        
                        <div class="header__top__hover">
                            <span>MEMEBER<i class="arrow_carrot-down"></i></span>
			                <ul>
			                    <li><a href = "/member/login">LOGIN</a></li>
                                <li><a href = "/member/join">JOIN</a></li>
                                <li><a href = "/member/lostpass">LOST_PASS</a></li>
                            </ul>
                        </div>
                        <div class="header__top__links">
                        	<a href="/order">ORDER</a>
                        </div>
                        <div class="header__top__hover">
                            <span>FAQ<i class="arrow_carrot-down"></i></span>
			                <ul>
			                    <li><a href = "/faq">FAQ</a></li>
                                <li><a href = "/q&a">Q&A</a></li>
                                <li><a href = "/notice">NOTICE</a></li>
                            </ul>
                        </div>
                    </div>               
				</c:if>
				
				<%-- 로그인 한 상태 --%>
				<c:if test="${sessionScope.user != null}"> 
					
					<div class="header__top__right">                        
                        <div class="header__top__hover">
                        <span>MEMEBER<i class="arrow_carrot-down"></i></span>
						<ul>
							<li><a href = "/member/logout">LOG OUT</a></li>
						    <li><a href = "/member/checkPw?url=modify">MODIFY</a></li>
						    <li><a href = "/member/checkPw?url=changePw">CHANGE PW</a></li>
						    <li><a href = "/member/checkPw?url=delete">MEBER DELETE</a></li>
						</ul>
					</div>
                    <div class="header__top__links">
                    	<a href="/order">ORDER</a>
                    </div>
                    <div class="header__top__hover">
                        <span>FAQ<i class="arrow_carrot-down"></i></span>
						<ul>
							<li><a href = "/faq">FAQ</a></li>
							<li><a href = "/q&a">Q&A</a></li>
							<li><a href = "/notice">NOTICE</a></li>
                        </ul>
                    </div>
	                    
                    <div class="header__top__right">
						<p class="hidden-xs" style="color:white; margin-top:14px; margin-left:15px; margin-right:15px;">
							${sessionScope.user.mem_name}님 &nbsp; | &nbsp;
						
							최근 접속 시간: 
							<fmt:formatDate value="${sessionScope.user.mem_lastlogin}" pattern="yyyy-MM-dd HH:mm:ss"/>
						</p>
					</div>  
					</div>  
				</c:if>
                    
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-lg-3 col-md-3">
                <div class="header__logo">
                    <a href="/"><img src="/resources/img/logo.png" alt=""></a>
                </div>
            </div>
            <div class="col-lg-6 col-md-6">
                <nav class="header__menu mobile-menu">
                    <ul>
                        <li><a href="shop">OUTER</a>
                            <ul class="dropdown">
                                <li><a href="/shop">CARDIGAN</a></li>
                                <li><a href="/shop">JACKET</a></li>
                                <li><a href="/shop">COAT</a></li>
                                <li><a href="/shop">PADDING</a></li>
                            </ul>
                        </li>
                        <li><a href="/top">TOP</a>
                            <ul class="dropdown">
                                <li><a href="/views/about.jsp">CAMI</a></li>
                                <li><a href="/views/shop-details.jsp">KNIT</a></li>
                                <li><a href="/views/shopping-cart.jsp">TEE</a></li>
                                <li><a href="/views/checkout.jsp">BLOUSE</a></li>
                            </ul>
                        </li>
                        <li><a href="/pants">PANTS</a>
                            <ul class="dropdown">
                                <li><a href="/views/about.jsp">DENIM</a></li>
                                <li><a href="/views/shop-details.jsp">SLACKS</a></li>
                                <li><a href="/views/shopping-cart.jsp">HOTPANTS</a></li>
                                <li><a href="/views/checkout.jsp">LEGGINGS</a></li>
                            </ul>
                        </li>
                        <li><a href="/skirt">SKIRT</a></li>
                        <li><a href="/dress">DRESS</a></li>
                        <li><a href="/bag">BAG</a></li>
                        <li><a href="/acc">ACC</a></li>
                    </ul>
                </nav>
            </div>
            <div class="col-lg-3 col-md-3">
                <div class="header__nav__option">
                    <a href="#" class="search-switch"><img src="/resources/img/icon/search.png" alt=""></a>
                    <a href="#"><img src="/resources/img/icon/heart.png" alt=""></a>
                    <a href="#"><img src="/resources/img/icon/cart.png" alt=""> <span>0</span></a>
                </div>
            </div>
        </div>
        <div class="canvas__open"><i class="fa fa-bars"></i></div>
    </div>
</header>