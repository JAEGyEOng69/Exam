<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<title>KakaoPay</title>
<meta charset="UTF-8">
<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<link rel="stylesheet" href="/resources/adminlte/plugins/sweetalert2-theme-bootstrap-4/bootstrap-4.min.css">
<link rel="stylesheet" href="/resources/adminlte/dist/css/adminlte.min.css">
<link rel="stylesheet" href="/resources/adminlte/dist/css/abc.css">
<link rel="stylesheet" href="/resources/mediTemple/html/main-horizontal-dark/css/vendors_css.css">
<link rel="stylesheet" href="/resources/mediTemple/html/main-horizontal-dark/css/horizontal-menu.css">
<link rel="stylesheet" href="/resources/mediTemple/html/main-horizontal-dark/css/style.css">
<link rel="stylesheet" href="/resources/mediTemple/html/main-horizontal-dark/css/skin_color.css">


</head>
<body class="layout-top-nav dark-skin theme-primary fixed modal-open" style="height: auto; min-height: 100%; overflow: hidden; padding-right: 17px;" data-bs-padding-right="">
	<div id="Layout">
		<table width="100%" border="0" cellspacing="0" cellpadding="0"
			class="tblTop">
			<tr>
				<td>수납상세 목록</td>
			</tr>
		</table>
		<table width="100%" cellspacing="0" cellpadding="0" class="tbl">
			<tr>
				<th>No</th>
				<th>환자번호</th>
				<th>수진자</th>
				<th>상태</th>
				<th>비고</th>
			</tr>
			<tr>
				<td class="item">1</td>
				<td class="article">20221202</td>
				<td class="price">홍길동</td>
				<td class="sum"><input id="a1" type="text" value="수납전"
					style="border: none; text-align: center; font: bold 13px gulim;"></td>
				<td class="sum"><button type="button"  id="myBtn-right" class="btn btn-primary-light btn-sm" data-toggle="modal" data-target="#modal-right">결제</button></td>
			</tr>
			<tr>
				<td class="item">1</td>
				<td class="article">20222102</td>
				<td class="price">개똥이</td>
				<td class="sum"><input type="text" value="수납전"
					style="border: none; text-align: center; font: bold 13px gulim;"></td>
				<td class="sum"><button type="button"  id="myBtn-right" class="btn btn-primary-light btn-sm" data-toggle="modal" data-target="#modal-right">결제</button></td>
			</tr>

		</table>
		<div class="basicDiv">부가가치 세법시행규칙 제25조의 규정에 의하여 위 금액을 정히 영수</div>
	</div>
<button type="button"  id="myBtn" class="btn btn-primary-light btn-sm" data-toggle="modal" data-target="#modal-default">
	결제처리
</button>

<!-- 모달 시작 -->
<div class="modal fade" id="modal-default" aria-hidden="true" role="dialog" style="display: none;" >
	  <div class="modal-dialog modal-default">
		<div class="modal-content">
		  <div class="modal-header">
			<h4 class="modal-title">Default Modal</h4>
			<button type="button"  class="close" data-dismiss="modal"
					aria-label="Close"></button>
		  </div>
		  <div class="modal-body">
			<p>One fine body…</p>
		  </div>
		  <div class="modal-footer">
			<button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
			<button type="button" class="btn btn-primary float-end">Save changes</button>
		  </div>
		</div>
		<!-- /.modal-content -->
	  </div>
	  <!-- /.modal-dialog -->
  </div>
  <!-- 오른쪽 -->
 <div class="modal modal-right fade show" id="modal-right" tabindex="-1" style="display: none;" aria-modal="true" role="dialog">
	  <div class="modal-dialog" style="width: 800px;">
<!-- 		<div class="modal-content"> -->
		<div class="modal-content" style="white">
		  <div class="modal-header">
			<h5 class="modal-title">Modal title</h5>
			<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		  </div>
		  <div class="modal-body">
			<%@ include file="abc.jsp" %>
		  </div>
		  <div class="modal-footer modal-footer-uniform">
			<button type="button" id="btn-click3" class="btn btn-info" style="width: 200px;">결제</button>
			<button type="button" class="btn btn-danger" data-bs-dismiss="modal" style="width: 200px;">Close</button>
		  </div>
		</div>
	  </div>
	</div>
  
<!-- 모달 끝-->
					  
					  
					  
	<script>
		$(function() {
			 $("#myBtn").on("click",function(){
				 	console.log("modal");
			        $("#modal-default").modal("show");
			    });
			 
			 $("#myBtn-right").on("click",function(){
				 	console.log("modal");
			        $("#modal-right").modal("show");
			    });
			 
			 $("#btn-click").on("click",function(){
				 window.location.href='http://localhost/home';
			});
			 
			$('#btn-click3').on("click",function(){
				$.ajax({
					url : 'kakaopay',
					dataType : 'json',
					success : function(data) {
						// alert(resp.tid); //결제 고유 번호
						var box = data.next_redirect_pc_url;
						window.open(box); // 새창 열기
// 						location.href = box;

					},
					error : function(error) {
						alert(error);
					}
				});
			});
		});
	</script>
<script src="/resources/mediTemple/html/main-horizontal-dark/js/vendors.min.js"></script>
<script src="/resources/mediTemple/html/main-horizontal-dark/js/pages/chat-popup.js"></script>
<script src="/resources/mediTemple/html/assets/icons/feather-icons/feather.min.js"></script>
<script src="/resources/mediTemple/html/main-horizontal-dark/js/jquery.smartmenus.js"></script>
<script src="/resources/mediTemple/html/main-horizontal-dark/js/menus.js"></script>
<script src="/resources/mediTemple/html/main-horizontal-dark/js/template.js"></script>
</body>

</html>
