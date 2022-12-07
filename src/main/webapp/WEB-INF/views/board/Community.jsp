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
            <h1 class="Title" style="margin-bottom: 30px;"> 쉼터 </h1>

            <nav class="navbar" style="background-color: #7afacb; margin-top: 30px">
                <div class="container-fluid">
                    <select class="form-select" aria-label="Default select example" style="width: 20%">
                        <option selected>카테고리</option>
                        <option value="1">일반</option>
                        <option value="2">정보</option>
                        <option value="3">나눔</option>
                        <option value="4">질문</option>
                    </select>
                    <div class="d-flex">
                        <button class="button">일반</button>
                        <button class="button">정보</button>
                        <button class="button">나눔</button>
                        <button class="button">질문</button>
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

            <a href="${contextPath}/board/CreateNewBoard.do">
                <button class="button2">작성하기</button>
            </a>

        </div>
    </article>
</section>


</body>
</html>
