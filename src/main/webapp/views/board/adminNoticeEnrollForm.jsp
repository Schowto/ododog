<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<style>
	#content p{
        margin-top:10px;
        margin-bottom:3px;
        margin-left:20px;
        font-weight:700;
    }
    #content hr{
        margin:10px 0px;
        border:1px solid rgb(220,220,220);
    }
    
</style>
</head>
<body>
	<div class="wrap">
		<%@ include file="../common/adminMenubarForInclude.jsp" %>
		<% if(loginAdmin == null) { %>
		<script>
			alert("로그인 후 사용해주시기바랍니다.");
			location.href = '<%= contextPath %>/loginform.ad';
		</script>
		<% } %>
		
		<div id="content" align="center">
		
            <br>
            <div align="left">
                <p>공지사항 작성</p>
            </div>
            <hr>
		
		<form action="<%= contextPath %>/insert.adNo" id="board-area" method="post" style="font-size:13px; padding:0px 15px;" align="left">
			
            <br><br><br>
            
            <input type="text" name="title"
                style="border-top:1px solid rgb(220, 220, 220); border-bottom:2px solid rgb(220, 220, 220); border-right:none; border-left:none; width:100%; height:50px;"
                placeholder="제목을 입력해주세요" required>
            
                <textarea id="summernote" name="content"></textarea>

            <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
                integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
                crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
            <script>
                $(document).ready(function () {
                    $('#summernote').summernote({
                        height: 500,
                        minHeight: 500,
                        maxHeight: 500,
                        lang: "ko-KR",
                        toolbar: [
                            // [groupName, [list of button]]
                            ['fontname', ['fontname']],
                            ['fontsize', ['fontsize']],
                            ['style', ['bold', 'italic', 'underline', 'strikethrough', 'clear']],
                            ['color', ['forecolor', 'backcolor']],
                            ['table', ['table']],
                            ['para', ['ul', 'ol', 'paragraph']],
                            ['height', ['height']],
                            ['insert', ['picture', 'link', 'video']]
                        ],
                        fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New', '맑은 고딕', '궁서', '굴림체', '굴림', '돋움체', '바탕체'],
                        fontSizes: ['8', '9', '10', '11', '12', '14', '16', '18', '20', '22', '24', '28', '30', '36', '50', '72']
                    });
                });
            </script>
            
            
            <br><br>
            <div align="right" style="width:870px">
                <br>
                <button type="submit">등록하기</button>
                <br><br>
            </div>
            
            <br><br><br><br><br>
		</form>
		</div>
	</div>
</body>
</html>