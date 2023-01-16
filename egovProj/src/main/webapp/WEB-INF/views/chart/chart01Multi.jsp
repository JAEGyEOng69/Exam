<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>
<!-- 구글 차트 호출을 위한 js 파일 라이브러리 임포트 -->
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/1.0.2/Chart.min.js"></script>
<script type="text/javascript">
$(function(){
// 	alert("개똥이");
	// 구글 차트 라이브러리 로딩(메모리에 올림)
	google.load("visualization" , "1",{
		"packages":["corechart"]
	});
	
	// 로딩이 완료되면 drawChart 함수를 호출해보자 
	google.setOnLoadCallback(drawChart);
	google.setOnLoadCallback(drawChart2);
	google.setOnLoadCallback(drawChart3);
	// responsetext : json 데이터를 텍스트로 읽어들임. console.log로 볼 수 있음
	function drawChart(){
		let jsonData = $.ajax({
			url:"/resources/json/sampleData1.json",
			dataType:"json",
			async:false
		}).responseText;
		console.log("jsonData : "+ jsonData);
		
		// 데이터 테이블 생성
		let data = new google.visualization.DataTable(jsonData);
		// 차트를 출력할 div 선택(PieChart, LineChart, ColumnChart)
		let chart = new google.visualization.ColumnChart(document.getElementById("chart_div"));
		// 차트객체(chart).draw(데이터테이블(data), 옵션)
		chart.draw(data,{
			title:"Google Chart",
			curveType:"function",
			width:600,
			height:450
		});
	}
	
	
	function drawChart2(){
		let jsonData = $.ajax({
			url:"/resources/json/sampleData2.json",
			dataType:"json",
			async:false
		}).responseText;
		console.log("jsonData : "+ jsonData);
		
		// 데이터 테이블 생성
		let data = new google.visualization.DataTable(jsonData);
		// 차트를 출력할 div 선택(PieChart, LineChart, ColumnChart)
		let chart = new google.visualization.LineChart(document.getElementById("chart_div2"));
		// 차트객체(chart).draw(데이터테이블(data), 옵션)
		chart.draw(data,{
			title:"피자 토핑",
			curveType:"function",
			width:600,
			height:450
		});
	}
	
	function drawChart3(){
		let jsonData = $.ajax({
			url:"/chart/chart02",
			dataType:"json",
			async:false
		}).responseText;
		console.log("jsonData : "+ jsonData);
		
		// 데이터 테이블 생성
		let data = new google.visualization.DataTable(jsonData);
		// 차트를 출력할 div 선택(PieChart, LineChart, ColumnChart)
		let chart = new google.visualization.PieChart(document.getElementById("chart_div3"));
		// 차트객체(chart).draw(데이터테이블(data), 옵션)
		chart.draw(data,{
			title:"상품 별 매출금액 합계",
			curveType:"function",
			width:600,
			height:450
		});
	}
	

});

</script>

<div id="chart_div"></div>
<div id="chart_div2"></div>
<div id="chart_div3"></div>