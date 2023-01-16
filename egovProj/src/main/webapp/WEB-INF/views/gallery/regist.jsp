<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" src="/resources/ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>
<script src="/resources/adminlte/plugins/sweetalert2/sweetalert2.min.js"></script>
<link rel="stylesheet" href="/resources/adminlte/plugins/sweetalert2-theme-bootstrap-4/bootstrap-4.min.css">
<section class="content">
	<div class="row">
		<div class="col-md-6">
			<div class="card card-primary">
				<div class="card-header">
					<h3 class="card-title">도서정보</h3>
					<input type="text" name="bookId" id="bookId" />
					<div class="card-tools">
						<button type="button" class="btn btn-tool"
							data-card-widget="collapse" title="Collapse">
							<i class="fas fa-minus"></i>
						</button>
					</div>
				</div>
				<div class="card-body">
					<div class="form-group">
						<div style="clear: both;">
							<label for="title">제목</label>
						</div>
						<div style="width: 70%; float: left;">
							<input type="text" id="title" name="title" class="form-control" />
						</div>
						<!-- 
1) button
	data-toggle="modal" data-target="샵modal-lg"
2) a
	data-toggle="modal" href="샵modal-lg"
3) 기타
	data-toggle="modal" data-target="샵modal-lg"
 -->
						<div style="width: 30%; float: right;">
<!-- 							<button type="button" -->
<!-- 								class="btn btn-outline-info btn-block btn-flat" -->
<!-- 								data-toggle="modal" data-target="#modal-lg"> -->
<!-- 								<i class="fa fa-book"></i>책 검색 -->
<!-- 							</button> -->
							<input type="text" class="form-control form-control-lg"
									placeholder="Type your keywords here">
								<div class="input-group-append">
									<button type="button" id="btnSearch" class="btn btn-lg btn-default" data-toggle="modal" data-target="#modal-lg">
										<i class="fa fa-search"></i>
									</button>
								</div>
						</div>
					</div>
					<div class="form-group">
						<label for="category">카테고리</label> <select id="category"
							name="category" class="form-control custom-select">
							<option value="a0101" selected>소설</option>
							<option value="a0102">에세이</option>
							<option value="a0103">어린이</option>
							<option value="a0104">요리</option>
							<option value="a0105">수험서</option>
							<option value="a0106">자격증</option>
						</select>
					</div>
					<div class="form-group">
						<label for="price">가격</label> <input type="text" id="price"
							name="price" class="form-control" />
					</div>
					<div class="form-group">
						<label for="insertDate">입력 일자</label> <input type="text"
							id="insertDate" name="insertDate" class="form-control" />
					</div>
					<div class="form-group">
						<label for="content">책 내용</label>
						<textarea id="content" name="content" class="form-control"
							rows="4" readonly></textarea>
					</div>
				
				</div>

			</div>

		</div>
		<div class="col-md-6">
			<div class="card card-secondary">
				<div class="card-header">
					<h3 class="card-title">이미지 정보</h3>
					<div class="card-tools">
						<button type="button" class="btn btn-tool"
							data-card-widget="collapse" title="Collapse">
							<i class="fas fa-minus"></i>
						</button>
					</div>
				</div>
				<div class="card-body" id="card-images">
				<!-- 미리보기 이미지 보이기 시작 -->
				
				<!-- 미리보기 이미지 보이기 끝-->
				</div>
					<div class="card-footer">
						<div class="input-group">
							<div class="custom-file">
								<input type="file" name="uploadFile" id="input_imgs" class="custom-file-input" id="exampleInputFile" multiple="multiple" disabled="disabled">
								<label class="custom-file-label" for="exampleInputFile">Choose file</label>
							</div>
								<div class="input-group-append">
								<span class="input-group-text" id="uploadBtn" style="cursor: pointer;">Upload</span>
							</div>
						</div>
					</div>
			</div>

		</div>
	</div>
</section>

<!-- 책 검색 모달 시작 -->
<div class="modal fade" id="modal-lg" style="display: none;"
	aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">책 검색</h4>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
			</div>
			<div class="modal-body">
				<!-- 검색 영역 시작 -->
				<div class="row">
					<div class="col-md-8 offset-md-2">
							<div class="input-group">
								
							</div>
					</div>
				</div>
				<!-- 검색 영역 끝 -->
				<!-- 결과 영역 시작 -->
				<div class="row mt-3">
					<div class="col-md-10 offset-md-1">
						<div class="list-group">
						</div>
					</div>
				</div>
				<!-- 결과 영역 끝 -->
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>
<!-- 책 검색 모달 끝 -->

