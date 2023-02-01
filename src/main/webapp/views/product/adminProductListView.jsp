<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<%@ page import="java.util.ArrayList , com.odd.common.model.vo.PageInfo, com.odd.product.model.vo.Product" %>

<%
	ArrayList<Product> list = (ArrayList<Product>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	String order = (String)request.getAttribute("order");
%>        
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체 상품 조회</title>

<style>

    .list-area{
        text-align: center;
        font-size: 80%;
    }
    
    .list-area>tbody>tr:hover{
    	background:gray;
    	
    }
    
	.page{ 
		float:right;
	}

	.order{
		height: 50px;
		text-align: right;
	}
	
	#deleteBTN{
		float:left;
		margin-left:10px;
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
		
		<!-- 관리자 로그인 확인 (마지막에 추가 예정)
		<% if(loginAdmin == null) { %>
		<script>
			alert("로그인 후 사용해주시기바랍니다.");
			history.back();
		</script>
		<% } %>
		-->
		 
        <div id="content" align="center">
        
        
            <br>
            <h2>전체 물품 조회</h2>
            <br>
            	<div class="order">
	                <a class="btn btn-sm btn-secondary" href="<%=contextPath%>/list.adPro?cpage=<%=pi.getCurrentPage()%>&&order=PRO_NO">번호</a>
	                <a class="btn btn-sm btn-secondary" href="<%=contextPath%>/list.adPro?cpage=<%=pi.getCurrentPage()%>&&order=CATEGORY">카테고리</a>
	                <a class="btn btn-sm btn-secondary" href="<%=contextPath%>/list.adPro?cpage=<%=pi.getCurrentPage()%>&&order=PRICE">가격</a>
	                <a class="btn btn-sm btn-secondary" href="<%=contextPath%>/list.adPro?cpage=<%=pi.getCurrentPage()%>&&order=EXPIRED_DATE">유통기한</a>
				</div>
				<br>
                <table class="list-area table" >
                    <thead>
                        <tr>
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
                            <td colspan="8"> 조회된 상품이 없습니다.</td>
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
            
                <br><br>
                
                <ul class="page pagination">
                    
                    <% if(pi.getCurrentPage() != 1){%>
                        <li class="page-item"><a class="page-link" href="<%=contextPath%>/list.adPro?cpage=<%=pi.getCurrentPage()-1%>&&order=<%=order%>">&lt;</a></li>
                    <% }else{ %>
                        <li class="page-item disabled"><a class="page-link " href="">&lt;</a></li>
                    <%} %>
                    
                    <% for(int p = pi.getStartPage(); p <= pi.getEndPage(); p++){ %>
                    <% 	if(pi.getCurrentPage() == p){ %>
                            <li class="page-item active"><a class="page-link" href="<%=contextPath%>/list.adPro?cpage=<%=p%>&&order=<%=order%>"><%=p%></a></li>
                    <% 	}else { %>	
                            <li class="page-item"><a class="page-link" href="<%=contextPath%>/list.adPro?cpage=<%=p%>&&order=<%=order%>"><%=p%></a></li>
                    <% 	} %>
                    <% } %>
                    
                    <% if(pi.getCurrentPage() != pi.getMaxPage()){%>
                        <li class="page-item"><a class="page-link" href="<%=contextPath%>/list.adPro?cpage=<%=pi.getCurrentPage()+1%>&&order=<%=order%>">&gt;</a></li>
                    <% }else{ %>
                        <li class="page-item disabled"><a class="page-link" href="">&gt;</a></li>
                    <%} %>
                </ul>

        </div>
    </div>



</body>
</html>