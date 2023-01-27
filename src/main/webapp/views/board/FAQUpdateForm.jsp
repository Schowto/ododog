<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.odd.board.model.vo.FAQ"%>
<%
	FAQ f = (FAQ)request.getAttribute("f");
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
    }    
    #content p {
        margin-top:10px;
        margin-bottom:3px;
        margin-left:20px;
        font-weight:700;
    }
    .FAQ{
        width: 900px;
        margin: auto;
        margin-top: 50px;
    }
    table{
        border-collapse: collapse;
    }
    table, th, td {
    border: 2px solid rgb(206, 206, 206);
    }
    button,select{
        font-size: 13px;
        border:2px solid rgb(220,220,220);
        background:white;
        color:rgb(50, 50, 50);
        border-radius:5px;
        display: inline-block;
    }
    h2{
        color: rgb(46, 46, 46);
    }
</style>    
</head>
<body>
	<div class="wrap">
 	    
 	    <%@ include file="../common/adminMenubarForInclude.jsp" %>

     
        <div id="content" align="center">
        <br><br>
        <h2>FAQ 수정하기</h2>
        <br><br>
        <form id="enroll-form" action="<%=contextPath %>/update.faq" method="post">
			<input type="hidden" name="no" value="<%=f.getContactNo()%>">
            <table>
                <tr>
                    <th width="70" style="text-align:center;">카테고리</th>
                    <td width="500">
                        <select name="category" id="category" required>
                            <option value="배송">배송</option>
                            <option value="결제">결제</option>
                            <option value="상품">상품</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <th style="text-align:center;">질문</th>
                    <td><input type="text" name="title" required style="border: none; width: 400px;" value="<%=f.getContactTitle() %>"></td>
                </tr>
                <tr>
                    <th style="text-align:center;">답변</th>
                    <td><textarea name="content" rows="10" required style="resize:none; border:none; width: 400px;" ><%=f.getContactAnswer() %></textarea></td>
                </tr>

            </table>
            <br>

            <div>
                <button type="submit">저장</button>
                <button type="button" onclick="history.back();">취소</button>
            </div>

        </form>    
        </div>
     </div>

</body>
</html>