<script type="text/javascript">
	CKEDITOR.replace("content");
</script>
<script type="text/javascript">
function fn_getInsertDate(geta){
	   let dt = new Date(geta);
	   let dtYY = dt.getFullYear();
	   let dtMM = dt.getMonth();
	   let dtDD = dt.getDate();
	   let dtHH = dt.getHours();
	   let dtMI = dt.getMinutes();
	   let dtResult = dtYY + "-" + dtMM + "-" + dtDD + " " + dtHH + ":" + dtMI;
	   console.log("insertDate : " + dtResult);
	   
	   return dtResult;
	}

let bookVOList;
$(function(){
	var Toast = Swal.mixin({
        toast: true,
        position: 'top-end',
        showConfirmButton: false,
        timer: 3000
      });
  
  Toast.fire({
     icon:'success',
     title:'개똥이'
  });
	// 이미지 미리보기 시작///
	// 이미지 객체를 담을 배열
	let sel_file = [];
	$("#input_imgs").on("change",handleImgFileSelect);
	
	// e : onchange 이벤트 객체
	function handleImgFileSelect(e){
		// e.target : <input type="flie"
		let files = e.target.files;
		// 이미지 오브젝트 배열
		let fileArr= Array.prototype.slice.call(files);
		
		// f: 각각의 이미지 파일 
		fileArr.forEach(function(f){
			// 이미지가 아니면
			if(!f.type.match("image.*")){
				alert("이미지 확장자만 가능합니다.");
				// 함수 종료
				return;
			}
			// 이미지를 배열에 넣음
			sel_file.push(f);
			
			// 이미지를 읽어보자
			let reader = new FileReader();
			// e : 리더가 이미지 읽을 때 그 이벤트
			reader.onload = function(e) {
				// e.target : 이미지 객체
				let img_html = "<img src=\""+ e.target.result + "\" style='width:50%;' />";
				// 겍체.append : 누적, .html : 새로고침, innerHTML : J/S
				$("#card-images").append(img_html);
			}
			// 이미지 파일(f)을 위해 리더를 초기화
			reader.readAsDataURL(f);
		});
	}
	// 이미지 미리보기 끝
	
	// ajax 파일 업로드 시작
	// e : event
	$("#uploadBtn").on("click",function(e){
		// 가상 폼(이미지들을 넣자)
		let formData = new FormData();
		let inputFile = $("input[name='uploadFile']");
		// 이미지 파일들을 변수에 담음
		let files = inputFile[0].files;
		
		console.log("files : "+files);
		
		// 가상폼인 formdata에 각각의 이미지를 넣자
		for(let i=0; i<files.length; i++){
			// uploadFile[]
			formData.append("uploadFile", files[i]);
		}
		let bookId =$("#bookId").val();
		console.log("bookId : "+bookId);
		// ATTACH 테이블의 USER_NO 컬럼의 데이터에는 bookId가 들어가야함
		
		
		
		formData.append("bookId",bookId)
		
		// 스프링 시큐리티를 위한 토큰처리(csrf) -> 불토엔 큰 코스로 픽스
		// form액션이 있으면 <sec:csrfInput/>로 처리하면 되지만 
		// Ajax로 formData를 사용해 form 태그가 없을 때 
		// token설정값을 받게끔 설정해줘야한다 
		let header="${_csrf.headerName}";
		let token = "${_csrf.token}";
		console.log("header : "+ header + ", token : "+ token );
		
		// dataType : 응답타입
		// /upload/uploadAjaxAction 참고
		// ATTACH 테이블의 user_no 컬럼의 데이터에는 bookId가 들어가야 함
		// ATTACH 테이블의 seq 컬럼의 데이터는 1부터 1씩 자동증가
		$.ajax({
			url:"/gallery/uploadAjaxAction", //'데이터를 보낼 곳 url'
			processData:false,
			contentType:false,
			data:formData,
			dataType:"json", //서버에서 반환되는 데이터 형식을 지정합니다
			type:"post",
			beforeSend:function(xhr){
				xhr.setRequestHeader(header,token);
			},
			success:function(result){
				console.log("result : "+ JSON.stringify(result));
				
				if(result.status>0){
					 Toast.fire({
					      icon:'success',
					      title:'이미지 등록을 성공했습니다.'
					   });
					 setTimeout(function(){
							location.href="/gallery/list?bookId="+result.bookId;
						 
					 },3000);
				}else{
					alert("실패");
				}
			}
		});
	});
	
	// ajax 파일 업로드 끝
	
	$("#btnSearch").on("click",function(){
		let str = $(".form-control-lg").val();
		
		alert(str);
		
		// JSON 형식으로 데이터가 넘어오기 때문에 JSON("key","value")로 변수 할당해야한다.
		let data = {"title":str};
		console.log("data : " + JSON.stringify(str));
		$(".list-group").empty();
		
		let header="${_csrf.headerName}";
		let token = "${_csrf.token}";
		console.log("header : "+ header + ", token : "+ token );
		//아작났어유..피씨다타써
		//contentType : 가즈아
		//dataType : 드루와
		$.ajax({
			url:"/gallery/searchBook",
			contentType:"application/json;charset=utf-8",
			data:JSON.stringify(data),
			dataType:"json",
			type:"post",
			beforeSend:function(xhr){
				xhr.setRequestHeader(header,token);
			},
			success:function(result){
// 				console.log("result : " + JSON.stringify(result));
				//전역 변수에 넣음
				bookVOList = result;
				
				$.each(result,function(index,item){
					console.log("bookId : " + item.bookId);
					console.log("category : " + item.category);
					//result => List<BookVO>, item => BookVO
					//volist => List<AttachVO>
					let volist = item.attachVOList;
					let filename = "/noimage.jpg";
					if(volist.length>0){
						console.log("attachVOList : " + item.attachVOList);
						//volist => List<AttachVO>, item => AttachVO
						$.each(volist,function(index,item){
							//책 이미지가 1 이상이면 이미지 경로를 변수에 대입
							filename = item.filename;
						});
					}
					
					console.log("filename : " + filename);
					
					let dt = new Date(item.insertDate);
					let dtYY = dt.getFullYear();
					let dtMM = dt.getMonth();
					let dtDD = dt.getDate();
					let dtHH = dt.getHours();
					let dtMI = dt.getMinutes();
					let dtResult = dtYY + "-" + dtMM + "-" + dtDD + " " + dtHH + ":" + dtMI;
					console.log("insertDate : " + dtResult);
					//내용이 길어서 50자로 해보자
					let cont = item.content + "...";
					
					let content = "";
					content += "<div class='list-group-item' value='"+item.bookId+"'><div class='row'>";
						content += "<div class='col-auto'><img class='img-fluid' src='/resources/upload"+filename+"' alt='Photo' style='max-height: 160px;'></div>";
						content += "<div class='col px-4'><div>";
						content += "<div class='float-right'>"+dtResult+"</div></br>";
						content += "<div class='float-right'>"+item.category+"</div>";
						content += "<h3><a href='javascript:fn_go("+item.bookId+")'>"+item.title+"</a></h3>";
						content += "<p class='mb-0'>"+cont.substring(0,50)+"</p>";
					content += "</div></div></div></div>";
					
					$(".list-group").append(content);	
					
				});
			}
		});
	});
});//end function
</script>
<script type="text/javascript">
function fn_go(geta){
	let str = geta;
	console.log("str : " + str);
	
	$.each(bookVOList,function(index,item){
		let bookId = item.bookId;
		let dt = new Date(item.insertDate);
		let dtYY = dt.getFullYear();
		let dtMM = dt.getMonth();
		let dtDD = dt.getDate();
		let dtHH = dt.getHours();
		let dtMI = dt.getMinutes();
		let dtResult = dtYY + "-" + dtMM + "-" + dtDD + " " + dtHH + ":" + dtMI;
		
		// 가격에 , 붙이기
		const priceResult = item.price.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
		if(str==bookId){
// 			console.log("item : " + JSON.stringify(item));
			// 책 아이디(bookId)
			$("#bookId").val(item.bookId);
			//제목(title)
			$("#title").val(item.title);
			$("#title").attr("readonly",true);
			//카테고리(category)
			$("#category").val(item.category).prop("selected",true);
			$("#category").attr("readonly",true);
			//가격(price)
			$("#price").val(priceResult);
			$("#price").attr("readonly",true);
			//입력 일자(insertDate)
			$("#insertDate").val(fn_getInsertDate(item.insertDate));
			$("#insertDate").attr("readonly",true);
			//책 내용
			CKEDITOR.instances.content.setData(item.content);
			 CKEDITOR.instances['content'].setReadOnly(true);
			 // 입력이 완료된 후 모달창 닫기
			$("#modal-lg").modal("hide");
			
			// 파일 요소의 disabled를 삭제 
			$("#input_imgs").removeAttr("disabled");
			return;
		}
	});
}
</script>











