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

    .selected{
        background:rgb(220,220,220);
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
        list-style-type:none;
        padding:0;
        margin:0;
        width:100%;
        height:100%;
    }
    .sort-filter>li{
        border:1px solid rgb(220, 220, 220);
        border-radius: 5px;
        float:right;
        width:6%;
        height:100%;
        cursor:pointer;
    }

    .sort-filter{overflow:hidden}

    /* 썸네일 */
    .thumbnail{
        display:inline-block;
        margin:40px 20px;
    }
    .thumbnail-img-area{
        cursor:pointer;
    }
    .thumbnail-img-area img:hover, .title-pointed{
        transform:scale(1.2);
        transition:transform .5s;
    }
    .thumbnail-img-area img{
        transform:scale(1.0);
        transition:transform .5s;
    }
    .thumbnail p{
        cursor:pointer;
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

        <ul class="sort-filter" style="font-size:13px;">
           <li class>댓글순</li>
           <li class>하트순</li>
           <li class="selected">최신순</li>
        </ul>
        <br>

        <script>
            $(".sort-filter>li").click(function(){
                //console.log($(this).text());
                $(this).addClass('selected');
                $(this).siblings().removeClass('selected');
            })
        </script>



        <div class="list-area" style="font-size:15px;">

            <!-- 레시피 없는 경우 -->
            <div>
                <br><br><br><br><br>
                등록된 레시피가 없습니다.
                <br><br><br><br><br>
            </div>

            <!-- 레시피 있는 경우 -->
            <div class="thumbnail" align="center">
                <div class="thumbnail-img-area" style="width:230px; height:200px; overflow:hidden;">
                    <img src="https://recipe.bom.co.kr/uploads/posts/images/20220422/6262298eec8f5.png" width="100%" height="100%">
                </div>
                <p style="margin:5px;">오리스튜</p>
                <div align="right" style="width:250px; font-size:12px;" class="heart-area">
                    <img src="<%= contextPath %>/resources/icons/comment.png" width="15"> 2
                    <div class="heart-area" style="display:inline-block;">
                        <!-- 좋아요 안했을 경우 -->
                        <img src="<%= contextPath %>/resources/icons/heart.png" width="15" style="margin-left:7px; cursor:pointer;">
                        <!-- 좋아요 했을 경우 -->
                        <img src="<%= contextPath %>/resources/icons/heartR.png" width="15" style="margin-left:7px; cursor:pointer;">
                    </div>
                </div>
            </div>

            <div class="thumbnail" align="center">
                <div class="thumbnail-img-area" style="width:230px; height:200px; overflow:hidden;">
                    <img src="https://recipe.bom.co.kr/uploads/posts/images/20220610/62a29ff919b33.png" width="100%" height="100%">
                </div>
                <p style="margin:5px;">캐롭짜장면</p>
                <div align="right" style="width:250px; font-size:12px;">
                    <img src="<%= contextPath %>/resources/icons/comment.png" width="15"> 2
                    <div class="heart-area" style="display:inline-block;">
                        <img src="<%= contextPath %>/resources/icons/heart.png" width="15" style="margin-left:7px; cursor:pointer;">
                    </div>
                </div>
            </div>

            <div class="thumbnail" align="center">
                <div class="thumbnail-img-area" style="width:230px; height:200px; overflow:hidden;">
                    <img src="https://recipe.bom.co.kr/uploads/posts/images/20220516/628208f0c4f90.png" width="100%" height="100%">
                </div>
                <p style="margin:5px;">소간칩 칙촉</p>
                <div align="right" style="width:250px; font-size:12px;">
                    <img src="<%= contextPath %>/resources/icons/comment.png" width="15"> 2
                    <div class="heart-area" style="display:inline-block;">
                        <img src="<%= contextPath %>/resources/icons/heartR.png" width="15" style="margin-left:7px; cursor:pointer;">
                    </div>
                </div>
            </div>

            <div class="thumbnail" align="center">
                <div class="thumbnail-img-area" style="width:230px; height:200px; overflow:hidden;">
                    <img src="https://recipe.bom.co.kr/uploads/posts/images/20220422/6262298eec8f5.png" width="100%" height="100%">
                </div>
                <p style="margin:5px;">오리스튜</p>
                <div align="right" style="width:250px; font-size:12px;" class="heart-area">
                    <img src="<%= contextPath %>/resources/icons/comment.png" width="15"> 2
                    <div class="heart-area" style="display:inline-block;">
                        <!-- 좋아요 안했을 경우 -->
                        <img src="<%= contextPath %>/resources/icons/heart.png" width="15" style="margin-left:7px; cursor:pointer;">
                        <!-- 좋아요 했을 경우 -->
                        <img src="<%= contextPath %>/resources/icons/heartR.png" width="15" style="margin-left:7px; cursor:pointer;">
                    </div>
                </div>
            </div>
            
            <div class="thumbnail" align="center">
                <div class="thumbnail-img-area" style="width:230px; height:200px; overflow:hidden;">
                    <img src="https://recipe.bom.co.kr/uploads/posts/images/20220610/62a29ff919b33.png" width="100%" height="100%">
                </div>
                <p style="margin:5px;">캐롭짜장면</p>
                <div align="right" style="width:250px; font-size:12px;">
                    <img src="<%= contextPath %>/resources/icons/comment.png" width="15"> 2
                    <div class="heart-area" style="display:inline-block;">
                        <img src="<%= contextPath %>/resources/icons/heart.png" width="15" style="margin-left:7px; cursor:pointer;">
                    </div>
                </div>
            </div>
            
            <div class="thumbnail" align="center">
                <div class="thumbnail-img-area" style="width:230px; height:200px; overflow:hidden;">
                    <img src="https://recipe.bom.co.kr/uploads/posts/images/20220516/628208f0c4f90.png" width="100%" height="100%">
                </div>
                <p style="margin:5px;">소간칩 칙촉</p>
                <div align="right" style="width:250px; font-size:12px;">
                    <img src="<%= contextPath %>/resources/icons/comment.png" width="15"> 2
                    <div class="heart-area" style="display:inline-block;">
                        <img src="<%= contextPath %>/resources/icons/heartR.png" width="15" style="margin-left:7px; cursor:pointer;">
                    </div>
                </div>
            </div>


        </div>

        <script>
            $(".thumbnail>p").mouseover(function(){
                $(this).css("font-weight","600").css("color","rgb(200,140,140)");
                $(this).siblings(".thumbnail-img-area").children().css("transform", "scale(1.2)");
            })
            $(".thumbnail>p").mouseleave(function () {
                $(this).css("font-weight", "500").css("color", "rgb(50,50,50)");
                $(this).siblings(".thumbnail-img-area").children().css("transform", "scale(1.0)");
            })
            $(".thumbnail-img-area>img").mouseover(function () {
                $(this).parent().siblings("p").css("font-weight", "600").css("color", "rgb(200,140,140)");
                $(this).css("transform", "scale(1.2)");
            })
            $(".thumbnail-img-area>img").mouseleave(function () {
                $(this).parent().siblings("p").css("font-weight", "500").css("color", "rgb(50,50,50)");
                $(this).css("transform", "scale(1.0)");
            })

            $(".heart-area>img").click(function(){
                //console.log($(this).attr("src"));
                if($(this).attr("src") == "<%= contextPath %>/resources/icons/heart.png"){
                    $(this).attr("src", "<%= contextPath %>/resources/icons/heartR.png");
                } else {
                    $(this).attr("src", "<%= contextPath %>/resources/icons/heart.png");
                }
            })

        </script>

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