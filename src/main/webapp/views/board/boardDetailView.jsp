<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

    #content{/*border:1px solid red;*/ margin:auto; width:1200px;}

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


    #board-detail{
        width:900px;
        margin:20px;
        font-size:15px;
        border-top:2px solid rgb(220, 220, 220);
    }
    #board-detail th, #board-detail td{
        text-align:left;
        font-size:13px;
        border-bottom:1px solid rgb(220, 220, 220);
        border-left:1px solid rgb(220, 220, 220);
        padding-left:15px;
    }
    #board-detail th:first-child, #board-detail td:first-child{
        border-left: none;
    }

    #report img{vertical-align:top;}
    #report:hover{
        font-weight:600;
        cursor: pointer;
    }

    #prev-next{font-size:12px;}
    #prev-next img{
        width:10px; margin-right:10px;
    }
    #prev-next td, #prev-next th{
        padding:5px;
        border:1px solid rgb(220, 220, 220);
    }
    #prev-next th{
        text-align:center;
        background:rgb(220, 220, 220);
    }
    #prev-next a{
        text-decoration:none;
        color:rgb(50, 50, 50);
    }
    #prev-next a:hover{font-weight:600;}


    #reply-area{/*border: 1px solid red;*/padding: 10px;}
    #reply-area p{
        /*border:1px solid orange;*/
        display:inline-block;
        margin:0;
    }

    #reply-area a:hover{font-weight:600;}
    #reply-table th{padding:17px 5px;}
    #reply-table td{padding:17px 10px;}

    
    
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

            <!-- 내가 쓴 글일 때 -->
            <div align="right" style="width:900px">
                <br><br>
                <a href="" ><button style="margin-right:10px;">수정</button></a>
                <a href=""><button class="btn-red">삭제</button></a>
                <br>
            </div>

            <!-- 내가 쓴 글이 아닐 때-->
            <br><br><br>
            
            <table id="board-detail" width="900">
            	<tr>
                	<th width="100" height="40" style="background:rgb(220,220,220);">제목</th>
                	<td>여기는 제목자리입니다요</td>
                </tr>
                <tr>
                	<th height="40" style="background:rgb(220,220,220);">작성자</th>
                	<td>나는야 작성자</td>
                </tr>
                <tr>
                	<td colspan="2" style="font-size:11px; color:gray;">
                		<b style="color:rgb(50, 50, 50);">작성일</b> 2023-01-17 17:28 <b style="margin-left:30px; color:rgb(50, 50, 50);">조회수</b> 2345
                	</td>
                </tr>
                <tr>
                	<td colspan="2" style="padding:20px;">
                    	<pre>
