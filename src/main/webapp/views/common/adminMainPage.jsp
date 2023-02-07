<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

    /******** 내용 *******/
    #welcomeAdmin p{
        margin-top:10px;
        margin-bottom:3px;
        margin-left:20px;
        font-weight:700;
        font-size:20px;
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
    
    .status-n{
    	width:30px;	height:23px;
    	border:2px solid rgb(220,220,220);
    	border-radius:5px;
    	vertical-align:middle;
    	line-height:15px;
    }
	.status-n:hover{
		background:rgb(220,220,220);
	}
	.status-y{
		width:30px; height:23px;
		border-radius:5px;
		vertical-align:middle;
		line-height:15px;
		background:rgb(220,220,220);
	}
	.status-y:hover{
		border:2px solid rgb(200,200,200);
		background:rgb(200,200,200);
	}

    #select-zone div{
        width:200px; height:180px;
        cursor:pointer;
        background:rgb(220,220,220);
        padding-top:30px;
        transition: background-color 1s;
    }
    #select-zone div:hover{
        background-color:rgb(220,140,140);
    }

</style>
</head>
<body>
    
    <div class="wrap">
        <%@ include file="../common/adminMenubarForInclude.jsp" %>
		<% if(loginAdmin == null) { %>
		<script>
			alert("로그인 후 사용해주시기바랍니다.");
			location.href = '<%= contextPath %>/loginform.ad';
		</script>
		<% } %>
        <div id="content" align="center">
        
        <br>
            <div align="left" id="welcomeAdmin">
                <p><span style="color:rgb(220,140,140);">관리자</span>님 환영합니다!</p>
            </div>
            <hr>
            <br><br><br><br><br>
            <table id="select-zone">
            	<tr align="center">
            		<td style="width:250px; height:200px;">
                        <div onclick="location.href='<%=contextPath%>/list.ad'">
                            <img src="<%= contextPath %>/resources/icons/profileW.png" width="70"> <br>
                            <p style="font-size:20px; font-weight:700; color:rgb(50, 50, 50); margin-top:10px;">회원관리</p>
                        </div>
                    </td>
            		<td style="width:250px;">
                        <div onclick="location.href='<%=contextPath%>/list.adPro?cpage=1&&order=PRO_NO&&by=ASC'">
                            <img src="<%= contextPath %>/resources/icons/bag.png" width="70"> <br>
                            <p style="font-size:20px; font-weight:700; color:rgb(50, 50, 50); margin-top:10px;">상품관리</p>
                        </div>
                    </td>
            		<td style="width:250px;">
                        <div onclick="location.href='<%=contextPath%>/list.adOrd?cpage=1&&order=주문번호&&by=ASC'">
                            <img src="<%= contextPath %>/resources/icons/package.png" width="70"> <br>
                            <p style="font-size:20px; font-weight:700; color:rgb(50, 50, 50); margin-top:10px;">주문관리</p>
                        </div>
                    </td>
            	</tr>
            	<tr align="center">
            		<td style="width:250px; height:200px;">
                        <div onclick="location.href='<%=contextPath%>/list.adNo?cpage=1'">
                            <img src="<%= contextPath %>/resources/icons/board.png" width="70"> <br>
                            <p style="font-size:20px; font-weight:700; color:rgb(50, 50, 50); margin-top:10px;">게시판관리</p>
                        </div>
                    </td>
            		<td style="width:250px;">
                        <div onclick="location.href='<%=contextPath%>/FAQlist.ad'">
                            <img src="<%= contextPath %>/resources/icons/headphone.png" width="70"> <br>
                            <p style="font-size:20px; font-weight:700; color:rgb(50, 50, 50); margin-top:10px;">고객센터 관리</p>
                        </div>
                    </td>
            		<td style="width:250px;">
                        <div onclick="location.href='<%=contextPath%>'">
                            <img src="<%= contextPath %>/resources/icons/homeW.png" width="70"> <br>
                            <p style="font-size:20px; font-weight:700; color:rgb(50, 50, 50); margin-top:10px;">사이트로</p>
                        </div>
                    </td>
            	</tr>
            </table>
        </div>

    </div>
	
	
	
</body>
</html>