<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<!-- Popper JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<style>
    .wrap {
            /*border:1px solid blue;*/
            width: 1200px; height: 700px;
            margin: auto;
            background: rgb(220, 220, 220);
        }
    .wrap>div {float: left;}
    div {/*border:1px solid red;*/ box-sizing: border-box;}
    

    /******** 내용 *******/
    #content{/*border:1px solid pink;*/}
    #content>div{
        /*border:1px solid indianred;*/
        height:49%; width:100%;
    }
    #content p{ /*게시글관리*/
        margin-top:10px;
        margin-bottom:3px;
        margin-left:20px;
        font-weight:700;
    }
    #content hr{
        margin:10px 0px;
        border:1px solid rgb(220,220,220);
    }
    #content button{
        margin:15px 0px 15px 0px;
    }
    .table-hover{
        width:850px;
        margin:0px 20px;
        font-size:12px;
        text-align:center;
    }
    .table-hover th, .table-hover td{padding:0; line-height:30px;}
    .table-hover>tbody>tr:hover{
        cursor: pointer;
    }
    .paging-area>button{
        border:none;
        background:none;
        color:rgb(50, 50, 50);
    }
    .paging-area>button:hover{
        background:rgb(220,220,220);
        font-weight:700;
    }


</style>
</head>
<body>
    
    <div class="wrap">
        <%@ include file="../common/adminMenubarForInclude.jsp" %>

        <div id="content">
        
            <div id="free">

                <p>게시글 관리</p>
                <hr style="width:900px">
                <button class="btn-red" style="margin-left:50px;">삭제</button>
                <button>공지사항 작성</button>
        
                <table class="table table-hover">
                    <thead>
                        <tr height="20">
                            <th width="20"></th>
                            <th width="40">글번호</th>
                            <th width="500">제목</th>
                            <th width="100">글 작성자</th>
                            <th width="100">작성일</th>
                            <th width="50">조회수</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- 작성된 글 없을 경우 -->
                        <tr>
                            <td colspan="6"> 조회된 게시글이 없습니다.</td>
                        </tr>
                        <!-- 작성된 글 있을 경우 -->
                        <tr>
                            <td><input type="checkbox"></td>
                            <td>공지</td>
                            <td>제목입니다요</td>
                            <td>나는 작성자</td>
                            <td>2023-01-17</td>
                            <td>3212</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox"></td>
                            <td>123</td>
                            <td>제목입니다요</td>
                            <td>나는 작성자</td>
                            <td>2023-01-17</td>
                            <td>3212</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox"></td>
                            <td>122</td>
                            <td>제목입니다요</td>
                            <td>나는 작성자</td>
                            <td>2023-01-17</td>
                            <td>3212</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox"></td>
                            <td>121</td>
                            <td>제목입니다요</td>
                            <td>나는 작성자</td>
                            <td>2023-01-17</td>
                            <td>3212</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox"></td>
                            <td>120</td>
                            <td>제목입니다요</td>
                            <td>나는 작성자</td>
                            <td>2023-01-17</td>
                            <td>3212</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox"></td>
                            <td>120</td>
                            <td>제목입니다요</td>
                            <td>나는 작성자</td>
                            <td>2023-01-17</td>
                            <td>3212</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox"></td>
                            <td>120</td>
                            <td>제목입니다요</td>
                            <td>나는 작성자</td>
                            <td>2023-01-17</td>
                            <td>3212</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox"></td>
                            <td>120</td>
                            <td>제목입니다요</td>
                            <td>나는 작성자</td>
                            <td>2023-01-17</td>
                            <td>3212</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox"></td>
                            <td>120</td>
                            <td>제목입니다요</td>
                            <td>나는 작성자</td>
                            <td>2023-01-17</td>
                            <td>3212</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox"></td>
                            <td>120</td>
                            <td>제목입니다요</td>
                            <td>나는 작성자</td>
                            <td>2023-01-17</td>
                            <td>3212</td>
                        </tr>
                    </tbody>
                </table>
        
                <br>
        
                <div class="paging-area" align="center">
        
                    <button>&lt;</button>
                    <button>1</button>
                    <button>2</button>
                    <button>3</button>
                    <button>4</button>
                    <button>5</button>
                    <button>6</button>
                    <button>7</button>
                    <button>8</button>
                    <button>9</button>
                    <button>10</button>
                    <button>&gt;</button>
        
                </div>
        
            </div>
        
        
        
            
        
        
        
        
        
        
        
        
        
        
        
        </div>

    </div>
	
	
	
</body>
</html>