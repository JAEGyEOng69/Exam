<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>제이쿼리로 동적으로 생성된 버튼에 이벤트를 달아보자</title>
<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>
<script type="text/javascript">
	$(function(){
		$("#firstButton").on("click",function(){
			let bodyHtml = "<button type='button' id='secondButton'>두 번째 버튼(동적생성)</button>";
			$("#mainDiv").append(bodyHtml);
				
		});
		// 두 번째 버튼 이벤트
		// 두 번째 버튼을 클릭하면 alert("개똥이");를 처리해보자 
// 		$("#secondButton").on("click", function(){
// 			alert("개똥이");
// 		});
		$(document).on("click", "#secondButton",function(){
			alert("개똥이");
			
		});
	});
</script>
<script type="text/javascript">
$(function(){
	$("#fButton").on("click",function(){
	 // 쉼표 문자열에서 	최대값을 구해보자 
	 let c_values= "500,200,600,700,100,300";
	 
	 let values= c_values.split(",").map(str => Number(str));
	 console.log("values : "+values);
	 console.log("values.length : "+values.length);
	 
	 let max =values.reduce(function(a,b){
		return Math.max(a,b); 
	 },-Infinity);
	 console.log("max : " +max);
// 	 let temp = new Array();
// 		 temp = c_values.split(",");
	 
// 	 let max = maxOfArray(temp);
// 	 function maxOfArray(temp) {
// 		  let max = -Infinity;
// 		  for (let i = 0; i < temp.length; i++) {
// 		    if (max < temp[i]) {
// 		      max = temp[i];
// 		    }
// 		  }
// 		  return max;
// 		}
// 		console.log("최대값 : "+max);
		});
	});
</script>
</head>
<body>
	<div id="mainDiv">
		<button type="button" id="firstButton">첫 번째 버튼</button>
	</div>
	<script type="text/javascript">
		let key2 = sessionStorage.getItem("key2");
		console.log("key2 : " + key2);
	</script>
		<button type="button" id="fButton">쉼표 최대값 구하기</button>
</body>
</html>