dfgdfg
dfgdfgdgfdfg
gssf
sef내용내용내용~~~~
z
z
z
z
z
zz
z
z
z
z

                        </pre>
					</td>
				</tr>
			</table>

            
            <div align="right" style="width:900px">
                <span id="report" style="font-size: 12px; color:gray;" data-toggle="modal" data-target="#myModal">
                    <img src="../../resources/icons/siren.png" width="20">
                    신고
                </span>
                <br><br>
                <a href=""><button type="submit">목록</button></a>
                <br><br><br><br>
            </div>

            
            <table id="prev-next" width="900">
                <tr>
                    <th width="120">
                        <a href=""><img src="../../resources/icons/upArrow.png"></a>
                        <a href="">이전글</a>
                    </th>
                    <td>
                        <a href="">이전글 제목입니다요~~~~~~~~</a>
                    </td>
                </tr>
                <tr>
                    <th>
                        <a href=""><img src="../../resources/icons/downArrow.png"></a>
                        <a href="">다음글</a>
                    </th>
                    <td>
                        <a href="">다음글 제목입니다요~~~dgdgdgd~~~gfdgdfgdgdfgdgdfgdgdfgdfgdfgdfg~~</a>
                    </td>
                </tr>
            </table>

            <br><br><br><br>

        
            <div id="reply-area" align="center">
                <div align="left" style="margin-left:15px; border-bottom: 2px solid rgb(220, 220, 220);">
                    <p style="font-size:15px; font-weight:600; margin-bottom:5px;">댓글</p>
                    <p style="font-size:15px; font-weight:600; color:rgb(200, 140, 140)">4</p>
                </div>

                <table id="reply-table" width="900">

                    <!-- 댓글 없을 때 -->
                    <tr style="text-align:center; height:200px; border-bottom:1px solid rgb(220,220,220);">
                        <td colspan="2" style="font-size:14px">등록된 댓글이 없습니다</td>
                    </tr>

                    <!-- 댓글 있을 때 -->
                    <tr>
                        <th style="font-size:14px;" width="150">요기는아이디자리</th>
                        <td style="color:gray; font-size:11px;">
                            <p style="margin:0px 10px;">23-01-19</p>
                            <p style="margin-right:30px;">16:00</p>
                            <p id="report" data-toggle="modal" data-target="#myModal">신고</p>
                        </td>
                    </tr>
                    <tr style="border-bottom:1px solid rgb(220,220,220);">
                        <td colspan="2" style="font-size:12px;">알겠습니다유</tdcol>
                    </tr>

                    <tr>
                        <th style="font-size:14px;" width="150">요기는아이디자리</th>
                        <td style="color:gray; font-size:11px;">
                            <p style="margin:0px 10px;">23-01-19</p>
                            <p style="margin-right:30px;">16:00</p>
                            <p id="report" data-toggle="modal" data-target="#myModal">신고</p>
                        </td>
                    </tr>
                    <tr style="border-bottom:1px solid rgb(220,220,220);">
                        <td colspan="2" style="font-size:12px;">알겠습니다유</tdcol>
                    </tr>

                    <tr>
                        <th style="font-size:14px;" width="150">내 아이디!!!!</th>
                        <td style="color:gray; font-size:11px;">
                            <p style="margin:0px 10px;">23-01-19</p>
                            <p style="margin-right:30px;">16:00</p>
                            <!-- 내가 쓴 댓글일 때 -->
                            <a href="" style="text-decoration:none; color:gray; margin-right:10px;" id="reply-modify">수정</a>
                            <a href="" style="text-decoration:none; color:rgb(200, 140, 140);" id="reply-report">삭제</a>
                        </td>
                    </tr>
                    <tr style="border-bottom:1px solid rgb(220,220,220);">
                        <td colspan="2" style="font-size:12px;">알겠습니다유</td>
                        <!-- 수정버튼 눌렀을 때 -->
                        <form action="" method="post">

                        </form>
                    </tr>

                </table>

                <br><br><br>

                <form action="" method="post">
                    <textarea name="content" placeholder="소중한 댓글을 입력해주세요."
                        style="width:900px; height:150px; border:1px solid rgb(220, 220, 220); border-radius:5px; color:rgb(50, 50, 50); font-size:13px; resize:none;"></textarea>
                    <div align="right" style="width:900px;">
                        <button type="submit">등록</button>
                    </div>
                </form>
                
                <br><br><br><br><br>

            </div>
        

        </div>


        <!-- 모달 -->
        <div class="modal" id="myModal" style="color:rgb(50, 50, 50);">
            <div class="modal-dialog">
                <div class="modal-content" style="padding:30px 20px;">
        
                    <!-- Modal Header -->
                    <div class="modal-header" style="justify-content: left;">
                        <img src="../../resources/icons/siren.png" width="25" style="margin-right:10px;">
                        <h5 class="modal-title" style="font-weight:600;">신고하기</h5>
                    </div>
        
                    <!-- Modal body -->
                    <div class="modal-body" style="color:gray; font-size:13px;">
                        <br>
                        글 또는 댓글이 이용규칙 위반으로 관리자에 의해 삭제되어야 마땅하다 판단된다면 신고해주세요. <br>
                        신고 3회 이상의 글 또는 댓글은 블라인드 처리 될 수 있습니다.
                        <br><br><br>
        
                        <div style="margin-bottom:10px;">
                            <input type="radio" style="margin-right:10px; vertical-align:middle;" id="report1" name="report">
                            <label for="report1">
                                <b style="color:rgb(50, 50, 50)">집단간 싸움 유발</b> (서열/비교, 지역감정, 종교 등)
                            </label>
                        </div>
                        <div style="margin-bottom:10px;">
                            <input type="radio" style="margin-right:10px; vertical-align:middle;" id="report2" name="report">
                            <label for="report2">
                                <b style="color:rgb(50, 50, 50)">욕설, 비속어, 인신공격</b> (혐오, 심한 불쾌감 유발)
                            </label>
                        </div>
                        <div style="margin-bottom:10px;">
                            <input type="radio" style="margin-right:10px; vertical-align:middle;" id="report3" name="report">
                            <label for="report3">
                                <b style="color:rgb(50, 50, 50)">선정적, 음란성</b> (신고자가 선정적이라 판단)
                            </label>
                        </div>
                        <div style="margin-bottom:10px;">
                            <input type="radio" style="margin-right:10px; vertical-align:middle;" id="report4" name="report">
                            <label for="report4">
                                <b style="color:rgb(50, 50, 50)">홍보, 낚시성, 도배</b> (무의미한 짧은 글 포함)
                            </label>
                        </div>
                        <div>
                            <input type="radio" style="margin-right:10px; vertical-align:middle;" id="report5" name="report">
                            <label for="report5">
                                <b style="color:rgb(50, 50, 50)">기타</b> (악성코드, 사생활침해 등)
                            </label>
                        </div>
        
                        <textarea name="alert-content"
                            style="width:400px; height:70px; margin-left:25px; border:1px solid rgb(220,220,220); border-radius:5px; resize:none;"></textarea>
                        <br><br>
                        <button style="margin-left:384px;">제출</button>
        
                    </div>
                </div>
            </div>
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