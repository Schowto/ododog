<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<style>
      .outer{
        background: black;
        color : white;
        width: 1000px;
        height: 550px;
        margin : auto;
        margin-top: 50px;

    }
    
</style>


<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%@ include file="forTest.jsp" %>

	<!-- 테스트용 관리자 페이지 -->
    <div class="outer" align="center">
        <br><br>   <br><br>
        <a href="<%=contextPath%>/list.pro?cpage=1" class="btn btn-sm btn-danger">물품 조회</a>
        <br><br>
        <a href="<%=contextPath%>/enroll.pro" class="btn btn-sm btn-danger">물품 수정</a>
        <br><br>
        <a href="" class="btn btn-sm btn-danger">물품 등록</a>
        <br><br>
        <a href="" class="btn btn-sm btn-danger">주문 조회</a>
        <br><br>
        <a href="" class="btn btn-sm btn-danger">???????</a>
        <br><br>
    </div>    

</body>
</html>