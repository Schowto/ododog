<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
       
        form{
        
        width:1200px;
        height:auto;
        font-size: 13px;
        
        }
        #select{
            margin: auto;
            display: block;
        }
        
    
    </style>
</head>
<body>
	<%@ include file="../common/userMenubar.jsp"%>
   <div class="wrap">
        <form action="" >
            <table align="center">
                <br>
                <h4 style="text-align: center;">상품 상세 검색</h4>
                <br><br>
                <tr>
                    <td>상품분류</td>
                    <td>
                        <select id="category" name="category" placeholder="상품분류 선택">
                            <option value="food">주식</option>
                            <option value="dry">건조간식</option>
                            <option value="oven">오븐간식</option>
                            <option value="party">PARTY</option>
                        </select>    
                    </td>
                </tr>
                <tr>
                    <td>상품명</td>
                    <td>
                        <select id="category2" name="category2" placeholder="상품명">
                            <option value="productName">상품명</option>
                            <option value="productCode">상품코드</option> 
                        </select>
                    </td>
                    <td>
                        <input type="text">
                    </td>
                </tr>
                <tr>
                    <td>판매가격대</td>
                    <td><input type="text" name="price1" size="6"> ~ </td>
                    <td><input type="text" name="price2"> </td>
                </tr>
                <tr>
                    <td>검색정렬기준</td>
                    <td>
                        <select id="category3" name="category3" >
                            <option value="newProduect">신상품 순</option>
                            <option value="newProduect">상품명 순</option>
                            <option value="newProduect">낮은가격 순</option>
                            <option value="newProduect">높은가격 순</option> 
                        </select>
                    </td>
                </tr>
            </table>
            <br><br>
            <button type="submit" id="select" class="btn btn-secondary btn-sm">검색</button>
            <br><br>
           
        </form>
        <hr style="border: 1px color= silver;" width="100%">
            <br><br>
        
    </div>
    <%@ include file="../common/userFooterbar.jsp"%>
    
                
                
</body>
</html>