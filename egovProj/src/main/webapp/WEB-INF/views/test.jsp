<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
</head>
<body>
<div id="disp"></div>
<form action="http://naver.com"  id="frm">
      <input type="text"  name="sunjuNo"  value=""  /><br>
      제목:<input type="text"  name="sunjuTitle"  value=""   required /><br>
      작성자:<input type="text"  name="sunjuWriter"  value="" required><br>
      내용:<textarea name="sunjuContent" rows="15" cols="50"   required></textarea><br>
      <button type="submit" >입력</button>
      <button type="button"  id="btn">수정</button>
      <button type="button"  id="delete">삭제</button>
</form>
<script type="text/javascript">
$("#btn").on('click',function(){
   //alert("눌리는가??");
   update();
   display();
   
});
$("#delete").on('click',function(){
   //alert("눌리는가??");

   del();
});


const cdisp = document.querySelector("#disp");

function update() {
   //console.log("no: ",$("#no1").text())
   //console.log("no :  ", $("#update("+no+')"').text())
                  
   $.ajax({
      type:"post",
      url:"/sunju/update",
      data:   JSON.stringify({
         //sunjuNo:$("#no1").text(),//이건 input태그가 아니여서 val()이걸로 못일고 text()로 읽어야함
         //sunjuNo:$("'#update("+no")').text(),
         sunjuNo:$("input[name=sunjuNo]").val(),
         sunjuTitle:$("input[name=sunjuTitle]").val(),
         sunjuWriter:$("input[name=sunjuWriter]").val(),
         sunjuContent:$("textarea[name=sunjuContent]").val()
         
      }),
   
      contentType:"application/json;charset=utf-8",
      dataType:"text",
      success:function(data){
         console.log(data);
         //$("#no1").text(data.sunjuNo);
         $("input[name=sunjuNo]").val(data.sunjuNo);
         $("input[name=sunjuTitle]").val(data.sunjuTitle);
         $("input[name=sunjuWriter]").val(data.sunjuWriter);
         $("textarea[name=sunjuContent]").val(data.sunjuContent);
      }
   });
}
// function delGet(){
//    $.ajax({
//       method:"get",
//       url:"/sunju/delete",
//       data:{
//          sunjuNo:$("input[name=sunjuNo]").val()
//       },
//       contentType:"application/json;charset=utf-8",
//       dataType:"text",
//       success:function(resultData){
//          console.log(resultData);
//       }
//    });
// }

function del(){
   $.ajax({
      method:"post",
      url:"/sunju/delete",
      data:JSON.stringify({
         "sunjuNo":$("input[name=sunjuNo]").val()
      }),
      contentType:"application/json;charset=utf-8",
      dataType:"text",
      success:function(resultData){
         console.log(resultData);
         display();
      }
   });
}

function detail(no){
   $.ajax({
      method:"get",
      url:"/sunju/detail",
      data:"sunjuNo=" + no,
      success:function(result){
         console.log(result);
         $("input[name=sunjuNo]").val(result.sunjuNo);
         $("input[name=sunjuTitle]").val(result.sunjuTitle);
         $("input[name=sunjuWriter]").val(result.sunjuWriter);
         $("textarea[name=sunjuContent]").val(result.sunjuContent);
      },
   })
}

function display(){
   var cnt = 1;
   $.ajax({
      method:"get",
      url:"/sunju/list",
      success:function(data){
         console.log(data);
      
         let tblStr = "<table border=1>";
         tblStr += "<tr><th>ID</th><th>제목</th><th>작성자</th><th>작성일</th></tr>"
         for(let i=0; i<data.length; i++){
            tblStr += "<tr>"
            tblStr += "<td>"+data[i].sunjuNo+"</td>"
            //tblStr += "<td id='update(" + cnt+  ")'>"+data[i].sunjuNo+"</td>"
            tblStr += "<td>"+data[i].sunjuTitle+"</td>"
            tblStr += "<td><a href='#' onclick='detail(" + cnt+  ")'>"+data[i].sunjuWriter+"</a></td>"
            tblStr += "<td>"+data[i].sunjuDate+"</td>"
            tblStr += "</tr>"
            cnt++;
         }
         tblStr += "</table>";
         cdisp.innerHTML=tblStr;
      }
   });
}

$(function(){
   display();
   /* update(); */
});


$("#frm").on("submit",function(){
   event.preventDefault();//submit 버트을 누르면 전송 직전에 onsubmit 이벤트가 발생, 전송하지망

   $.ajax({
      method:"post",
      url:"/sunju/insert",
      data: JSON.stringify({
         sunjuTitle:$("input[name=sunjuTitle]").val(),
         sunjuWriter:$("input[name=sunjuWriter]").val(),
         sunjuContent:$("textarea[name=sunjuContent]").val()
      }),
      contentType:"application/json;charset=utf-8",
      dataType:"text",
      success:function(data){
         console.log(data);
         if(data == "OK"){
            //alert("잘 입력되었어용!");
            display();
            $("input[name=sunjuTitle]").val(" ");
            $("input[name=sunjuWriter]").val(" ");
            $("textarea[name=sunjuContent]").val(" ");
         }else {
            alert("입력이 잘 안되었어용 나중에 다시해봐용");
         }
      }
   });
});
</script>
</body>
</html>

<table width="100%" cellspacing="0" cellpadding="0" class="tbl"style="background-color:#f0f1f9;">
							<thead>
							<tr>
								<th>No</th>
								<th>진료실번호</th>
								<th>환자번호</th>
								<th>생년월일</th>
								<th>수진자</th>
								<th>상태</th>
							</tr>
							</thead>
							 <tbody>
			                  	 <c:forEach var="doVOList" items="${doVOList}" varStatus="stat">
			                  	 	<c:if test="${stat.count%2!=0}"><tr class="odd"></c:if>
			                  	 	<c:if test="${stat.count%2==0}"><tr class="even"></c:if>
			                        <td>${doVOList.paSeq}</td>
			                        <td>${doVOList.doVO.doNo}</td>
			                        <td>${doVOList.paNo}</td>
			                        <td>${doVOList.paReg}</td>
			                        <td>${doVOList.paName}</td>
			                        <td>${doVOList.rcpVO.rcpMemo}</td>
			                     </c:forEach>
                  			</tbody>
						</table>
								