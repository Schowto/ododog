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


</style>
</head>
<body>
    
    <div class="wrap">
        <%@ include file="../common/adminMenubarForInclude.jsp" %>

        <div id="content" align="center">
        
            <br>
            <div align="left">
                <p>공지사항 관리</p>
            </div>
            <hr>

            <div align="right" style="margin:15px 0px;">
                <button style="height:30px;">공지사항 작성</button>
            </div>

            <table class="list-area">
                <thead>
                    <tr>
                        <th width="60">노출</th>
                        <th width="40">글번호</th>
                        <th width="500">제목</th>
                        <th width="100">작성일</th>
                        <th width="100">조회수</th>
                        <th width="50"></th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td colspan="6" style="height:300px;"> 조회된 게시글이 없습니다.</td>
                    </tr>
                    
                    <tr>
                        <td style="height:30px;"><input type="checkbox"></td>
                        <td>1</td>
                        <td>공지사항제목입니당</td>
                        <td>2023-01-27</td>
                        <td>3545</td>
                        <td>
                            <button class="btn-red" style="height:25px; vertical-align:middle; line-height:20px;">삭제</button>
                        </td>
                    </tr>
                    <tr>
                        <td style="height:30px;"><input type="checkbox"></td>
                        <td>1</td>
                        <td>공지사항제목입니당</td>
                        <td>2023-01-27</td>
                        <td>3545</td>
                        <td>
                            <button class="btn-red" style="height:25px; vertical-align:middle; line-height:20px;">삭제</button>
                        </td>
                    </tr>
                    <tr>
                        <td style="height:30px;"><input type="checkbox"></td>
                        <td>1</td>
                        <td>공지사항제목입니당</td>
                        <td>2023-01-27</td>
                        <td>3545</td>
                        <td>
                            <button class="btn-red" style="height:25px; vertical-align:middle; line-height:20px;">삭제</button>
                        </td>
                    </tr>
                    <tr>
                        <td><input type="checkbox"></td>
                        <td>123</td>
                        <td>제목입니다요</td>
                        <td>나는 작성자</td>
                        <td>2023-01-17</td>
                        <td>3212</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox"></td>
                        <td>123</td>
                        <td>제목입니다요</td>
                        <td>나는 작성자</td>
                        <td>2023-01-17</td>
                        <td>3212</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox"></td>
                        <td>123</td>
                        <td>제목입니다요</td>
                        <td>나는 작성자</td>
                        <td>2023-01-17</td>
                        <td>3212</td>
                    </tr>
                </tbody>

                <tfoot>
                    <tr>
                        <td>
                            <button style="height:25px; line-height:20px;">확인</button>
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
                <button>6</button>
                <button>7</button>
                <button>8</button>
                <button>9</button>
                <button>10</button>
                <button>&gt;</button>
    
            </div>
        
        
        
            
        
        
        
        
        
        
        
        
        
        
        
        </div>

    </div>
	
	
	
</body>
</html>