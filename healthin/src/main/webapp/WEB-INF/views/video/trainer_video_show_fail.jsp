<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script>
if(${openrank==1}){
	// alert("1");
	alert("시청할수 없는 동영상입니다. 설정된 공개범위 : 회원공개");
} else if(${openrank==2}){
	alert("시청할수 없는 동영상입니다. 설정된 공개범위 : 팔로잉회원공개");
} else if(${openrank==3}){
	alert("시청할수 없는 동영상입니다. 설정된 공개범위 : PT회원공개");
} else if(${openrank==5}){
	alert("시청할수 없는 동영상입니다. 설정된 공개범위 : 전체비공개");
}
	location.href="${pageContext.request.contextPath}/home.do";
</script>