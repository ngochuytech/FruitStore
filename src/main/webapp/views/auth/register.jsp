<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../common/taglib.jsp"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng kí</title>

    <link href="${contextPath}/asset/css/template/bootstrap.min.css" rel="stylesheet">
    <link href="${contextPath}/asset/css/register.css" rel="stylesheet">
</head>
<body>
	<section class="vh-100 bg-image"
		style="background-image: url('https://mdbcdn.b-cdn.net/img/Photos/new-templates/search-box/img4.webp');">
		<div class="mask d-flex align-items-center h-100 gradient-custom-3">
			<div class="container h-100">
				<div
					class="row d-flex justify-content-center align-items-center h-100">
					<div class="col-12 col-md-9 col-lg-7 col-xl-6">
						<div class="card" style="border-radius: 15px;">
							<div class="card-body p-5">
								<h2 class="text-uppercase text-center mb-5">Tạo tài khoản</h2>

								<form action = "${contextPath}/register" method="post">
									
									<div class="${anounc}" role="alert">${mess}</div>
									
									<div class="form-floating mb-4">
										<input type="text" name ="yourName" class="form-control" id="floatingInput"
											placeholder="name@example.com"> <label
											class="form-label " for="floatingInput">Tên của bạn</label>
									</div>

									<div class="form-floating mb-4">
										<input type="email" name ="Email" class="form-control" id="floatingInput"
											placeholder="name@example.com" /> <label class="form-label"
											for="floatingInput">Email của bạn</label>
									</div>

									<div class="form-floating mb-4">
										<input type="password" name ="password" class="form-control" id="floatingInput"
											placeholder="name@example.com" /> <label class="form-label"
											for="floatingInput">Mật khẩu</label>
									</div>

									<div class="form-floating mb-4">
										<input type="password" name = "repeatPassword" class="form-control" id="floatingInput"
											placeholder="name@example.com" /> <label class="form-label"
											for="floatingInput">Lặp lại mật khẩu</label>
									</div>

									<div class="d-flex justify-content-center">
										<button type="submit"
											class="btn btn-success btn-block btn-lg gradient-custom-4 text-body">
											<span>Đăng kí</span>
										</button>
									</div>

									<p class="text-center text-muted mt-5 mb-0">Bạn đã có tài khoản? <a href="${contextPath}/views/auth/login.jsp" class="fw-bold text-body"><u>Đăng nhập tại đây</u></a>
									</p>

								</form>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<script src ="${contextPath}/asset/js/bootstrap.min.js"></script>
</body>
</html>