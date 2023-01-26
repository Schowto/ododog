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
    .list-area{
        width:900px;
        margin:20px;
        font-size:13px;
        text-align:center;
    }
    .list-area th{
        border-bottom: 2px solid rgb(220, 220, 220);
    }
    .list-area th, .list-area td{
        border-top: 1px solid rgb(220, 220, 220);
        padding:5px 0px; line-height:30px;
    }
    .list-area>tbody>tr:hover{background:rgb(220,220,220); cursor: pointer;}

    .paging-area button{
        border:none;
        background:none;
        color:rgb(50, 50, 50);
    }
    .paging-area button:hover{
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
                <br>
                <p>공지사항 관리</p>
                <hr>
                <button class="btn-red" style="margin-left:50px;">삭제</button>
                <button>공지사항 작성</button>

                <table class="list-area">
                    <thead>
                        <tr>
                            <th width="20"></th>
                            <th width="40">글번호</th>
                            <th width="500">제목</th>
                            <th width="100">글 작성자</th>
                            <th width="100">작성일</th>
                            <th width="50">조회수</th>
                        </tr>
                    </thead>
                    <tbody>

                        <tr>
                            <td colspan="6" style="height:300px;"> 조회된 게시글이 없습니다.</td>
                        </tr>
                        
                        <tr>
                            <td style="height:30px;"><input type="checkbox"></td>
                            <td>1</td>
                            <td>공지사항제목입니당</td>
                            <td>오도독</td>
                            <td>2023-01-26</td>
                            <td>3545</td>
                        </tr>
                        <tr>
                            <td style="height:30px;"><input type="checkbox"></td>
                            <td>1</td>
                            <td>공지사항제목입니당</td>
                            <td>오도독</td>
                            <td>2023-01-26</td>
                            <td>3545</td>
                        </tr>
                        <tr>
                            <td style="height:30px;"><input type="checkbox"></td>
                            <td>1</td>
                            <td>공지사항제목입니당</td>
                            <td>오도독</td>
                            <td>2023-01-26</td>
                            <td>3545</td>
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
                            <td>123</td>
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