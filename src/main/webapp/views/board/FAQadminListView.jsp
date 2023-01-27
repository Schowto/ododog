<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.ArrayList, com.odd.board.model.vo.FAQ, com.odd.board.model.service.*" %>

<%
	FAQService faq = new FAQService();
	
	ArrayList<FAQ> list = faq.selectFAQList(); 
	// list = (ArrayList<FAQ>)request.getAttribute("list");

%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

    .wrap {
            /* 전체 -> ????? 세로 사이즈는 여기서 조정 ,,????? */
            /*border:1px solid blue;*/
            width: 1200px; height: 700px;
            margin: auto;
            background: rgb(220, 220, 220);
        }

    .wrap>div {float: left;}

    div {/*border:1px solid red;*/ box-sizing: border-box;}

    #content {
        width: 75%; height: 100%;
        padding-top: 20px;
        color: rgb(50, 50, 50);
        background: white;
        text-align: left;
    }    
    #content p {
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
        font-size: 11px;
        border:2px solid rgb(220,220,220);
        background:white;
        color:rgb(50, 50, 50);
        border-radius:5px;
        display: inline-block;
        height: 25px;
    }
    
</style>

</head>

<body>

    <div class="wrap">
 	    
 	    <%@ include file="../common/adminMenubarForInclude.jsp" %>

     
        <div id="content" align="center">
        <br><br>    
        <h1 align="center">FAQ</h1>
         <br><br>   
        	<select name="" id="" style="float: left; margin-left: 40px; font-size: 11px;">
                <option value="">전체</option>
                <option value="">제품</option>
                <option value="">배송</option>
            </select>
            <input type="text" value="키워드 검색" id="serch" style="float: left; font-size: 11px;">
            <button style="float: left;">검색하기</button>
            
            <button style="float: right;" onclick="location.href ='<%=contextPath%>/FAQenrollForm.ad'">등록하기</button>
            <br><br> 

            
            <ul class="qna">
            <% if(list.isEmpty()) { %>
            	<li></li>
            	<li>존재하는 FAQ가 없습니다.</li> 
            <% }else{ %>      
            <% for(FAQ f : list){ %>      
                
                <li></li>
                <li>
                    <input type="checkbox" id="qna-1">
                    
                    <label for="qna-1"><span>[<%=f.getCategory() %>] </span><%= f.getContactTitle() %></label>
                    <div>
                        <p><%=f.getContactAnswer() %></p>
                        <br>
                        <button>수정하기</button>
                        <button>삭제하기</button>
                    </div>
                </li>
            	<%} %>
            <%} %>
            </ul> 
            
        </div>
    </div>
			
</body>
</html>