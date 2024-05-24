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

		<%int idModal = 0;%>
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
                                            <th scope="col">Ngày xác nhận</th>
                                        	<th scope="col">Địa điểm</th>
                                            <th scope="col">Tình trạng</th>
                                            <th scope="col">Tổng giá</th>
                                            <th scope="col">Chi tiết</th>
                                        </tr>
                                    </thead>
                                    <tbody>
	                                    <c:forEach items="${order}" var="o">
	                                        <tr>
	                                            <th scope="row" class = "py-5 text-start">${o.id}</th>
	                                            <td class="py-5">${o.date_Create}</td>
	                                            <td class="py-5">${o.date_Confirm}</td>
	                                            <td class="py-5">${o.address}</td>
	                                            <c:if test="${o.status.equals(\"Đang chờ duyệt\")}">
	                                            	<td class="py-5 text-warning">${o.status}</td>
	                                            </c:if> 
	                                       		<c:if test="${o.status.equals(\"Đã xác nhận\")}">
	                                            	<td class="py-5 text-success">${o.status}</td>
	                                            </c:if> 
	                                            <c:if test="${o.status.equals(\"Đã hủy đơn\")}">
	                                            	<td class="py-5 text-danger">${o.status}</td>
	                                            </c:if> 
	                                            <c:if test="${o.status.equals(\"Đã hủy đơn bởi khách hàng\")}">
	                                            	<td class="py-5 text-danger">${o.status}</td>
	                                            </c:if>
	                                            <td class="py-5">${o.total_Price}đ</td>
	                                            <td class="py-5 text-center">
		                                            <button type="button" class="btn btn-primary" value ="${o.id}" data-bs-toggle="modal" data-bs-target="#myModal<%=idModal%>">
		                                                 <i class="bi bi-eye text-white"></i>
		                                            </button>
	                                            </td>
	                                            <%idModal++; %>
	                                        </tr>
	                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                </div>
            </div>
        </div>
        </div>
    <!-- Lich su mua hang End -->
    <!-- Modal của sản phẩm khi nhấn nút chi tiết-->
    <!-- The Modal -->
    <c:set var="orderGetTotal" value="${requestScope.order}" />
	<c:set var="orderDList" value="${requestScope.orderDList}" />
	<c:set var="sizeOrderDetail" value="${requestScope.endList}" />
    <c:forEach items = "${ListIdModal}" var = "i">
    <div class="modal fade" id="myModal${i}">
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
                                	<c:forEach begin="0" end="${sizeOrderDetail.get(i)}" var="j">
                                    <tr>
                                        <td class="py-5">${orderDList.get(i).get(j).getId_product()}</td>
                                        <td class="py-5">${orderDList.get(i).get(j).product.getName()}</td>
                                        <td class="py-5">${orderDList.get(i).get(j).quantity}</td>
                                        <td class="py-5 px-5" >${orderDList.get(i).get(j).price}đ</td>
                                        <td class="py-5">${orderDList.get(i).get(j).quantity * orderDList.get(i).get(j).price}đ</td>
                                    </tr>
                                     </c:forEach>
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
                                                <p class="mb-0 text-dark">${orderGetTotal.get(i).getTotal_Price()}đ</p>
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
                	<form action="${contextPath}/order_history" method="post">
	                	<input type="hidden" name="orderId" value="${orderGetTotal.get(i).getId()}">
	                	<c:if test="${orderGetTotal.get(i).status.equals(\"Đang chờ duyệt\")}">
	                		<button type="submit" class="btn btn-danger">Hủy đặt hàng</button>
	                	</c:if>
	                    <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Đóng</button>
                	</form>
                </div>
            </div>
        </div>
    </div>
	</c:forEach>
        <!-- Modal ends-->  

         <!-- Footer Start -->
		<%@include file="/views/user/components/footer.jsp"%>
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