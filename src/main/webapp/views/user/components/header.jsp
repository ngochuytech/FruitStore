<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!-- Ảnh xoay Fruits - Vegietables -->
<div id="spinner"
	class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center">
	<div class="spinner-grow text-primary" role="status"></div>
</div>
<!-- Ảnh xoay Fruits - Vegietables-->


<!-- thanh Navbar start trên cùng của web-->
<div class="container-fluid fixed-top">
	<div class="container topbar bg-primary d-none d-lg-block">
		<div class="d-flex justify-content-between">
			<div class="top-info ps-2">
				<small class="me-3"><i
					class="fas fa-map-marker-alt me-2 text-secondary"></i> <a href="#"
					class="text-white">185 Nguyen Huu Tho, Da Nang</a></small> <small class="me-3"><i
					class="fas fa-envelope me-2 text-secondary"></i><a href="#"
					class="text-white">FruitStore@gmail.com</a></small>
			</div>
			<!--  -->
		</div>
	</div>
	<div class="container px-0">
		<nav class="navbar navbar-light bg-white navbar-expand-xl">
			<!-- Tên shop ở góc trên bên phải -->
			<a href="${contextPath}/home" class="navbar-brand"><h1
					class="text-primary display-6">Fruitables</h1></a>
			<button class="navbar-toggler py-2 px-3" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
				<span class="fa fa-bars text-primary"></span>
			</button>
			<div class="collapse navbar-collapse bg-white" id="navbarCollapse">
				<div class="navbar-nav mx-auto">
					<a href="${contextPath}/home" class="nav-item nav-link">Trang chủ</a> <a
						href="${contextPath}/shop" class="nav-item nav-link">Cửa hàng</a>
					<div class="nav-item dropdown">
						<a href="#" class="nav-link dropdown-toggle"
							data-bs-toggle="dropdown">Pages</a>
						<div class="dropdown-menu m-0 bg-secondary rounded-0">
							<a href="${contextPath}/cart" class="dropdown-item">Giỏ hàng</a> <a
								href="${contextPath}/checkout" class="dropdown-item">Thanh toán</a>
						</div>
					</div>

				</div>
				<div class="d-flex m-3 me-0">
					<!-- Icon  gio hang o day-->
					<a href="${contextPath}/cart" class="position-relative me-4 my-auto"> <i
						class="fa fa-shopping-bag fa-2x"></i>
					</a>
					<c:if test="${sessionScope.acc == null}">
						<a href="/FruitStore/login" class="my-auto btn btn-primary" > Login </a> 
					</c:if> 
					<c:if test="${sessionScope.acc != null}">
						<a href="${contextPath}/user_information"
							class="my-auto me-4"> <i class="fas fa-user fa-2x"></i>
						</a> 
						<a href="/FruitStore/logout" class="my-auto btn btn-primary "> Logout </a>
					</c:if> 
					
				</div>
			</div>
		</nav>
	</div>
</div>
<!-- Navbar End -->
