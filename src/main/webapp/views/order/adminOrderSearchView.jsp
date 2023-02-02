<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.ArrayList, com.odd.order.model.vo.AdminOrder, com.odd.product.model.vo.AdminProSearch" %>

<%
	ArrayList<AdminOrder> list = (ArrayList<AdminOrder>)request.getAttribute("list");
%>    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 배송 처리</title>

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
</style>

</head>

<body>
	<div class="wrap">
 	    
 	    <%@ include file="../common/adminMenubarForInclude.jsp" %>

        <div id="content" align="center">
        
            <br>
            <h2>배송 가능한 주문 
            	<span class="font-italic font-weight-lighter" style="font-size:0.4em;"> 유통기한, 재고, 결제 유무</span>
           	</h2>
            <br>
			
			<!-- 상하 스크롤바 -->
			<div style="width:100%; height:350px; overflow:auto white-space: nowrap;">
			 
			   <!-- 주문 검색 결과 테이블 -->				
               <table class="list-area table" >
                   <thead>
                       <tr style="white-space: nowrap;">
                           <th width="50px">배송여부</th>
                           <th width="5px">번호</th>
                           <th width="170px">상품명</th>
                           <th width="100px">배송지</th>                           
                           <th width="15px">최종결제금액</th>
                           <th width="5px">적립률</th>
                           <th width="300px">배송시 요청 사항</th>
                           
                       </tr>
                   </thead>
                   <tbody>
                   
                       <%if (list.isEmpty()){ %>
                       <tr>
                           <td colspan="7"> 조회된 주문이 없습니다.</td>
                       </tr>
                       <%}else{ %>
                           <% for(AdminOrder p : list){ %>
                       <tr role="button" data-toggle="modal" data-target="#myModal">
                          
                           <td></td>
                           <td></td>
                           <td></td>
                           <td></td>
                          
                       </tr>
                           <%} %>
                       <%} %>  
                       
                       
                   </tbody>
               </table>
            </div>
               
            <br><br><br>
       		
       		<!-- 
       			>> 배송 가능한 상품
       			   
       			   결제 O
       			   배송 X
       			   품절 X
       			   유통기한 남아있는 상품
       			   
       			   -> 기본 검색 조건으로 추가
       			 
       		 -->
       		<form id="searchForm" action="<%=contextPath%>/search.adOrd" method="post">
				  <input type="hidden" name="cpage" value="2" >

                  <table class="table-bordered" style="width:700px">
                    <tr>
                        <td>상품명</td>
                        <td>
                            <input type="text" class="form-control-sm" name="proName" style="width:300px"> 
                        </td>
                    </tr>
                    
                    <tr>
                        <td>고객명</td>
                        <td>
                            <input type="text" class="form-control-sm" name="proName" style="width:300px"> 
                        </td>
                    </tr>
                    
                    <tr>
                        <td>최종 결제 금액</td>
                        <td>
                            <div class="input-group-prepend input-group-sm">
                                <input type="text" class="form-control" name="lowPrice" placeholder="원"> 
                                <span style="font-size: 130%;">~</span>
                                <input type="text" class="form-control" name="highPrice" placeholder="원">
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