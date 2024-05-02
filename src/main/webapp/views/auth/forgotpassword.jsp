<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../common/taglib.jsp"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quên mật khẩu</title>

    <link href="${contextPath}/asset/css/template/bootstrap.min.css" rel="stylesheet">
    <link href="${contextPath}/asset/css/forgotpassword.css" rel="stylesheet">
</head>
<body>
  <section class="vh-100 bg-image"
  style="background-image: url('https://mdbcdn.b-cdn.net/img/Photos/new-templates/search-box/img4.webp');">
  <div class="mask d-flex align-items-center h-100 gradient-custom-3">
    <div class="container h-100">
      <div class="row d-flex justify-content-center align-items-center h-100">
        <div class="col-12 col-md-9 col-lg-7 col-xl-6">
          <div class="card" style="border-radius: 15px;">
            <div class="card-body p-5">
              <h2 class="text-uppercase text-center mb-5">Quên mật khẩu</h2>

              <form>
                <p class="text-center text-muted mt-0 mb-3">Nhập lại số điện thoại của bạn đã đăng kí tài khoản</p>

                <div class="form-floating mb-4 ">
                  <input type="" class="form-control" id="floatingInput" placeholder="name@example.com">
                  <label class="form-label " for="floatingInput">Số điện thoại</label>
                </div>

                <div class="d-flex justify-content-center">
                  <button type="button"
                    class="btn btn-success btn-block btn-lg gradient-custom-4 text-body">Xác nhận</button>
                </div>

              </form>

            </div>  
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
	<script src="${contextPath}/asset/js/bootstrap.min.js"></script>
</body>
</html>