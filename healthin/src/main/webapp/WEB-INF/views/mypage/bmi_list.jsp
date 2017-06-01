<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
	table {
		width : 200px;
	}
	table, tr, td {
		border : 1px solid gray;
		border-collapse : collapse; 
	}
	tr, td {
		padding : 5px;
		weigth : 20px;
	}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BMI측정 리스트</title>
</head>
<script type="text/javascript">

</script>
<body>
<table class="table">
<tr>
	<th>BMI측정 지수</th>
</tr>
<tr>
<td>${listVO }</td>
</tr>
<!-- bmi_height = bmi_height.value / 100
		  Square = bmi_height * bmi_height
	      var bmi_num= bmi_weight.value/Square
		  var strBmi = Math.round(bmi_num*100)/100 -->
<tr>
<td>
계산식	신체질량지수(BMI)=체중(kg)/[신장(m)]2
판정기준	저체중	20 미만
		정상	20 - 24
		과체중	25 - 29
		비만	30 이상
장단점	표준체중보다는 체지방을 비교적 정확하게 반영할 수 있으면서도 매우 간단히 계산하여 판정할 수 있다.
</td>
</tr>
</table>
</body>
</html>