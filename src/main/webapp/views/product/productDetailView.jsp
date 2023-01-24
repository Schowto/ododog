<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .outer {
	width: 1000px;
	margin: auto;
	margin-top: 50px; 
    }
.left{
    width:35%;
    float:left;
    box-sizing: border-box;
    
}

.right{
    width:60%;
    float:right;
    box-sizing: border-box;
    font-size: 13px;
    
}

    .float-file{
    border:1px solid black;
    width: 73px;
    height: 73px;
    float:left;
    margin-bottom: 30px; 
        }
    .file-area{
      margin-bottom: 10px;  
    }
    .content>div{
        width: 500px;
        height:500pxl
    }    
</style>
</head>
<body>
	<%@ include file="../common/userMenubar.jsp"%>
    <div class="outer">
        <form action="" method="post">
        <div class="left">
            <div class="file-area"> <!--대표이미지-->
				<img src="<%=contextPath%>/resources/product_img/주식1.png"
					width="300px" height="300px"
					onclick="location.href='<%=contextPath%>'">
            </div>

            <div class="float-file"> <!--미리보기1-->
                <img src="<%=contextPath%>/resources/product_img/주식1.png"
					onclick="location.href='<%=contextPath%>'" class=img>
            </div>

            <div class="float-file"> <!--미리보기2-->
                <img src="<%=contextPath%>/resources/product_img/주식1-2.png"
					onclick="location.href='<%=contextPath%>'" class=img>
            </div>

            <div class="float-file"> <!--미리보기3-->
                <img src="<%=contextPath%>/resources/product_img/주식1-3.png"
					onclick="location.href='<%=contextPath%>'" class=img>
            </div>

            <div class="float-file"> <!--미리보기4-->
                <img src="<%=contextPath%>/resources/product_img/주식1-4.png"
					onclick="location.href='<%=contextPath%>'" class=img>
            </div>
        </div>
        <div class="right">
            <span>
                <b>상품명</b> 
            </span> 
            <span> 
                건강한 한끼 화식 4종세트 (말고기, 닭고기, 소고기영양죽, 야채퓨레)
            </span>
            <br><br><br>
            
            <span>
                <b>판매가</b>
            </span>
            <span>
                16,000원
            </span>
            <br><br><br>

            <span>
                <b>적립금</b>
            </span>
            <span>
                1%
            </span>
            <br><br><br><br><br>

            <hr style="border: 1px color= silver;" width="100%"> 
            <br><br>
            
            <span>
                건강한 한끼 화식 4종세트 (말고기, 닭고기, 소고기영양죽, 야채퓨레)
            </span>
            <span>
                <input type="number" name="quantity" style="width:20px">
            </span>
            <br><br>

            <span>
                <b>TOTAL : </b>
            </span>
            <span>
                <b>16000원</b>
            </span>
            <br><br><br>

            <button type="submit" class="btn btn-dark">구매하기</button>
            <button type="submit" class="btn btn-secondary">장바구니 담기</button>
            <button type="submit" class="btn btn-light">관심상품 등록</button>
        </div>
       
        <hr style="border: 1px color= silver;" width="100%">

        <div class="content" align="center">
            <span>상품 상세정보</span>　　　　　　　　　　　　
            <span>상품 사용후기</span>
            <hr style="border: 1px color= silver;" width="100%">
        
            <div>
                <img src="<%=contextPath%>/resources/product_img/본문1.png" width="900px" height="600px">
            </div>
            
            <div>
                <img src="<%=contextPath%>/resources/product_img/본문2.png" width="900px" height="600px">
            </div>
            
            <div>
                <img src="<%=contextPath%>/resources/product_img/본문3.png" width="900px" height="800px">
            </div>
            
            <div>
                <img src="<%=contextPath%>/resources/product_img/본문4.png" width="900px" height="1500px">
            </div>
            
        </div>
       

    </form>
    </div>
</body>
</html>