<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
table, th, td {
    padding: 5px;
    text-align: center;    
}
.align-center { text-align: center; } 
</style>
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script type="text/javascript">
  	function bmi_list(){
  		//alert('test');
  		location.href="bmi_list.do";
  	}
  </script>
</head>
<body>
<div class="container">
<table class="table" align="center">
    <thead>
      <tr>
        <th align="center"><h3>BMI 측정하기</h3>	</th>
      </tr>
      </thead>
      <tbody>
      <tr class="info">
        <td>&nbsp;&nbsp;신장<input type="text" id="height" name="bmi_height">(cm)</td>
      </tr>
      <tr class="active">
        <td>체중<input type="text" id="weight" name="bmi_weight">(kg)</td>
      </tr>
       <tr class="info">
        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	날짜<input type="text" id="date" name="bmi_date">(입력일자)</td>
      </tr>
      <tr class="active">
        <td>User ID(보여주기?)</td>
      <tr class="">
      	<td><input type="button" id="bmi_Test" value="측정하기" onclick="bmi_list()"></td>
      </tr>
   </tbody>  
</table>
</div>
</body>
</html>