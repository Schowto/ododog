<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.outer{
		width:1200px;
		height:100%;
		margin:auto;
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
        display:inline-block;
	}
    table{
        width:100%;
        height: 100%;
        border-top:1px solid gray;
        border-collapse: collapse;
        border-spacing: 0;
        text-align:center;
    }
    .logoutUser td{
        border-bottom:1px solid gray;
    }
    .loginUser td{
        border-bottom:1px solid gray;
        height:50px;
    }
    #btn{
        width:70px;
        height:30px
    }
    #btnWrap{
        float:right;
    }
    .consultSearch{
        width:300px;
        margin:auto;
    }
</style>
</head>
<body>

	<%@ include file="../common/userMenubar.jsp"%>
	
	<div class="outer">

		<div id="side">
            <br><br><br><br><br>
            <p style="font-size:23px;">고객센터</p>
            <hr>
            <a href="<%=contextPath%>/myOrder.me" style="font-size:17px;">공지사항</a> <br><br>
            <a href="<%=contextPath%>/myPage.me" style="font-size:17px;">FAQ</a> <br><br>
            <a href="" style="font-size:17px; font-size:17px; color:rgb(200, 140, 140);">1:1 맞춤상담</a> <br><br>
        </div>

        <script>
            $("#side a").hover(function(){
                $(this).css("color", "rgb(200, 140, 140)");
            }, function(){
                $(this).css("color", "rgb(50, 50, 50)");
            })
        </script>

		<div class="content">

			<h2 align="center" style="font-weight:600; color:rgb(50, 50, 50);">1:1 문의 게시판</h2>
			<br><br><br><br>

			<div class="consultView">

                <div class="consultCategory">

                    
                </div>
                <!--게시물이없을때-->
                <form action="" class="logoutUser">
                    <table>
                        <tr style="height:50px;">
                            <td width="10%;">번호</td>
                            <td width="60%;">제목</td>
                            <td width="15%;">작성일</td>
                            <td width="15%;">답변</td>
                        </tr>
                        <tr style="height:100px;">
                            <td colspan="5" style="font-weight:600; color:rgba(18, 17, 17, 0.795);">
                                <br><br>
                                <img src="<%=contextPath%>/resources/images/error.png"> <br>
                                게시글이 존재하지 않습니다. 
                                <br><br><br>
                            </td>
                        </tr>
                    </table>
                </form>

                <br><br><br>

                <!--게시물이있을때-->
                <form action="" class="loginUser">
                    <table>
                        <tr>
                            <td width="10%;">번호</td>
                            <td width="60%;">제목</td>
                            <td width="15%;">작성일</td>
                            <td width="15%;">답변</td>
                        </tr>
                        <tr>
                            <td>3</td>
                            <td>배송관련문의드립니다</td>
                            <td>2023.01.27</td>
                            <td>미답변</td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td>배송관련문의드립니다</td>
                            <td>2023.01.27</td>
                            <td>답변완료</td>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td>배송관련문의드립니다</td>
                            <td>2023.01.27</td>
                            <td>답변완료</td>
                        </tr>
                    </table>
                </form>
                <br>

                    <div id="btnWrap">
                    <button id="btn">글쓰기</button>
                    </div>

                    <script>
                        $(function(){
                            $("#btn").click(function(){
                                location.href="<%=contextPath%>/consultEnroll.bo";
                            })
                        })
                    </script>
                    <br><br>

                    <div class="consultSearch">
                        <select name="" id="searchAnswer" style="height:21px;">
                            <option value=""  selected>전체</option>
                            <option value="">미답변</option>
                            <option value="">답변</option>
                        </select>
                        <input type="text" id="searchInput">
                    </div>

			</div>







		</div>






	</div>
	
	<%@ include file="../common/userFooterbar.jsp" %>

</body>
</html>