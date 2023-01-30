<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.odd.board.model.vo.FAQ, com.odd.board.model.service.*" %>

<%

	FAQService faq = new FAQService();
	
	ArrayList<FAQ> list = faq.selectFAQList(); 

%>
     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .outer{width: 1200px; margin: auto;}
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

    /*FAQ*/ 
    #content{
        width:80%; height:100%;
        float:left;
        text-align: left;
    }
    #content p{ /*게시글관리*/
        margin-top:10px;
        margin-bottom:3px;
        margin-left:20px;
        font-weight:700;
    }
   .qna{
        list-style: none;
        margin: auto;
        margin-top: -5px;
    }
    .qna > li{
        padding: 10px 10px;
        box-sizing: border-box;
    }
    .qna > li:nth-child(n+2){ /* 아이템 구분 점선 */
        border-top: 1px solid rgb(220,220,220);
        font-size: 12px;
        background:white;
        color:rgb(50, 50, 50);
    }
    .qna input {
        display: none;
    }

    .qna label{ /* 제목 - 클릭 영역 */
        font-size: 14px;
        font-weight: bold;
        color: #000;
        margin: 20px 0 0;
        cursor: pointer;
    }
    .qna label::before { /* 제목 앞 화살표 */
        display: block;
        content: "";
        width: 0;
        height: 0;
        border: 8px solid transparent;
        border-left: 8px solid rgb(180, 180, 180);
        float: left;
    }
    .qna input:checked + label::before { /* 내용 펼침 상태 제목 앞 화살표 */
        border: 8px solid transparent;
        border-top: 8px solid rgb(180, 180, 180);
        border-bottom: 0;
        margin: 8px 4px 0;
    }

    .qna div{ /* 내용 영역 - 기본 감춤 상태 */
        display: none;
        color: #666;
        font-size: 12px;
        overflow: hidden;
        padding: 10px 90px 10px 30px;
        box-sizing: border-box;
        transition: max-height 0.4s;
    }
    .qna input:checked + label + div { /* 내용 영역 펼침 */
        display: block;
    }
    button,select,input{
        font-size: 13px;
        border:2px solid rgb(220,220,220);
        background:white;
        color:rgb(50, 50, 50);
        border-radius:5px;
        display: inline-block;
        height: 25px;
    }
    a{
        font-size: 12px;
        color: rgb(50, 50, 50);
        font-weight: bold;

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

    <div class="outer">
    <div id="side">
        <br><br><br><br><br>
        <p style="font-size:23px;">COMMUNITY</p>
        <hr>
        <a href="" style="font-size:17px;">공지사항</a> <br><br>
        <a href="<%=contextPath%>/FAQlist.ur" style="font-size:17px;">FAQ</a> 
    </div>

        <script>
             $("#side a").hover(function(){
                $(this).css("color", "rgb(200, 140, 140)");
            }, function(){
                 $(this).css("color", "rgb(50, 50, 50)");
             })
         </script>


    <div id="board-area" align="center" style="margin-top: -100px;">

        <div>
            <br><br><br><br><br><br><br>
            <h2 style="color:rgb(50, 50, 50); font-weight:600;">FAQ</h2>
            <br><br><br>
        </div>
        
        <!-- FAQ내용 -->
        <div id="content" align="center">
        <br><br>    
         <br><br>   
        	<select name="" id="" style="float: left; margin-left: 40px; font-size: 11px;">
                <option>전체</option>
                <option>제품</option>
                <option>배송</option>
            </select>
            <input type="text" value="키워드 검색" id="serch" style="float: left; font-size: 11px;">
            <button style="float: left;">검색하기</button>
            
            
            <br><br> 

            
            <ul class="qna">
            <% if(list.isEmpty()) { %>
            	<li></li>
            	<li>존재하는 FAQ가 없습니다.</li> 
            <% }else{ int count = 0; %>    <li></li>  
            <% for(FAQ f : list){ %>      
                <li>
                    <input type="checkbox" id="qna-<%=count%>">
                    
                    <label for="qna-<%=count++%>"><span>[<%=f.getCategory() %>] </span><%= f.getContactTitle() %></label>
                    <div>
                        <p><%=f.getContactAnswer() %></p>
                        <br>
                        </div>
                </li>
            	<%} %>
            <%} %>
            </ul> 
            
        </div>
    
    
    </div>
</body>
</html>