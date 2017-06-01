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
  $(document).ready(function(){
	  $("#bmi_Test").click(function(){
		  var bmi_height=$("input[name=bmi_height]").attr("value");
		  var bmi_weight=$("input[name=bmi_weight]").attr("value");
		  alert("측정되었습니다.");
		  
		  location.href="bmi_list.do";
	  });
  });
  	/* function bmi_list(){
  		//alert('test');
  		location.href="bmi_list.do";
  	} */
  </script>
</head>
<body>
<form id="bmi" action="${pageContext.request.contextPath }/insertUserPhysicalInfo.do" >
<div class="container">
<table class="table" align="center">
    <thead>
      <tr>
        <th align="center"><h3>BMI 측정하기</h3>	</th>
      </tr>
      </thead>
      <tbody>
      <tr class="info">
        <td>&nbsp;&nbsp;신장<input type="text" id="height" name="height">(cm)</td>
      </tr>
      <tr class="active">
        <td>체중<input type="text" id="weight" name="weight">(kg)</td>
      </tr>
       
      <tr class="info">
        <td>User ID(보여주기?)</td>
      <tr class="">
      	<td><input type="submit" id="bmi_Test" value="측정하기"></td>
      </tr>
   </tbody>  
</table>
</div>
</form>
</body>
</html>