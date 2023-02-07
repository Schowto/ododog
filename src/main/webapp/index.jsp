<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <!-- Popper JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<style>
        #content{margin:auto; width:1200px;}

        
        /********* header *********/
        #header-carousel{
            width:1200px;
            position:absolute;
        }
        #header-carousel a{
            width:150px;
            height:200px;
            margin-top:30%;
        }

        #header-2{
            float:left;
            height:200px;
            width:100%;
            position:relative;
        }
        #header-2>div{float:left;}
        #header-logo{width:25%;height:100%;position:relative;}
        #header-logo>img{
            position:absolute;
            margin:auto;
            top:0;bottom:0;
            left:0;right:0;
        }
        #header-icons{
            width:75%; height:30%;
            padding-right: 30px;
            padding-top: 30px;
        }
        #navigator{width:75%;height:70%}

        /* header icons */
        #header-icons img{
            width:20px;
            margin:5px;
        }

        /* navigator */
        #navi{
            list-style-type:none;
            padding:0;
            margin-top:30px;
            width:100%;
            height:30%;
        }
        #navi>li{
            float:left;
            width:15%;
            height:100%;
            margin:2%;
        }
        #navi a{
            text-decoration:none;
            color:rgb(50, 50, 50);
            font-size:15px;
            font-weight: 700;
            width:100%; height:100%;
            display:block;
            text-align:center;
            line-height:30px;
        }
        #navi a:hover{color:black;}

        #navi>li>ul{
            list-style-type: none;
            padding:0;margin:0;
            display:none;
        }
        #navi>li>ul a{font-size:13px;}
        #navi>li:hover>ul{
            background:rgba(255, 255, 255, 0.3);
            display:block;
        }
        #navi>li>ul>li:hover{
            background:rgba(255, 255, 255, 0.5);
        }
        #navi>li>ul a:hover{
            color:rgb(200, 140, 140);
        }


        /********* content *********/
        #content{text-align:center;}
        #content1-icon, #content2-icon{height: 30px; width: 100%; padding-left:1100px;}


        /********* footer *********/
        #footer{clear:both}
        #footer>div{float:left; height:100%; padding:20px;}
        #footer-1{width:60%;}
        #footer-2{width:40%;}
        #footer-2 a{
            line-height:35px;
            color:rgb(50, 50, 50);
            text-decoration:none;
            font-size: 13px;
            font-weight: 700;
        }

    </style>
</head>
<body>

	<%@include file="views/common/userMenubar.jsp" %>
    <div id="content">

        <div id="demo" class="carousel slide" data-ride="carousel" style="z-index:-10;">
            
            <!-- Indicators -->
            <ul class="carousel-indicators">
                <li data-target="#demo" data-slide-to="0" class="active"></li>
                <li data-target="#demo" data-slide-to="1"></li>
                <li data-target="#demo" data-slide-to="2"></li>
            </ul>
            
            <!-- The slideshow -->
            <div class="carousel-inner" align="center" >
                <div class="carousel-item active">
                <img src="<%= contextPath %>/resources/icons/메인상단1.jpg" width="1200px" height="700px">
                </div>
                <div class="carousel-item">
                <img src="<%= contextPath %>/resources/icons/메인상단2.jpg" width="1200px" height="700px">
                </div>
                <div class="carousel-item">
                <img src="<%= contextPath %>/resources/icons/메인상단3.jpg" width="1200px" height="700px">
                </div>
            </div>
            
            <!-- Left and right controls -->
            <a class="carousel-control-prev" href="#demo" data-slide="prev">
                <span class="carousel-control-prev-icon"></span>
            </a>
            <a class="carousel-control-next" href="#demo" data-slide="next">
                <span class="carousel-control-next-icon"></span>
            </a>
    
        </div>
            <br><br><br><br>
        
            <div id="content1" style="height:430px">
                <br>
                <h4>NEW ARRIVALS</h4>
                <div id="content1-icon"><img src="<%=contextPath%>/resources/icons/plus.png" width="25" style="cursor:pointer;" onclick="location.href='<%=contextPath%>/list.food'"></div>
                
                <div id="content1-products"><!-- 상품자리 --></div>
        
            </div>
        
            <br><br><br><br>
        
            <div id="content2" style="height:430px">
                <br>
                <h4>BEST ITEMS</h4>
                <div id="content2-icon"><img src="<%=contextPath%>/resources/icons/plus.png" width="25" style="cursor:pointer;" onclick="location.href='<%=contextPath%>/list.food'"></div>
                
                <div id="content1-products"><!-- 상품자리 --></div>
            </div>

    </div>
    

        
	
	<br><br><br><br><br><br><br><br>

	<%@include file="views/common/userFooterbar.jsp" %>
	
	
</body>
</html>