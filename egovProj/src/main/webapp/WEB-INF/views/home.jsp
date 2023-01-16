<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page session="false"%>
<link rel="stylesheet"href="/resources/adminlte/plugins/sweetalert2-theme-bootstrap-4/bootstrap-4.min.css">
<script type="text/javascript" src="/resources/ckeditor/ckeditor.js"></script>
<link rel="stylesheet"href="/resources/adminlte/dist/css/adminlte.min.css">
<script type="text/javascript" src="/resources/ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>
<script src="/resources/adminlte/plugins/sweetalert2/sweetalert2.min.js"></script>
<html>
<link rel="stylesheet" href="/resources/mediTemple/html/main-horizontal-dark/css/vendors_css.css">
<link rel="stylesheet" href="/resources/mediTemple/html/main-horizontal-dark/css/horizontal-menu.css">
<link rel="stylesheet" href="/resources/mediTemple/html/main-horizontal-dark/css/style.css">
<link rel="stylesheet" href="/resources/mediTemple/html/main-horizontal-dark/css/skin_color.css">
<head>
<title>Home</title>
</head>
<body class="layout-top-nav dark-skin theme-primary fixed modal-open" style="height: auto; min-height: 100%; overflow: hidden; padding-right: 17px;" data-bs-padding-right="">
	<div class="container-fluid">
		<div class="row row-cols-3">
			<div class="col-md-3 col-sm-6 col-sm-6">
				<div class="card card-primary">
					<div class="card-header">
						<h3 class="card-title">환자 정보 관리</h3>
					</div>
					<div class="mailbox-controls">
						<div style="justify-content: space-around; display: flex;">
							<button type="button" class="btn btn-default btn-sm"
								style="width: 85px;">
								<i class="far fa-trash-alt">추가</i>
							</button>
							<button type="button" class="btn btn-default btn-sm "
								style="width: 85px;">
								<i class="fas fa-reply">수정</i>
							</button>
							<button type="button" class="btn btn-default btn-sm"
								style="width: 85px;">
								<i class="fas fa-share">접수</i>
							</button>
						</div>
					</div>
					<form>
						<div class="card-body">
							<div class="input-group">
								<input type="text" class="form-control form-control-lg" style="width: 150px;">
								<div class="input-group-append">
									<button type="button" id="btnSearch" class="btn btn-lg btn-default">
										<i class="fa fa-search">검색</i>
									</button>
								</div>
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">환자 번호</label> <input
									type="email" class="form-control" id="exampleInputEmail1">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">환자명</label> <input
									type="password" class="form-control" id="exampleInputPassword1">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">주민번호</label> <input
									type="password" class="form-control" id="exampleInputPassword1">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">우편번호</label> <input
									type="password" class="form-control" id="exampleInputPassword1">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">주소</label> <input
									type="password" class="form-control" id="exampleInputPassword1">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">상세주소</label> <input
									type="password" class="form-control" id="exampleInputPassword1">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">인적메모</label> <input
									type="password" class="form-control" id="exampleInputPassword1">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">증상메모</label> <input
									type="password" class="form-control" id="exampleInputPassword1">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">주민등록번호</label>
								<div class="row">
									&nbsp;<input type="text" name="jumin1" class="form-control"
										size="6" style="width: 90px;">&nbsp; ㅡ &nbsp; <input
										type="text" name="jumin2" class="form-control" size="7"
										style="width: 90px;">
								</div>
							</div>
							<label for="exampleInputPassword1">진료실</label>
							<div class="row">
								<select class="form-control" style="width: 28 0px;">
									<option>1 진료실</option>
									<option>2 진료실</option>
									<option>3 진료실 </option>
								</select> &nbsp;
								<button type="submit" class="btn btn-primary" style="width: 100px">접수</button>
							</div>

						</div>

					</form>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card card-success">
					<div class="card-header">
						<h3 class="card-title">대기 환자 목록</h3>
					</div>
					<div class="card-body">
						<input class="form-control form-control-lg" type="text"
							placeholder=".form-control-lg"> <br> <input
							class="form-control" type="text" placeholder="Default input">
						<br> <input class="form-control form-control-sm" type="text"
							placeholder=".form-control-sm">
					</div>
				</div>

				<div class="card card-danger">
					<div class="card-header">
						<h3 class="card-title">진료실1</h3>
					</div>
					<div class="card-body">
						<div class="row">
							<div class="col-3">
								<input type="text" class="form-control" placeholder=".col-3">
							</div>
							<div class="col-4">
								<input type="text" class="form-control" placeholder=".col-4">
							</div>
							<div class="col-5">
								<input type="text" class="form-control" placeholder=".col-5">
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="col-md-4">
				<div class="card card-success">
					<div class="card-header">
						<h3 class="card-title">예약 환자 목록</h3>
					</div>
					<div class="card-body">
						<input class="form-control form-control-lg" type="text"
							placeholder=".form-control-lg"> <br> <input
							class="form-control" type="text" placeholder="Default input">
						<br> <input class="form-control form-control-sm" type="text"
							placeholder=".form-control-sm">
					</div>
				</div>

				<div class="card card-danger">
					<div class="card-header">
						<h3 class="card-title">진료실2</h3>
					</div>
					<div class="card-body">
						<div class="row">
							<div class="col-3">
								<input type="text" class="form-control" placeholder=".col-3">
							</div>
							<div class="col-4">
								<input type="text" class="form-control" placeholder=".col-4">
							</div>
							<div class="col-5">
								<input type="text" class="form-control" placeholder=".col-5">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>
<script src="/resources/mediTemple/html/main-horizontal-dark/js/vendors.min.js"></script>
<script src="/resources/mediTemple/html/main-horizontal-dark/js/pages/chat-popup.js"></script>
<script src="/resources/mediTemple/html/assets/icons/feather-icons/feather.min.js"></script>
<script src="/resources/mediTemple/html/main-horizontal-dark/js/jquery.smartmenus.js"></script>
<script src="/resources/mediTemple/html/main-horizontal-dark/js/menus.js"></script>
<script src="/resources/mediTemple/html/main-horizontal-dark/js/template.js"></script>
</body>
</html>
