<%@ page import="com.tp.farm.vo.SurveyOutputVO" %>
<%@ page import="com.tp.farm.vo.SurveyInputVO" %>
<%@ page import="com.tp.farm.vo.CropDataVO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<html>
<head>
    <title>Main</title>

</head>
<body>

<%
    SurveyOutputVO surveyOutput = (SurveyOutputVO) request.getAttribute("surveyOutput");

    SurveyInputVO surveyInput = (SurveyInputVO) request.getAttribute("surveyInput");

    CropDataVO cropData = (CropDataVO) request.getAttribute("cropData");
%>

<%--몸통--%>
<section>
    <article>
        <div id="Main_Box" align="center" style="width: 90%; margin:auto;">
            <h2 class="pb-2 border-bottom" style="font-size: 60px; color: #04AA6D; margin-top: 50px">작물 선택 결과</h2>

            <div style="padding: 20px; border-radius: 25px; margin-bottom: 20px; margin-top: 50px; background: #f7f7cb">
                <table id="list_table" style="margin-bottom: 20px;">
                    <tr>
                        <th>회원 아이디</th><td>${surveyInput.msi_id}</td>
                        <th>회원 이름</th><td>${surveyInput.msi_memberName}</td>
                        <th>회원 나이</th><td>${surveyInput.msi_memberAge}</td>
                    </tr>
                    <tr>
                        <th>귀농 희망지역</th><td>${surveyInput.msi_desiredArea} ${surveyInput.msi_desiredAreaDetail}</td>
                        <th>파종 희망시기</th><td>${surveyInput.msi_desiredTimeSowing}</td>
                    </tr>
                    <tr>
                        <th>${cropData.cd_cropName}</th><td><img src="${contextPath}/resources/image/FV/${cropData.cd_idx}.jpg" width="300px" height="300px" style="border-radius: 20px" ></td>
                        <th>자본금</th><td>${surveyOutput.mso_capital}</td>
                        <th>보유중인 토지</th><td>${surveyOutput.mso_holdingLand}</td>
                    </tr>
                    <tr>
                        <th>최종예상 소득</th><td>${surveyOutput.mso_finalIncome}</td>
                    </tr>
                </table>
            </div>

            <a href="${contextPath}/service/Advice.do">
                <button type="button" class="button2">전문가 상담하기</button>
            </a>
        </div>
    </article>
</section>

</body>
</html>
