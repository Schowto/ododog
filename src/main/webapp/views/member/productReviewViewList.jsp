<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title><%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.odd.member.model.vo.*, java.util.ArrayList, com.odd.product.model.vo.*" %>
<%
	ArrayList<Review> list = (ArrayList<Review>)request.getAttribute("list");
	Product p = (Product)request.getAttribute("p");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    /******리뷰 스타일*******/
	.reviewLine{
    width:1000px;
    height:3px;
    background: rgba(128, 128, 128, 0.26);
    margin:auto;
    }
	.reviewContent{
		width:1000px;
		margin:auto;
	}
	.reviewTable{
		width:100%;
	}
    .reviewTable textarea{
        resize:none; 
        border:none;
        background-color: rgba(128, 128, 128, 0.285);
		width:1000px;
		height:400px;
    }
    .reviewTable table{
        border-collapse: collapse;
        border-spacing: 0;
        width:800px;
        margin:auto;
        border-top:2px solid rgba(128, 128, 128, 0.26);
        margin:auto;

    }
    .reviewTable td{
		border-bottom: 2px solid rgb(220,220,220);
    }
    .reviewTable img{
        box-sizing: border-box;
        width:100px;
        height:100px;
    }
    .reviewTable td:last-child{
        border-bottom:3px solid rgba(128, 128, 128, 0.26);
    }
	.reviewTable td{
		border-bottom:3px solid rgb(220,220,220);
		
	}
	/*****별점구현부분*****/
    /*덮어씌워진회색별*/
    .star {
    position: relative;
    font-size: 2rem;
    color: #ddd;
  }
  
  /*range부분*/
  .star input { 
    width: 100%;
    height: 100%;
    position: absolute;
    left: 0;
    opacity: 0;
    cursor: pointer;
  }
  
  /*노란색으로표시될별*/
  .star span {
    width: 0;
    position: absolute; 
    left: 0;
    color: yellow;
    overflow: hidden; 
    pointer-events: none;
  }

</style>
</head>
<body>
	<%@ include file="../common/userMenubar.jsp"%>
	<br><br>

	<div class="reviewContent">

		<H2 align="center">상품리뷰</H2>

        <div class="reviewLine"></div>
        <br><br>

        	<table class="reviewTable">
					<%if(list.isEmpty()){ %>
					<!-- 리뷰가없을때 -->
	                	<tr style="text-align:center;">
	                		<td colspan="4" style="height:50px; font-weight: 600;" >
		                		<br>
								<br> <img src="<%=contextPath%>/resources/images/error.png"> <br><br>
									상품에 대한 리뷰가 존재하지않습니다. <br>
								<br>
								<br>
							</td>
	                	</tr>
                	<%}else{ %>
	                	<%for(Review r : list){ %>
	                	<!-- 리뷰가있을때 -->
							<tr>
								<td style="height:50px; width:60%; border-bottom: none;">
									<div name="myStar" id="myStar">
                                            <span class="star">
                                                ★★★★★
                                                <span>★★★★★</span>
                                                <input type="range" name="star" id="reviewStar" oninput="drawStar(this)" value="<%=r.getStar() %>" step="1" min="0" max="10">
                                              </span>
                         
                         
                         
                                        </div>
								<td rowspan="2"><img src="<%=r.getReviewPhoto()%>"></td>
								<td rowspan="2">
									&nbsp;&nbsp;상품명 : <%=r.getProName() %> <br>
									&nbsp;&nbsp;작성자 : <%=r.getUserId() %><br>
									&nbsp;&nbsp;작성일 : <%=r.getModifyDate() %>
								</td>
							</tr>
							<tr>
								<td style="height:50px;">&nbsp;&nbsp;<%=r.getReviewTitle() %></td>
							</tr>
							<tr>
							<td colspan="3">
								<p>
									&nbsp;&nbsp;리뷰내용 : <br><br>
									&nbsp;&nbsp;<textarea name="reviewContent"><%=r.getReviewContent() %></textarea>
								</p>
							</td>
						</tr>
						<%} %>
					<% } %>
						
                </table>
                
                <script>
      					$( document ).ready( function() {
        					$( '.reviewTable>thead' ).click( function() {
          						$( '.reviewContent' ).slideDown();
        					} );
      					} );
    				</script>	

        </div>

		<br><br><br><br><br><br><br><br><br>

	</div>
	
	<!--별점구현부분-->
    <script>
        const drawStar = (target) => {
            document.querySelector(`.star span`).style.width = `${target.value * 10}%`;
            let value = document.querySelector("#reviewStar").value();
        }
    </script>

	
	

</body>
</html>
</head>
<body>

</body>
</html>