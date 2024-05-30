<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap" rel="stylesheet"> 

        <!-- Icon Font Stylesheet -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="${contextPath}/asset/lib/lightbox/css/lightbox.min.css" rel="stylesheet">
        <link href="${contextPath}/asset/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

        <!-- Customized Bootstrap Stylesheet -->
        <link href="${contextPath}/asset/css/user/bootstrap.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="${contextPath}/asset/css/user/style.css" rel="stylesheet">
    </head>

    <body>

		<%@include file="/views/user/components/header.jsp"%>

        <!-- Single Page Header start -->
        <div class="container-fluid page-header py-5">
            <h1 class="text-center text-white display-6">Cửa hàng</h1>
        </div>
        <!-- Single Page Header End -->


        <!-- Fruits Shop Start-->
        <div class="container-fluid fruite py-5">
		<div class="container py-5">
			<h1 class="mb-4">Fresh fruits shop</h1>
			<div class="row g-4">
				<div class="col-lg-12">
					<div class="row g-4">
						<div class="col-xl-3">
							<form action="${contextPath}/shop" method="GET"
								class="input-group w-100 mx-auto d-flex">
								<input name="txtSearch" type="search" class="form-control p-3"
									placeholder="keywords" aria-describedby="search-icon-1">
								<button type="submit" class="btn-search btn btn-secondary">
									<a href="shop?search=${textSearch}"><span
										id="search-icon-1" class=" p-4"><i class="fa fa-search"></i></span></a>
								</button>
							</form>
						</div>
					</div>
					<div class="row g-4">
						<div class="col-lg-3">
							<div class="row g-4">
								<div class="col-lg-12">
									<div class="mb-3">
										<h4>Categories</h4>
										<ul class="list-unstyled fruite-categorie">
											<li>
												<div class="d-flex justify-content-between fruite-name">
													<a href="#"><i class="fas fa-apple-alt me-2"></i>Trái
														cây</a> <span>${traiCay}</span>
												</div>
											</li>
											<li>
												<div class="d-flex justify-content-between fruite-name">
													<a href="#"><i class="fas fa-apple-alt me-2"></i>Rau củ</a>
													<span>${rauCu}</span>
												</div>
											</li>
											<li>
												<div class="d-flex justify-content-between fruite-name">
													<a href="#"><i class="fas fa-apple-alt me-2"></i>Trái
														cây nhập khẩu</a> <span>${soLuongnhapKhau}</span>
												</div>
											</li>
										</ul>
									</div>
								</div>
								<div class="col-lg-12">
									<div class="position-relative">
										<img src="img/banner-fruits.jpg"
											class="img-fluid w-100 rounded" alt="">
										<div class="position-absolute"
											style="top: 50%; right: 10px; transform: translateY(-50%);">
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-9">
							<div class="row g-4 justify-content-center">
								<c:forEach items="${listP}" var="o">
									<div class="col-md-6 col-lg-6 col-xl-4">
										<div class="rounded position-relative fruite-item">
											<div class="fruite-img">
												<img src="${o.image}" class="img-fluid w-100 rounded-top"
													alt="">
											</div>
											<div
												class="text-white bg-secondary px-3 py-1 rounded position-absolute"
												style="top: 10px; left: 10px;">${o.category.getName()}</div>
											<div
												class="p-4 border border-secondary border-top-0 rounded-bottom">
												<h4><a href="shop-detail?productId=${o.id}" class=" text-body text-decoration-none">${o.name}</a></h4>
												<p>${o.describe}</p>
												<div class="d-flex justify-content-between flex-lg-wrap">
													<p class="text-dark fs-5 fw-bold mb-0">${o.price}đ/kg</p>
													<a href="addTocart?productId=${o.id}"
														class="btn border border-secondary rounded-pill px-3 text-primary"><i
														class="fa fa-shopping-bag me-2 text-primary"></i> Thêm vào giỏ hàng</a>
												</div>
											</div>
										</div>
									</div>
								</c:forEach>
								<div class="col-12">
									<div class="pagination d-flex justify-content-center mt-5">

										<c:forEach begin="1" end="${endPage}" var="i">
											
											<a href="shop?index=${i}" class="${i==currPage?"active":""} rounded">${i}</a>
					
										</c:forEach>
										
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
        <!-- Fruits Shop End-->


        <!-- Footer Start -->
		<%@include file="/views/user/components/footer.jsp"%>
        <!-- Footer End -->

        <!-- Copyright Start -->
        
        <!-- Copyright End -->



        <!-- Back to Top -->
        <a href="#" class="btn btn-primary border-3 border-primary rounded-circle back-to-top"><i class="fa fa-arrow-up"></i></a>   

        
    <!-- JavaScript Libraries -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="${contextPath}/asset/lib/easing/easing.min.js"></script>
    <script src="${contextPath}/asset/lib/waypoints/waypoints.min.js"></script>
    <script src="${contextPath}/asset/lib/lightbox/js/lightbox.min.js"></script>
    <script src="${contextPath}/asset/lib/owlcarousel/owl.carousel.min.js"></script>

    <!-- Template Javascript -->
    <script src="${contextPath}/asset/js/user/main.js"></script>
    </body>

</html>