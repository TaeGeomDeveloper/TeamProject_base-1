<!--
작성자 : 윤태검
내용 : 임시  Board

일시 : 2022.10.10 ~
-->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<html>
<head>
    <title>Board</title>

    <!-- 스타일시트 연결 -->
    <script src="http://code.jquery.com/jquery-latest.js"></script>

    <%-- 폰트 --%>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Jua&display=swap'); /* 수정 연습 */
    </style>

    <style>
        /*.p-2 {*/
        /*  margin: 10px;*/
        /*  border-radius: 20px;*/
        /*  border: 2px solid #04AA6D;*/
        /*  padding: 0px;*/
        /*}*/
    </style>

</head>
<body>

<%--몸통--%>
<section>
    <article>
        <div id="Main_Box" align="center" style="margin-top: 30px">
            <h1> 자유 게시판 </h1>

            <div class="d-flex justify-content-center" style="width: 80%; text-align: center">
                <table class="table" style="margin-top: 30px">
                    <thead>
                    <tr class="table-success">
                        <th scope="col" style="width: 5%">번호</th>
                        <th scope="col" style="width: 60%">제목</th>
                        <th scope="col" style="width: 10%">작성자</th>
                        <th scope="col" style="width: 15%">등록일</th>
                        <th scope="col" style="width: 10%">조회수</th>
                    </tr>
                    </thead>
                    <tbody class="table-group-divider">
                    <c:forEach var="i" begin="1" end="15">
                        <tr>
                            <th scope="row">${i}</th>
                            <td>제목 ${i}</td>
                            <td>작성자 ${i}</td>
                            <td>2022.10.24</td>
                            <td>100</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>

            <nav aria-label="Page navigation example">
                <ul class="pagination justify-content-center">
                    <li class="page-item disabled">
                        <a class="page-link" href="#" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item">
                        <a class="page-link" href="#" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </ul>
            </nav>

        </div>
    </article>
</section>

</body>
</html>
