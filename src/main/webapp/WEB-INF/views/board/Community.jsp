<!--
작성자 : 윤태검, 이영록
내용 : 쉼터 화면 설계 및 구성. / Commnuity.jsp

일시 : 2022.10.10 ~
-->

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>List</title>

    <script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
    <link rel="stylesheet" href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.min.css">

    <script>
        $(document).ready(function () {
            $('#table_i').DataTable({
                order: [[0, "desc"]]
            });
        });
    </script>

</head>
<body>

<%--몸통--%>
<section>
    <article>
        <div id="Main_Box" align="center" style="margin: auto; width: 90%">
            <h1 class="Title" style="margin-bottom: 30px;"> 대화의 씨앗 </h1>

            <nav class="navbar" style="background-color: #7afacb; margin-top: 30px">
                <div class="container-fluid">
                    <div class="d-flex">
                        <a href="BoardList.do"><button class="button">전체</button></a>
                        <a href="BoardList.do?cb_category=일반"><button class="button">일반</button></a>
                        <a href="BoardList.do?cb_category=정보"><button class="button">정보</button></a>
                        <a href="BoardList.do?cb_category=나눔"><button class="button">나눔</button></a>
                        <a href="BoardList.do?cb_category=질문"><button class="button">질문</button></a>
                    </div>
                </div>
            </nav>

            <table id="table_i" class="table table-striped table-bordered" style="width:100%;">
                <thead style="background-color: #7afacb">
                <tr>
                    <th>글번호</th>
                    <th>분류</th>
                    <th style="width: 40%">제목</th>
                    <th>작성자</th>
                    <th>등록일</th>
                    <th>조회수</th>
                    <th>첨부파일</th>
                    <c:if test="${user.mi_id=='admin'}">
                        <th>삭제</th>
                    </c:if>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="vo" items="${list}">
                    <tr>
                        <td>${vo.cb_seq}</td>
                        <td>${vo.cb_category}</td>
                        <td><a href="ReadBoard.do?cb_seq=${vo.cb_seq}">${vo.cb_title} </a></td>
                        <td>${vo.cb_id}</td>
                        <td>${vo.cb_regDate}</td>
                        <td>${vo.cb_viewCount}</td>
                        <td>
                            <c:if test="${vo.cb_originFileName!=null}">
                                <a href="download.do?cb_seq=${vo.cb_seq}&token=on">
                                    ${vo.cb_originFileName}
                                </a>
                            </c:if>
                        </td>
                        <c:if test="${user.mi_id=='admin'}">
                            <td>
                                <a href="delete.do?cb_seq=${vo.cb_seq}">
                                    <button class="button3">삭제</button>
                                </a>
                            </td>
                        </c:if>
                    </tr>
                </c:forEach>
                </tbody>
            </table>

            <c:if test="${user.mi_id!=null}">
                <a href="${contextPath}/board/CreateNewBoard.do">
                    <button class="button2">작성하기</button>
                </a>
            </c:if>

        </div>
    </article>
</section>


</body>
</html>
