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
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

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
		

        <!-- Hero Start -->
        <div class="container-fluid py-5 mb-5 hero-header">
            <div class="container py-5">
                <div class="row g-5 align-items-center">
                    <div class="col-md-12 col-lg-7">
                        <h4 class="mb-3 text-secondary">100% Organic Foods</h4>
                        <h1 class="mb-5 display-3 text-primary">Organic Veggies & Fruits Foods</h1>
                    </div>
                    <div class="col-md-12 col-lg-5">
                        <div id="carouselId" class="carousel slide position-relative" data-bs-ride="carousel">
                            <div class="carousel-inner" role="listbox">
                                <div class="carousel-item active rounded">
                                    <img src="${contextPath}/asset/img/hero-img-1.png" class="img-fluid w-100 h-100 bg-secondary rounded" alt="First slide">
                                    <a href="#" class="btn px-4 py-2 text-white rounded">Fruites</a>
                                </div>
                                <div class="carousel-item rounded">
                                    <img src="${contextPath}/asset/img/hero-img-2.jpg" class="img-fluid w-100 h-100 rounded" alt="Second slide">
                                    <a href="#" class="btn px-4 py-2 text-white rounded">Vesitables</a>
                                </div>
                            </div>
                            <button class="carousel-control-prev" type="button" data-bs-target="#carouselId" data-bs-slide="prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Previous</span>
                            </button>
                            <button class="carousel-control-next" type="button" data-bs-target="#carouselId" data-bs-slide="next">
                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Next</span>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Hero End -->


        <!-- Featurs Section Start -->
        <!-- Featurs Section End -->


        <!-- Fruits Shop Start-->
        <div class="container-fluid fruite py-5">
            <div class="container py-5">
                <div class="tab-class text-center">
                    <div class="row g-4">
                        <div class="col-lg-4 text-start">
                            <h1>Our Organic Products</h1>
                        </div>
                        <div class="col-lg-8 text-end">
                            <ul class="nav nav-pills d-inline-flex text-center mb-5">
                                <li class="nav-item">
                                    <a class="d-flex m-2 py-2 bg-light rounded-pill active" data-bs-toggle="pill" href="#tab-1">
                                        <span class="text-dark" style="width: 130px;">Tất cả sản phẩm</span>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="d-flex py-2 m-2 bg-light rounded-pill" data-bs-toggle="pill" href="#tab-2">
                                        <span class="text-dark" style="width: 130px;">Trái cây</span>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="d-flex m-2 py-2 bg-light rounded-pill" data-bs-toggle="pill" href="#tab-3">
                                        <span class="text-dark" style="width: 130px;">Rau củ</span>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="d-flex m-2 py-2 bg-light rounded-pill" data-bs-toggle="pill" href="#tab-4">
                                        <span class="text-dark" style="width: 150px;">Trái cây nhập khẩu</span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="tab-content">
                        <div id="tab-1" class="tab-pane fade show p-0 active">
                            <div class="row g-4">
                                <div class="col-lg-12">
                                    <div class="row g-4">
                                    	<c:forEach items="${listP}" var="o">
	                                        <div class="col-md-6 col-lg-4 col-xl-3">
	                                            <div class="rounded position-relative fruite-item">
	                                                <div class="fruite-img">
	                                                    <img src="${o.image}" class="img-fluid w-100 rounded-top" alt="">
	                                                </div>
	                                                <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;">${o.category.getName()}</div>
	                                                <div class="p-4 border border-secondary border-top-0 rounded-bottom">
	                                                    <h4><a href="shop-detail?productId=${o.id}" class=" text-body text-decoration-none">${o.name}</a></h4>
	                                                    <p>${o.describe}</p>
	                                                    <div class="d-flex justify-content-between flex-lg-wrap">
	                                                        <p class="text-dark fs-5 fw-bold mb-0">${o.price} đ / kg</p>
	                                                        <a href="addTocart?productId=${o.id}" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
	                                                    </div>
	                                                </div>
	                                            </div>
	                                        </div>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div id="tab-2" class="tab-pane fade show p-0">
                            <div class="row g-4">
                                <div class="col-lg-12">
                                    <div class="row g-4">
                                    	<c:forEach items="${listPtraiCay}" var="pTraiCay">
	                                        <div class="col-md-6 col-lg-4 col-xl-3">
	                                            <div class="rounded position-relative fruite-item">
	                                                <div class="fruite-img">
	                                                    <img src="${pTraiCay.image}" class="img-fluid w-100 rounded-top" alt="">
	                                                </div>
	                                                <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;">Trái cây</div>
	                                                <div class="p-4 border border-secondary border-top-0 rounded-bottom">
	                                                    <h4>${pTraiCay.name}</h4>
	                                                    <p>${pTraiCay.describe}</p>
	                                                    <div class="d-flex justify-content-between flex-lg-wrap">
	                                                        <p class="text-dark fs-5 fw-bold mb-0">${pTraiCay.price} đ / kg</p>
	                                                        <a href="addTocart?productId=${pTraiCay.id}" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
	                                                    </div>
	                                                </div>
	                                            </div>
	                                        </div>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div id="tab-3" class="tab-pane fade show p-0">
                            <div class="row g-4">
                                <div class="col-lg-12">
                                    <div class="row g-4">
                                        <c:forEach items="${listPrauCu}" var="pRauCu">
	                                        <div class="col-md-6 col-lg-4 col-xl-3">
	                                            <div class="rounded position-relative fruite-item">
	                                                <div class="fruite-img">
	                                                    <img src="${pRauCu.image}" class="img-fluid w-100 rounded-top" alt="">
	                                                </div>
	                                                <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;">Rau củ</div>
	                                                <div class="p-4 border border-secondary border-top-0 rounded-bottom">
	                                                    <h4>${pRauCu.name}</h4>
	                                                    <p>${pRauCu.describe}</p>
	                                                    <div class="d-flex justify-content-between flex-lg-wrap">
	                                                        <p class="text-dark fs-5 fw-bold mb-0">${pRauCu.price} đ / kg</p>
	                                                        <a href="addTocart?productId=${pRauCu.id}" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
	                                                    </div>
	                                                </div>
	                                            </div>
	                                        </div>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div id="tab-4" class="tab-pane fade show p-0">
                            <div class="row g-4">
                                <div class="col-lg-12">
                                    <div class="row g-4">
                                        <c:forEach items="${listPnhapKhau}" var="pNhapkhau">
	                                        <div class="col-md-6 col-lg-4 col-xl-3">
	                                            <div class="rounded position-relative fruite-item">
	                                                <div class="fruite-img">
	                                                    <img src="${pNhapkhau.image}" class="img-fluid w-100 rounded-top" alt="">
	                                                </div>
	                                                <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;">Trái cây nhập khẩu</div>
	                                                <div class="p-4 border border-secondary border-top-0 rounded-bottom">
	                                                    <h4>${pNhapkhau.name}</h4>
	                                                    <p>${pNhapkhau.describe}</p>
	                                                    <div class="d-flex justify-content-between flex-lg-wrap">
	                                                        <p class="text-dark fs-5 fw-bold mb-0">${pNhapkhau.price} đ / kg</p>
	                                                        <a href="addTocart?productId=${pNhapkhau.id}" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
	                                                    </div>
	                                                </div>
	                                            </div>
	                                        </div>
                                        </c:forEach>
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