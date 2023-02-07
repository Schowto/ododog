<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<%@ page import="java.util.ArrayList , com.odd.common.model.vo.PageInfo, com.odd.product.model.vo.Product" %>

<%
	ArrayList<Product> list = (ArrayList<Product>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	String order = (String)request.getAttribute("order");
	String by = (String)request.getAttribute("by");
	String byAdv = (String)request.getAttribute("byAdv");
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

	 .order>a{
     	opacity:0.4;
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
        	
        	<!-- 오름차순/내림차순 버튼 변경 -->
        	<script>
                $(function(){
					let by = "<%=by%>";                	
                	let order ="<%=order%>";
                	
                    switch(order){
                        case "PRO_NO" : 
                            if(by == "ASC"){
                                $("#btn1").html("번호↑");
                            }else{
                                $("#btn1").html("번호↓");
                            }
                            $("#btn1").css("opacity","1");
                            $("#btn1").attr("href","<%=contextPath%>/list.adPro?cpage=<%=pi.getCurrentPage()%>&&order=<%=order%>&&by=<%=byAdv%>");
                       break;
                            
                       case "CATEGORY" :
                           if(by == "ASC"){
                               $("#btn2").html("카테고리↑");
                           }else{
                               $("#btn2").html("카테고리↓");
                           }
                           $("#btn2").css("opacity","1");
                           $("#btn2").attr("href","<%=contextPath%>/list.adPro?cpage=<%=pi.getCurrentPage()%>&&order=<%=order%>&&by=<%=byAdv%>");
                       break;
                       
                       case "PRICE" :
                           if(by == "ASC"){
                               $("#btn3").html("가격↑");
                           }else{
                               $("#btn3").html("가격↓");
                           }
                           $("#btn3").css("opacity","1");
                           $("#btn3").attr("href","<%=contextPath%>/list.adPro?cpage=<%=pi.getCurrentPage()%>&&order=<%=order%>&&by=<%=byAdv%>");
                       break;
                               
                       case "EXPIRED_DATE" :
                           if(by == "ASC"){
                               $("#btn4").html("유통기한↑");
                           }else{
                               $("#btn4").html("유통기한↓");
                     	   }
                           $("#btn4").css("opacity","1");
                           $("#btn4").attr("href","<%=contextPath%>/list.adPro?cpage=<%=pi.getCurrentPage()%>&&order=<%=order%>&&by=<%=byAdv%>");
                       break;

                    }

                })
        	
        	</script>
        	
        
            <br>
            <h2>전체 상품 조회</h2>
            <br>
            	<div class="order">
	                <a class="btn btn-sm btn-secondary" id="btn1" href="<%=contextPath%>/list.adPro?cpage=<%=pi.getCurrentPage()%>&&order=PRO_NO&&by=ASC">번호</a>
	                <a class="btn btn-sm btn-secondary" id="btn2" href="<%=contextPath%>/list.adPro?cpage=<%=pi.getCurrentPage()%>&&order=CATEGORY&&by=ASC">카테고리</a>
	                <a class="btn btn-sm btn-secondary" id="btn3" href="<%=contextPath%>/list.adPro?cpage=<%=pi.getCurrentPage()%>&&order=PRICE&&by=ASC">가격</a>
	                <a class="btn btn-sm btn-secondary" id="btn4" href="<%=contextPath%>/list.adPro?cpage=<%=pi.getCurrentPage()%>&&order=EXPIRED_DATE&&by=ASC">유통기한</a>
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
                        <li class="page-item"><a class="page-link" href="<%=contextPath%>/list.adPro?cpage=<%=pi.getCurrentPage()-1%>&&order=<%=order%>&&by=<%=by%>">&lt;</a></li>
                    <% }else{ %>
                        <li class="page-item disabled"><a class="page-link " href="">&lt;</a></li>
                    <%} %>
                    
                    <% for(int p = pi.getStartPage(); p <= pi.getEndPage(); p++){ %>
                    <% 	if(pi.getCurrentPage() == p){ %>
                            <li class="page-item active"><a class="page-link" href="<%=contextPath%>/list.adPro?cpage=<%=p%>&&order=<%=order%>&&by=<%=by%>"><%=p%></a></li>
                    <% 	}else { %>	
                            <li class="page-item"><a class="page-link" href="<%=contextPath%>/list.adPro?cpage=<%=p%>&&order=<%=order%>&&by=<%=by%>"><%=p%></a></li>
                    <% 	} %>
                    <% } %>
                    
                    <% if(pi.getCurrentPage() != pi.getMaxPage()){%>
                        <li class="page-item"><a class="page-link" href="<%=contextPath%>/list.adPro?cpage=<%=pi.getCurrentPage()+1%>&&order=<%=order%>&&by=<%=by%>">&gt;</a></li>
                    <% }else{ %>
                        <li class="page-item disabled"><a class="page-link" href="">&gt;</a></li>
                    <%} %>
                </ul>

        </div>
    </div>



</body>
</html>