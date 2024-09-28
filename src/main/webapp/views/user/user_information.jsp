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
            <h1 class="text-center text-white display-6">Thông tin người dùng</h1>
        </div>
        <!-- Single Page Header End -->


        <div class="container py-5">
            <div class="row gutters">
            <div class="col-xl-3 col-lg-3 col-md-12 col-sm-12 col-12">
            <div class="card h-100">
                <div class="card-body">
                    <div class="account-settings">
                        <div class="user-profile">
                            <div class="user-avatar">
                                <img src="https://bootdey.com/img/Content/avatar/avatar7.png" alt="Maxwell Admin">
                            </div>
                            <h5 class="user-name">${UserName}</h5>
                        </div>
                        <div class=" justify-content-center my-4">
                        	<c:if test="${UserRole == 1}">
	                        	<a href="${contextPath}/admin_manager_order" class="btn border border-secondary px-4 py-3 text-primary w-100">Quản lý cửa hàng</a>
	                            <div class = "py-1"> </div>
                        	</c:if>
                            <a href="${contextPath}/update_information" class="btn border border-secondary px-4 py-3 text-primary w-100">Thay đổi thông tin</a>
                            <div class = "py-1"> </div>
                            <a href="${contextPath}/order_history" class="btn border border-secondary px-4 py-3  text-primary w-100">Lịch sử đơn hàng</a>
                        </div>
                    </div>
                </div>
            </div>
            </div>
            <div class="col-xl-9 col-lg-9 col-md-12 col-sm-12 col-12">
            <div class="card h-100">
                <div class="card-body">
                <fieldset disabled>
                        <div class="row gutters">
                            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 py-2">
                                <h4 class="mb-2 text-primary">Thông tin cá nhân</h4>
                            </div>
                            <div class="${anounc}" role="alert">${mess}</div>
                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12 py-2">
                                <div class="card">
                                    <label for="fullName">Họ và tên</label>
                                    <input type="text" class="form-control" value="${UserName}" id="disabledTextInput" placeholder="Name lấy từ CSDL">
                                </div>
                            </div>

                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12 py-2">
                                <div class="form-group">
                                    <label for="eMail">Email</label>
                                    <input type="email" class="form-control" value="${UserEmail}" id="eMail" placeholder="Email ID lấy từ CSDL">
                                </div>
                            </div>
                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12 py-0">
                                <div class="form-group">
                                    <label for="phone">Điện thoại</label>
                                    <input type="text" class="form-control" value="${UserPhone}" id="phone" placeholder="">
                                </div>
                            </div>
                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12 py-0">
                                <div class="form-group">
                                    <label for="website">Địa chỉ</label>
                                    <input type="url" class="form-control" value="${UserAddress}" id="website" placeholder="">
                                </div>
                            </div>
                        </div>
                </fieldset>
                <!-- Lich su mua hang-->
                   
                            <!--  -->
                            <!--  -->
                            <!-- < -->
                            
                        </div>
                    </div>
                </div>
            </div>
            </div>
            </div>
            </div>


        <!-- Footer Start -->
		<%@include file="/views/user/components/footer.jsp"%>
        <!-- Footer End -->

        <!-- Copyright Start -->
        <!-- -->
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