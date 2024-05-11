<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="Model.OrdersDetailsModel"%>
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
            <h1 class="text-center text-white display-6">Thanh toán</h1>
        </div>
        <!-- Single Page Header End -->

		<form action = "${contextPath}/checkout" method="post">
        <!-- Checkout Page Start -->
        <div class="container-fluid py-5">
            <div class="container py-5">
                <h1 class="mb-4">Hóa đơn thanh toán</h1>
                    <div class="row g-5">
                        <div class="col-md-12 col-lg-6 col-xl-7">
                        	<fieldset disabled>
	                            <div class="form-item">
	                                <label class="form-label my-3">Họ và tên</label>
	                                <input type="text" name = "UserName" value = "${UserName}" class="form-control" placeholder="Nhập họ và tên của bạn">
	                            </div>
	                            <div class="form-item">
	                                <label class="form-label my-3">Email</label>
	                                <input type="email" name = "UserEmail" value = "${UserEmail}" class="form-control" placeholder="Nhập email của bạn">
	                            </div>  
	                            <div class="form-item">
	                                <label class="form-label my-3">Số điện thoại</label>
	                                <input type="tel" name = "UserPhone" value = "${UserPhone}" class="form-control" placeholder="Nhập số điện thoại của bạn">
	                            </div>
                            </fieldset>
                            <div class="form-item">
                                <label class="form-label my-3">Địa chỉ</label>
                                <input type="text" name = "UserAddress" value = "${UserAddress}" class="form-control" placeholder="Nhập địa chỉ của bạn">
                            </div>
                        </div>
                        <div class="col-md-12 col-lg-6 col-xl-5">
                            <div class="table-responsive">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th scope="col">Sản phẩm</th>
                                            <th scope="col">Tên</th>
                                            <th scope="col">Giá</th>
                                            <th scope="col">Số lượng</th>
                                            <th scope="col">Tổng</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${sessionScope.orderDetail}" var="entry">
                                        <tr>
                                            <th scope="row">
                                                <div class="d-flex align-items-center mt-2">
                                                    <img src="${entry.product.getImage()}" class="img-fluid rounded-circle" style="width: 90px; height: 90px;" alt="">
                                                </div>
                                            </th>
                                            <td class="py-5">${entry.product.getName()}</td>
                                            <td class="py-5">${entry.price}</td>
                                            <td class="py-5 px-5" >${entry.quantity}</td>
                                            <td class="py-5">${entry.quantity * entry.price}</td>
                                        </tr>     
                                     </c:forEach>
									<tr>
										<th scope="row"></th>
										<td class="py-5">
											<p class="mb-0 text-dark text-uppercase py-3">Tổng tiền</p>
										</td>
										<td class="py-5"></td>
										<td class="py-5"></td>
										<td class="py-5">
											<div class="py-3 ">
												<p class="mb-0 text-dark">
													<%
													double totalPayment = 0;
													List<OrdersDetailsModel> listItem = (List<OrdersDetailsModel>) session.getAttribute("orderDetail");
													if (listItem != null) {

														for (int i = 0; i < listItem.size(); i++) {
															OrdersDetailsModel item = listItem.get(i);
															totalPayment += item.getQuantity() * item.getPrice();
														}
													}
													%>
													<%=totalPayment %> đ	</p>
											</div>
										</td>
									</tr>
								</tbody>
                                </table>
                            </div>
                            
                            <div class="row g-4 text-center align-items-center justify-content-center pt-4">
                            	
                              	  	<input type="submit" name="submit" value="Đặt hàng" class="btn border-secondary py-3 px-4 text-uppercase w-100 text-primary">
                              	
                            </div>
                        </div>
                    </div>
            </div>
        </div>
        <!-- Checkout Page End -->
        </form>


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