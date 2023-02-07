<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.ArrayList, com.odd.order.model.vo.AdminOrder, com.odd.order.model.vo.OrdPro" %>

<%
	AdminOrder o = (AdminOrder)request.getAttribute("o");
	ArrayList<OrdPro> list = (ArrayList<OrdPro>)request.getAttribute("list");
	Object savePoint = request.getAttribute("savePoint");
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
   	 
   	 .list-area th{
   	 	background-color: rgba(228, 228, 228, 0.384);
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
            <h2> 주문 정보
           	</h2>
            <br>
			
			<!-- 상하 스크롤바 -->
			<div style="width:80%; height:350px; overflow:auto white-space: nowrap;">
			 
			   <!-- 주문 검색 결과 테이블 -->				
               <table class="list-area table" >
                   <thead>
                       <tr>
                           <th width="40%" colspan="2">주문번호</th>
                           <td width="60%" colspan="2"><%=o.getOrdNo() %></td>
                       </tr>
                       <tr>
                       <tr>
                           <th width="40%" colspan="2">고객이름</th>
                           <td width="60%" colspan="2"><%=o.getUserName() %></td>
                       </tr>
                           <th width="40%" colspan="2">고객주소</th>
                           <td width="60%" colspan="2"><%=o.getAddress() %></td>
                       </tr>
                       <tr>
                           <th width="40%" colspan="2">핸드폰</th>
                           <td width="60%" colspan="2"><%=o.getPhone() %></td>
                       </tr>
                       <tr>
                           <th width="40%" colspan="2">이메일</th>
                           <td width="60%" colspan="2"><%=o.getEmail() %></td>
                       </tr>
                       <tr>
                           <th width="40%" colspan="2">배송지</th>
                           <td width="60%" colspan="2"><%=o.getDelAdd() %></td>
                       </tr>
                       <tr>
                           <th width="40%" colspan="2">배송시 요청 사항</th>
                           <td width="60%" colspan="2"><%=o.getRequire() %></td>
                       </tr>
                       <tr>
                           <th width="40%" colspan="2">사용 적립급</th>
                           <td width="60%" colspan="2"><%=o.getDiscount() %></td>
                       </tr>
                       <tr>
                           <th width="40%" colspan="2">최종 결제 금액</th>
                           <td width="60%" colspan="2"><%=o.getTotalPrice() %></td>
                       </tr>
                       <tr>
                           <th width="40%" colspan="2">예상 적립금</th>
                           <td width="60%" colspan="2"><%=savePoint%></td>
                       </tr>
                   </thead>
                   <tbody>
                   	 
                       <%if (list.isEmpty()){ %>
                       <tr>
                           <td colspan="4"> 조회된 주문이 없습니다.</td>
                       
                       <%}else{ %>
                           <% for(OrdPro op : list){ %>
	                           </tr>                           
		                           <th>상품명</th>
		                           <td colspan="3" rowspan="4">
                                        <img src="<%=op.getThumbImg()%>" class="img-thumbnail" style="width:40%; height:40%;" alt="">
		                           </td>
	                           </tr>
                               </tr>
	                           	 	 <td><%= op.getProName() %></td> 
                           	   </tr>
	                           </tr>    
		                           <th>수량</th>
	                           </tr>
	                           </tr>    
		                           <td><%= op.getAmount() %></td>
	                           </tr>
                           <%} %>
                       <%} %>  
                       
                       
                   </tbody>
               </table>
               
                   <form action="<%=contextPath%>/confirm.adOrd" method="post">
				    	<input type="hidden" name="ordNo" value="<%=o.getOrdNo()%>">
				    	<input type="hidden" name="userNo" value="<%=o.getUserNo()%>">
				    	<input type="hidden" name="savePoint" value="<%=savePoint%>">
				    	<input type="hidden" name="discount" value="<%=o.getDiscount()%>">
				    	<button type="submit" class="btn btn-primary">주문 승인</button>
				    </form>
				               
            </div>
               
            <br><br><br><br><br><br>
            <br><br><br><br><br><br>
            <br><br><br><br><br><br>
        
        
    </div>
    </div>
</body>
</html>