<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<%@ page import="java.util.ArrayList , com.odd.common.model.vo.PageInfo, com.odd.product.model.vo.Product, java.text.SimpleDateFormat" %>

<%
	ArrayList<Product> list = (ArrayList<Product>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
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
        font-size: 80%
    }
    
    .list-area>tbody>tr:hover{
    	background:gray;
    	cursor:pointer;
    }
    
    .list-area>tbody>tr:hover{
    	background:gray;
    	cursor:pointer;
    }

	.page { 
		float:right;
		color:black;
	;}
	
	.order{
		text-align: right;
	}
	
</style>

</head>

<body>

    <div class="wrap">
 	    <%@ include file="../common/adminMenubarForInclude.jsp" %>

        <div id="content" align="center">
        
        
            <br>
            <h2>전체 물품 조회</h2>
            <br>
            	<div class="order">
	                <a class="btn btn-sm btn-secondary" href="<%=contextPath%>/list.pro?cpage=<%=pi.getCurrentPage()%>&&order=PRO_NO">번호</a>
	                <a class="btn btn-sm btn-secondary" href="<%=contextPath%>/list.pro?cpage=<%=pi.getCurrentPage()%>&&order=CATEGORY">카테고리</a>
	                <a class="btn btn-sm btn-secondary" href="<%=contextPath%>/list.pro?cpage=<%=pi.getCurrentPage()%>&&order=PRICE">가격</a>
	                <a class="btn btn-sm btn-secondary" href="<%=contextPath%>/list.pro?cpage=<%=pi.getCurrentPage()%>&&order=EXPIRED_DATE">유통기한</a>
				</div>
				<br>
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
                
                
                <!--  세부 사항 보기 // 나중에 구현
                
                <script>
                $(function(){
                    $(".list-area>tbody>tr").click(function(){
                        location.href = '<%=contextPath%>/detail.bo?no=' + $(this).children().eq(0).text();
                    })
                })
                
                </script>
                -->
            
                <br><br>
                
                <ul class="page pagination">
                    
                    <% if(pi.getCurrentPage() != 1){%>
                        <li class="page-item"><a class="page-link" href="<%=contextPath%>/list.pro?cpage=<%=pi.getCurrentPage()-1%>&&order=<%=request.getAttribute("order")%>">&lt;</a></li>
                    <% }else{ %>
                        <li class="page-item disabled"><a class="page-link " href="">&lt;</a></li>
                    <%} %>
                    
                    <% for(int p = pi.getStartPage(); p <= pi.getEndPage(); p++){ %>
                    <% 	if(pi.getCurrentPage() == p){ %>
                            <li class="page-item active"><a class="page-link" href="<%=contextPath%>/list.pro?cpage=<%=p%>&&order=<%=request.getAttribute("order")%>"><%=p%></a></li>
                    <% 	}else { %>	
                            <li class="page-item"><a class="page-link" href="<%=contextPath%>/list.pro?cpage=<%=p%>&&order=<%=request.getAttribute("order")%>"><%=p%></a></li>
                    <% 	} %>
                    <% } %>
                    
                    <% if(pi.getCurrentPage() != pi.getMaxPage()){%>
                        <li class="page-item"><a class="page-link" href="<%=contextPath%>/list.pro?cpage=<%=pi.getCurrentPage()+1%>&&order=<%=request.getAttribute("order")%>">&gt;</a></li>
                    <% }else{ %>
                        <li class="page-item disabled"><a class="page-link" href="">&gt;</a></li>
                    <%} %>
                </ul>

        </div>
    </div>



</body>
</html>