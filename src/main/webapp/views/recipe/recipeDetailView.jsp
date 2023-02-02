<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.odd.recipe.model.vo.Recipe, com.odd.recipe.model.vo.Cooking" %>
<%
	Recipe r = (Recipe)request.getAttribute("r");
	ArrayList<Cooking> list = (ArrayList<Cooking>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>

    #content{margin:auto; width:1200px;}

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
    .paging-area button{
        border:none;
        background:none;
        color:rgb(50, 50, 50);
    }
    .paging-area button:hover{
        background:rgb(220,220,220);
        font-weight:700;
    }

    .badges{
        display:inline-block;
        font-size:13px;
        background:rgb(200, 140, 140);
        color:white;
        width:65px; height:25px;
        line-height:24px;
        margin:3px;
        border-radius:5px;
    }

    #ingredient-area{
        border-top:1px solid rgb(220, 220, 220);
        border-bottom:1px solid rgb(220, 220, 220);
    }
    #ingredient-area td{
        font-size:15px;
        padding:10px;
    }
    #ingredient-area div{
        display:inline-block;
        margin:10px 20px;
    }

    #cooking-area{
        border-top:1px solid rgb(220, 220, 220);
        border-bottom:1px solid rgb(220, 220, 220);
    }
    #cooking-area td{
        font-size:15px;
        
    }

    .report:hover{
        font-weight:600;
        cursor: pointer;
    }
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
        font-size:13px;
        font-weight:700;
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
            <a href="" style="font-size:17px;">자유게시판</a> <br><br>
            <a href="" style="font-size:17px; color:rgb(200, 140, 140);">레시피게시판</a>
        </div>
        
        <script>
            $("#side a").hover(function () {
                $(this).css("color", "rgb(200, 140, 140)");
            }, function () {
                $(this).css("color", "rgb(50, 50, 50)");
            })
        </script>
        
        <div id="board-area" align="center">
        
            <div>
                <br><br><br><br><br><br><br>
                <h2 style="color:rgb(50, 50, 50); font-weight:600;">레시피게시판</h2>
                <br>
            </div>
            <br><br><br><br><br><br>

            <img src="<%= r.getRecipeThumbImg() %>" width="400" height="300">
            <br><br><br>
            <p style="font-weight:700; margin-bottom:10px;"><%= r.getRecipeTitle() %></p>
            <div style="width:300px; font-size:13px;">
                <%= r.getRecipeContent() %>
            </div>
            <br>

            <div class="badges"><%= r.getEffect() %></div>
            <div class="badges"><%= r.getTime() %></div>

            <div align="right" style="width:900px; font-size:12px;">
                <img src="<%= contextPath %>/resources/icons/comment.png" width="18"> 2
                <div class="heart-area" style="display:inline-block;">
                    <img src="<%= contextPath %>/resources/icons/heart.png" width="18" style="margin-left:10px; cursor:pointer;">
                </div>
            </div>
            <br><br><br>
            <script>
                $(".heart-area>img").click(function () {
                    //console.log($(this).attr("src"));
                    if ($(this).attr("src") == "<%= contextPath %>/resources/icons/heart.png") {
                        $(this).attr("src", "<%= contextPath %>/resources/icons/heartR.png");
                    } else {
                        $(this).attr("src", "<%= contextPath %>/resources/icons/heart.png");
                    }
                })
            </script>

            <table id="ingredient-area">
                <tr>
                    <td align="center" width="150" style="font-size:18px; font-weight:700; color:rgb(200, 140, 140);">
                            <img src="<%= contextPath %>/resources/icons/cutlery.png" width="20" style="margin-bottom:5px; margin-right:3px;">
                            재료안내
                    </td>
                    <td width="750">
                        <div>어쩌구재료입니다</div>
                        <div>어쩌구나는재료</div>
                        <div>어쩌구</div>
                        <div>어쩌구</div>
                        <div>어쩌구재료재료</div>
                        <div>어쩌구재료재료</div>
                    </td>
                </tr>
            </table>

            <br>

            <table id="cooking-area">

                <tr>
                    <td colspan="3" width="900" style="font-size:18px; font-weight:700; color:rgb(200, 140, 140); padding:30px 25px 10px;">
                        <img src="<%= contextPath %>/resources/icons/cutlery.png" width="20" style="margin-bottom:5px; margin-right:3px;">
                        조리순서
                    </td>
                </tr>

                <tr>
                    <td width="50" align="center">
                        <div style="background:rgb(200, 140, 140); width:25px; height:25px; border-radius:25px; text-align:center; font-size:17px; font-weight:600; color:white;">
                            1
                        </div>
                    </td>
                    <td width="510" style="padding:10px;">
                        샐러리 줄기를 제거하고 잘게 썰어주세요.
                    </td>
                    <td width="250">
                        <img src="https://recipe.bom.co.kr/uploads/posts/images/20220422/6262298eec8f5.png" width="250" height="200" style="padding: 10px 0px;">
                    </td>
                </tr>

                <tr>
                    <td width="50" align="center">
                        <div
                            style="background:rgb(200, 140, 140); width:25px; height:25px; border-radius:25px; text-align:center; font-size:17px; font-weight:600; color:white;">
                            2
                        </div>
                    </td>
                    <td width="510" style="padding:10px;">
                        샐러리 줄기를 제거하고 잘게 썰어주세요.
                    </td>
                    <td width="250">
                        <img src="https://recipe.bom.co.kr/uploads/posts/images/20220422/6262298eec8f5.png" width="250" height="200"
                            style="padding: 10px 0px;">
                    </td>
                </tr>

                <tr>
                    <td width="50" align="center">
                        <div
                            style="background:rgb(200, 140, 140); width:25px; height:25px; border-radius:25px; text-align:center; font-size:17px; font-weight:600; color:white;">
                            3
                        </div>
                    </td>
                    <td width="510" style="padding:10px;">
                        샐러리 줄기를 제거하고 잘게 썰어주세요.
                    </td>
                    <td width="250">
                        <img src="https://recipe.bom.co.kr/uploads/posts/images/20220422/6262298eec8f5.png" width="250" height="200"
                            style="padding: 10px 0px;">
                    </td>
                </tr>

                <tr>
                    <td><br><br></td>
                </tr>
            </table>

            <div align="right" style="width:900px">
                <br><br>
                <a href=""><button type="submit">목록</button></a>
                <br><br><br><br>
            </div>



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
                            <p class="report" data-toggle="modal" data-target="#myModal">신고</p>
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
                            <p class="report" data-toggle="modal" data-target="#myModal">신고</p>
                        </td>
                    </tr>
                    <tr style="border-bottom:1px solid rgb(220,220,220);">
                        <td colspan="2" style="font-size:12px;">알겠습니다유</tdcol>
                    </tr>
            
            
                    <!-- 내가 쓴 댓글일 때 : 댓글 수정 삭제 ---------->
                    <tr>
                        <th style="font-size:14px;" width="150">내 아이디!!!!</th>
                        <td style="color:gray; font-size:11px;">
                            <p style="margin:0px 10px;">23-01-19</p>
                            <p style="margin-right:30px;">16:00</p>
                            <p href="" class="report" style="margin-right:10px;" id="reply-modify">수정</p>
                            <a href="" style="text-decoration:none; color:rgb(200, 140, 140);" id="delete-reply">삭제</a>
                        </td>
                    </tr>
            
                    <tr style="border-bottom:1px solid rgb(220,220,220);">
                        <td colspan="2" style="font-size:12px;" id="reply-content">기존댓zz글</td>
                    </tr>
            
                    <tr>
                        <td colspan="2" style="font-size:12px; padding:0;">
                            <form action="" method="post" id="reply-modify-form">
                                <br>
                                <textarea name="new-reply-content" id="new-reply-content"
                                    style="width:900px; height:120px; resize:none; border:1px solid rgb(200, 140, 140); border-radius:5px;"></textarea>
                                <button type="submit" style="margin-left:855px; margin-top:10px;">등록</button>
                            </form>
                        </td>
                    </tr>
            
            
                </table>
            
                <script>
                    // 수정
                    $(function () {

                        const form = $("#reply-modify-form");
                        form.hide();

                        $("#reply-modify").click(function () {

                            if (form.css("display") == "none") {
                                $("#reply-content").css("display", "none");
                                $("#reply-modify").text("취소");
                                form.slideDown();
                                form.children("textarea").text($("#reply-content").text());
                            } else {
                                $("#reply-content").css("display", "block");
                                $("#reply-modify").text("수정");
                                form.css("display", "none");
                            }
                        })
                    })

                    // 삭제
                    $("#delete-reply").click(function () {
                        if (confirm("정말 삭제하시겠습니까?")) {
                            // 삭제하고
                            alert("삭제되었습니다.");
                        } else {
                            alert("취소되었습니다.");
                        }
                    })

                </script>
                <!-- 댓글 수정삭제 여기까지 ------------->
            
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
            
            <script>
                $(function () {
                    $("#myModal button").click(function () {
                        alert("제출되었습니다.");
                    })
                })
            </script>


        

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