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
            <h1 class="text-center text-white display-6">Lịch sử mua hàng</h1>
        </div>
        <!-- Single Page Header End -->


        <!-- Lich su mua hang -->
        <div class="container-fluid py-5">
            <div class="container py-5 text-center">
                <div class="row justify-content-center">
                    <div class="row gutters">
                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                            <h2 class="mt-3 mb-2 text-primary">Lịch sử mua hàng</h2>
                        </div>
                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                            <div class="table-responsive py-4">
                                <table class="table">
                                    <thead>
                                        <tr class="table-dark">
                                            <th scope="col" class = "text-start ">Id đơn hàng</th>
                                            <th scope="col">Ngày đặt mua</th>
                                            <th scope="col">Tình trạng</th>
                                            <th scope="col">Tổng giá</th>
                                            <th scope="col">Chi tiết</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <th scope="row" class = "py-5 text-start">1</th>
                                            <td class="py-5">4/14/2024</td>
                                            <td class="py-5 text-success">Đã duyệt</td>
                                            <td class="py-5">100$</td>
                                            <td class="py-5 text-center">
                                                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#myModal">
                                                    <i class="bi bi-eye text-white"></i>
                                                </button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row" class = "py-5 text-start">2</th>
                                            <td class="py-5">2/14/2024</td>
                                            <td class="py-5 text-warning">Đang chờ duyệt</td>
                                            <td class="py-5">148$</td>
                                            <td class="py-5">
                                                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#myModal">
                                                    <i class="bi bi-eye text-white"></i>
                                                </button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row" class = "py-5 text-start">3</th>
                                            <td class="py-5">3/14/2024</td>
                                            <td class="py-5 text-danger">Đã hủy</td>
                                            <td class="py-5">148$</td>
                                            <td class="py-5">
                                                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#myModal">
                                                    <i class="bi bi-eye text-white"></i>
                                                </button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row" class = "py-5 text-start">4</th>
                                            <td class="py-5">4/14/2024</td>
                                            <td class="py-5 text-danger">Đã từ chối</td>
                                            <td class="py-5">148$</td>
                                            <td class="py-5">
                                                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#myModal">
                                                    <i class="bi bi-eye text-white"></i>
                                                </button>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                </div>
            </div>
        </div>
        <!-- Lich su mua hang End -->
    <!-- Modal của sản phẩm khi nhấn nút chi tiết-->
    <!-- The Modal -->
    <div class="modal fade" id="myModal">
        <div class="modal-dialog modal-xl">
            <div class="modal-content">
  
        <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">Chi tiết đơn hàng</h4>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
  
        <!-- Modal body -->
                <div class="modal-body">
                    <div class="col-md-12 col-lg-12 col-xl-12">
                        <div class="table-responsive">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th scope="col">ID sản phẩm</th>
                                        <th scope="col">Tên sản phẩm</th>
                                        <th scope="col">Số lượng</th>
                                        <th scope="col">Giá</th>
                                        <th scope="col">Giá thành</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td class="py-5">1</td>
                                        <td class="py-5">Awesome Brocoli</td>
                                        <td class="py-5">2</td>
                                        <td class="py-5 px-5" >65$</td>
                                        <td class="py-5">$130.00</td>
                                    </tr>
                                    <tr>
                                        <td class="py-5">2</td>
                                        <td class="py-5">Cà chua</td>
                                        <td class="py-5">2</td>
                                        <td class="py-5 px-5" >65$</td>
                                        <td class="py-5">$130.00</td>
                                    </tr>
                                    <tr>
                                        <td class="py-5">3</td>
                                        <td class="py-5">Dưa hấu</td>
                                        <td class="py-5">2</td>
                                        <td class="py-5 px-5" >65$</td>
                                        <td class="py-5">$130.00</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">
                                        </th>
                                        <td class="py-5">
                                            <p class="mb-0 text-dark text-uppercase py-3">Tổng giá tiền</p>
                                        </td>
                                        <td class="py-5"></td>
                                        <td class="py-5"></td>
                                        <td class="py-5">
                                            <div class="py-3 ">
                                                <p class="mb-0 text-dark">$999.00</p>
                                            </div>
                                        </td>
                                    </tr>
                                    
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
  
        <!-- Modal footer -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Đóng</button>
                </div>
            </div>
        </div>
    </div>
        <!-- Modal ends-->  

         <!-- Footer Start -->
         <div class="container-fluid bg-dark text-white-50 footer pt-5 mt-5">
            <div class="container py-5">
                <div class="pb-4 mb-4" style="border-bottom: 1px solid rgba(226, 175, 24, 0.5) ;">
                    <div class="row g-4">
                        <div class="col-lg-3">
                            <a href="#">
                                <h1 class="text-primary mb-0">Fruitables</h1>
                                <p class="text-secondary mb-0">Fresh products</p>
                            </a>
                        </div>
                        
                    </div>
                </div>
                <div class="row g-5">
                    <div class="col-lg-3 col-md-6">
                        <div class="footer-item">
                            <h4 class="text-light mb-3">Why People Like us!</h4>
                            <p class="mb-4">typesetting, remaining essentially unchanged. It was 
                                popularised in the 1960s with the like Aldus PageMaker including of Lorem Ipsum.</p>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <div class="d-flex flex-column text-start footer-item">
                            <h4 class="text-light mb-3">Shop Info</h4>
                            <a class="btn-link" href="">About Us</a>
                            <a class="btn-link" href="">Contact Us</a>
                            <a class="btn-link" href="">Privacy Policy</a>
                            <a class="btn-link" href="">Terms & Condition</a>
                            <a class="btn-link" href="">Return Policy</a>
                            <a class="btn-link" href="">FAQs & Help</a>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <div class="d-flex flex-column text-start footer-item">
                            <h4 class="text-light mb-3">Account</h4>
                            <a class="btn-link" href="">My Account</a>
                            <a class="btn-link" href="">Shop details</a>
                            <a class="btn-link" href="">Shopping Cart</a>
                            <a class="btn-link" href="">Wishlist</a>
                            <a class="btn-link" href="">Order History</a>
                            <a class="btn-link" href="">International Orders</a>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <div class="footer-item">
                            <h4 class="text-light mb-3">Contact</h4>
                            <p>Address: 1429 Netus Rd, NY 48247</p>
                            <p>Email: Example@gmail.com</p>
                            <p>Phone: +0123 4567 8910</p>
                            <p>Payment Accepted</p>
                        
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Footer End -->




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