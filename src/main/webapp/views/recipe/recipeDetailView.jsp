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
	<% String userId = (loginUser == null) ? "" : loginUser.getUser_Id(); %>

    <div id="content">

        <div id="side">
            <br><br><br><br><br>
            <p style="font-size:23px;">COMMUNITY</p>
            <hr>
            <a href="<%= contextPath %>/list.bo?cpage=1" style="font-size:17px;">자유게시판</a> <br><br>
            <a href="<%= contextPath %>/list.re?cpage=1" style="font-size:17px; color:rgb(200, 140, 140);">레시피게시판</a>
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
			
			<% if(r.getEffect() != null){ %>
				<% String[] effectArr = r.getEffect().split(","); %>
				<% for(String str : effectArr){ %>
					<%	switch(str){
						case "10": str = "다이어트"; break;
						case "20": str = "모질개선"; break;
						case "30": str = "구강개선"; break;
						case "40": str = "관절관련"; break;
						case "50": str = "장관련"; break;
						} %>
            		<div class="badges"><%= str %></div>
            	<% } %>
            <% } %>
            <% if(r.getTime() != null){ %>
            	<%  String time = r.getTime();
            		switch(time){
            		case "10": time = "10분"; break;
            		case "20": time = "30분"; break;
            		case "30": time = "1시간~"; break;
            		case "40": time = "2시간~"; break;
            		} %>
            	<div class="badges"><%= time %></div>
            <% } %>
            

            <div align="right" style="width:900px; font-size:12px;">
                <img src="<%= contextPath %>/resources/icons/comment.png" width="18"><span class="reply-count" style="margin-left:7px;"></span>
                <div class="heart-area" style="display:inline-block;">
                    <img src="<%= contextPath %>/resources/icons/heart.png" width="18" style="margin-left:10px; cursor:pointer;">
                </div>
            </div>
            <br><br><br>
            
            <% if(loginUser != null){ %>
            <script>
            	// 첫화면 로딩시 하트 데이터 불러오기
            	$(function(){selectHeart();})
            	function selectHeart(){
            		$.ajax({
            			url:"<%= contextPath %>/hcount.re",
            			data:{no:"<%= r.getRecipeNo() %>"},
            			type:"post",
            			success:function(count){
            				if(count > 0){
            					$(".heart-area>img").attr("src", "<%= contextPath %>/resources/icons/heartR.png");
            				} else {
            					$(".heart-area>img").attr("src", "<%= contextPath %>/resources/icons/heart.png");
            				}
            			}, error:function(){
            				console.log("하트 조회용 ajax 통신 실패")
            			}
            		})
            	}
            	// 하트 등록/삭제
                $(".heart-area>img").click(function () {
                	if ($(this).attr("src") == "<%= contextPath %>/resources/icons/heart.png") {
                		// 하트가 눌려있지 않았을 때
                		$.ajax({
                    		url:"<%=contextPath%>/hinsert.re",
                    		data:{no:<%= r.getRecipeNo() %>},
                    		type:"post",
                    		success:function(result){
                    			if(result>0){
                    				alert("성공적으로 하트 등록되었습니다.");
                    				$(".heart-area>img").attr("src", "<%= contextPath %>/resources/icons/heartR.png");
                    			} else {
                    				alert("하트 등록 실패")
                    			}
                    		}, error:function(){
                    			console.log("하트 등록용 ajax 통신 실패")
                    		}
                    	})
                	} else {
                		// 하트가 눌려있었을 때
                		$.ajax({
                    		url:"<%=contextPath%>/hdelete.re",
                    		data:{no:<%= r.getRecipeNo() %>},
                    		type:"post",
                    		success:function(result){
                    			alert("성공적으로 하트 해제됨")
                    			$(".heart-area>img").attr("src", "<%= contextPath %>/resources/icons/heart.png");
                    		}, error:function(){
                    			console.log("하트 삭제용 ajax 통신 실패")
                    		}
                    	})
                	}
                })
            </script>
			<% } else { %>
         		<script>
         			$(".heart-area>img").click(function () {
         				alert("로그인 후 이용 가능합니다.");
         			})
         		</script>
            <% } %>
			
            <table id="ingredient-area">
                <tr>
                    <td align="center" width="150" style="font-size:18px; font-weight:700; color:rgb(200, 140, 140);">
                            <img src="<%= contextPath %>/resources/icons/cutlery.png" width="20" style="margin-bottom:5px; margin-right:3px;">
                            재료안내
                    </td>
                    <td width="750">
                    	<% if(r.getIngredient() != null){ %>
	                    	<% String[] ingredientArr = r.getIngredient().split(","); %>
	                    	<% for(String str : ingredientArr){ %>
	                    		<div><%= str %></div>
	                    	<% } %>
                        <% } %>
                    </td>
                </tr>
            </table>

            <br>

            <table id="cooking-area">

                <tr>
                    <td colspan="3" width="900" style="font-size:18px; font-weight:700; color:rgb(200, 140, 140); padding:30px 25px 30px;">
                        <img src="<%= contextPath %>/resources/icons/cutlery.png" width="20" style="margin-bottom:5px; margin-right:3px;">
                        조리순서
                    </td>
                </tr>
                
                <% for(Cooking c : list){ %>
                	<tr>
	                    <td width="50" align="center" style="padding:10px 10px 50px 10px;">
	                        <div style="background:rgb(200, 140, 140); width:25px; height:25px;  border-radius:25px; text-align:center; font-size:17px; font-weight:600; color:white;">
	                            <%= c.getCookingOrder() %>
	                        </div>
	                    </td>
	                    <td width="510" style="padding:10px 10px 50px 10px; line-height:30px;">
	                        <%= c.getCookingContent() %>
	                    </td>
	                    <td width="250">
	                        <img src="<%= c.getFilePath() %>" width="250" height="180" style="margin:10px;">
	                    </td>
	                </tr>
                <% } %>
                <tr><td><br><br></td></tr>
            </table>

            <div align="right" style="width:900px">
                <br><br>
                <a href="<%= contextPath %>/list.re?cpage=1"><button type="submit">목록</button></a>
                <br><br><br><br>
            </div>



            <div id="reply-area" align="center">
                <div align="left" style="margin-left:15px; border-bottom: 2px solid rgb(220, 220, 220);">
                    <p style="font-size:15px; font-weight:600; margin-bottom:5px;">댓글</p>
                    <p class="reply-count" style="font-size:15px; font-weight:600; color:rgb(200, 140, 140)">0</p>
                </div>
            
                <table id="reply-table" width="900">
                	<tbody></tbody>
                </table>
            
                <br><br><br>
				<% if(loginUser != null){ %>
                <!-- 로그인이 되어있을 경우 -->
                	<textarea id="reply-insert-area" name="content" placeholder="소중한 댓글을 입력해주세요."
                        style="width:900px; height:150px; border:1px solid rgb(220, 220, 220); border-radius:5px; color:rgb(50, 50, 50); font-size:13px; resize:none;"></textarea>
                    <div align="right" style="width:900px;">
                        <button onclick="insertReply();">등록</button>
                    </div>
                <% } else { %>
                <!-- 로그인이 되어있지 않을 경우 -->
                	<textarea style="width:900px; height:150px; border:1px solid rgb(220, 220, 220); border-radius:5px; color:rgb(50, 50, 50); font-size:13px; resize:none;" readonly>로그인 이후 작성 가능합니다.</textarea>
                    <div align="right" style="width:900px;">
                        <button class="disabled-btn" style="color:gray;">등록</button>
                    </div>
                <% } %>
                <br><br><br><br><br>
			</div>
			
			<script>
				$(function(){selectReplyList();})
				
				// 댓글 목록 조회 - ajax
	        	function selectReplyList(){
	        		$.ajax({
	        			url:"<%=contextPath%>/rlist.bo",
	        			data:{
	        				no:<%= r.getRecipeNo() %>,
	        				boardType:3
	        			},
	        			success:function(list){
	        				let value = "";
	        				let replyCount = 0;
	        				if(list.length == 0) {
	        					// 댓글이 없을 때
	        					value += "<tr style='text-align:center; height:200px; border-bottom:1px solid rgb(220,220,220);'>"
	        						   +	"<td colspan='2' style='font-size:14px'>등록된 댓글이 없습니다</td>"
	        						   + "</tr>";
	        				} else {
	        					// 댓글이 있을 때
	        					for(let i=0; i<list.length; i++){
	        						replyCount = list[i].count;
	        						if("<%= userId %>" == list[i].replyWriter){
	        						// 내 댓글일 때
		        						value += "<tr>"
		        							   +	"<th style='font-size:14px;' width='150'>" + list[i].replyWriter + "</th>"
		        							   +	"<td class='reply-btn-area' style='color:gray; font-size:11px;>"
									  		   + 		"<p style='margin:0px 10px;'>" + list[i].createDate + "</p>"
									  		   +		"<p class='report modify-btn' style='margin-left:30px; margin-right:10px;'>수정</p>"
									  		   +		"<input type='hidden' name='reply-no' value='"+ list[i].replyNo +"'>"
									  		   +		"<p class='report delete-btn' style='color:rgb(200, 140, 140);'>삭제</a>"
									  		   + 	"</td>"
									   		   + "</tr>"
									   		   + "<tr style='border-bottom:1px solid rgb(220,220,220);'>"
									   		   + 	"<td colspan='2' style='font-size:12px;'>" + list[i].replyContent + "</td>"
									   		   + "</tr>"
									   		   + "<tr class='reply-modify-area' style='display:none;'>"
									   		   +	"<td colspan='2' style='font-size:12px; padding:0;'>"
									   		   +		"<input type='hidden' name='reply-no' value='"+ list[i].replyNo +"'>"
									   		   +		"<textarea style='width:900px; height:120px; resize:none; border:1px solid rgb(200, 140, 140); border-radius:5px;'>" + list[i].replyContent + "</textarea>"
									   		   +		"<button style='margin-left:855px; margin-top:10px;'>등록</button>"
									   		   +	"</td>"
									   		   + "</tr>"
	        						} else {
		        						value += "<tr>"
		        							   +	"<th style='font-size:14px;' width='150'>" + list[i].replyWriter + "</th>"
		        							   +	"<td style='color:gray; font-size:11px;'>"
									  		   + 		"<p style='margin:0px 10px;'>" + list[i].createDate + "</p>"
									  		   +		"<p class='report' data-toggle='modal' data-target='#myModal' style='margin-left:30px;'>신고</p>"
									  		   + 	"</td>"
									   		   + "</tr>"
									   		   + "<tr style='border-bottom:1px solid rgb(220,220,220);'>"
									   		   + 	"<td colspan='2' style='font-size:12px;'>" + list[i].replyContent + "</td>"
									   		   + "</tr>"
	        						}
	        					}
	        				}
	        				$(".reply-count").html(replyCount);
		        			$("#reply-area tbody").html(value);
	        			}, error:function(){
	        				console.log("댓글목록 조회용 ajax 통신실패");
	        			}
	        		})
	        	}
				
				// 댓글 작성 - ajax
	        	function insertReply(){
	        		$.ajax({
	        			url:"<%=contextPath%>/rinsert.bo",
	        			data:{
	        				content: $("#reply-insert-area").val(),
	        				boardType: 3,
	        				no: <%= r.getRecipeNo() %>
	        			},
	        			type:"post",
	        			success:function(result){
	        				if(result>0){
	        					$("#reply-insert-area").val("");
	        					selectReplyList();
	        				}else{
	        					alert("댓글 등록 실패");
	        				}
	        			}, error:function(){
	        				console.log("댓글작성용 ajax 통신실패")
	        			}
	        		})
	        	}
				
	        	// 댓글 수정 - ajax
	        	$(function(){
            		$(document).on("click", ".reply-modify-area button", function(){
            			updateReply($(this).prev().prev().val(), $(this).prev().val());
            		})
            	})
	        	function updateReply(no, content){
	        		$.ajax({
	        			url:"<%=contextPath%>/rupdate.bo",
	        			data:{
	        				replyContent: content,
	        				replyNo: no
	        			},
	        			type:"post",
	        			success:function(result){
	        				if(result>0){	// 댓글수정성공
	        					selectReplyList();
	        					alert("성공적으로 수정되었습니다.");
	        				}else{			// 실패
	        					alert("댓글 등록 실패");
	        				}
	        			}, error:function(){
	        				console.log("댓글수정용 ajax 통신실패")
	        			}
	        		})
	        	}
	        	
	        	// 댓글 삭제 - ajax
	        	$(function(){
            		$(document).on("click", ".reply-btn-area .delete-btn", function(){
            			if (confirm("정말 삭제하시겠습니까?")) {
            				deleteReply($(this).prev().val());
                        }
            		})
            	})
            	function deleteReply(no){
	        		$.ajax({
	        			url:"<%=contextPath%>/rdelete.bo",
	        			data:{replyNo: no},
	        			type:"post",
	        			success:function(result){
	        				if(result>0){	// 댓글삭제성공
	        					selectReplyList();
	        					alert("성공적으로 삭제되었습니다.");
	        				} else {			// 실패
	        					alert("댓글 삭제 실패");
	        				}
	        			}, error:function(){
	        				console.log("댓글삭제용 ajax 통신실패")
	        			}
	        		})
	        	}
				
			</script>
            <script>
            	// 수정area 보이기
            	$(function(){
            		$(document).on("click", ".reply-btn-area .modify-btn", function(){
            			const area = $(this).parents("tr").next().next();	// 수정 tr(.reply-modify-area)
            			if (area.css("display") == "none") {
            				$(this).parents("tr").next().children("td").css("display", "none");
            				$(this).parents("tr").next().css("border-bottom", "none")
                            $(this).text("취소");
                            area.slideDown();
                        } else {
                        	$(this).parents("tr").next().children("td").css("display", "block");
            				$(this).parents("tr").next().css("border-bottom", "1px solid rgb(220,220,220)")
                            $(this).text("수정");
                            area.css("display", "none");
                        }
            		})
            	})
            </script>
        </div>
            
            
            <!-- 모달 -->
            <div class="modal" id="myModal" style="color:rgb(50, 50, 50);">
                <div class="modal-dialog">
                    <div class="modal-content" style="padding:30px 20px;">
            
                        <!-- Modal Header -->
                        <div class="modal-header" style="justify-content: left;">
                            <img src="<%= contextPath %>/resources/icons/siren.png" width="25" style="margin-right:10px;">
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