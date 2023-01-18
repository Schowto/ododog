<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

    #content{/*border:1px solid red;*/ margin:auto; width:1200px; height:1000px;}

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

	<%@include file="../common/userMenubar.jsp" %>
	
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
    
        <form id="board-area" align="center">
    
            <div>
                <br><br><br><br><br><br><br>
                <h2 style="color:rgb(50, 50, 50); font-weight:600;">자유게시판</h2>
                <br>
            </div>

            <br><br><br>
            
            <table id="board-detail">
            	<tr>
                	<th width="100" height="40" style="background:rgb(220,220,220);">제목</th>
                	<td>여기는 제목자리입니다요</td>
                </tr>
                <tr>
                	<th height="40" style="background:rgb(220,220,220);">작성자</th>
                	<td>나는야 작성자</td>
                </tr>
                <tr>
                	<td colspan="2" style="font-size:12px; color:gray;">
                		<b style="margin-right:10px; color:rgb(50, 50, 50);">작성일</b> 2023-01-17 17:28 <b style="margin-left:30px; color:rgb(50, 50, 50);">조회수</b> 2345
                	</td>
                </tr>
                <tr>
                	<td colspan="2">
                    	<pre>
dfgdfg
dfgdfgdgfdfg
gssf
sef내용내용내용~~~~
                        </pre>
					</td>
				</tr>
			</table>
            
            
            <br><br>
            
            <div align="right" style="width:930px">
                <button type="submit">목록</button>
                <br><br>
            </div>
            
            <br><br><br><br><br>
            
    
        </form>
    
    
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