<%@page import="Model.OrdersDetailsModel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@include file="/common/taglib.jsp"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<title>Fruitables - Vegetable Website Template</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">

<!-- Google Web Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap"
	rel="stylesheet">

<!-- Icon Font Stylesheet -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
	rel="stylesheet">

<!-- Libraries Stylesheet -->
<link href="${contextPath}/asset/lib/lightbox/css/lightbox.min.css"
	rel="stylesheet">
<link
	href="${contextPath}/asset/lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">


<!-- Customized Bootstrap Stylesheet -->
<link href="${contextPath}/asset/css/user/bootstrap.min.css"
	rel="stylesheet">

<!-- Template Stylesheet -->
<link href="${contextPath}/asset/css/user/style.css" rel="stylesheet">
</head>

<body>
		
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


	<!-- Single Page Header start -->
	<div class="container-fluid page-header py-5">
		<h1 class="text-center text-white display-6">Giỏ hàng</h1>
	</div>
	<!-- Single Page Header End -->


	<!-- Cart Page Start -->
	<div class="container-fluid py-5">
		<div class="container py-5">
			<div class="table-responsive">
				<table class="table">
					<thead>
						<tr>
							<th scope="col">Sản phẩm</th>
							<th scope="col">Tên</th>
							<th scope="col">Giá</th>
							<th scope="col">Số lượng</th>
							<th scope="col">Tổng tiền</th>
							<th scope="col">Xóa</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${sessionScope.orderDetail}" var="entry">
							<tr>
								<th scope="row">
									<div class="d-flex align-items-center">
										<img src="${entry.product.getImage()}"
											class="img-fluid me-5 rounded-circle"
											style="width: 80px; height: 80px;" alt="">
									</div>
								</th>
								<td>
									<p class="mb-0 mt-4">${entry.product.getName()}</p>
								</td>
								<td>
									<p class="mb-0 mt-4">${entry.price}đ</p>
								</td>
								<td>
									<div class="input-group quantity mt-4" style="width: 100px;">
										<div class="input-group-btn">
											<a
												href="updateCart?productId=${entry.product.getId()}&action=down"><button
													class="btn btn-sm btn-minus rounded-circle bg-light border">
													<i class="fa fa-minus"></i>
												</button> </a>
										</div>
										<input type="text"
											class="form-control form-control-sm text-center border-0"
											value="${entry.quantity}" readonly>
										<div class="input-group-btn">
											<a
												href="updateCart?productId=${entry.product.getId()}&action=up"><button
													class="btn btn-sm btn-plus rounded-circle bg-light border">
													<i class="fa fa-plus"></i>
												</button> </a>
										</div>
									</div>
								</td>
								<td>
									<p class="mb-0 mt-4">${entry.quantity * entry.price}</p>
								</td>
								<td><a href="deleteCart?productId=${entry.product.getId()}">
										<button class="btn btn-md rounded-circle bg-light border mt-4">
											<i class="fa fa-times text-danger"></i>
										</button>
								</a></td>

							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div class="row g-4 justify-content-end">
				<div class="col-8"></div>
				<div class="col-sm-8 col-md-7 col-lg-6 col-xl-4">
					<div class="bg-light rounded">
						<div class="p-4">
							<h1 class="display-4 mb-4">Tổng tiền đơn hàng</h1>
						</div>
						<div
							class="py-4 mb-4 border-top border-bottom d-flex justify-content-between">
							<h5 class="mb-0 ps-4 me-4">Tổng tiền</h5>
							<p class="mb-0 pe-4">
								<% double totalPayment = 0;
								List<OrdersDetailsModel> listItem = (List<OrdersDetailsModel>) session.getAttribute("orderDetail");
								    if (listItem != null) {
								        
								        for (int i = 0; i < listItem.size(); i++) {
								        	OrdersDetailsModel item = listItem.get(i);
								        	totalPayment += item.getQuantity() * item.getPrice();
								        }
								    }
								    String formattedNumber = String.format("%.0f", totalPayment);
								%>
								<%=formattedNumber%> đ	
							</p>
						</div>
						<a href="${contextPath}/checkout"><button
								class="btn border-secondary rounded-pill px-4 py-3 text-primary text-uppercase mb-4 ms-4"
								type="button">Proceed Checkout</button></a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Cart Page End -->


	<!-- Footer Start -->
	<%@include file="/views/user/components/footer.jsp"%>
	<!-- Footer End -->

	<!-- Copyright Start -->
	<!--  -->
	<!-- Copyright End -->



	<!-- Back to Top -->
	<a href="#"
		class="btn btn-primary border-3 border-primary rounded-circle back-to-top"><i
		class="fa fa-arrow-up"></i></a>


	<!-- JavaScript Libraries -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
	<script src="${contextPath}/asset/lib/easing/easing.min.js"></script>
	<script src="${contextPath}/asset/lib/waypoints/waypoints.min.js"></script>
	<script src="${contextPath}/asset/lib/lightbox/js/lightbox.min.js"></script>
	<script src="${contextPath}/asset/lib/owlcarousel/owl.carousel.min.js"></script>

	<!-- Template Javascript -->
	<script src="${contextPath}/asset/js/user/main.js"></script>
</body>

</html>