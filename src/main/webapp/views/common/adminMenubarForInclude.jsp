<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.odd.member.model.vo.Admin"%>
<%	
	String contextPath = request.getContextPath();
	String alertMsg = (String)session.getAttribute("alertMsg");
	Admin loginAdmin = (Admin)session.getAttribute("loginAdmin");
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

        /* 수정 : wrap클래스 스타일 여기에 작성 & position:relative 속성 부여 */
        .wrap {
            width: 1200px;
            margin: auto;
            position:relative;
        }
        .wrap>div {float: left;}
        div {box-sizing: border-box;}
     
        /* 수정 : 사이드 고정 위해 position속성 */
        #side {
            height: 100vh;
            background: rgb(50, 50, 50);
            position:fixed;
        }

        /* 수정 : position속성 */
        #header {
            width:75%; height:40px;
            padding: 7px 0px;
            color: rgb(50, 50, 50);
            font-size: 13px;
            position:absolute;
            left:300px;
        }

        /* 수정 : height 삭제, position속성 */
        #content {
            width: 75%;
            padding-top: 20px;
            color: rgb(50, 50, 50);
            position:absolute;
            left:300px;
            top:36px;
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

        #side p {
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
		<% if(alertMsg != null) { %>
		<script>
			alert("<%=alertMsg%>");
		</script>
		<% session.removeAttribute("alertMsg"); %>
		<% } %>
		
 

        <div id="side">
            
            <br><br>
            <div id="logo" style="color:white;" align="center">
                <img src="<%= contextPath %>/resources/icons/logoW.png" width="150">
            </div>
            <hr>
            <div id="home">
                <img src="<%= contextPath %>/resources/icons/logout.png" width="13">
                <a href="">사이트 바로가기</a>
            </div>
            <hr>
            <br>

            <div id="navi">
                <div>
                    &nbsp&nbsp&nbsp<img src="<%= contextPath %>/resources/icons/profileW.png" width="20">&nbsp
                    회원관리
                </div>
                <p>
                    <a href="<%=contextPath%>/views/member/adminUserListView.jsp">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp회원관리</a>
                </p>

                <div>
                    &nbsp&nbsp&nbsp<img src="<%= contextPath %>/resources/icons/bag.png" width="20">&nbsp
                    상품 관리
                </div>
                <p>
                    <a href="<%=contextPath%>/list.adPro?cpage=1&&order=PRO_NO">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp전체 상품 조회</a>
                    <a href="<%=contextPath%>/search.adPro?cpage=1">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp상품 검색 및 관리</a>
                    <a href="<%=contextPath%>/enroll.adPro">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp상품 등록</a>
                </p>

                <div>
                    &nbsp&nbsp&nbsp<img src="<%= contextPath %>/resources/icons/package.png" width="20">&nbsp
                    주문 관리
                </div>
                <p>
                    <a href="<%=contextPath%>/list.adOrd?cpage=1&&order=주문번호">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp전체 주문 조회</a>
                    <a href="<%=contextPath%>/search.adOrd?cpage=1">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp주문 배송 처리</a>
                </p>

                <div>
                    &nbsp&nbsp&nbsp<img src="<%= contextPath %>/resources/icons/board.png" width="20">&nbsp
                    게시판관리
                </div>
                <p>
                    <a href="">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp공지사항 관리</a>
                    <a href="">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp자유게시판 관리</a>
                    <a href="">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp레시피게시판 관리</a>
                </p>

                <div>
                    &nbsp&nbsp&nbsp<img src="<%= contextPath %>/resources/icons/headphone.png" width="20">&nbsp
                    고객센터관리
                </div>
                <p>
                    <a href="<%=contextPath%>/FAQlist.ad">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspFAQ</a>
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
            	
            <hr style="margin-top:30px; border:4px solid rgb(220, 220, 220);">
        </div>

</body>

</html>