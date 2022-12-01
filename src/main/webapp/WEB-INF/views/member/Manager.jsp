<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2022-11-22
  Time: 오전 10:26
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>Manager</title>

    <script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
    <link rel="stylesheet" href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.min.css">

    <script>
        $(document).ready(function () {
            $('#table_i').DataTable();
        });
    </script>
    <style>
        .Mbtn {
            border-radius: 15px;
            background-color: #f57878;
            border: none;
            color: white;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 20px;
            margin: 4px 2px;
            cursor: pointer;
        }

        .Mbtn:hover {
            background-color: #ff4a4a;
        }
    </style>
    <script>
        // CSV 데이터 삽입
        function fn_click() {
            var csvForm = document.csvForm;

            csvForm.method = "post";
            csvForm.action = "./InputCSV.do";
            csvForm.submit();
        }
    </script>

    <script>
        $(document).ready(function () {
            // CSV 삽입
            <%--$("#Insert").on('click', function () {--%>
            <%--    $.ajax({--%>
            <%--        type: 'POST',--%>
            <%--        url: "${contextPath}/member/InputCSV.do",--%>
            <%--        success: function () {--%>
            <%--            alert("성공!");--%>
            <%--        },--%>
            <%--        error: function () {--%>
            <%--            alert("error");--%>
            <%--        }--%>
            <%--    });--%>
            <%--});--%>

            // 전국전통시장데이터 삭제
            $("#Choice1").on('click', function () {
                $.ajax({
                    type: 'POST',
                    url: "${contextPath}/member/DeleteTraditionalMarket.do",
                    success: function () {
                        alert("성공!");
                    },
                    error: function () {
                        alert("error");
                    }
                });
            });
            // 농지 시세 테이블 삭제
            $("#Choice2").on('click', function () {
                $.ajax({
                    type: 'POST',
                    url: "${contextPath}/member/DeleteFarmlandPriceData.do",
                    success: function () {
                        alert("성공!");
                    },
                    error: function () {
                        alert("error");
                    }
                });
            });
            // 농작물 자료 삭제
            $("#Choice3").on('click', function (event) {
                $.ajax({
                    type: 'POST',
                    url: "${contextPath}/member/DeleteCropData.do",
                    success: function () {
                        alert("성공!");
                    },
                    error: function () {
                        alert("error");
                    }
                });
            });
        });
    </script>

</head>
<body>
<div id="Main_Box" align="center" style="width: 90%; margin:auto;">
    <h1 class="Title" style="color: #ff4a4a; margin-bottom: 30px;"> 회원정보 </h1>

    <table id="table_i" class="table table-striped table-bordered" style="width:100%;">
        <thead style="background-color: #ff4a4a">
        <tr>
            <th>회원 아이디</th>
            <th>회원 이름</th>
            <th>회원 이메일</th>
            <th>회원 폰번호</th>
            <th>삭제 버튼</th>
        </tr>
        </thead>
        <tbody class="table-group-divider">
        <c:forEach var="vo" items="${List}">
            <tr>
                <td scope="row">${vo.mi_id}</td>
                <td>${vo.mi_name}</td>
                <td> ${vo.mi_email}</td>
                <td>${vo.mi_phone}</td>
                <td>
                    <a href="deleteMember.do?mi_id=${vo.mi_id}">
                        <button class="button4">삭제</button>
                    </a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <h2 class="pb-2 border-bottom" style="font-size: 60px; color: #ff4a4a; margin-top: 100px">CSV 파일 업로드</h2>
    <form action="InputCSV.do" method="post" enctype="multipart/form-data">
        <h3>※ CSV 파일을 넣어주세요!</h3>
        <input class="form-control" placeholder="file" type="file" name="files" style="width: 50%" multiple="multiple"/>
        <button type="submit" class="Mbtn" style="margin-top: 25px" id="Insert">파일 전송</button>
    </form>

    <h2 class="pb-2 border-bottom" style="font-size: 60px; color: #ff4a4a; margin-top: 100px">CSV 데이터 삭제</h2>
    <h3>※ CSV 데이터를 삭제합니다!</h3>
    <table>
        <tr>
            <th>전국전통시장표준데이터</th>
            <td>
                <button class="button" id="Choice1">삭제</button>
            </td>
        </tr>
        <tr>
            <th>농지시세 데이터</th>
            <td>
                <button class="button" id="Choice2">삭제</button>
            </td>
        </tr>
        <tr>
            <th>농작물 자료</th>
            <td>
                <button class="button" id="Choice3">삭제</button>
            </td>
        </tr>
    </table>

</div>
</body>
</html>
