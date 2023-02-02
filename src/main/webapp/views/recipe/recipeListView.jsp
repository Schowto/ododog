<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.ArrayList, com.odd.common.model.vo.PageInfo, com.odd.recipe.model.vo.Recipe" %>
<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<Recipe> list = (ArrayList<Recipe>)request.getAttribute("list");
	String sort = (String)request.getAttribute("sort");
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

    .selected{
        background:rgb(220,220,220);
    }

    /* 검색창 */
    #search-area{
        width:900px;
        padding:30px;
        border-radius:5px;
        background:rgb(220, 220, 220);
    }
    #search-area label{
        position:relative;
        margin:0px 7px;
        height:30px;
        width:70px;
        cursor:pointer;
    }
    #search-area span{
        /*border: 1px solid red;*/
        position:absolute;
        margin:auto;
        left:0; right:0; top:0; bottom:0;
        text-align:center;
        line-height:30px;
    }
    #search-area button:hover{
        background:rgb(240, 240, 240);
    }

    #select-effect input, #select-time input{
        position:absolute;
        opacity:0;
    }

    /* 정렬순서 */
    .sort-filter-area label{
    	position:relative;
    	margin:0px;
        border:1px solid rgb(220, 220, 220);
        border-radius: 5px;
        float:right;
        width:6%;
        cursor:pointer;
    }
    .sort-filter-area input{
    	position:absolute;
        opacity:0;
    }

    /* 썸네일 */
    .thumbnail{
        display:inline-block;
        margin:40px 20px;
    }
    .thumbnail-img-area{
        cursor:pointer;
    }
    .thumbnail-img-area img:hover, .title-pointed{
        transform:scale(1.2);
        transition:transform .5s;
    }
    .thumbnail-img-area img{
        transform:scale(1.0);
        transition:transform .5s;
    }
    .thumbnail p{
        cursor:pointer;
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
            <a href="" style="font-size:17px;">자유게시판</a> <br><br>
            <a href="" style="font-size:17px; color:rgb(200, 140, 140);">레시피게시판</a>
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
                <h2 style="color:rgb(50, 50, 50); font-weight:600;">레시피게시판</h2>
                <br>
            </div>
            <br><br>
            
            <form id="search-area">

                <table style="font-size:15px;">
                    <tr>
                        <td width="200" height="50" style="font-weight:600;">아이들에게 필요한 건?</td>
                        <td width="500" id="select-effect">
                            <label class="checkbox" style="border-radius:5px; background: white;">
                                <input type="checkbox" name="effect" value="10">
                                <span>다이어트</span>
                            </label>
                            <label class="checkbox" style="border-radius:5px; background: white;">
                                <input type="checkbox" name="effect" value="20">
                                <span>모질개선</span>
                            </label>
                            <label class="checkbox" style="border-radius:5px; background: white;">
                                <input type="checkbox" name="effect" value="30">
                                <span>구강개선</span>
                            </label>
                            <label class="checkbox" style="border-radius:5px; background: white;">
                                <input type="checkbox" name="effect" value="40">
                                <span>관절관련</span>
                            </label>
                            <label class="checkbox" style="border-radius:5px; background: white;">
                                <input type="checkbox" name="effect" value="50">
                                <span>장관련</span>
                            </label>
                        </td>
                    </tr>
                    <tr>
                        <td height="50" style="font-weight:600;">만드는 시간은?</td>
                        <td id="select-time">
                            <label class="checkbox" style="border-radius:5px; background: white;">
                                <input type="checkbox" name="time" value="10">
                                <span>10분</span>
                            </label>
                            <label class="checkbox" style="border-radius:5px; background: white;">
                                <input type="checkbox" name="time" value="20">
                                <span>30분</span>
                            </label>
                            <label class="checkbox" style="border-radius:5px; background: white;">
                                <input type="checkbox" name="time" value="30">
                                <span>1시간~</span>
                            </label>
                            <label class="checkbox" style="border-radius:5px; background: white;">
                                <input type="checkbox" name="time" value="40">
                                <span>2시간~</span>
                            </label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center" style="padding-top:50px; font-size:18px; font-weight:600; line-height:26px;">
                            내가 가진 재료로 레시피 추천받기 <br>
                            <input type="text" name="ingredient" style="width:400px; height:25px; border-radius:5px; border:none;">
                            <button type="submit" style="height:25px; width:50px; border:none; margin-top:10px;">
                                <img src="<%= contextPath %>/resources/icons/search.png" width="12px" style="opacity:0.5; margin-bottom:5px;">
                            </button>
                        </td>
                    </tr>
                </table>

            </form>

            <script>
                $(":checkbox").change(function(){
                    //console.log($(this).prop("checked"));
                    if($(this).prop("checked")){
                        $(this).parent().css("backgroundColor","rgb(200, 140, 140)").css("color","white");
                    } else {
                        $(this).parent().css("backgroundColor", "white").css("color","rgb(50, 50, 50)");
                    }
                })
            </script>

            <br><br><br><br>

            <div class="sort-filter-area" style="font-size:13px;">
            	<label class="sort" style="border-radius:5px;">
                    <input type="radio" name="sort-by" value="reply" style="cursor:pointer;">
                    <span>댓글순</span>
                </label>
                <label class="sort" style="border-radius:5px;">
                    <input type="radio" name="sort-by" value="heart" style="cursor:pointer;">
                    <span>하트순</span>
                </label>
                <label class="sort selected" style="border-radius:5px;">
                    <input type="radio" name="sort-by" value="new" style="cursor:pointer;">
                    <span>최신순</span>
                </label>
            </div>
            <br>
            
            <script>
                $(".sort-filter-area label").click(function(){
                    //console.log($(this).text());
                    $(this).addClass('selected');
                    $(this).siblings().removeClass('selected');
                    location.href = "<%= contextPath %>/list.re?cpage=1&sort=" + $(this).children("input").val();
                })
            	$(function(){
            		const sortList = $(".sort-filter-area :radio");
            		$(sortList).each(function(){
            			if($(this).val() == "<%= sort %>"){
            				$(this).parents("label").addClass("selected");
            				$(this).parents("label").siblings().removeClass('selected');
            			}
            		})
            	})
            </script>
            
            <div class="list-area" style="font-size:15px;">
                <% if(list.isEmpty()){ %>
                <!-- 레시피가 없는 경우 -->
	                <div>
	                    <br><br><br><br><br>
	                    등록된 레시피가 없습니다.
	                    <br><br><br><br><br>
	                </div>
				<% } else { %>
					<% for(Recipe r : list){ %>
	                <!-- 레시피 있는 경우 -->
	                <div class="thumbnail" align="center">
	                    <div class="thumbnail-img-area" style="width:230px; height:200px; overflow:hidden;">
	                        <img src="<%= r.getRecipeThumbImg() %>" width="100%" height="100%" onclick="location.href='<%= contextPath %>/detail.re?no=<%= r.getRecipeNo() %>';">
	                    </div>
	                    <p style="margin:5px;" onclick="location.href='<%= contextPath %>/detail.re?no=<%= r.getRecipeNo() %>';" ><%= r.getRecipeTitle() %></p>
	                    <div align="right" style="width:250px; font-size:12px;">
	                        <img src="<%= contextPath %>/resources/icons/comment.png" width="15"> <%= r.getReplyCount() %>
	                        <div style="display:inline-block;">
	                            <img src="<%= contextPath %>/resources/icons/heart.png" id="heart-area<%= r.getRecipeNo() %>" width="15" style="margin-left:7px; cursor:pointer;">
	                            <%= r.getHeartCount() %>
	                        </div>
	                    </div>
	                </div>
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
		            					$("#heart-area<%= r.getRecipeNo() %>").attr("src", "<%= contextPath %>/resources/icons/heartR.png");
		            				} else {
		            					$("#heart-area<%= r.getRecipeNo() %>").attr("src", "<%= contextPath %>/resources/icons/heart.png");
		            				}
		            			}, error:function(){
		            				console.log("하트 조회용 ajax 통신 실패")
		            			}
		            		})
		            	}
		            	// 하트 등록/삭제
		                $("#heart-area<%= r.getRecipeNo() %>").click(function () {
		                	if ($(this).attr("src") == "<%= contextPath %>/resources/icons/heart.png") {
		                		// 하트가 눌려있지 않았을 때
		                		$.ajax({
		                    		url:"<%=contextPath%>/hinsert.re",
		                    		data:{no:<%= r.getRecipeNo() %>},
		                    		type:"post",
		                    		success:function(result){
		                    			if(result>0){
		                    				alert("성공적으로 하트 등록되었습니다.");
		                    				$("#heart-area<%= r.getRecipeNo() %>").attr("src", "<%= contextPath %>/resources/icons/heartR.png");
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
		                    			$("#heart-area<%= r.getRecipeNo() %>").attr("src", "<%= contextPath %>/resources/icons/heart.png");
		                    		}, error:function(){
		                    			console.log("하트 삭제용 ajax 통신 실패")
		                    		}
		                    	})
		                	}
		                })
		            </script>
	                <% } else { %>
	                <script>
	                	$("#heart-area<%= r.getRecipeNo() %>").click(function () {
	                		alert("로그인 후 이용 가능합니다.");
	                	})
	                </script>
	                <% } %>
                	<% } %>
                <% } %>
            </div>
            
            <script>
                $(".thumbnail>p").mouseover(function(){
                    $(this).css("font-weight","600").css("color","rgb(200,140,140)");
                    $(this).siblings(".thumbnail-img-area").children().css("transform", "scale(1.2)");
                })
                $(".thumbnail>p").mouseleave(function () {
                    $(this).css("font-weight", "500").css("color", "rgb(50,50,50)");
                    $(this).siblings(".thumbnail-img-area").children().css("transform", "scale(1.0)");
                })
                $(".thumbnail-img-area>img").mouseover(function () {
                    $(this).parent().siblings("p").css("font-weight", "600").css("color", "rgb(200,140,140)");
                    $(this).css("transform", "scale(1.2)");
                })
                $(".thumbnail-img-area>img").mouseleave(function () {
                    $(this).parent().siblings("p").css("font-weight", "500").css("color", "rgb(50,50,50)");
                    $(this).css("transform", "scale(1.0)");
                })
            </script>

            <br><br><br>
            
            <div class="paging-area" align="center">
            
        		<!-- 페이지1일 때는 < 버튼 출력 X -->
	        	<% if(pi.getCurrentPage() != 1){ %>
	        		<button onclick="location.href='<%=contextPath%>/list.re?cpage=<%=pi.getCurrentPage()-1%>';">&lt;</button>
	        	<% } %>
	        	
	        	<% for(int p = pi.getStartPage(); p <= pi.getEndPage(); p++){ %>
	        		<button onclick="location.href='<%=contextPath%>/list.re?cpage=<%=p%>';"><%= p %></button>
	        	<% } %>
	        	
	        	<!-- 마지막페이지일 때 -->
	        	<% if(pi.getCurrentPage() != pi.getMaxPage()){ %>
	            	<button onclick="location.href='<%=contextPath%>/list.re?cpage=<%=pi.getCurrentPage()+1%>'">&gt;</button>
	            <% } %>
            
        </div>
            <br><br><br><br><br><br><br>

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