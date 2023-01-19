<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	
	String contextPath = request.getContextPath();
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
        div {/*border:1px solid red;*/box-sizing: border-box;}
        .wrap {margin: auto; width: 1200px;}

        .menubar {
            height: 200px; width: 1200px;
            margin: auto;
        }
        .menubar>div {float: left;}
        
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


        /* 로고 */
        #logo-area {
            width:25%; height:100%;
            position: relative;
        }

        #logo-area>img {
            position: absolute;
            margin: auto;
            top: 0; bottom: 0; left: 0; right: 0;
        }

        /* 아이콘 */
        #icons {
            width: 75%; height: 30%;
            padding-right: 30px;
            padding-top: 30px;
            font-size: 12px;
        }

        #icons img {width:20px; margin:7px;}

        #user-id{
            text-decoration:none;
            color:rgb(200, 140, 140);
            font-weight:900;
        }
        #logout{
            text-decoration:none;
            color:rgb(50, 50, 50);
            font-weight:900;
            margin: 0px 10px;
        }

        /* 내비게이터*/
        #navigator {width: 75%; height: 70%}

        #navi {
            list-style-type: none;
            padding: 0;
            margin-top: 30px;
            width: 100%;
            height: 30%;
        }

        #navi>li {
            /*border:1px solid red;*/
            float: left;
            width: 15%;
            height: 100%;
            margin: 2%;
        }

        #navi a {
            text-decoration: none;
            color: rgb(50, 50, 50);
            font-size: 15px;
            font-weight: 700;
            width: 100%;
            height: 100%;
            display: block;
            text-align: center;
            line-height: 30px;
        }

        #navi a:hover {color: black;}

        #navi>li>ul {
            /*border:1px solid red;*/
            list-style-type: none;
            padding: 0;
            margin: 0;
            display: none;
        }

        #navi>li>ul a {font-size: 13px;}

        #navi>li:hover>ul {
            background: rgba(255, 255, 255, 0.3);
            display: block;
        }

        #navi>li>ul>li:hover {background: rgba(255, 255, 255, 0.5);}

        #navi>li>ul a:hover {color: rgb(200, 140, 140);}

    </style>
</head>

<body>

    <div class="wrap">

        <div class="menubar">

            <div id="logo-area">
                <img src="<%= contextPath %>/resources/icons/logo.png" width="200px" height="90px">
            </div>

            <div id="icons" align="right">

                <!-- 로그인 전 -->
                <img src="<%= contextPath %>/resources/icons/profile.png">
                <!-- 로그인 후 -->
                <img src="<%= contextPath %>/resources/icons/loginProfile.png">
                <a href="" id="user-id">누구누구</a>님 반갑습니다!
                <a href="" id="logout">로그아웃</a>

                <!-- 공통 -->
                <img src="<%= contextPath %>/resources/icons/cart.png">
                <img src="<%= contextPath %>/resources/icons/search.png">

            </div>

            <div id="navigator">
                <ul id="navi">

                    <li><a href="">HOME</a></li>

                    <li><a href="">SHOP</a>
                        <ul>
                            <li><a href="">SH</a></li>
                            <li><a href="">OP</a></li>
                        </ul>
                    </li>

                    <li><a href="">COMMUNITY</a>
                        <ul>
                            <li><a href="">자유게시판</a></li>
                            <li><a href="">레시피게시판</a></li>
                        </ul>
                    </li>

                    <li><a href="">MY PAGE</a>
                        <ul>
                            <li><a href="">마이</a></li>
                            <li><a href="">페이지</a></li>
                        </ul>
                    </li>

                    <li><a href="">고객센터</a>
                        <ul>
                            <li><a href="">FAQ</a></li>
                            <li><a href="">1:1상담</a></li>
                        </ul>
                    </li>

                </ul>
            </div>

        </div>

    </div>

</body>

</html>