<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.ArrayList, com.odd.product.model.vo.Product, com.odd.product.model.vo.AdminProSearch" %>

<%
	ArrayList<Product> list = (ArrayList<Product>)request.getAttribute("list");
	String proName = request.getParameter("proName");
	String category = request.getParameter("category");
	String soldout = request.getParameter("soldout");
	String expDateRemain = request.getParameter("expDateRemain");
	String lowPrice = request.getParameter("lowPrice");
	String highPrice = request.getParameter("highPrice");
	String firstDate = request.getParameter("firstDate");
	String secondDate = request.getParameter("secondDate");
	String cpage = request.getParameter("cpage");
%>   


    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 검색 및 관리</title>

<style>
    
    .list-area{
        border: 1px solid white;
        text-align: center;
        font-size: 80%;
    }
    
    .list-area>tbody>tr:hover{
    	background:gray;
    	cursor:pointer;
    }

	#searchForm input{
		width:50%;
	}
	
	.form-control{
        width: 150px;
        height: 50%;
    }
	
	.table-bordered{
		overflow:hidden; white-space:nowrap;
        font-size: 90%;
	}
	
	.delete{
		height: 50px;
		text-align: right;
	}
	
	#deleteBTN{
		float:left;
		margin-left:10px;
	}
	
    .enrollTB{
        font-size: 80%;
    }
    
    .enrollTB1 th{
        text-align: center;
    }
    .enrollTB2{
        text-align: center;
    }
    
    .enrollTB1 img{
    	object-fit: cover;
   		width:150px;
   		height:150px;
    }
    
    .enrollTB2 img{
    	object-fit: cover;
    	width:250px;
   		height:180px;
    }
    
    #content{
   	    z-index:-1;
    }
    
     #header{
   	    z-index:-1;
     }
     
   	 #searchForm th{
   	 	text-align:center;
   	 	width:140px;
   	 }

</style>

</head>

