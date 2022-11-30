<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2022-10-05
  Time: 오후 2:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<html>
<head>
    <title>ItemInfo</title>

    <!-- 스타일시트 연결 -->
    <script src="http://code.jquery.com/jquery-latest.js"></script>

    <%-- 폰트 --%>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Jua&display=swap');
    </style>

    <style>
        .Item_Information {
            border-radius: 10px;
            border: 5px solid #04AA6D;
            margin-left: auto;
            margin-right: auto;
            padding: 10px;
        }

    </style>

</head>
<body>

<%--몸통--%>
<section>
    <article>
        <div id="Main_Box" align="center">
            <h1> 물품 상세 페이지 입니다. </h1>

            <div class=front style="display: flex">
                <div class="Image_Box" style="border-radius: 10px">
                    <img src="${contextPath}/resources/image/potato3.jpg" alt="promo1" width="600px" height="600px">
                </div>
                <div class="Item_Information">
                    <h1> 상품 정보 </h1>
                    <table>
                        <tr>
                            <th>
                                작물 품종
                            </th>
                            <td>
                                <input type="text" name=""  value="">
                            </td>
                        </tr>
                        <tr>
                            <th>
                                중량 단위
                            </th>
                            <td>
                                <input type="text" name=""  value="">
                            </td>
                        </tr>
                        <tr>
                            <th>
                                원산지
                            </th>
                            <td>
                                <input type="text" name=""  value="">
                            </td>
                        </tr>
                    </table>
                    <button class="button2" onclick="fn_sendPerson()">구매 하기</button>
                </div>
            </div>

            <div class="middle">
                <div class="Required_Information">
                    <h1> 필수 표기 정보 </h1>
                    <table class="list_table">
                        <tr>
                            <th>
                                품목 또는 명칭
                            </th>
                            <td>

                            </td>
                            <th>
                                포장단위별 내용물 용량, 중량, 수량, 크기
                            </th>
                            <td>

                            </td>
                        </tr>
                        <tr>
                            <th>
                                생산자(수입자)
                            </th>
                            <td>

                            </td>
                            <th>
                                원산지
                            </th>
                            <td>

                            </td>
                        </tr>
                        <tr>
                            <th>
                                제조연월일
                            </th>
                            <td>

                            </td>
                            <th>
                                관련법상 표시사항
                            </th>
                            <td>

                            </td>
                        </tr>
                        <tr>
                            <th>
                                보관방법
                            </th>
                            <td>

                            </td>
                            <th>
                                상품구성
                            </th>
                            <td>

                            </td>
                        </tr>
                    </table>
                </div>
            </div>

            <div class="back">
                <div class="detailed_description">
                    <h1> 상세 설명 </h1>

                    <img src="${contextPath}/resources/image/potato3.jpg" alt="promo1" width="600px" height="600px">

                </div>
            </div>

        </div>
    </article>
</section>

</body>
</html>
