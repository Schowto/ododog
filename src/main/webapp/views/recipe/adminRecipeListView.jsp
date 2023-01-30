<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>

    /******** 내용 *******/
    #content{/*border:1px solid pink;*/}

    #content p{
        margin-top:10px;
        margin-bottom:3px;
        margin-left:20px;
        font-weight:700;
    }
    #content hr{
        margin:10px 0px;
        border:1px solid rgb(220,220,220);
    }

    .list-area{
        width:850px;
        font-size:13px;
        text-align:center;
    }
    .list-area th{
        border-bottom: 2px solid rgb(220, 220, 220);
    }
    .list-area th, .list-area td{
        border-top: 1px solid rgb(220, 220, 220);
        padding:5px 0px; line-height:30px;
    }
    .list-area>tbody>tr:hover{font-weight:700; cursor: pointer;}

    .paging-area button{
        border:none;
        background:none;
        color:rgb(50, 50, 50);
    }
    .paging-area button:hover{
        background:rgb(220,220,220);
        font-weight:700;
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
        margin-top:20px;
        float:right;
        width:50px;
        cursor:pointer;
    }

    .sort-filter{overflow:hidden}
    .selected{
        background:rgb(220,220,220);
    }
    
</style>

</head>
<body>

    <div class="wrap">
        <%@ include file="../common/adminMenubarForInclude.jsp" %>
    
            <div id="content" align="center">
    
                <br>
                <div align="left">
                    <p>레시피 관리</p>
                </div>
                <hr>

                <div align="left" style="width:200px; float:left;">
                    <button style="width:100px; height:30px; margin:15px 20px 10px;">레시피 작성</button>
                </div>
    
                <ul class="sort-filter" style="width:700px; font-size:13px;">
                    <li class>댓글순</li>
                    <li class>하트순</li>
                    <li class="selected">최신순</li>
                </ul>
                
                <script>
                    $(".sort-filter>li").click(function () {
                        //console.log($(this).text());
                        $(this).addClass('selected');
                        $(this).siblings().removeClass('selected');
                    })
                </script>
    
                <table class="list-area">
                    <thead>
                        <tr>
                            <th width="60"></th>
                            <th width="40">글번호</th>
                            <th width="500">제목</th>
                            <th width="100">작성자</th>
                            <th width="100">작성일</th>
                            <th width="50">조회수</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td colspan="6" style="height:300px;"> 조회된 게시글이 없습니다.</td>
                        </tr>
    
                        <tr>
                            <td><input type="checkbox"></td>
                            <td>123</td>
                            <td>제목입니다요</td>
                            <td>나는 작성자</td>
                            <td>2023-01-27</td>
                            <td>3212</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox"></td>
                            <td>123</td>
                            <td>제목입니다요</td>
                            <td>나는 작성자</td>
                            <td>2023-01-27</td>
                            <td>3212</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox"></td>
                            <td>123</td>
                            <td>제목입니다요</td>
                            <td>나는 작성자</td>
                            <td>2023-01-27</td>
                            <td>3212</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox"></td>
                            <td>123</td>
                            <td>제목입니다요</td>
                            <td>나는 작성자</td>
                            <td>2023-01-27</td>
                            <td>3212</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox"></td>
                            <td>123</td>
                            <td>제목입니다요</td>
                            <td>나는 작성자</td>
                            <td>2023-01-27</td>
                            <td>3212</td>
                        </tr>
                    </tbody>
    
                    <tfoot>
                        <tr>
                            <td>
                                <button class="btn-red" style="height:25px; line-height:20px;">삭제</button>
                            </td>
                            <td colspan="5"></td>
                        </tr>
                    </tfoot>
    
    
                </table>
    
    
                <br>
    
                <div class="paging-area" align="center">
    
                    <button>&lt;</button>
                    <button>1</button>
                    <button>2</button>
                    <button>3</button>
                    <button>4</button>
                    <button>5</button>
                    <button>&gt;</button>
    
                </div>
    
                <br><br>
                <hr style="border:3px solid rgb(220,220,220);">
    
                <br><br>
                <div align="left">
                    <p>댓글 관리</p>
                </div>
                <hr>
    
                <div align="right" style="margin:15px 0px;">
                    <form action="" style="font-size:13px;">
    
                        <select name="search-order"
                            style="height:25px; border:1px solid rgb(220, 220, 220); border-radius:5px;">
                            <option value="title">댓글내용</option>
                            <option value="writer">작성자</option>
                        </select>
    
                        <input type="text" name=""
                            style="width:200px; height:25px; border-right:none; border:1px solid rgb(220, 220, 220); border-radius:5px;">
    
                        <button type="submit" style="height:25px; width:40px; border:1px solid rgb(220,220,220);">
                            <img src="<%= contextPath %>/resources/icons/search.png" width="12px"
                                style="opacity:0.5; margin-bottom:3px;">
                        </button>
    
                    </form>
                </div>
    
                <table class="list-area">
                    <thead>
                        <tr>
                            <th width="60"></th>
                            <th width="100">작성자</th>
                            <th width="40">글번호</th>
                            <th width="200">글제목</th>
                            <th width="350">댓글내용</th>
                            <th width="100">작성일</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td colspan="6" style="height:300px;"> 조회된 댓글이 없습니다.</td>
                        </tr>
    
                        <tr>
                            <td><input type="checkbox"></td>
                            <td>나는 작성자</td>
                            <td>공지</td>
                            <td>제목입니다요</td>
                            <td>!@#$%^&*^$#@$#@$@$#!@#@#!!!!</td>
                            <td>2023-01-27</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox"></td>
                            <td>나는 작성자</td>
                            <td>123</td>
                            <td>제목입니다요</td>
                            <td>!@#$%^&*^$#@$#@$@$#!@#@#!!!!</td>
                            <td>2023-01-27</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox"></td>
                            <td>나는 작성자</td>
                            <td>공지</td>
                            <td>제목입니다요</td>
                            <td>!@#$%^&*^$#@$#@$@$#!@#@#!!!!</td>
                            <td>2023-01-27</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox"></td>
                            <td>나는 작성자</td>
                            <td>123</td>
                            <td>제목입니다요</td>
                            <td>!@#$%^&*^$#@$#@$@$#!@#@#!!!!</td>
                            <td>2023-01-27</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox"></td>
                            <td>나는 작성자</td>
                            <td>123</td>
                            <td>제목입니다요</td>
                            <td>!@#$%^&*^$#@$#@$@$#!@#@#!!!!</td>
                            <td>2023-01-27</td>
                        </tr>
                    </tbody>
    
                    <tfoot>
                        <tr>
                            <td>
                                <button class="btn-red" style="height:25px; line-height:20px;">삭제</button>
                            </td>
                            <td colspan="5"></td>
                        </tr>
                    </tfoot>
    
    
                </table>
    
    
                <br>
    
                <div class="paging-area" align="center">
    
                    <button>&lt;</button>
                    <button>1</button>
                    <button>2</button>
                    <button>3</button>
                    <button>4</button>
                    <button>5</button>
                    <button>&gt;</button>
    
                </div>
    
                <br><br><br>
    
            </div>
    
    </div>

</body>
</html>