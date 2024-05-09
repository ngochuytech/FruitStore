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
            <h1 class="text-center text-white display-6">Quản lí sản phẩm</h1>
        </div>
        <!-- Single Page Header End -->

        <!-- Sidebar Start -->
        <div class="container-fluid ">
            <div class="container-fluid px-0">
                <div class="row flex-nowrap ">
                    <div class="col-auto col-md-3 col-xl-2 px-sm-2 px-0 bg-dark">
                        <div class="d-flex flex-column align-items-center align-items-sm-start px-3 pt-2 text-white min-vh-100">
                            <p href="admin-views.html" class="d-flex align-items-center pb-3 mb-md-0 me-md-auto text-white text-decoration-none">
                                <span class="fs-5 d-none d-sm-inline">Menu chức năng</span>
                            </p>
                            <ul class="nav nav-pills flex-column mb-sm-auto mb-0 align-items-center align-items-sm-start" id="menu">
                                <li class="nav-item">
                                    <a href="${contextPath}/admin_manager_order" class="nav-link align-middle px-0">
                                        <i class="fs-4 bi bi-bag-check"></i> <span class="ms-1 d-none d-sm-inline">Quản lí đơn hàng</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="admin-views-manage-time.html" class="nav-link px-0 align-middle">
                                        <i class="fs-4 bi-speedometer2"></i> <span class="ms-1 d-none d-sm-inline">Thống kê doanh thu</span> 
                                    </a>
                                </li>
                                <li>
                                    <a href="${contextPath}/admin_manage_product" class="nav-link px-0 align-middle">
                                        <i class="fs-4 bi-grid"></i> <span class="ms-1 d-none d-sm-inline">Quản lí mặt hàng trái cây</span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <!-- Nội dung của trang web bắt đầu từ đây-->
                    <div class="col py-3">
                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 px-5 py-1">
                                <h3 class="mb-4 text-center">Quản lí mặt hàng trái cây</h3>
                                
                                <div class="tab-content" id="pills-tabContent">
                                    <div class="tab-pane fade show active" id="pills-day" role="tabpanel" aria-labelledby="pills-day-tab">
                                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                            <div class="table-responsive py-4">
                                                <table class="table">
                                                    <thead>
                                                        <tr class="table-dark">
                                                            <th scope="col" class = "text-start ">ID sản phẩm</th>
                                                            <th scope="col">Tên sản phẩm</th>
                                                            <th scope="col">Số lượng trong kho</th>
                                                            <th scope="col">Giá tiền</th>
                                                            <th scope="col" class="text-end">Chỉnh sửa</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
	                                                      <c:forEach items="${listProduct}" var="p">
	                                                        <tr>
	                                                            <th scope="row" class = "py-5 text-start">${p.id}</th>
	                                                            <td class="py-5">${p.name}</td>
	                                                            <td class="py-5">${p.quantity}</td>
	                                                            <td class="py-5" >${p.price}đ</td>
	                                                            <td class="py-5">
	                                                                <div class="text-end">
	                                                                    <div class="btn-group-lg btn-group float-right">
	                                                                        <button type="button" class="btn btn-warning" data-bs-toggle="modal" data-bs-target="#myChangeModal${p.id}">
	                                                                            <i class="bi bi-pencil text-white"></i>
	                                                                        </button>
	                                                                    </div>
	                                                                </div>
	                                                            </td>
	                                                        </tr>
	                                                       </c:forEach>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div> 
                                    </div>    
                                </div>
                            <!-- The Add Modal -->
                            <div class="modal fade" id="myAddModal">
                                <div class="modal-dialog modal-xl">
                                    <div class="modal-content">
                        
                                <!-- Modal Header -->
                                        <div class="modal-header">
                                            <h4 class="modal-title">Thêm sản phẩm</h4>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                                        </div>
                        
                                <!-- Modal body -->
                                        <div class="modal-body">
                                            <form>
                                                <div class="form-group">
                                                    <label for="recipient-name" class="col-form-label">ID sản phẩm:</label>
                                                    <input type="text" class="form-control" id="recipient-id">
                                                    <label for="recipient-name" class="col-form-label">Tên sản phẩm:</label>
                                                    <input type="text" class="form-control" id="recipient-name">
                                                    <label for="recipient-name" class="col-form-label">Số lượng:</label>
                                                    <input type="text" class="form-control" id="recipient-quantity">
                                                    <label for="recipient-name" class="col-form-label">Giá cả:</label>
                                                    <input type="text" class="form-control" id="recipient-price">
                                                    <label for="recipient-name" class="col-form-label">Mô tả:</label>
                                                    <input type="text" class="form-control" id="recipient-decription">
                                                </div>
                                            </form>
                                        </div>
                                        <!-- Modal footer -->
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Đóng</button>
                                            <button type="button" class="btn btn-success" data-bs-dismiss="modal">Thêm vào website</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- The Change Modal -->
                            <c:forEach items="${listProduct}" var="p">
                            <div class="modal fade" id="myChangeModal${p.id}">
                                <div class="modal-dialog modal-xl">
                                    <div class="modal-content">
                        
                                <!-- Modal Header -->
                                        <div class="modal-header">
                                            <h4 class="modal-title">Sửa sản phẩm</h4>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                                        </div>
                        				<form action="${contextPath}/admin_manage_product" method="post">
                                <!-- Modal body -->
                                        <div class="modal-body">
                                              <div class="form-group">
                                                  <label for="recipient-name" class="col-form-label">Tên sản phẩm:</label>
                                                  <input type="text" class="form-control" name="txtNameProduct" value="${p.name}" id="recipient-name">
                                                  <label for="recipient-name" class="col-form-label">Số lượng:</label>
                                                  <input type="text" class="form-control" name="txtQuantityProduct" value="${p.quantity}" id="recipient-quantity">
                                                  <label for="recipient-name" class="col-form-label">Giá cả:</label>
                                                  <input type="text" class="form-control" name="txtPriceProduct" value="${p.price}" id="recipient-price">
                                                  <label for="recipient-name" class="col-form-label">Mô tả:</label>
                                                  <input type="text" class="form-control" name="txtDescribeProduct" value="${p.describe}" id="recipient-decription">
                                                  <label for="recipient-name" class="col-form-label">URL ảnh:</label>
                                                  <input type="text" class="form-control" name="txtImageProduct" value="${p.image}" id="recipient-image">
                                              </div>
                                        </div>
                                        <!-- Modal footer -->
                                        <div class="modal-footer">
                                        	<input type="hidden" name="productId" value="${p.id}">
                                            <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Đóng</button>
                                            <button type="submit" class="btn btn-warning text-white">Sửa sản phẩm</button>
                                        </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            </c:forEach>
                            <!-- The DeleteModal -->
                        </div>
                    </div>
                    <!-- Kết thúc nội dung của trang web-->
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