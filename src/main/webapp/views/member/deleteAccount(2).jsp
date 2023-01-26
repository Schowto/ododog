<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        width:20%; height:100%;
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
        margin:auto;
        margin-top:180px;
        margin-bottom: 200px;
        width:75%;
        height:100%;
        display: inline-block;
    }
    .delete{
        width:100%;
        margin:auto;
    }
    .deleteText{
        margin:auto;
        font-size: 13px;
        color:rgbargb(50, 50, 50);
        font-weight:600;
    }
    table{
        border-collapse: collapse;
        border-spacing: 0;
        border-top:1px solid rgb(220, 220, 220);
    }
    td{
        margin:auto;
        border-bottom: 1px solid rgb(220, 220, 220);
        border-left:1px solid rgb(220, 220, 220);
        height:60px;
        color:rgb(50, 50, 50);
    }
    td:first-child{
        border-left:none;
    }
    #deleteBtn2{
        border-radius:4px; 
        background:white; 
        width:80px; 
        height:30px; 
        border:1px solid gray;
    }
    #deleteBtn1{
        color:white; 
        background:rgb(200, 140, 140); 
        border:none;
        margin-bottom:3px;
        border-radius:4px;
        width:80px;  
        height:30px; 
        font-size: 13px;
        text-align: center;
        line-height: 12px;
        border:1px solid rgb(200, 140, 140); 
    }
    option{
        font-size: 13px;
    }
</style>
<!-- 부트스트랩 css 사용 -->
<link rel="stylesheet" href="/css/bootstrap.css">
<!--  부트스트랩 js 사용 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="/js/bootstrap.js"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 제이쿼리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<body>

	<%@ include file="../common/userMenubar.jsp" %>

    <div class="outer">

        <div id="side">
            <br><br><br><br><br>
            <p style="font-size:23px;">MYPAGE</p>
            <hr>
            <a href="<%=contextPath%>/myOrder.me" style="font-size:17px;">주문조회</a> <br><br>
            <a href="<%=contextPath%>/myPage.me" style="font-size:17px; color:rgb(200, 140, 140);">회원정보</a> <br><br>
            <a href="" style="font-size:17px;">관심상품</a> <br><br>
            <a href="<%=contextPath%>/myPoint.me" style="font-size:17px;">적립금</a> <br><br>
            <a href="<%=contextPath%>/myBoard.me" style="font-size:17px;">게시글조회</a> <br><br>
            <a href="" style="font-size:17px;">1:1맞춤상담</a>
        </div>

        <script>
             $("#side a").hover(function(){
                $(this).css("color", "rgb(200, 140, 140)");
            }, function(){
                 $(this).css("color", "rgb(50, 50, 50)");
             })
         </script>

        <div class="content">
        
            <h2 align="center" style="color:rgb(50, 50, 50); font-weight:600;">회원탈퇴</h2>
            <br><br><br><br>

            <div class="delete"">

                <div class="deleteText">
                    혜택 내역
                </div>
                <br>

                <div class="deletePassword">
                    <form>
                        <table>
                            <tr>
                                <td style="width:200px; text-align:center; font-size: 13px;">적립금</td>
                                <td style="width:800px; font-weight: 900; font-size: 12px;">
                                    &nbsp;탈퇴하면 적립금이 삭제됩니다. <br><br>
                                    &nbsp;현재 보유하신 적립금은 (회원적립금들어갈자리) 원 입니다. 
                                </td>
                            </tr>
                        </table>
                    </form>
                </div>
                <br><br>

                <div class="deleteText">
                    회원 탈퇴 사유
                </div>
                <br>

                <div class="deletePassword">
                    <form>
                        <table>
                            <tr>
                                <td style="width:200px; text-align:center; font-size: 13px;">선택</td>
                                <td style="width:800px;">
                                    &nbsp;&nbsp; 
                                    <select name="deleteReason" id="deleteReason" style="height:25px; font-size:13px;">
                                        <option value="no" selected>&nbsp;&nbsp;-선택안함-&nbsp;&nbsp;</option>
                                        <option value="">&nbsp;&nbsp;상품종류가 부족하다</option>
                                        <option value="">&nbsp;&nbsp;상품가격이 비싸다</option>
                                        <option value="">&nbsp;&nbsp;배송이 느리다</option>
                                        <option value="">&nbsp;&nbsp;삼담원 고객응대 서비스가 불만이다</option>
                                        <option value="">&nbsp;&nbsp;쇼핑몰 혜택이 부족하다(쿠폰, 적립금, 할인 등)</option>
                                        <option value="">&nbsp;&nbsp;이용빈도가 낮다</option>
                                        <option value="">&nbsp;&nbsp;기타</option>
                                    </select>
                                </td>
                            </tr>
                        </table>
                    </form>
                </div>
                <br>

                <!-- Button to Open the Modal -->
                <div align="center">
                    <button type="button" class="btn btn-primary" id="deleteBtn1" data-toggle="modal" data-target="#checkModal">
    				    탈퇴
  				    </button>
                    <button onclick="location.href='<%=contextPath%>/myPage.me'" id="deleteBtn2">취소</button>
                </div>

  				<!-- The Modal -->
  				<div class="modal fade" id="checkModal">
    				<div class="modal-dialog modal-sm">
      				<div class="modal-content">
      
        				<!-- Modal Header -->
        				<div class="modal-header">
          				<h4 class="modal-title" style="font-size:13px;">정말 오도독(DOG)을 탈퇴하시겠습니까?</h4>
          				<button type="button" class="close" data-dismiss="modal">&times;</button>
        				</div>
        
        				<!-- Modal body -->
        				<div class="modal-body">
         				
        				</div>
        
        				<!-- Modal footer -->
        				<div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">예</button>
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">아니오</button> 
        				</div>
        
      					</div>
    					</div>
  				</div>

                <script>
                    $(function(){
                        $("#btn").click(function(){
                            if(){
                            	
                            }else{
                            	location href="<%=contextPath%>/review.me";
                            }
                        })
                    })
                </script>


            </div>


        </div>

        <%@ include file="../common/userFooterbar.jsp"%> 

    </div>

</body>
</html>