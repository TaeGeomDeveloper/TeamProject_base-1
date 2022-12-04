<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<html>
<head>
    <title>Main</title>

</head>
<body>

<%--몸통--%>
<section>
    <article>
        <div id="Main_Box" align="center" style="width: 90%; margin:auto;">
            <h2 class="pb-2 border-bottom" style="font-size: 60px; color: #04AA6D; margin-top: 100px">작물 선택 결과지</h2>



            <a href="${contextPath}/service/Advice.do">
                <button type="button" class="button2">전문가 상담하기</button>
            </a>
        </div>
    </article>
</section>

</body>
</html>
