<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.odd.member.model.vo.Admin"%>
<%	
	String contextPath = request.getContextPath();

	Admin loginAdmin = (Admin)session.getAttribute("loginAdmin");
	
	String alertMsg = (String)session.getAttribute("alertMsg");
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <!-- Popper JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        div {/*border:1px solid red;*/ box-sizing: border-box;}

        .wrap {
            /* 전체 -> ????? 세로 사이즈는 여기서 조정 ,,????? */
            /*border:1px solid blue;*/
            width: 1200px; height: 700px;
            margin: auto;
            background: rgb(220, 220, 220);
        }

        .wrap>div {float: left;}

        #side {
            width: 25%; height: 100%;
            background: rgb(50, 50, 50);
        }

        #header {
            width: 75%; height: 30px;
            margin-bottom: 10px;
            background: white;
            color: rgb(50, 50, 50);
            font-size: 13px;
        }

        #content {
            width: 75%; height: 660px;
            padding-top: 20px;
            color: rgb(50, 50, 50);
            background: white;
        }

        button {	/* 버튼 스타일 일단 설정해놨어요,,!! 각자 페이지에서 바꿔도 됨 */
            font-size: 13px;
            border: 2px solid rgb(220, 220, 220);
            background: white;
            color: rgb(50, 50, 50);
            border-radius: 5px;
        }
        button:hover{
            font-weight: 600;
            background: rgb(220, 220, 220);
        }
        .btn-red{   /* 빨간 버튼 */
        font-size: 13px;
        border: 2px solid rgb(200, 140, 140);
        background: white;
        color: rgb(50, 50, 50);
        border-radius: 5px;
        }
        .btn-red:hover{
            font-weight: 600;
            background:rgb(200, 140, 140);
            color:white;
        }


        /******** 사이드 *******/
        #logo {
            width: 100%; height: 100px;
            position: relative;
        }

        #logo img {
            position: absolute;
            margin: auto;
            left: 0;
            right: 0;
            top: 0;
            bottom: 0;
        }

        #side hr {
            width: 250px;
            background: rgb(220, 220, 220);
        }

        #home {
            width: 100%; height: 30px;
            text-align: center;
        }

        #home a {
            font-size: 13px;
            color: white;
            text-decoration: none;
        }

        #navi {
            width: 300px;
            font-size: 17px;
            cursor: pointer;
        }

        #navi>div {
            /* 상위메뉴들 */
            color: white;
            height: 50px;
            line-height: 50px;
        }

        #side  p {
            /*border: 1px solid yellow;*/
            width: 100%;
            margin-top: 5px;
            display: none;
        }

        #side p>a {
            display: block;
            color: white;
            font-size: 13px;
            padding: 10px;
        }

        #side p>a:hover {
            /* 하위메뉴들 */
            background-color: gray;
            color: white;
            text-decoration: none;
            font-weight: 700;
        }

        /******** 상단 *******/
        #header>div {
            height: 100%;
            float: left;
            line-height: 25px;
        }

        #page {width: 70%}

        #admin-profile {
            width: 27%;
            text-align: right;
        }
    </style>
</head>

<body>

    <div class="wrap">

        <div id="side">

            <div id="logo" style="color:white;" align="center">
                <img src="<%= contextPath %>/resources/icons/logoW.png" width="150">
            </div>
            <hr>
            <div id="home">
                <img src="<%= contextPath %>/resources/icons/logout.png" width="13">
                <a href="">사이트 바로가기</a>
            </div>
            <hr>

            <div id="navi">
                <div>
                    &nbsp&nbsp&nbsp<img src="<%= contextPath %>/resources/icons/profileW.png" width="20">&nbsp
                    회원관리
                </div>
                <p>
                    <a href="">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp회원</a>
                    <a href="">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp관리</a>
                </p>

                <div>
                    &nbsp&nbsp&nbsp<img src="<%= contextPath %>/resources/icons/bag.png" width="20">&nbsp
                    상품관리
                </div>
                <p>
                    <a href="">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp상품</a>
                    <a href="">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp관리</a>
                    <a href="">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp관리</a>
                </p>

                <div>
                    &nbsp&nbsp&nbsp<img src="<%= contextPath %>/resources/icons/package.png" width="20">&nbsp
                    주문관리
                </div>
                <p>
                    <a href="">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp주문</a>
                    <a href="">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp관리</a>
                </p>

                <div>
                    &nbsp&nbsp&nbsp<img src="<%= contextPath %>/resources/icons/board.png" width="20">&nbsp
                    게시판관리
                </div>
                <p>
                    <a href="">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp게시판</a>
                    <a href="">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp관리</a>
                </p>

                <div>
                    &nbsp&nbsp&nbsp<img src="<%= contextPath %>/resources/icons/headphone.png" width="20">&nbsp
                    고객센터관리
                </div>
                <p>
                    <a href="">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp고객센터</a>
                    <a href="">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp관리</a>
                </p>
            </div>

        </div>

        <script>
            $(function () {
                $("#navi>div").click(function () {

                    const $p = $(this).next();

                    if ($p.css("display") == "none") {
                        $(this).siblings("p").slideUp();
                        $p.slideDown();
                    } else {
                        $p.slideUp();
                    }

                })
            })
        </script>


        <div id="header">
            <div id="page">
                &nbsp&nbsp&nbsp<img src="<%= contextPath %>/resources/icons/home.png" width="15">&nbsp&nbsp&nbsp>&nbsp&nbsp나중에생각해보기
            </div>
            <div id="admin-profile">

                <!-- 로그인 전 -->
                <% if(loginAdmin == null) { %>
                <img src="<%= contextPath %>/resources/icons/profile.png" width="15" style="margin-right:10px;">
                <a href="<%=contextPath %>/views/member/loginAdmin.jsp" style="text-decoration:none; color:rgb(50, 50, 50); font-weight:700;">로그인</a>
				
				 <%}else{ %>
				 
                <!-- 로그인 후 -->
                <img src="<%= contextPath %>/resources/icons/loginProfile.png" width="15" style="margin-right:10px;">관리자님
                <a href="<%=contextPath %>/logout.ad"
                    style="margin-left:30px; text-decoration:none; color:rgb(50, 50, 50); font-weight:700;">로그아웃</a>
	
				<%} %>	
            </div>
        </div>


        <div id="content">
            내용<br>내용<br>내용<br>내용<br>내용<br>내용<br>내용<br>내용<br>내용<br>내용<br>내용<br>내용<br>내용<br>내용<br>내용<br>내용<br>내용<br>내용<br>
        </div>

    </div>





</body>

</html>