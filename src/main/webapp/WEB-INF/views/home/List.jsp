<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2022-10-05
  Time: 오후 2:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>List</title>

    <!-- 스타일시트 연결 -->
    <script src="http://code.jquery.com/jquery-latest.js"></script>

    <%-- 폰트 --%>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Jua&display=swap');
    </style>


</head>
<body>

<%--몸통--%>
<section>
    <article>

        <div id="Main_Box">
            <h1> 회원정보 리스트 </h1>
            <table class="list_table">
                <tr>
                    <th>아이디</th>
                    <th id="title">이름</th>
                    <th id="content">이메일</th>
                    <th>사업자 등록번호</th>
                    <th>휴대전화</th>
                    <th>일반전화</th>
                    <th>회원유형</th>
                    <th colspan="2"> 버튼</th>
                </tr>
                <c:forEach var="vo" items="${list}">
                    <tr>
                        <td>
                                ${vo.id}
                        </td>
                        <td>
<%--                            <a href="read.do?Num=${vo.num}"> </a>--%>
                                ${vo.name}
                        </td>
                        <td>
                                ${vo.email}
                        </td>
                        <td>
                                ${vo.b_num}
                        </td>
                        <td>
                                ${vo.phone}
                        </td>
                        <td>
                                ${vo.l_phone}
                        </td>
                        <td>
                                ${vo.member_type}
                        </td>
                        <td>
                            <a href="Update.do?id=${vo.id}">
                                <button class="button3">변경하기</button>
                            </a>
                        </td>
                        <td>
                            <a href="Delete.do?id=${vo.id}">
                                <button class="button3">삭제하기</button>
                            </a>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>

    </article>
</section>

</body>
</html>