<body>

    <div class="wrap">
 	    
 	    <%@ include file="../common/adminMenubarForInclude.jsp" %>
 	 		
		<!-- 관리자 로그인 확인 -->
		<% if(loginAdmin == null) { %>
		<script>
			alert("로그인 후 사용해주시기바랍니다.");
			history.back();
		</script>
		<% } %>
 	 	
        <div id="content" align="center">
        
            <br>
            <h2>물품 검색</h2>
            <br>
			
			<!-- 상품 삭제 버튼 -->
			<div class="delete">
				<button type="button" class="button btn-red" id="deleteBTN">삭제</button>
			</div>
			
			<script>
				$(function(){
					
					$("#deleteBTN").click(function(){
						
						 let deleteList = [];

				        $("input[name='deleteNo']:checked").each(function() {

				     	   deleteList.push($(this).val());

				        });
				        
						$.ajax({
							
							url:"delete.adPro" , 
							data:{deleteList:deleteList} ,
							type : "post" ,
							dataType: "json",
							traditional: true,
							success : function(result){
								if(result > 0) {
		            				alert("상품 삭제 성공");
		            			}else { 
		            				alert("상품 삭제 실패");
		            			} 
								
								// 페이지 새로 고침
								location.reload();
							} ,
							error : function(){
								
							} 
						})
					})	
				})
			</script>
			
			
			<!-- 상하 스크롤바 -->
			<div style="width:100%; height:350px; overflow:auto">
			 
			   <!-- 상품 검색 결과 테이블 -->				
               <table class="list-area table" >
                   <thead>
                       <tr>
                       	   <th width="5px" onclick="event.stopPropagation()"></th>
                           <th width="5px">번호</th>
                           <th width="50px">카테고리</th>
                           <th width="170px">상품명</th>
                           <th width="30px">가격</th>
                           <th width="20px">품절</th>
                           <th width="40px">유통기한</th>
                           <th width="40px">등록일</th>
                           <th width="10px">적립률</th>
                       </tr>
                   </thead>
                   <tbody>
                   
                       <%if (list.isEmpty()){ %>
                       <tr>
                           <td colspan="9"> 조회된 상품이 없습니다.</td>
                       </tr>
                       <%}else{ %>
                           <% for(Product p : list){ %>
                       <tr role="button" data-toggle="modal" data-target="#myModal">
                           
                           <!-- 체크박스 부분에서는 클릭 이벤트 작동하지 않도록 -->
                           <td onclick="event.stopPropagation()"> 
                           	<input type="checkbox" name="deleteNo" class="deleteNo" value="<%= p.getProNo() %>">
                           </td>
                           
                           <td><%= p.getProNo() %></td>
                           <td><%= p.getCategory() %></td>
                           <td><%= p.getProName() %></td>
                           <td><%= p.getPrice() %></td>
                           <td><%= p.getSoldout() %></td>
                           <td><%= p.getExpiredDate()%></td>
                           <td><%= p.getEnrollDate() %></td>
                           <td><%= p.getSave() %></td>
                       </tr>
                           <%} %>
                       <%} %>  
                       
                       
                   </tbody>
               </table>
            </div>
               
            <br><br><br>
       		
       		<script>
       		
       		<!-- 검색 폼의 값을 다시 채워줌 --> 
			$(function(){
 	    		
 	    		let proName = "<%=proName%>"; 
 	    		let category ="<%=category%>";
 	    		let soldout = "<%=soldout%>";
 	    		let expDateRemain ="<%=expDateRemain%>";
 	    		let lowPrice = "<%=lowPrice%>";
 	    		let highPrice ="<%=highPrice%>";
 	    		let firstDate ="<%=firstDate%>";
 	    		let secondDate = "<%=secondDate%>";
 	    		
 	    		<!-- 최초 페이지가 아닐 경우 -->
 	    		if(<%=cpage%> != 1){
 	    			$("input[name='proName']").val(proName);
 	    	
	    		    $("input[name='category']").each(function() {
						if($(this).val() == category){
							$(this).attr("checked",true);							
						} 
	    		    })	
	    		    $("input[name='soldout']").each(function() {
						if($(this).val() == soldout){
							$(this).attr("checked",true);							
						} 
	    		    })	
	    		    $("input[name='expDateRemain']").each(function() {
						if($(this).val() == expDateRemain){
							$(this).attr("checked",true);							
						} 
	    		    })
					$("input[name='lowPrice']").val(lowPrice);
					$("input[name='highPrice']").val(highPrice);
					$("input[name='firstDate']").val(firstDate);
					$("input[name='secondDate']").val(secondDate);
 	    		}	
 	    	});
       		</script>
       		
       		
       		<!-- 상품 검색 조건 폼 -->
       		<form id="searchForm" action="<%=contextPath%>/search.adPro" method="post">
				  <input type="hidden" name="cpage" value="2" >

                  <table class="table-bordered" style="width:700px">
                    <tr>
                        <th>상품명</th>
                        <td>
                            <input type="text" class="form-control-sm" name="proName" style="width:300px"> 
                        </td>
                    </tr>
                    <tr>
                        <th>상품분류</th>
                        <td>  
							&nbsp;
                            <div class="form-check-inline">
                                <input type="radio" class="form-check-input" name="category" value="전체" checked> 
                                <label class="form-check-label">전체</label>
                            </div>

                            <div class="form-check-inline">
                                <input type="radio" class="form-check-input" name="category" value="주식">
                                <label class="form-check-label">주식</label>
                            </div>
                            
                            <div class="form-check-inline">
                                <input type="radio" class="form-check-input" name="category" value="건조간식">
                                <label class="form-check-label">건조간식</label>
                            </div>
                            
                            <div class="form-check-inline">
                                <input type="radio" class="form-check-input" name="category" value="오븐간식">
                                <label class="form-check-label">오븐간식</label>
                            </div>

                            <div class="form-check-inline">
                                <input type="radio" class="form-check-input" name="category" value="PARTY">
                                <label class="form-check-label">PARTY</label>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th>품절여부</th>
                        <td>
                            &nbsp;
                            <div class="form-check-inline">
                                <input type="radio" class="form-check-input" name="soldout" value="all" checked>
                                <label class="form-check-label">전체</label>
                            </div>
                            
                            <div class="form-check-inline">
                                <input type="radio" class="form-check-input" name="soldout" value="Y">
                                <label class="form-check-label">품절</label>
                            </div>
                            
                            <div class="form-check-inline">
                                <input type="radio" class="form-check-input" name="soldout" value="N">
                                <label class="form-check-label">재고보유</label>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th>유통기한 잔여일</th>
                        <td>
                        	&nbsp;
                            <div class="form-check-inline">
                                <input type="radio" class="form-check-input" name="expDateRemain" value="1" checked>
                                <label class="form-check-label">전체</label>
                            </div>
                            
                            <div class="form-check-inline">
                                <input type="radio" class="form-check-input" name="expDateRemain" value="31">
                                <label class="form-check-label">1달 이하</label>
                            </div>
                            
                            <div class="form-check-inline">
                                <input type="radio" class="form-check-input" name="expDateRemain" value="7">
                                <label class="form-check-label">1주 이하</label>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th>상품 가격</th>
                        <td>
                            <div class="input-group-prepend input-group-sm">
                                <input type="text" class="form-control" name="lowPrice" placeholder="원"> 
                                <span style="font-size: 130%;">~</span>
                                <input type="text" class="form-control" name="highPrice" placeholder="원">
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th>등록일</th>
                        <td>
                            <div class="input-group-prepend input-group-sm">
                                <input type="date" class="form-control" name="firstDate"> 
                                <span style="font-size: 130%;">~</span>
                                <input type="date" class="form-control" name="secondDate">
                            </div>
                        </td>
                    </tr>
                  </table>

				  
				  <br>
				  <button type="submit" class="btn btn-primary">검색</button>
			</form>
			
   		</div>
        
    </div>
        
        
       <!-- 검색결과에서 상품 클릭시 모달에 상품 정보 불러오기  -->
       <script>
       $(function(){
    	   
	  		$(".list-area>tbody>tr").click(function(){
	  			
				$.ajax({
					
					url:"select.adPro" , 
					data:{proNo:$(this).children().eq(1).text()} ,
					type : "post" ,
					success : function(p){
						
							$("select>option").each(function(){
		            			if(p.category == $(this).val() || p.save == $(this).val()){
		            				$(this).attr("selected", true);
		            			}
		            		})
						
							$("#proName").val(p.proName);
							$("#price").val(p.price);
							$("#expiredDate").val(p.expiredDate);
							
							$("#thumbImg").attr("src", "");
							$("#contentImg1").attr("src", "");
							$("#contentImg2").attr("src", "");
							$("#contentImg3").attr("src", "");
							$("#contentImg4").attr("src", "");
							$("#contentImg5").attr("src", "");
							$("#contentImg6").attr("src", "");
							$("#contentImg7").attr("src", "");
							$("#contentImg8").attr("src", "");
							$("#contentImg9").attr("src", "");
							
							$("input[name=file1No]").val("");
							$("input[name=file2No]").val("");
							$("input[name=file3No]").val("");
							$("input[name=file4No]").val("");
							$("input[name=file5No]").val("");
							$("input[name=file6No]").val("");
							$("input[name=file7No]").val("");
							$("input[name=file8No]").val("");
							$("input[name=file9No]").val("");
							$("input[name=file10No]").val("");
							
							$("#thumbImg").attr("src", p.proAtt1);
							$("#contentImg1").attr("src", p.proAtt2);
							$("#contentImg2").attr("src", p.proAtt3);
							$("#contentImg3").attr("src", p.proAtt4);
							$("#contentImg4").attr("src", p.proAtt5);
							$("#contentImg5").attr("src", p.proAtt6);
							$("#contentImg6").attr("src", p.proAtt7);
							$("#contentImg7").attr("src", p.proAtt8);
							$("#contentImg8").attr("src", p.proAtt9);
							$("#contentImg9").attr("src", p.proAtt10);
							
							$("input[name=file1No]").val(p.proAttNo1);
							$("input[name=file2No]").val(p.proAttNo2);
							$("input[name=file3No]").val(p.proAttNo3);
							$("input[name=file4No]").val(p.proAttNo4);
							$("input[name=file5No]").val(p.proAttNo5);
							$("input[name=file6No]").val(p.proAttNo6);
							$("input[name=file7No]").val(p.proAttNo7);
							$("input[name=file8No]").val(p.proAttNo8);
							$("input[name=file9No]").val(p.proAttNo9);
							$("input[name=file10No]").val(p.proAttNo10);
							
							$("input[name=proNo]").val(p.proNo);
							
							$("input[name=thumbImg]").val(p.thumbImg);
							
							
					} ,
					error : function(){
						
					} 
				})
	  		})
   		})
	
	</script>
	        
        
	
	<!-- The Modal -->
	<div class="modal fade" id="myModal">
	  <div class="modal-dialog modal-lg">
	    <div class="modal-content">
	
	      <!-- Modal Header -->
	      <div class="modal-header">
	        <h4 class="modal-title">상품 정보 수정</h4>
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	      </div>
	
	      <!-- Modal body -->
	      <div class="modal-body" style="overflow:auto; white-space: nowrap;">
	        <form action="<%=contextPath%>/update.adPro" method="post" enctype="multipart/form-data" >			
	            <table class="enrollTB1 table-bordered" style="width:750px">
	                    <tr>
	                        <th>카테고리</th>
	                        <td colspan="3">
	                        	&nbsp;
	                        	<select name="category" id="category" class="form-control-sm">
                            		<option value="주식">주식</option>
                            		<option value="건조간식">건조간식</option>
                            		<option value="오븐간식">오븐간식</option>
                            		<option value="PARTY">PARTY</option>
	                        	</select>
	                        </td>
	                        <th style="width:200px" class="table-active">
	                        	섬네일 등록
	                        </th>
	                    </tr>
	
	                    <tr>
	                        <th>상품명</th>
	                        <td colspan="3">
	                        	&nbsp;
	                        	<input type="text" class="form-control-sm" name="proName" style="width:400px" id="proName" required>
	                        </td>
	                        
	                        <td rowspan="4" style="text-align:center">
	                        	<img class="img-thumbnail" id="thumbImg" onclick="clickFile(1)">
	                        </td>
	                    </tr>
	
	                    <tr>
	                        <th>가격</th>
	                        <td colspan="3">
	                        	&nbsp;
	                        	<input type="text" class="form-control-sm" name="price" style="width:150px" id="price" required>
                       		</td>
	                    </tr>
	
	                    <tr>
	                        <th>유통 기한</th>
	                    	<td colspan="3">
	                    		&nbsp;
	                    		<input type="date" class="form-control-sm" name="expiredDate" id="expiredDate" style="width:150px" required>
                    		</td>
	                    </tr>
	
	                    <tr>
	                        <th>적립률</th>
	                        <td>
	                     	    &nbsp;
	                        	<select name="save" class="form-control-sm">
                            		<option value="0.1">0.1%</option>
                            		<option value="0.2">0.2%</option>
                            		<option value="0.3">0.3%</option>
                            		<option value="0.4">0.4%</option>
	                        	</select>
	                        </td>
	                        <th style="width:100px">품절 여부</th>
	                        <td style="width:150px">
                        		&nbsp;
	                        	<select name="soldout" class="form-control-sm">
                            		<option value="N">재고보유</option>
                            		<option value="Y">품절</option>
	                        	</select>
							</td>
	                    </tr>
	                    
	            </table>

				<table class="enrollTB2 table-bordered" style="width:750px">
						<tr>
							<th colspan="3" class="table-active">상세 이미지 등록</th>
						</tr>
						
						<tr>
							<td>
								<img class="img-thumbnail" id="contentImg1" onclick="clickFile(2)" onerror="this.src='<%=contextPath%>/resources/icons/white.png';">
							</td>
							<td>
								<img class="img-thumbnail" id="contentImg2" onclick="clickFile(3)" onerror="this.src='<%=contextPath%>/resources/icons/white.png';">
							</td>
							<td>
								<img class="img-thumbnail" id="contentImg3" onclick="clickFile(4)" onerror="this.src='<%=contextPath%>/resources/icons/white.png';">
							</td>
						</tr>
						
						<tr>
							<td>
								<img class="img-thumbnail" id="contentImg4" onclick="clickFile(5)" onerror="this.src='<%=contextPath%>/resources/icons/white.png';">
							</td>
							<td>
								<img class="img-thumbnail" id="contentImg5" onclick="clickFile(6)" onerror="this.src='<%=contextPath%>/resources/icons/white.png';">
							</td>	
							<td>
								<img class="img-thumbnail" id="contentImg6" onclick="clickFile(7)" onerror="this.src='<%=contextPath%>/resources/icons/white.png';">
							</td>
						</tr>
						
						<tr>
							<td>
								<img class="img-thumbnail" id="contentImg7" onclick="clickFile(8)" onerror="this.src='<%=contextPath%>/resources/icons/white.png';">
							</td>
							<td>
								<img class="img-thumbnail" id="contentImg8" onclick="clickFile(9)" onerror="this.src='<%=contextPath%>/resources/icons/white.png';">
							</td>	
							<td>
								<img class="img-thumbnail" id="contentImg9" onclick="clickFile(10)" onerror="this.src='<%=contextPath%>/resources/icons/white.png';">
							</td>
						</tr>
						
						
				</table>
				
		        <div id="file-area" style="display: none;">
	                <input type="file" name="file1" onchange="loadImg(this, 1)">
	                <input type="file" name="file2" onchange="loadImg(this, 2)">
	                <input type="file" name="file3" onchange="loadImg(this, 3)">
	                <input type="file" name="file4" onchange="loadImg(this, 4)">
	                <input type="file" name="file5" onchange="loadImg(this, 5)">
	                <input type="file" name="file6" onchange="loadImg(this, 6)">
	                <input type="file" name="file7" onchange="loadImg(this, 7)">
	                <input type="file" name="file8" onchange="loadImg(this, 8)">
	                <input type="file" name="file9" onchange="loadImg(this, 9)">
	                <input type="file" name="file10" onchange="loadImg(this, 10)">
	                
	                <input type="hidden" name="file1No">
	                <input type="hidden" name="file2No">
	                <input type="hidden" name="file3No">
	                <input type="hidden" name="file4No">
	                <input type="hidden" name="file5No">
	                <input type="hidden" name="file6No">
	                <input type="hidden" name="file7No">
	                <input type="hidden" name="file8No">
	                <input type="hidden" name="file9No">
	                <input type="hidden" name="file10No">

                   <input type="hidden" name="proNo">
                   
                   <input type="hidden" name="thumbImg">
                   
          		</div>
				
				
				<script>
				
				<!-- 클릭시 파일 업로드 -->
                function clickFile(num){
                
                    $("input[name=file"+num+"]").click();
                
                }
				
                <!-- 파일 업로드시 이미지 반영 -->
                function loadImg(inputFile, num){
                	
                    if(inputFile.files.length == 1){
                    	
                        const reader = new FileReader();
                        reader.readAsDataURL(inputFile.files[0]);

                        reader.onload = function(e){
                            switch(num){
                                case 1:
                                	$("#thumbImg").attr("src",e.target.result);
                                	break;
                                case 2:
                                	$("#contentImg1").attr("src",e.target.result); 
                                	break;
                                case 3:
                                	$("#contentImg2").attr("src",e.target.result); 
                                	break;
                                case 4:
                                	$("#contentImg3").attr("src",e.target.result); 
                                	break;
                                case 5:
                                	$("#contentImg4").attr("src",e.target.result); 
                                	break;
                                case 6:
                                	$("#contentImg5").attr("src",e.target.result); 
                                	break;
                                case 7:
                                	$("#contentImg6").attr("src",e.target.result); 
                                	break;
                                case 8:
                                	$("#contentImg7").attr("src",e.target.result); 
                                	break;
                                case 9:
                                	$("#contentImg8").attr("src",e.target.result); 
                                	break;
                                case 10:
                                	$("#contentImg9").attr("src",e.target.result); 
                                	break;
                    
                            }
                        }

                    }else{
                        switch(num){
                                case 1:$("#thumbImg").attr("src",null); break;
                                case 2:$("#contentImg1").attr("src",null); break;
                                case 3:$("#contentImg2").attr("src",null); break;
                                case 4:$("#contentImg3").attr("src",null); break;
                                case 5:$("#contentImg4").attr("src",null); break;
                                case 6:$("#contentImg5").attr("src",null); break;
                                case 7:$("#contentImg6").attr("src",null); break;
                                case 8:$("#contentImg7").attr("src",null); break;
                                case 9:$("#contentImg8").attr("src",null); break;
                                case 10:$("#contentImg9").attr("src",null); break;
                
                            }

                    }


                }
              	  
            </script>
				
            <br>
			<button type="submit" class="btn btn-primary" style="float:right; margin:15px;">수정하기</button>
				
	    	</form>        
	      </div>
	
	    </div>
	  </div>
	</div>
	
	
	
	

</body>
</html>