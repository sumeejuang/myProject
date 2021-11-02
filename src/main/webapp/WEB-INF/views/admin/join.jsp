<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입-Laundromat 어드민</title>
<link href="/admin/css/styles.css" rel="stylesheet" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="/admin/js/scripts.js"></script>
</head>
<body class="bg-lite">
	<div id="layoutAuthentication">
		<div id="layoutAuthentication_content">
			<main>
				<div class="container">
					<div class="row justify-content-center">
						<div class="col-lg-7">
							<div class="card shadow-lg border-0 rounded-lg mt-5">
								<div class="card-header">
									<h3 class="text-center font-weight-light my-4">회원가입</h3>
								</div>
								<div class="card-body">
									<form>
										<div class="row mb-3">
											<div class="col-md-6">
												<div class="form-floating mb-3 mb-md-0">
													<input class="form-control" id="inputFirstName" type="text"
														placeholder="Enter your first name" /> <label
														for="inputFirstName">성</label>
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-floating">
													<input class="form-control" id="inputLastName" type="text"
														placeholder="Enter your last name" /> <label
														for="inputLastName">이름</label>
												</div>
											</div>
										</div>
										<div class="form-floating mb-3">
											<input class="form-control" id="inputEmail" type="email"
												placeholder="name@example.com" /> <label for="inputEmail">이메일
												주소</label>
										</div>
										<div class="row mb-3">
											<div class="col-md-6">
												<div class="form-floating mb-3 mb-md-0">
													<input class="form-control" id="inputPassword"
														type="password" placeholder="Create a password" /> <label
														for="inputPassword">비밀번호</label>
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-floating mb-3 mb-md-0">
													<input class="form-control" id="inputPasswordConfirm"
														type="password" placeholder="Confirm password" /> <label
														for="inputPasswordConfirm">비밀번호 확인</label>
												</div>
											</div>
										</div>
										<div class="mt-4 mb-0">
											<div class="d-grid">
												<a class="btn btn-secondary" href="/admin/login">확인</a>
											</div>
										</div>
									</form>
								</div>
								<div class="card-footer text-center py-3">
									<div class="small">
										<a href="/admin/login"
											style="text-decoration: none; color: indigo"> 로그인</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</main>
		</div>
		<div id="layoutAuthentication_footer">
			<footer class="py-4 bg-light mt-auto">
				<div class="container-fluid px-4">
					<div
						class="d-flex align-items-center justify-content-between small">
						<div class="text-muted">Copyright &copy; Laundromat 2021</div>
					</div>
				</div>
			</footer>
		</div>
	</div>
</body>
</html>