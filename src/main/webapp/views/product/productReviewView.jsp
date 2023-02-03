<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .outer{
        width:1000px;
        height:100%;
        margin:auto;
        margin-top:50px;
    }
    .reviewLine{
            width:1000px;
            height:3px;
            background: rgba(128, 128, 128, 0.26);
            margin:auto;
    }
    .review textarea{
        resize:none; 
        border:none;
        background-color: rgba(128, 128, 128, 0.285);
    }
    .review table{
        border-collapse: collapse;
        border-spacing: 0;
        width:800px;
        margin:auto;
        border-top:2px solid rgba(128, 128, 128, 0.26);
        margin:auto;

    }
    .review td{
        width:100%;
    }
    .review img{
        box-sizing: border-box;
        width:100px;
        height:100px;
    }
    .review td:last-child{
        border-bottom:2px solid rgba(128, 128, 128, 0.26);
    }

</style>
</head>
<body>

	<%@ import file="../common/userMenubar.jsp" %>

    <div class="outer">
        
        <H2 align="center">상품리뷰</H2>

        <div class="line"></div>
        <br><br>

        <div class="review"> 
            <form action="">
                <table>
                    <tr>
                        <td style="height:50px;">&nbsp;&nbsp;⭐⭐⭐</td>
                        <td rowspan="2"><img src=""></td>
                        <td rowspan="2">
                            &nbsp;&nbsp;상품명 : 댕댕츄르 <br>
                            &nbsp;&nbsp;작성자 : 와그작<br>
                            &nbsp;&nbsp;작성일 : 2023.01.22
                        </td>
                    </tr>
                    <tr>
                        <td style="height:50px;">&nbsp;&nbsp;리뷰제목쓰는칸</td>
                        
                    </tr>
                    <tr>
                        <td colspan="2">
                            <p>
                                &nbsp;&nbsp;제목 : <input type="text" name="title" value="리뷰제목쓰는칸" size="30px;" style="border:none;"> <br>
                                &nbsp;&nbsp;내용 : <br><br>
                                &nbsp;&nbsp;<textarea name="" id="" cols="50px;" rows="15">리뷰내용들어오는자리냠호로로로로로롤</textarea>
                            </p>
                        </td>
                    </tr>
                    <tr>
                        <td style="height:50px;">&nbsp;&nbsp;⭐⭐⭐⭐</td>
                        <td rowspan="2" style="border-bottom:2px solid rgb(220,220,220)"><img src=""></td>
                        <td rowspan="2">
                            &nbsp;&nbsp;상품명 : 댕댕츄르 <br>
                            &nbsp;&nbsp;작성자 : 와그작<br>
                            &nbsp;&nbsp;작성일 : 2023.01.22
                        </td>
                    </tr>
                    <tr>
                        <td style="height:50px;">&nbsp;&nbsp;리뷰제목쓰는칸</td>
                    </tr>
                </table>
            </form>

        </div>




    </div>
	
	

</body>
</html>