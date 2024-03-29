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

    input{border:1px solid gray; border-radius:5px;}
    textarea{border:1px solid gray; border-radius:5px;}

    /******** 내용 *******/
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

    #input-thumbnail-btn, .input-img-btn{
        width:120px; height:23px;
        text-align:center;
        border:2px solid gray;
        border-radius:5px;
        font-size:13px;
        font-weight:600;
        cursor:pointer;
        margin-top:5px;
        margin-bottom:0px;
    }
    #input-thumbnail-btn:hover, .input-img-btn:hover{
        background-color:gray; color:white;
    }

    #select-effect label, #select-time label{
        position:relative;
        margin:0px 7px;
        height:30px;
        width:70px;
        cursor:pointer;
    }
    #select-effect span, #select-time span{
        position:absolute;
        margin:auto;
        left:0; right:0; top:0; bottom:0;
        text-align:center;
        line-height:27px;
        border-radius:5px;
    }

    #select-effect input, #select-time input{
        position:absolute;
        opacity:0;
    }

    #ingredient-print span{
        margin-right:30px;
        line-height:30px;
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
				<p>레시피 수정</p>
			</div>
			<hr>

            
            <form action="<%= contextPath %>/update.re" method="post" enctype="multipart/form-data">
            	<input type="hidden" name="recipe-no" value="<%= r.getRecipeNo() %>">
                <div style="border: 1px solid rgb(220, 220, 220); border-radius:3px; width:800px; padding:20px; margin:40px 0px; font-size:14px;">
                <table>
                    <tr>
                        <td style="width:100px;">레시피 이름</td>
                        <td style="padding:10px 30px;"><input type="text" name="title" style="width:350px;" value="<%= r.getRecipeTitle() %>" required></td>
                        <td rowspan="2" align="center" style="padding-left:30px;">
                            <img id="thumbnail-img" style="width:200px; height:150px;" src="<%= r.getRecipeThumbImg() %>">
                            <label id="input-thumbnail-btn" for="input-thumbnail">
                                대표 이미지 등록
                            </label>
                            <input type="file" id="input-thumbnail" name="thumbImg" accept="image/*" onchange="loadThumb(this);" style="display:none;">
                        	<input type="hidden" id="input-thumbnail-update" name="thumbImg-update" value="0">
                        </td>
                    </tr>
                    <tr>
                        <td>레시피 소개</td>
                        <td style="padding:10px 30px;">
                            <textarea name="content" style="width:350px; height:80px; resize:none;" required><%= r.getRecipeContent() %></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td>효과</td>
                        <td colspan="2" width="500" id="select-effect" style="padding:10px 30px;">
                            <label class="checkbox" style="border-radius:5px; height:27px; background: rgb(220, 220, 220);">
                                <input type="checkbox" name="effect" value="10">
                                <span>다이어트</span>
                            </label>
                            <label class="checkbox" style="border-radius:5px; height:27px; background: rgb(220, 220, 220);">
                                <input type="checkbox" name="effect" value="20">
                                <span>모질개선</span>
                            </label>
                            <label class="checkbox" style="border-radius:5px; height:27px; background: rgb(220, 220, 220);">
                                <input type="checkbox" name="effect" value="30">
                                <span>구강개선</span>
                            </label>
                            <label class="checkbox" style="border-radius:5px; height:27px; background: rgb(220, 220, 220);">
                                <input type="checkbox" name="effect" value="40">
                                <span>관절관련</span>
                            </label>
                            <label class="checkbox" style="border-radius:5px; height:27px; background: rgb(220, 220, 220);">
                                <input type="checkbox" name="effect" value="50">
                                <span>장관련</span>
                            </label>
                        </td>
                    </tr>
                    <tr>
                        <td>소요시간</td>
                        <td colspan="2" width="500" id="select-time" style="padding:10px 30px;">
                            <label class="radio" style="border-radius:5px; height:27px; background: rgb(220, 220, 220);">
                                <input type="radio" name="time" value="10">
                                <span>10분</span>
                            </label>
                            <label class="radio" style="border-radius:5px; height:27px; background: rgb(220, 220, 220);">
                                <input type="radio" name="time" value="20">
                                <span>30분</span>
                            </label>
                            <label class="radio" style="border-radius:5px; height:27px; background: rgb(220, 220, 220);">
                                <input type="radio" name="time" value="30">
                                <span>1시간~</span>
                            </label>
                            <label class="radio" style="border-radius:5px; height:27px; background: rgb(220, 220, 220);">
                                <input type="radio" name="time" value="40">
                                <span>2시간~</span>
                            </label>
                        </td>
                    </tr>
                    <tr>
                        <td>재료</td>
                        <td colspan="2" width="500" id="ingredient-insert" style="padding:10px 30px;">
                            <input type="text" id="ingredient-add" placeholder="재료를 입력해주세요">
                            <button type="button" onclick="input()">추가</button>
                            <input type="hidden" name="ingredient" id="ingredient" value="<%= r.getIngredient() %>">
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td colspan="2" width="500" id="ingredient-print" style="padding:0px 30px;">
                        <%
                        	String[] ingredientArr = r.getIngredient().split(",");
                        %>
                        <% for(String i : ingredientArr){ %>
                        	<span name='ingredient'><%= i %></span>
                        <% } %>
                        </td>
                    </tr>
                </table>
                </div>
                <script>
	                $(function(){
	            		const effect = "<%= r.getEffect() %>";
	            		// "ㅇㅇ,ㅇㅇ," | null
	            		$("#select-effect input").each(function(){
	            			// indexof, search 메소드 이용 가능
	            			if(effect != null && effect.search($(this).val()) != -1){	// effect 문자열에 value값이 포함되어있을 경우
	            				$(this).attr("checked", true);
	            				$(this).parent().css("backgroundColor", "rgb(200, 140, 140)").css("color", "white");
	            			}
	            		})
	            		const time = "<%= r.getTime() %>";
	            		$("#select-time input").each(function(){
	            			if(time != null && time.search($(this).val()) != -1){	// effect 문자열에 value값이 포함되어있을 경우
	            				$(this).attr("checked", true);
	            				$(this).parent().css("backgroundColor", "rgb(200, 140, 140)").css("color", "white");
	            			}
	            		})
	            	})
                    function loadThumb(inputFile) {
                        if (inputFile.files.length == 1) {
                            const reader = new FileReader();
                            reader.readAsDataURL(inputFile.files[0]); // readAsDataURL메소드 호출시 읽어들이고자 하는 파일 객체 전달
                            // 파일 읽어들이기 완료됐을 때 실행할 함수
                            reader.onload = function (e) {
                                // e.target.result => 현재 읽어들이기가 완료된 파일의 고유한 url
                                $("#thumbnail-img").attr("src", e.target.result);
                            }
	                        $("#input-thumbnail-update").val("1");
                        } else {
                            $("#thumbnail-img").attr("src", null);
		                    $("#input-thumbnail-update").val("0");
                        }
                    }
                </script>
                
                <script>
                    // 효과, 소요시간 버튼 클릭
                    $(":checkbox").change(function () {
                        //console.log($(this).prop("checked"));
                        if ($(this).prop("checked")) {
                            $(this).parent().css("backgroundColor", "rgb(200, 140, 140)").css("color", "white");
                        } else {
                            $(this).parent().css("backgroundColor", "rgb(220,220,220)").css("color", "rgb(50, 50, 50)");
                        }
                    })
                    $(":radio").click(function () {
                        if ($(this).prop("checked")) {
                            $(this).parent().css("backgroundColor", "rgb(200, 140, 140)").css("color", "white");
                            $(this).parent().siblings().css("backgroundColor", "rgb(220,220,220)").css("color", "rgb(50, 50, 50)");
                        }
                    })
                    let ingredient = "<%= r.getIngredient() %>";
                    function input() {
                        if($("#ingredient-add").val() != ""){
                        	// 뿌리기
                            let value = $("#ingredient-add").val();
                            document.getElementById("ingredient-print").innerHTML += "<span name='ingredient'>" + value + "</span>";
                            
                            ingredient += "," + value;
                            document.getElementById("ingredient-add").value = "";
                            // input으로 넘기기
                            document.getElementById("ingredient").value = ingredient;
                        }
                    }
                </script>





                <table id="cooking-area" style="margin:50px 0px;">
                <% for(Cooking c : list){ %>
                	<input type="hidden" value="<%= c.getCookingNo() %>" name="cooking-no<%= c.getCookingOrder() %>">
                    <tr>
                        <td width="60" align="center">
                            <div style="background:rgb(200, 140, 140); width:25px; height:25px; border-radius:25px; text-align:center; font-size:17px; font-weight:600; color:white;">
                                <%= c.getCookingOrder() %>
                            </div>
                        </td>
                        <td width="430" style="padding:30px 10px;">
                            <textarea name="cooking-content<%= c.getCookingOrder() %>" style="width:370px; height:120px; resize:none; border:1px solid gray" required><%= c.getCookingContent() %></textarea>
                        </td>
                        <td width="200" align="center">
                            <img width="180" height="130" style="padding: 10px 0px;" src="<%= c.getFilePath() %>">
                            <label class="input-img-btn" for="input-img<%= c.getCookingOrder() %>" style="margin-top:0;">
                                이미지 등록
                            </label>
                            <input type="file" name="input-img<%= c.getCookingOrder() %>" id="input-img<%= c.getCookingOrder() %>" accept="image/*" onchange="loadImg(this);" style="display:none;">
                        	<input type="hidden" name="thumbImg-update<%= c.getCookingOrder() %>" value="0">
                        </td>
                    </tr>
                <% } %>
                </table>

                <input type="hidden" name="process-count" id="process-count" value="<%= r.getProcessCount() %>">

                <script>
                    function loadImg(inputFile) {
                        if (inputFile.files.length == 1) {
                            const reader = new FileReader();
                            reader.readAsDataURL(inputFile.files[0]);
                            reader.onload = function (e) {
                                                        // e.target.result => 현재 읽어들이기가 완료된 파일의 고유한 url
                                $(inputFile).prev().prev().attr("src", e.target.result);    // 인라인에서 $(this)는 window를 가리킴 -> inputFile로 받기!
                            }
                            $(inputFile).next().val("1");
                        } else {
                            $(inputFile).prev().prev().attr("src", null);
                            $(inputFile).next().val("1");
                        }
                    }
                </script>

                <br><br><br><br><br>
                <button style="width:60px; margin-right:5px;">등록</button>
                <button type="reset" class="btn-red" style="width:60px;">취소</button>
                <br><br><br>

            </form>
            
		</div>
        
    </div>
</body>
</html>