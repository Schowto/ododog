<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.ArrayList , com.odd.common.model.vo.PageInfo, com.odd.product.model.vo.Product, java.text.SimpleDateFormat" %>

<%
	ArrayList<Product> list = (ArrayList<Product>)request.getAttribute("list");
%>   

    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>

    .wrap {
            /* 전체 -> ????? 세로 사이즈는 여기서 조정 ,,????? */
            /*border:1px solid blue;*/
            width: 1200px; height: 700px;
            margin: auto;
            background: rgb(220, 220, 220);
        }

    .wrap>div {float: left;}

    div {/*border:1px solid red;*/ box-sizing: border-box;}

    #content {
        width: 75%; height: 100%;
        padding-top: 20px;
        color: rgb(50, 50, 50);
        background: white;
    }    
    
    .list-area{
        border: 1px solid white;
        text-align: center;
        font-size: 80%;
    }
    
    .list-area>tbody>tr:hover{
    	background:gray;
    	cursor:pointer;
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
		overflow:hiddlen; white-space:nowrap;
        font-size: 90%;
	}
	
	

</style>

</head>

<body>

    <div class="wrap">
 	    
 	    <%@ include file="../common/adminMenubarForInclude.jsp" %>

        <div id="content" align="center">
			<!-- 세부페이지 들어갈 자리 -->
            <br>
            <h2>물품 검색</h2>
            <br>
			<br>
			
			<div style="width:100%; height:50px; overflow:auto">
               <table class="list-area table" >
                   <thead>
                       <tr>
                           <th width="30px">번호</th>
                           <th width="50px">카테고리</th>
                           <th width="100px">상품명</th>
                           <th width="50px">가격</th>
                           <th width="40px">품절</th>
                           <th width="40px">유통기한</th>
                           <th width="30px">등록일</th>
                           <th width="10px">적립률</th>
                       </tr>
                   </thead>
                   <tbody>
                   
                       <%if (list.isEmpty()){ %>
                       <tr>
                           <td colspan="8"> 조회된 게시글이 없습니다.</td>
                       </tr>
                       <%}else{ %>
                           <% for(Product p : list){ %>
                       <tr>
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
               
               <!--  세부 사항 보기 // 나중에 구현
               
               <script>
               $(function(){
                   $(".list-area>tbody>tr").click(function(){
                       location.href = '<%=contextPath%>/detail.bo?no=' + $(this).children().eq(0).text();
                   })
               })
               
               </script>
               -->
           
               <br>

       		<br><br>
       		
       		<form id="searchForm" action="<%=contextPath%>/search.adPro" method=post>
				  <input type="hidden" name="cpage" value="2" >

                  <table class="table-bordered" style="width:700px">
                    <tr>
                        <td>상품명</td>
                        <td>
                            <input type="text" class="form-control-sm" name="proName" style="width:300px"> 
                        </td>
                    </tr>
                    <tr>
                        <td>상품분류</td>
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
                        <td>품절여부</td>
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
                        <td>유통기한 잔여일</td>
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
                        <td>상품 가격</td>
                        <td>
                            <div class="input-group-prepend input-group-sm">
                                <input type="text" class="form-control" name="lowPrice" placeholder="원"> 
                                <span style="font-size: 130%;">~</span>
                                <input type="text" class="form-control" name="highPrice" placeholder="원">
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>등록일</td>
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
        


</body>
</html>