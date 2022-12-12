<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2022-11-15
  Time: 오전 9:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<html>
<head>
    <title>Weather</title>

    <script src="${contextPath}/resources/JS/weather.js"></script>
</head>
<body>

<%--몸통--%>
<section>
    <article>
        <div id="Main_Box" align="center" style="width: 90%; margin:auto;">
            <h1 class="Title" style="color: #38a9d9; margin-bottom: 30px;"> 경상남도 작물별 주산지 날씨</h1>
            <img src="${contextPath}/resources/image/Job/알바.jpg" alt="promo1" width="800" height="450">
            <div style="border: #04AA6D 5px; border-radius: 20px; margin-top: 30px">
                <div class="d-flex justify-content-center" style="margin-top: 50px">
                    <input class="form-control" type="date" placeholder="원하는 날짜 (예: 20221114)" id="Day" name="Day">

                    <select class="form-select" id="AREA_ID" name="AREA_ID">
                    </select>

                    <select class="form-select" id="PA_CROP_SPE_ID" name="PA_CROP_SPE_ID">
                    </select>
                </div>
            </div>

            <button type="button" class="button2" style="margin-top: 50px" id="WT">날씨 조회하기</button>

            <div id="weatherBox" style="margin-top: 100px; margin-bottom: 200px">

            </div>
        </div>
    </article>
</section>

</body>
</html>
