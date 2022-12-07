<!--
작성자 : 윤태검, 이영록
내용 : 공지사항 화면 설계 및 구성. / Notice.jsp

일시 : 2022.10.10 ~
-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>공지사항</title>

    <script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
    <link rel="stylesheet" href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.min.css">

    <script>
        $(document).ready(function () {
            $('#table_i').DataTable({
                order: [ [ 0, "desc" ] ]
            });
        });
    </script>

    <style>
        .button4 {
            border-radius: 15px;
            background-color: #f0bc97;
            border: none;
            color: white;
            padding: 5px 10px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 4px 2px;
            cursor: pointer;
        }

        .button4:hover {background-color: #f7a063;}
    </style>

</head>
<body>

<%--몸통--%>
<section>
    <article>
        <div id="Main_Box" align="center" style="width: 90%; margin:auto;">
            <h1 class="Title" style="color: #f58e45; margin-bottom: 30px;"> 공지사항 </h1>

            <table id="table_i" class="table table-striped table-bordered" style="width:100%;">
                <thead style="background-color: #f7a063">
                <tr>
                    <th>글번호</th>
                    <th style="width: 40%">제목</th>
                    <th>작성자</th>
                    <th>등록일</th>
                    <th>조회수</th>
                    <th>첨부파일</th>
                    <c:if test="${user.mi_id=='admin'}">
                        <th>삭제 버튼</th>
                    </c:if>
                </tr>
                </thead>
                <tbody class="table-group-divider">
                <c:forEach var="vo" items="${list}">
                    <tr>
                        <th scope="row">${vo.nb_seq}</th>
                        <td><a href="ReadBoard.do?nb_seq=${vo.nb_seq}">${vo.nb_title} </a></td>
                        <td> ${vo.nb_id}</td>
                        <td>${vo.nb_regDate}</td>
                        <td>${vo.nb_viewCount}</td>
                        <td>
                            <c:if test="${vo.nb_originFileName!=null}">
                                <a href="download.do?nb_seq=${vo.nb_seq}&token=on">
                                        ${vo.nb_originFileName}
                                </a>
                            </c:if>
                        </td>
                        <c:if test="${user.mi_id=='admin'}">
                            <td>
                                <a href="delete.do?nb_seq=${vo.nb_seq}">
                                    <button class="button4">삭제</button>
                                </a>
                            </td>
                        </c:if>
                    </tr>
                </c:forEach>
                </tbody>
            </table>

            <c:if test="${user.mi_id=='admin'}">
                <a href="${contextPath}/gwinongin/notice/CreateNewBoard.do">
                    <button class="button2">작성하기</button>
                </a>
            </c:if>

        </div>
    </article>
</section>


</body>
</html>
