<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.odd.member.model.vo.*"%>
<%
	//MyOrder m = (MyOrder)request.getAttribute("m");
	//Review r = (Review)request.getAttribute("r");
	MyOrder m = (MyOrder)request.getAttribute("m");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .outer{
        /*border:1px solid black;*/
        margin:auto;
        height:100%;
        width:1200px;
    }

    /****** 사이드 ******/
    #side{
        /*border:1px solid blue;*/
        width:20%; 
        height:100%;
        padding:20px;
        color: rgb(50, 50, 50);
        font-weight: 600;
        float:left;
    }
    #side>hr{margin-bottom:30px; border:1px solid rgb(220,220,220);}
    #side>a{
        text-decoration:none;
        color: rgb(50, 50, 50);
    }

    /****** 내용 ******/
    .content{
        width:75%;
        height:100%;
        margin:auto;
        margin-top:180px;
        margin-bottom:200px;
        display: inline-block;
        margin-left:40px;
    }
    .myOrderView{
        margin:auto;
        width: 100%;
        height:150px;
        border:1px solid rgb(220,220,220);
    }
    .myOrderReview{
        width:100%;
        margin:auto;
    }
    .myOrderView table{
        width:100%;
        height:150px;
    }
    .myOrderView td{
       text-align: center;
       font-weight: 600;
    }
    .myOrderView img{
        width:100%;
        height:100%;
        box-sizing: border-box;
    }
    .starTable td:first-child{
        width:200px;
        height:50px;
        border-right:1px solid rgb(220,220,220);
        text-align:center;
        font-size: 14px;
        font-weight: 600;
        color:rgb(50, 50, 50);
    }
    .starTable td:last-child{
        width:600px;
        height:50px;
    }
    .starTatble td{
        border-collapse: collapse;
        border-spacing: 0;
        border-top:1px solid rgb(220,220,220);
    }
    #myStar fieldset{
        display: inline-block;
        border:none;
        direction:ltr;

    }
    #myStar input[type=radio]{
        display:none;
    }
    #myStar label{
        font-size:3em;
        color:transparent;
        text-shadow: 0 0 0 #f0f0f0;
    }
    #myStar label:hover{
        text-shadow:rgba(255, 255, 0, 0.505);
    }
    #myStar label:hover~label{
        text-shadow:rgba(255, 255, 0, 0.505);
    }
    .contentTable td{
        border-top:1px solid rgb(220,220,220);
        border-bottom:1px solid rgb(220,220,220);
    }
    textarea{
        resize:none; 
        border:none;
        background-color: rgba(128, 128, 128, 0.285);
    }
    .starTable, .contentTatble{
        width:100%;
        margin:auto;
    }
    input[type=text]{
        border:none;
    }
    .reviewContent{
        margin:auto;
        width:100%;
    }
    #btnWrap{
        width:70px;
        margin:auto;
    }
    table{
		width:100%;
		border-top:1px solid rgb(220,220,220);
		border-collapse: collapse;
		border-spacing: 0;
	}
	.contentTable td{
		height:50px;
		color:rgb(50, 50, 50);
		border-bottom:1px solid rgb(220,220,220);
		font-size:14px;
	}
	.consultEnroll input[type=text]{
		width:300px;
		border:1px solid rgb(220,220,220);
		color:rgb(50, 50, 50);
	}
	textarea{
		width:100%;
		height:400px;
		background: rgb(220,220,220);
		border:none;
		font-size:14px;
		box-sizing: border-box;
	}
	button{
		width:80px;
		height:40px;
	}
    #reviewStar{
        width:200px;
        height:30px;
    }
    .contentTable input[type=text]{
        width:400px;
        height:30px;
        border:1px solid rgb(220,220,220);

    }
    .starTable select, .starTable option{
        color:rgb(255, 230, 0);
        font-size: 20px;
        line-height: 30px;
        border:1px solid rgb(220,220,220);
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

	<%@include file="../common/userMenubar.jsp" %>

    <div class="outer">

        <div id="side">
            <br><br><br><br><br>
            <p style="font-size:23px;">MYPAGE</p>
            <hr>
            <a href="<%=contextPath%>/myOrder.me" style="font-size:17px;color:rgb(200, 140, 140);">주문조회</a> <br><br>
            <a href="<%=contextPath%>/myPage.me" style="font-size:17px;">회원정보</a> <br><br>
            <a href="<%=contextPath%>/myWhish.me" style="font-size:17px;">관심상품</a> <br><br>
            <a href="<%=contextPath%>/myPoint.me" style="font-size:17px;">적립금</a> <br><br>
            <a href="<%=contextPath%>/myBoard.me" style="font-size:17px;">게시글조회</a> <br><br>
            <a href="<%=contextPath%>/list.co" style="font-size:17px;">1:1맞춤상담</a>
        </div>

        <script>
             $("#side a").hover(function(){
                $(this).css("color", "rgb(200, 140, 140)");
            }, function(){
                 $(this).css("color", "rgb(50, 50, 50)");
             })
         </script>

        <div class="content">

            <h2 align="center" style="color:rgb(50,50,50); font-weight:600;">주문조회 > 리뷰작성</h2>
            <br><br><br><br>

            <div class="myOrderReview">

                <div style="font-size:13px; color:rgb(50, 50, 50); font-weight:600;">
                    주문번호 : <input type="text" value="<%=m.getOrdNo()%>">
                </div>

                <br>

                <div class="myOrderView">
                    <form>
                        <table>
                            <tr>
                                <td style="width:150px;"><img src="<%=m.getTumbImg() %>" ></td>
                                <td style="width:250px;"><%=m.getProName() %></td>
                                <td style="width:200px; padding-right: 20px;"></td>
                                <td style="width:200px; text-align:left;">
                                    &nbsp;상품명 : <%=m.getProName() %> <br><br>
                                    &nbsp;구매자 : <%=m.getUserId() %> <br><br>
                                    &nbsp;총금액 : <%=m.getPrice() %>원
                                    
                                </td>
                            </tr>
                        </table>
                    </form>
                </div>
                <br>

                <div class="reviewContent">
                    <form action="<%=contextPath%>/reviewInsert.me" method="post" enctype="multipart/form-data">
                    	<input type="hidden" name="ordNo" value="<%=m.getProNo() %>">
                    	<input type="hidden" name="proName" value="<%=m.getProName() %>">
                    	<input type="hidden" name="userId" value="<%=m.getUserId() %>">
                        <input type="hidden" name="star" value="">
                        -->
                        <table class="starTable">
                                <tr>
                                    <td style="width:40%;">상품을 사용해보셨나요?</td>
                                    <td>
                                        <div name="myStar" id="myStar">
                                            <span class="star">
                                                ★★★★★
                                                <span>★★★★★</span>
                                                <input type="range" name="star" id="reviewStar" oninput="drawStar(this)" value="1" step="1" min="0" max="10">
                                              </span>
                                        
                                        </div>
                                    </td>
                                </tr>
                            </table>

                            <table class="contentTable">
                                <tr>
                                            <td colspan="2" style="font-size:14px; font-weight: 600; text-align: center; width:40%; border-right:1px solid rgb(220,220,220);">&nbsp;&nbsp;&nbsp;제목</td>
                                            <td colspan="2">
                                                &nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="reviewTitle" required>
                                            </td>
                                            
                                        </tr>
                                        <tr>
                                            <td colspan="4">
                                                <br>
                                                <textarea name="reviewContent" style="resize:none;" required></textarea>
                                                <br><br>
                                            </td>
                                        </tr>
                                        <tr>
											<td style="font-size:14px; font-weight: 600; text-align: center; width:40%; border-right:1px solid rgb(220,220,220);">첨부파일</td>
											<td colspan="3">&nbsp;&nbsp;<input type="file" name="upfile"></td>
										</tr>
                            </table>

                            <br>
                
                                    <div align="center">
                                    <button type="submit" id="btn">작성완료</button> &nbsp;&nbsp;
                                    <button type="button" class="btn-red" onclick="location.href='<%=contextPath%>/myOrder.me'">취소</button>
                                    </div>
                    </form>
					

				</div>

            </div>

        </div>



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