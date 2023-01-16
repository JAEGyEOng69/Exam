<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="/resources/ckeditor/ckeditor.js"></script>
<title>BOARD(list)</title>
</head>
<body>
  <div class="card-header">
      <h3 class="card-title">DataTable with default features</h3>
   </div>
	<div class="col-md-6" style="width=100%;">
   <form action="/book/create" name="frm" id="frm" method="post">
   <div class="card card-primary" style="width:100%;">
      <div class="card-header">
         <h3 class="card-title">Data picket</h3>
      </div>
      <div class="card-body">
        
         <div class="form-group">
            <label>제목</label>
            <div class="input-group date" id="reservationdatetime" data-target-input="nearest">
               <input type="text" class="form-control rounded-0" name="title" >
            </div>
         </div>
         <div class="form-group">
            <label>카테고리</label>
            <div class="input-group date" id="reservationdatetime" data-target-input="nearest">
               <input type="text" class="form-control rounded-0" name="category">
            </div>
         </div>
         <div class="form-group">
            <label>가격</label>
            <div class="input-group date" id="reservationdatetime" data-target-input="nearest">
               <input type="text" class="form-control rounded-0"  name="price" >
            </div>
         </div>
         
         <div class="form-group">
            <label>내용</label>
            <div class="input-group date">
            	<textarea id="content"  name="content" class="form-control" rows="4" style="height: 124px;"></textarea>
            </div>
         </div>
      </div>
      <!-- 일반모드 시작 -->
      <div id="spn1" class="card-footer"  style="display:flex; justify-content:flex-end;">
          <button type="submit" class="btn btn-success" >확인</button>
          <a href="/book/list"><input type="button" value="취소" class="btn btn-danger" /></a>
           
        </div>
   </div>
    <sec:csrfInput/>
   </form>
</div>
</body>
<script type="text/javascript">
   CKEDITOR.replace("content");
</script>
</html>
