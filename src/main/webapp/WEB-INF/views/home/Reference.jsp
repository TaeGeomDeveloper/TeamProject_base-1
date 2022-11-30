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
    <title>Reference</title>

    <!-- 스타일시트 연결 -->
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
    <link rel="stylesheet" href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.min.css">

    <%-- 폰트 --%>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Jua&display=swap');
    </style>

    <script>
        $(document).ready(function () {
            $('#table_Reference').DataTable();

        });
    </script>

    <style>
        .button4 {
            border-radius: 15px;
            background-color: #f7dd7e;
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

        .button4:hover {background-color: #f5c61b;}
    </style>

</head>
<body>

<%--몸통--%>
<section>
    <article>
        <div id="Main_Box" align="center" style="margin:auto; width: 90%">
            <h1 class="Title" style=" color: #f7cc4a; margin-bottom: 30px;"> 자료실 </h1>

            <%-- 자료실 현황 --%>
            <table id="table_Reference" class="table table-striped table-bordered" style="width:100%;">
                <thead style="background-color: #f7cc4a">
                <tr>
                    <th>글번호</th>
                    <th style="width: 40%">제목</th>
                    <th>작성자</th>
                    <th>등록일</th>
                    <th>조회수</th>
                    <th>변경 버튼</th>
                    <th>삭제 버튼</th>
                    <th>첨부파일</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="i" begin="0" end="15">
                    <tr>
                        <td>${i}</td>
                        <td> 제목 ${i}</td>
                        <td>김 모씨</td>
                        <td>2022-11-11</td>
                        <td>0</td>
                        <td>
                            <button class="button4">변경</button>
                        </td>
                        <td>
                            <button class="button4">삭제</button>
                        </td>
                        <td>
                            <button class="button4">첨부파일</button>
                        </td>
                    </tr>
                    <tr>
                        <td>${i}</td>
                        <td> 상담 리스트 ${i}</td>
                        <td>윤 모씨</td>
                        <td>2022-11-11</td>
                        <td>0</td>
                        <td>
                            <button class="button4">변경</button>
                        </td>
                        <td>
                            <button class="button4">삭제</button>
                        </td>
                        <td>
                            <button class="button4">첨부파일</button>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
                <tfoot>
                <tr>
                    <th>글번호</th>
                    <th>제목</th>
                    <th>작성자</th>
                    <th>등록일</th>
                    <th>조회수</th>
                    <th>변경 버튼</th>
                    <th>삭제 버튼</th>
                    <th>첨부파일</th>
                </tr>
                </tfoot>
            </table>

        </div>
    </article>
</section>

</body>
</html>
