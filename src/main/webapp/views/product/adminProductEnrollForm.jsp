<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.ArrayList" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

    .enrollTB{
        font-size: 80%;
    }
    
    .enrollTB1 th{
        text-align: center;
    }
    .enrollTB2{
        text-align: center;
    }
    
    .enrollTB1 img{
    	object-fit: cover;
   		width:150px;
   		height:150px;
    }
    
    .enrollTB2 img{
    	object-fit: cover;
    	width:250px;
   		height:180px;
    }
    
    #content{
   	    z-index:-1;
    }
    
    #header{
   	    z-index:-1;
     }
    
</style>

</head>

<body>

    <div class="wrap">
 	    
 	    <%@ include file="../common/adminMenubarForInclude.jsp" %>

        <div id="content" align="center">
        	<br>
            <h2>물품 등록</h2>
            <br>
			<br>
			
			<form id="enrollForm" action="<%=contextPath%>/insert.adPro" method="post" enctype="multipart/form-data">			
	            <table class="enrollTB1 table-bordered" style="width:850px">
	                    <tr>
	                        <th>카테고리</th>
	                        <td>
	                        	&nbsp;
	                        	<select name="category" class="form-control-sm">
                            		<option value="주식">주식</option>
                            		<option value="건조간식">건조간식</option>
                            		<option value="오븐간식">오븐간식</option>
                            		<option value="PARTY">PARTY</option>
	                        	</select>
	                        </td>
	                        <th style="width:200px" class="table-active">
	                        	섬네일 등록
	                        </th>
	                    </tr>
	
	                    <tr>
	                        <th>상품명</th>
	                        <td>
	                        	&nbsp;
	                        	<input type="text" class="form-control-sm" name="proName" style="width:400px" required>
                        	</td>
	                        <td rowspan="4" style="text-align:center">
	                        	<img class="img-thumbnail" id="thumbImg" onclick="clickFile(1)">
	                        </td>
	                    </tr>
	
	                    <tr>
	                        <th>가격</th>
	                        <td>
	                        	&nbsp;
	                        	<input type="text" class="form-control-sm" name="price" id="price" style="width:150px" required>
                        	</td>
	                    </tr>
	
	                    <tr>
	                        <th>유통 기한</th>
	                    	<td>
	                    		&nbsp;
	                    		<input type="date" class="form-control-sm" name="expiredDate" style="width:150px" required>
                    		</td>
	                    </tr>
	
	                    <tr>
	                        <th>적립률</th>
	                        <td>
	                        	&nbsp;
	                        	<select name="save" class="form-control-sm">
                            		<option value="0.1">0.1%</option>
                            		<option value="0.2">0.2%</option>
                            		<option value="0.3">0.3%</option>
                            		<option value="0.4">0.4%</option>
	                        	</select>
	                        </td>
	                    </tr>
	                    
	            </table>

				<table class="enrollTB2 table-bordered" style="width:850px">
						<tr>
							<th colspan="3" class="table-active">상세 이미지 등록</th>
						</tr>
						
						<tr>
							<td>
								<img class="img-thumbnail" id="contentImg1" onclick="clickFile(2)">
							</td>
							<td>
								<img class="img-thumbnail" id="contentImg2" onclick="clickFile(3)">
							</td>
							<td>
								<img class="img-thumbnail" id="contentImg3" onclick="clickFile(4)">
							</td>
						</tr>
						
						<tr>
							<td>
								<img class="img-thumbnail" id="contentImg4" onclick="clickFile(5)">
							</td>
							<td>
								<img class="img-thumbnail" id="contentImg5" onclick="clickFile(6)">
							</td>	
							<td>
								<img class="img-thumbnail" id="contentImg6" onclick="clickFile(7)">
							</td>
						</tr>
						
						<tr>
							<td>
								<img class="img-thumbnail" id="contentImg7" onclick="clickFile(8)">
							</td>
							<td>
								<img class="img-thumbnail" id="contentImg8" onclick="clickFile(9)">
							</td>	
							<td>
								<img class="img-thumbnail" id="contentImg9" onclick="clickFile(10)">
							</td>
						</tr>
						
						
				</table>
				
		        <div id="file-area" style="display: none;">
	                <input type="file" name="file1" onchange="loadImg(this, 1)" required>
	                <input type="file" name="file2" onchange="loadImg(this, 2)">
	                <input type="file" name="file3" onchange="loadImg(this, 3)">
	                <input type="file" name="file4" onchange="loadImg(this, 4)">
	                <input type="file" name="file5" onchange="loadImg(this, 5)">
	                <input type="file" name="file6" onchange="loadImg(this, 6)">
	                <input type="file" name="file7" onchange="loadImg(this, 7)">
	                <input type="file" name="file8" onchange="loadImg(this, 8)">
	                <input type="file" name="file9" onchange="loadImg(this, 9)">
	                <input type="file" name="file10" onchange="loadImg(this, 10)">

          		</div>

				<script>
                function clickFile(num){
                
                    $("input[name=file"+num+"]").click();
                
                }



                function loadImg(inputFile, num){
                	
                    if(inputFile.files.length == 1){
                    	
                        const reader = new FileReader();
                        reader.readAsDataURL(inputFile.files[0]);

                        reader.onload = function(e){
                            switch(num){
                                case 1:$("#thumbImg").attr("src",e.target.result); break;
                                case 2:$("#contentImg1").attr("src",e.target.result); break;
                                case 3:$("#contentImg2").attr("src",e.target.result); break;
                                case 4:$("#contentImg3").attr("src",e.target.result); break;
                                case 5:$("#contentImg4").attr("src",e.target.result); break;
                                case 6:$("#contentImg5").attr("src",e.target.result); break;
                                case 7:$("#contentImg6").attr("src",e.target.result); break;
                                case 8:$("#contentImg7").attr("src",e.target.result); break;
                                case 9:$("#contentImg8").attr("src",e.target.result); break;
                                case 10:$("#contentImg9").attr("src",e.target.result); break;
                    
                            }
                        }

                    }else{
                        switch(num){
                                case 1:$("#thumbImg").attr("src",null); break;
                                case 2:$("#contentImg1").attr("src",null); break;
                                case 3:$("#contentImg2").attr("src",null); break;
                                case 4:$("#contentImg3").attr("src",null); break;
                                case 5:$("#contentImg4").attr("src",null); break;
                                case 6:$("#contentImg5").attr("src",null); break;
                                case 7:$("#contentImg6").attr("src",null); break;
                                case 8:$("#contentImg7").attr("src",null); break;
                                case 9:$("#contentImg8").attr("src",null); break;
                                case 10:$("#contentImg9").attr("src",null); break;
                
                            }

                    }


                }
              	  
            </script>
				
            <br>
			<button type="submit" class="btn btn-primary">등록하기</button>
				
	    	</form>        
       
        </div>
        
    </div>

</body>
</html>