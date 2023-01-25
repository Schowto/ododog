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
    #board-area{
        /*border:1px solid blue;*/
        width:80%; height:100%;
        float:left;
    }
    .paging-area button{
        border:none;
        background:none;
        color:rgb(50, 50, 50);
    }
    .paging-area button:hover{
        background:rgb(220,220,220);
        font-weight:700;
    }

    /* 검색창 */
    #search-area{
        width:900px;
        padding:30px;
        border-radius:5px;
        background:rgb(220, 220, 220);
    }
    #search-area label{
        position:relative;
        margin:0px 7px;
        height:30px;
        width:70px;
        cursor:pointer;
    }
    #search-area span{
        /*border: 1px solid red;*/
        position:absolute;
        margin:auto;
        left:0; right:0; top:0; bottom:0;
        text-align:center;
        line-height:30px;
    }
    #search-area button:hover{
        background:rgb(240, 240, 240);
    }

    #select-effect input, #select-time input{
        position:absolute;
        opacity:0;
    }

    /* 정렬순서 */
    .sort-filter{
        border: 1px solid red;
        list-style-type:none;
        padding:0;
        margin:0;   /* ul요소가 기본적으로 갖고 있는 여백, 간격 없애기 */
        width:100%;
        height:100%;    /* 상위 요소에 가로세로 길이가 지정되어있어야 하위 요소에서 지정 가능 */
    }
    .sort-filter>li{
        border:1px solid blue;
        float:left;
        width:7%;
        height:100%;
    }
    #navi a{
        border:1px solid orange;
        text-decoration:none;
        color:darkorange;
        font-size:18px;
        font-weight: 900;       /* 인라인요소> 블럭단위로 영역이 잡히지 않음 글자만 영역으로 잡힘
                                   영역을 박스 안까지 늘리면 박스만 눌러도 글자 클릭된 것처럼 되지 */
        width:100%; height:100%; /* 가로세로길이는 블럭요소에서만 먹힘 */
        display:block;
        text-align: center;
        /*vertical-align: middle;*/ /* 요곤 또 인라인요소에서만 먹히는 속성 */
        line-height:35px;
    }
    #navi a:hover{
        color:orangered;
    }
    #navi>li>ul{
        list-style-type: none;
        padding:0;
        margin:0;
        display:none;
    }
    #navi>li>ul a{
        font-size:15px;
    }
    
    #navi>li:hover>ul{  /* hover되는 요소 & 적용할 요소 동시에 작성 */
        display:block;
    }


    
    
    /****** footer ******/
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

	<%@ include file="../common/userMenubar.jsp" %>
	
	<div id="content">
    
    
        <div id="side">
            <br><br><br><br><br>
            <p style="font-size:23px;">COMMUNITY</p>
            <hr>
            <a href="" style="font-size:17px;">자유게시판</a> <br><br>
            <a href="" style="font-size:17px; color:rgb(200, 140, 140);">레시피게시판</a>
        </div>

        <script>
            $("#side a").hover(function(){
                $(this).css("color", "rgb(200, 140, 140)");
            }, function(){
                $(this).css("color", "rgb(50, 50, 50)");
            })
        </script>

	<div id="board-area" align="center">
    
		<div>
		    <br><br><br><br><br><br><br>
		    <h2 style="color:rgb(50, 50, 50); font-weight:600;">레시피게시판</h2>
		    <br>
		</div>
		<br><br>
		
		<form id="search-area">

            <table style="font-size:15px;">

                <tr>
                    <td width="200" height="50" style="font-weight:600;">아이들에게 필요한 건?</td>
                    <td width="500" id="select-effect">

                        <label class="checkbox" style="border-radius:5px; background: white;">
                            <input type="checkbox" name="effect" value="10">
                            <span>다이어트</span>
                        </label>
                        <label class="checkbox" style="border-radius:5px; background: white;">
                            <input type="checkbox" name="effect" value="20">
                            <span>모질개선</span>
                        </label>
                        <label class="checkbox" style="border-radius:5px; background: white;">
                            <input type="checkbox" name="effect" value="30">
                            <span>구강개선</span>
                        </label>
                        <label class="checkbox" style="border-radius:5px; background: white;">
                            <input type="checkbox" name="effect" value="40">
                            <span>관절관련</span>
                        </label>
                        <label class="checkbox" style="border-radius:5px; background: white;">
                            <input type="checkbox" name="effect" value="50">
                            <span>장관련</span>
                        </label>

                    </td>
                </tr>

                <tr>
                    <td height="50" style="font-weight:600;">만드는 시간은?</td>
                    <td id="select-time">
                        <label class="checkbox" style="border-radius:5px; background: white;">
                            <input type="checkbox" name="time" value="10">
                            <span>10분</span>
                        </label>
                        <label class="checkbox" style="border-radius:5px; background: white;">
                            <input type="checkbox" name="time" value="20">
                            <span>30분</span>
                        </label>
                        <label class="checkbox" style="border-radius:5px; background: white;">
                            <input type="checkbox" name="time" value="30">
                            <span>1시간~</span>
                        </label>
                        <label class="checkbox" style="border-radius:5px; background: white;">
                            <input type="checkbox" name="time" value="40">
                            <span>2시간~</span>
                        </label>
                    </td>
                </tr>

                <tr>
                    <td colspan="2" align="center" style="padding-top:50px; font-size:18px; font-weight:600; line-height:26px;">
                        내가 가진 재료로 레시피 추천받기 <br>
                        <input type="text" name="ingredient" style="width:400px; height:25px; border-radius:5px; border:none;">
                        <button type="submit" style="height:25px; width:50px; border:none; margin-top:10px;">
                            <img src="<%= contextPath %>/resources/icons/search.png" width="12px" style="opacity:0.5; margin-bottom:5px;">
                        </button>
                        
                    </td>
                </tr>

            </table>

        </form>

        <script>

            $(":checkbox").change(function(){
                //console.log($(this).prop("checked"));

                if($(this).prop("checked")){
                    $(this).parent().css("backgroundColor","rgb(200, 140, 140)").css("color","white");
                } else {
                    $(this).parent().css("backgroundColor", "white").css("color","rgb(50, 50, 50)");
                }

            })

        </script>

        <br><br><br><br>

        <ul class="sort-filter">
           <li>최신순</li>
           <li>하트순</li>
           <li>댓글순</li>
        </ul>





		
		
		
		<br><br><br>
        
        <div class="paging-area" align="center">

            <a href=""><button>&lt;</button></a>
            <a href=""><button>1</button></a>
            <a href=""><button>2</button></a>
            <a href=""><button>3</button></a>
            <a href=""><button>4</button></a>
            <a href=""><button>5</button></a>
            <a href=""><button>6</button></a>
            <a href=""><button>7</button></a>
            <a href=""><button>8</button></a>
            <a href=""><button>9</button></a>
            <a href=""><button>10</button></a>
            <a href=""><button>&gt;</button></a>
            
		</div>
		<br><br><br><br><br><br><br>

	</div>
	
	
	<div id="footer" style="height:200px; background:rgb(220, 220, 220);">
     
		<div id="footer-1">
		    <p style="font-size:12px;">
		        COMPANY : (주)오도독 CEO : 강보람 PHONE : 031-1234-5678 / FAX : 02-1234-9999 <br>
		        BUSINESS LICENCE : [828-88-01900] E-COMMERCE PERMINT 2020-성남중원-0191 <br>
		        ADDRESS : 13201 경기도 성남시 중원구 갈마치로288번길 14 (상대원동) SK V1타워101호
		    </p>
		    <br><br>
		    <p style="font-size:12px; font-weight:700;">Copyright(C) 2023 (주)오도독 ALL RIGHTS REVERVED</p>
		</div>
		<div id="footer-2">
		    <a href="">회사소개</a> <br>
		    <a href="">개인정보처리방침</a> <br>
		    <a href="">이용약관</a> <br>
		    <a href="">이용안내</a> <br>
		</div>
    
	</div>
	

</body>
</html>