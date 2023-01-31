<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<%@ page import="java.util.ArrayList , com.odd.common.model.vo.PageInfo, com.odd.order.model.vo.AdminOrder, java.text.SimpleDateFormat" %>

<%
	ArrayList<AdminOrder> list = (ArrayList<AdminOrder>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	String order = (String)request.getAttribute("order");
%>        
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>

    .list-area{
        text-align: center;
        font-size: 80%;
    }
    
    .list-area>tbody>tr:hover{
    	background:gray;
    	
    }
    
	.page { 
		float:right;
		color:black;
	;}
	
	.order{
		height: 50px;
		text-align: right;
	}
	
	#deleteBTN{
		float:left;
		margin-left:10px;
	}

</style>

</head>

<body>

    <div class="wrap">
 	    <%@ include file="../common/adminMenubarForInclude.jsp" %>

        <div id="content" align="center">
        
        
            <br>
            <h2>전체 주문 조회</h2>
            <br>
            	<div class="order">
	                <a class="btn btn-sm btn-secondary" href="<%=contextPath%>/list.adOrd?cpage=<%=pi.getCurrentPage()%>&&order=PRO_NO">번호</a>
	                <a class="btn btn-sm btn-secondary" href="<%=contextPath%>/list.adOrd?cpage=<%=pi.getCurrentPage()%>&&order=CATEGORY">카테고리</a>
	                <a class="btn btn-sm btn-secondary" href="<%=contextPath%>/list.adOrd?cpage=<%=pi.getCurrentPage()%>&&order=PRICE">가격</a>
	                <a class="btn btn-sm btn-secondary" href="<%=contextPath%>/list.adOrd?cpage=<%=pi.getCurrentPage()%>&&order=EXPIRED_DATE">유통기한</a>
				</div>
				<br>
				
				
				<div style="width:100%; height:520px; overflow:auto; white-space: nowrap;">
	                <table class="list-area table" >
	                    <thead>
	                        <tr>
	                           <th width="10px">주문 번호</th>
	                           
	                           <th width="170px">상품명</th>
	                           <th width="10px">상품 개수</th>
	                           
	                           <th width="20px">유저 이름</th>
	                           <th width="150px">배송지</th>
	                           <th width="30px">휴대전화</th>
	                           <th width="50px">이메일</th>
	                           
	                           <th width="50px">최종결제금액</th>
	                           
	                           <th width="10px">결제 여부</th>
	                           <th width="10px">배송 여부</th>
	                           
	                           <th width="600px">배송시 요청 사항</th>
	                           
	                           
	                        </tr>
	                    </thead>
	                    <tbody>
	                    
	                        <%if (list.isEmpty()){ %>
	                        <tr>
	                            <td colspan="11"> 조회된 주문이 없습니다.</td>
	                        </tr>
	                        <%}else{ %>
	                            <% for(AdminOrder o : list){ %>
	                        <tr>
	                            <td><%= o.getOrdNo() %></td>
	                            
	                            <td><%= o.getProName() %></td>
	                            <td><%= o.getAmount() %></td>
	                            
	                            <td><%= o.getUserName() %></td>
	                            <td><%= o.getDelAdd() %></td>
	                            <td><%= o.getPhone() %></td>
	                            <td><%= o.getEmail()%></td>
	                            
	                            <td><%= o.getTotalPrice() %></td>
	                            
	                            <td><%= o.getPayment() %></td>
	                            <td><%= o.getDelivery() %></td>
	                            
	                            <td><%= o.getRequire() %></td>
	                            
	                        </tr>
	                            <%} %>
	                        <%} %>  
	                        
	                        
	                    </tbody>
	                </table>
            	</div>
            	
                <br><br>
                
                <ul class="page pagination">
                    
                    <% if(pi.getCurrentPage() != 1){%>
                        <li class="page-item"><a class="page-link" href="<%=contextPath%>/list.adOrd?cpage=<%=pi.getCurrentPage()-1%>&&order=<%=order%>">&lt;</a></li>
                    <% }else{ %>
                        <li class="page-item disabled"><a class="page-link " href="">&lt;</a></li>
                    <%} %>
                    
                    <% for(int p = pi.getStartPage(); p <= pi.getEndPage(); p++){ %>
                    <% 	if(pi.getCurrentPage() == p){ %>
                            <li class="page-item active"><a class="page-link" href="<%=contextPath%>/list.adOrd?cpage=<%=p%>&&order=<%=order%>"><%=p%></a></li>
                    <% 	}else { %>	
                            <li class="page-item"><a class="page-link" href="<%=contextPath%>/list.adOrd?cpage=<%=p%>&&order=<%=order%>"><%=p%></a></li>
                    <% 	} %>
                    <% } %>
                    
                    <% if(pi.getCurrentPage() != pi.getMaxPage()){%>
                        <li class="page-item"><a class="page-link" href="<%=contextPath%>/list.adPOrd?cpage=<%=pi.getCurrentPage()+1%>&&order=<%=order%>">&gt;</a></li>
                    <% }else{ %>
                        <li class="page-item disabled"><a class="page-link" href="">&gt;</a></li>
                    <%} %>
                </ul>

        </div>
    </div>



</body>
</html>