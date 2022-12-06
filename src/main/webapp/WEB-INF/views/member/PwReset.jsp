
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
            <h2 class="pb-2 border-bottom" style="font-size: 60px; color: #04AA6D; margin-top: 50px">비밀번호 변경</h2>

            <form>
                <table style="margin-top: 30px">
                    <tr>
                        <td>로그인 ID</td>
                        <td><input class="form-control form-control" type="text" value="" /></td>
                    </tr>
                    <tr>
                        <td>현재 비밀번호</td>
                        <td><input class="form-control form-control" type="text" value="" /></td>
                    </tr>
                    <tr>
                        <td>새 비밀번호</td>
                        <td><input class="form-control form-control" type="text" value="" /></td>
                    </tr>
                    <tr>
                        <td>새 비밀번호(확인)</td>
                        <td><input class="form-control form-control" type="text" value="" /></td>
                    </tr>
                </table>
                <button style="margin-top: 30px" class="button w-20" type="button" id="">비밀번호 변경 ▶
                </button>
            </form>

        </div>
    </article>
</section>

</body>
</html>
