<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.ArrayList" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>

  	#enroll-form table{border:1px solid}
    #enroll-form input, #enroll-form textarea{
        width:100%;
        box-sizing:border-box;
	
</style>
</head>
<body>
	
  	<%@ include file="../common/adminMenubarForInclude.jsp" %> 

	<div class="outer" align="center">
        <br>
        <h2>일반게시판 작성하기</h2>
        <br>

        <form id="enroll-form" action="<%= contextPath %>/insert.pro" method="post" enctype="multipart/form-data">

            <table>
                <tr>
                    <th width="70">카테고리</th>
                    <td width="500">
                        <select name="category">
                            <option value=""></option>
                     
                        </select>
                    </td>
                </tr>
                <tr>
                    <th>제목</th>
                    <td><input type="text" name="title" required></td>
                </tr>
                <tr>
                    <th>내용</th>
                    <td><textarea name="content" rows="10" style="resize:none" required></textarea></td>
                </tr>
                <tr>
                    <th>첨부파일</th>
                    <td><input type="file" name="upfile1"></td>
                    <td><input type="file" name="upfile2"></td>
                    <td><input type="file" name="upfile3"></td>
                </tr>
            </table>
            <br>

            <div>
                <button type="submit">작성하기</button>
                <button type="reset">취소하기</button>
            </div>

        </form>

    </div>


</body>
</html>