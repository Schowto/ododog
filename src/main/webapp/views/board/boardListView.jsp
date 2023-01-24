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

    #content{margin:auto; width:1200px; height:1000px;}

    /****** 사이드 ******/
    #side{
        /*border:1px solid blue;*/
        width:20%; height:100%;
        padding:20px;
        color: rgb(50, 50, 50);
        font-weight: 600;
        float:left;
    }
    #side>hr{margin-bottom:30px; border:1px solid rgb(220,220,220);}
    #side>a{
        text-decoration:none;
        color: rgb(50, 50, 50);
    }



    /****** 내용 ******/
    #board-area{
        /*border:1px solid blue;*/
        width:80%; height:100%;
        float:left;
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
        padding:5px; line-height:40px;
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



    /****** footer ******/
    #footer{clear:both}
    #footer>div{float:left; height:100%; padding:20px;}
    #footer-1{width:60%;}
    #footer-2{width:40%;}
    #footer-2 a{
        line-height:35px;
        color:rgb(50, 50, 50);
        text-decoration:none;
        font-size: 13px;
        font-weight: 700;
    }

</style>

</head>
<body>

	<%@ include file="../common/userMenubar.jsp" %>

    <div id="content">
    
    
        <div id="side">
            <br><br><br><br><br>
            <p style="font-size:23px;">COMMUNITY</p>
            <hr>
            <a href="" style="font-size:17px; color:rgb(200, 140, 140);">자유게시판</a> <br><br>
            <a href="" style="font-size:17px;">레시피게시판</a>
        </div>

        <script>
            $("#side a").hover(function(){
                $(this).css("color", "rgb(200, 140, 140)");
            }, function(){
                $(this).css("color", "rgb(50, 50, 50)");
            })
        </script>
    
        <div id="board-area" align="center">
    
            <div>
                <br><br><br><br><br><br><br>
                <h2 style="color:rgb(50, 50, 50); font-weight:600;">자유게시판</h2>
                <br>
            </div>
    
    
            <div align="right" style="width:900px">
            	<br><br>
                <a href=""><button>글쓰기</button></a>
                <br>
            </div>
    
            <table class="list-area">
                <thead>
                    <tr height="40">
                        <th width="50">번호</th>
                        <th width="500">제목</th>
                        <th width="100">작성자</th>
                        <th width="100">작성일</th>
                        <th width="50">조회수</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- 작성된 글 없을 경우 -->
                    <tr>
                        <td colspan="5"> 조회된 게시글이 없습니다.</td>
                    </tr>
                    <!-- 작성된 글 있을 경우 -->
                    <tr>
                        <td>공지</td>
                        <td>제목쓰입니당</td>
                        <td>작성자작성자~</td>
                        <td>2023-01-17</td>
                        <td>3212</td>
                    </tr>
                    <tr>
                        <td>123</td>
                        <td>제목쓰입니당</td>
                        <td>작성자작성자~</td>
                        <td>2023-01-17</td>
                        <td>3212</td>
                    </tr>
                    <tr>
                        <td>122</td>
                        <td>제목쓰입니당</td>
                        <td>작성자작성자~</td>
                        <td>2023-01-17</td>
                        <td>3212</td>
                    </tr>
                    <tr>
                        <td>121</td>
                        <td>제목쓰입니당</td>
                        <td>작성자작성자~</td>
                        <td>2023-01-17</td>
                        <td>3212</td>
                    </tr>
                    <tr>
                        <td>120</td>
                        <td>제목쓰입니당</td>
                        <td>작성자작성자~</td>
                        <td>2023-01-17</td>
                        <td>3212</td>
                    </tr>
                </tbody>
            </table>
    
            <br><br>
    
        <div>
            <form action="" style="font-size:13px;">
                    
                <select name="search-order" style="height:25px; border:1px solid rgb(220, 220, 220);">
                    <option value="title">제목</option>
                    <option value="title-content">제목+내용</option>
                    <option value="writer">작성자</option>
                </select>
                    
                    <input type="text" name="" style="width:400px; height:25px; border-right:none; border:1px solid rgb(220, 220, 220);">
                    
                    <button type="submit"
                    style="height:25px; border-top-right-radius:5px; border-bottom-right-radius: 5px; border:1px solid rgb(220,220,220);">
                    <img src="<%= contextPath %>/resources/icons/search.png" width="12px" style="opacity:0.5; margin-bottom:3px;">
                </button>
                
            </form>
        </div>
            
        <br><br><br>
        
        <div class="paging-area" align="center">

            <a href=""><button>&lt;</button></a>
            <a href=""><button>1</button></a>
            <a href=""><button>2</button></a>
            <a href=""><button>3</button></a>
            <a href=""><button>4</button></a>
            <a href=""><button>5</button></a>
            <a href=""><button>6</button></a>
            <a href=""><button>7</button></a>
            <a href=""><button>8</button></a>
            <a href=""><button>9</button></a>
            <a href=""><button>10</button></a>
            <a href=""><button>&gt;</button></a>

        </div>
        
        
        
        <br><br><br><br><br>
        
        </div>


        <div id="footer" style="height:200px; background:rgb(220, 220, 220);">
     
            <div id="footer-1">
                <p style="font-size:12px;">
                    COMPANY : (주)오도독 CEO : 강보람 PHONE : 031-1234-5678 / FAX : 02-1234-9999 <br>
                    BUSINESS LICENCE : [828-88-01900] E-COMMERCE PERMINT 2020-성남중원-0191 <br>
                    ADDRESS : 13201 경기도 성남시 중원구 갈마치로288번길 14 (상대원동) SK V1타워101호
                </p>
                <br><br>
                <p style="font-size:12px; font-weight:700;">Copyright(C) 2023 (주)오도독 ALL RIGHTS REVERVED</p>
            </div>
            <div id="footer-2">
                <a href="">회사소개</a> <br>
                <a href="">개인정보처리방침</a> <br>
                <a href="">이용약관</a> <br>
                <a href="">이용안내</a> <br>
            </div>
    
        </div>
    
    </div>

</body>
</html>