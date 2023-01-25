<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        }
        .wrap>div {float: left;}
        div {/*border:1px solid red;*/ box-sizing: border-box;}


    #FAQ{
        width: 75%; height: 100%;
        padding-top: 20px;
        color: rgb(50, 50, 50);
        background: white;
    }
     #title{ /*게시글관리*/
        margin-top:10px;
        margin-bottom:3px;
        margin-left:20px;
        font-weight:700;
    }
    #FAQ hr{
        margin:10px 0px;
        border:1px solid rgb(220,220,220);
    }  

    .qna{
        list-style: none;
        margin: auto;
        margin-top: -5px;
    }
    .qna > li{
        padding: 10px 0;
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

    .qna label { /* 제목 - 클릭 영역 */
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
        margin: 2px 0 0 8px;
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
    button{
        font-size: 13px;
        border:2px solid rgb(220,220,220);
        background:white;
        color:rgb(50, 50, 50);
        border-radius:5px;
        display: inline-block;
    }
    a{
        font-size: 12px;
        color: rgb(50, 50, 50);
        font-weight: bold;

    }
    button,select,input{
        font-size: 13px;
        border:2px solid rgb(220,220,220);
        background:white;
        color:rgb(50, 50, 50);
        border-radius:5px;
        display: inline-block;
    }

</style>
</head>
<body>
    <div class="wrap">
        <%@ include file="../common/adminMenubarForInclude.jsp" %>
        
        <br><br><br><br>
    <div id="FAQ">
        <p id="title">FAQ</p>
                <hr style="width: 95%; float: right;">
               
                <select name="" id="" style="float: left; margin-left: 40px;">
                    <option value="">전체</option>
                    <option value="">제품</option>
                    <option value="">배송</option>
                </select>
                <input type="text" value="키워드 검색" id="serch" style="float: left;">
                <button style="float: left;">검색하기</button>

                <button style="float: right;">게시글 작성</button> <br><br>                
                
    
        <ul class="qna">
            <li>
                <input type="checkbox" id="qna-1">
                <label for="qna-1">다른 사람 명의의 계좌로 환불받을 수 있나요?</label>
                <div>
                    <p>다른 사람 명의로는 환불할 수 없습니다. 고객님 본인 명의 계좌로만 환불이 가능합니다.</p>
                    
    
                    <br>
    
                    <button>수정</button> 
                    <button>삭제</button>
                </div>
            </li>
            <li>
                <input type="checkbox" id="qna-2">
                <label for="qna-2">등록한 환불계좌를 등록/변경하고 싶어요.</label>
                <div>
                    <p>마이페이지에서 환불계좌 등록 및 수정이 가능합니다. 환불계좌는 주문자 명의의 본인 계좌만 등록할 수 있습니다.</p>
                    <p>주문 진행 상태가 '환불진행중' 또는 '환불완료' 에서는 환불계좌를 변경할 수 없습니다.</p>
    
                    <br>
                    
                    <button>수정</button> 
                    <button>삭제</button>
                </div>
            </li>
            <li>
                <input type="checkbox" id="qna-3">
                <label for="qna-3">반품 신청을 철회하고 싶어요.</label>
                <div>
                    <p>반품할 상품을 아직 보내지 않은 경우, 마이페이지에서 반품철회를 하실 수 있습니다.</p>
                    <p>반품철회 후 택배사에서 상품 수거가 된 것으로 확인될 경우 해당 주문은 반품처리한 것으로 재 변경됩니다.</p>
    
                    <br>
                    
                    <button>수정</button> 
                    <button>삭제</button>
                </div>
            </li>
            <li>
                <input type="checkbox" id="qna-4">
                <label for="qna-4">배송된 상품이 부재중으로 반송된 경우 어떻게 하나요?</label>
                <div>
                    <p>부재 등의 사유로 반송된 상품은 "마이페이지 > 주문 조회"]"에서 택배사 영업소, 또는 배송 담당 택배원 연락처를 통해 재배송 요청을 할 수 있습니다. 상품이 이미 반송되어 해당 업체로 입고된 경우, 왕복 배송비를 추가 부담하셔야 합니다.</p>
                    
                    <br>
                    
                    <button>수정</button> 
                    <button>삭제</button>
                </div>
            </li>
            <li>
                <input type="checkbox" id="qna-5">
                <label for="qna-5">상품에 대해서 문의하려면 어떻게 해야 하나요?</label>
                <div>
                    <p>상품에 관한 내용은 상품상세 화면에 자세히 안내되어 있습니다. 마이페이지 > 주문내역에서 주문한 상품을 선택하면 상세페이지로 이동합니다.</p>
                    <p>상품 상세 내용에 표시되어 있지 않은 내용은 판매자에게 문의해 주십시오.</p>
                    <p>> 판매자에게 문의</p>
                    <p>1. "마이페이지 > 주문내역에서 상품 선택 > 배송/교환/반품 안내"에 표기된 판매자 연락처로 문의</p>
                    <p>2. "["마이페이지 > 1:1문의하기 > 문읜타입에서 판매자에게 문의하기"를 선택한 후 질의 내용 작성</p>
                    
                    <br>
                    
                    <button>수정</button> 
                    <button>삭제</button>
                </div>
            </li>
        </ul>
    </div>
</body>
</html>