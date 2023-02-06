<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.ArrayList, com.odd.product.model.vo.UserProduct, com.odd.product.model.vo.ProAtt" %>	
<%
	ArrayList<UserProduct>list=(ArrayList<UserProduct>)request.getAttribute("list");
%>	    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
       
        form{
        
        width:1200px;
        height:auto;
        font-size: 13px;
        margin-top:50px;
        
        }
        #select{
            margin: auto;
            display: block;
        }
        
    
    </style>
</head>
<body>
	<%@ include file="../common/userMenubar.jsp"%>
   <div class="wrap">
        <form action="" >
            <table align="center">
                <br>
                <img src="<%=contextPath%>/resources/icons/search.png" width=30px; height=30px;>
                상품 상세 검색</h4>
                <br><br>
                <tr>
                    <td>상품분류</td>
                    <td>
                        <select id="category" name="category">
                            <option value="food">주식</option>
                            <option value="dry">건조간식</option>
                            <option value="oven">오븐간식</option>
                            <option value="party">PARTY</option>
                        </select>    
                    </td>
                </tr>
                <tr>
                    <td>상품명</td>
                    <td>
                        <select id="category2" name="category2" >
                            <option value="productName">상품명</option>
                            <option value="productCode">상품코드</option> 
                        </select>
                    </td>
                    <td>
                        <input type="text">
                    </td>
                </tr>
                <tr>
                    <td>판매가격대</td>
                    <td><input type="text" name="price1" size="6"> ~ </td>
                    <td><input type="text" name="price2"> </td>
                </tr>
                <tr>
                    <td>검색정렬기준</td>
                    <td>
                        <select id="category3" name="category3" >
                            <option value="newProduect">신상품 순</option>
                            <option value="newProduect">상품명 순</option>
                            <option value="newProduect">낮은가격 순</option>
                            <option value="newProduect">높은가격 순</option> 
                        </select>
                    </td>
                </tr>
            </table>
            <br><br>
            <button type="submit" id="select" class="btn btn-secondary btn-sm">검색</button>
            <br><br>
            </form>
           	
           	
           	<% if(list.isEmpty()) { %>
				<div>
				<p>존재하는 상품이 없습니다.</p>
				</div>
				<% }%>
				
				<div class="list-area">
					<% for(UserProduct p : list){ %>
					
						<div class="thumbnail" align="center">
							<input type="hidden" value="<%=p.getProNo() %>">
							<img src="<%=contextPath%>/<%= p.getThumbImg()%>" width="300px" height="300px">
							
							<p> 
								<%= p.getProName() %> <br>
								<b><%= p.getPrice() %>원</b>
							</p>
							<div class="badge bg-info text-light">추천</div>
						
						</div>
						<%} %>
					</div>
						
							
			</div>
			
			<script>
				$(function(){
					$(".thumbnail").click(function(){
						location.href = "<%=contextPath%>/detail.pro?no=" + $(this).children('input').val();
					})
				})
			</script>
           
           
       
    <%@ include file="../common/userFooterbar.jsp"%>
    
                
                
</body>
</html>