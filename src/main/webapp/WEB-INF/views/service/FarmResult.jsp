<%@ page import="com.tp.farm.vo.SurveyOutputVO" %>
<%@ page import="com.tp.farm.vo.SurveyInputVO" %>
<%@ page import="com.tp.farm.vo.CropDataVO" %>
<%@ page import="com.tp.farm.vo.TraditionalMarketVO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<html>
<head>
    <title>Main</title>

    <%-- 차트 --%>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script src="${contextPath}/resources/JSON/Farm2.json"></script>
    <script src="${contextPath}/resources/JS/Farm.js"></script>


    <style>
        th {
            text-align: center;
        }
    </style>

    <script>
        $(document).ready(function () {
            $("#ID_Box").click(function () {
                $("#findID").slideToggle("slow");
            });
        });
    </script>

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
                    <tr style="width: 90%">
                        <th>회원 아이디</th>
                        <td><input class="form-control form-control" type="text" value="${surveyInput.msi_id}"
                                   readonly/></td>
                        <th>회원 이름</th>
                        <td><input class="form-control form-control" type="text" value="${surveyInput.msi_memberName}"
                                   readonly/></td>
                    </tr>
                    <tr>
                        <th>귀농 희망지역</th>
                        <td><input class="form-control form-control" type="text"
                                   value="${surveyInput.msi_desiredArea} ${surveyInput.msi_desiredAreaDetail}"
                                   readonly/></td>
                    </tr>
                    <tr>
                        <th>파종 시기</th>
                        <td><input class="form-control form-control" type="text"
                                   value="${surveyInput.msi_desiredTimeSowing} ${surveyInput.msi_desiredTimeSowingPart}"
                                   readonly/></td>
                        <th>수확 시기</th>
                        <td><input class="form-control form-control" type="text"
                                   value="${surveyInput.msi_desiredHarvestTime} ${surveyInput.msi_desiredHarvestTimePart}"
                                   readonly/></td>
                    </tr>
                    <tr>
                        <th>선택한 작물<br>${cropData.cd_cropName}</th>
                        <td>
                            <img src="${contextPath}/resources/image/FV/${cropData.cd_idx}.jpg" width="200px"
                                 id="CropData" name="CropData" height="200px" style="border-radius: 20px"></td>
                    </tr>
                    <tr>
                        <th>자본금</th>
                        <td><input class="form-control form-control" type="text"
                                   value="${surveyOutput.mso_capital} (천원단위)"
                                   readonly/></td>
                        <th>보유중인 토지</th>
                        <td><input class="form-control form-control" type="text"
                                   value="${surveyOutput.mso_holdingLand} 평" readonly/></td>
                    </tr>
                    <tr>
                        <th>예상 토지비용</th>
                        <td><input class="form-control form-control" type="text"
                                   value="${surveyOutput.mso_landCost} (천원단위)"
                                   readonly/></td>
                        <th>에상 경영비</th>
                        <td><input class="form-control form-control" type="text"
                                   value="${surveyOutput.mso_managementExpenses} (천원단위)" readonly/></td>
                    </tr>
                    <tr>
                        <th>예상 농작물소득</th>
                        <td><input class="form-control form-control" type="text"
                                   value="${surveyOutput.mso_incomeCrops} (천원단위)" readonly/></td>
                        <th>최종예상 소득</th>
                        <td><input class="form-control form-control" type="text"
                                   value="${surveyOutput.mso_finalIncome} (천원단위)" readonly/></td>
                    </tr>
                </table>

                <h2 class="pb-2 border-bottom" style="font-size: 60px; color: #04AA6D; margin-top: 50px">관련 시장 정보</h2>
                <button class="button" id="ID_Box">리스트 확인</button>
                <div id="findID" style="display: none">
                    <table>
                        <thead>
                        <tr>
                            <th>시장 이름</th>
                            <th>시장 유형</th>
                            <th>도로명 주소</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="vo" items="${TM_list}">
                            <tr>
                                <td>${vo.tmi_name}</td>
                                <td>${vo.tmi_marketType}</td>
                                <td>${vo.tmi_roadNameAddress}</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>

            <a href="${contextPath}/consult/BoardList.do">
                <button type="button" class="button2">전문가 상담하기</button>
            </a>
        </div>
    </article>
</section>

</body>
</html>
