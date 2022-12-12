<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<html>
<head>
    <title>Login</title>

    <!-- 스타일시트 연결 -->
    <script src="http://code.jquery.com/jquery-latest.js"></script>

    <script>
        $(document).ready(function () {
            $("#fn_login").on('click', function (event) {
                var SendPerson = document.SendPerson;

                let id = $("#floatingInputID").val();
                let pwd = $("#floatingInputPassword").val();

                console.log(id);
                console.log(pwd);

                $.ajax({
                    url: "${contextPath}/member/loginProcess.do",
                    type: "POST",
                    data: {mi_id: id, mi_password: pwd},
                    success: function (data, status) {
                        if (data == 'false') {
                            console.log("data false");
                            alert("등록되어 있지 않는 회원입니다.");
                            $("#mi_id").val('');
                            $("#mi_password").val('');
                        } else {
                            console.log("data true");
                            SendPerson.method = "POST";
                            SendPerson.action = "Main.do";
                            SendPerson.submit();
                        }
                    },
                    error: function (data, status) {
                        alert('error' + status);
                    }
                });
            });
        });

        function fn_find() {
            var Find = document.Find;

            Find.method = "post";
            Find.action = "./Forgot.do";
            Find.submit();
        }
    </script>

    <style>
        body {
            position: relative;
        }

        #MB {
            width: 100%;
            position: absolute;
            z-index: 2;
        }

        #BG {
            position: absolute;
            z-index: 1;
        }
        #footer{
            bottom: -600px;
        }
    </style>

</head>

<body>
<%--몸통--%>
<section>
    <article>
        <div id="Main_Box" align="center" style="padding: 0px">
            <div id="MB">
                <form name="SendPerson" style="margin-top: 100px">
                    <table class="c" align="center">
                        <h1 style="text-align: center; font-size: 60px"> 로그인 </h1>
                        <tr>
                            <td class="form-floating w-80" align="center">
                                <input type="text" class="form-control" id="floatingInputID" placeholder="아이디"
                                       name="mi_id">
                                <label for="floatingInputID"></label>
                            </td>
                        </tr>
                        <tr>
                            <td class="form-floating w-80" align="center">
                                <input type="password" class="form-control" id="floatingInputPassword"
                                       placeholder="비밀번호"
                                       name="mi_password">
                                <label for="floatingInputPassword"></label>
                            </td>
                        </tr>
                        <tr>
                            <td class="checkbox mb-3">
                                <input type="checkbox" value="remember-me"> 기억하기
                            </td>
                        </tr>
                        <tr>
                            <td align="center">
                                <button class="button w-100" type="button" id="fn_login">로그인</button>
                            </td>
                        </tr>
                    </table>
                </form>
                <form name="Find">
                    <table class="c" align="center">
                        <tr>
                            <td>
                                <a href="">
                                    <button class="button w-100" type="submit" onclick="fn_find()"> ID 또는 PW 찾기</button>
                                </a>
                            </td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
    </article>
</section>

</body>
</html>
