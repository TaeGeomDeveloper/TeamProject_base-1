
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<html>
<head>
    <title>Main</title>
    <script src="http://code.jquery.com/jquery-latest.js"></script>


    <script>
        $(document).focusout(function () {
            let pwdCheck = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/;
            let password1 = $("#password_1").val();
            let password2 = $("#password_2").val();
            console.log(password1);

            if (password1 != '') {
                null;
            }

            if (pwdCheck.test(password1)) {
                $("#rightPwd").css('display', 'inline-block');
                $('#rightPwd').html("적합");
                $("#unrightPwd").css('display', 'none');
            } else {
                $("#rightPwd").css('display', 'none');
                $("#unrightPwd").css('display', 'inline-block');
                $('#unrightPwd').html("부적합")
            }

            if ( password1 != '' && password2 == '' ) {
                null;
            } else if (password1 != "" || password2 != "") {
                if (password1 == password2) {
                    $("#success").css('display', 'inline-block');
                    $('#success').html("비밀번호가 일치합니다");
                    $("#fail").css('display', 'none');
                } else {
                    $("#success").css('display', 'none');
                    $("#fail").css('display', 'inline-block');
                    $('#fail').html("비밀번호가 일치하지 않습니다. 비밀번호를 재확인 해주세요.")
                }
            }
        });
    </script>

    <script>
        function changePwd(){
            var SendPwd = document.SendPwd;
            let password1 = $("#password_1").val();
            let password2 = $("#password_2").val();
            let pwdCheck = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/;
            if (!pwdCheck.test(password1)) {
                alert("비밀번호는 영문자+숫자+특수문자 조합으로 8자리 이상 사용해야 합니다.");
                password1.focus();
                return false;
            }
            if(password1 == ""){
                alert("올바른 비밀번호를 입력해주세요");
                return false;
            }
            if(password2 == ""){
                alert("비밀번호를 확인 해주세요");
                return false;
            }
            alert("비밀번호 변경 완료");
            SendPwd.method="post"
            SendPwd.action = "./changePwd.do"
            SendPwd.submit();
        }
    </script>
</head>


<body>

<%--몸통--%>
<section>
    <article>
        <div id="Main_Box" align="center" style="width: 90%; margin:auto;">
            <h2 class="pb-2 border-bottom" style="font-size: 60px; color: #04AA6D; margin-top: 50px">비밀번호 변경</h2>

            <form name="SendPwd">
                <table style="margin-top: 30px">
                    <tr>
                        <td>로그인 ID</td>
                        <td><input class="form-control form-control" type="text" value="${member.mi_id}" name="mi_id"/></td>
                    </tr>
                    <tr>
                        <td>새 비밀번호</td>
                        <td><input class="form-control form-control" type="password" id="password_1" name="mi_password"/></td>
                        <td>
                            <span id="rightPwd" style="display: none; color:green"></span>
                            <span id="unrightPwd" style="display: none; color:red"></span>
                        </td>
                    </tr>
                    <tr>
                        <td>새 비밀번호(확인)</td>
                        <td><input class="form-control form-control" type="password" id="password_2" /></td>
                        <td>
                            <span id="success" style="display: none;"></span>
                            <span id="fail" style="display: none; color: red"></span>
                        </td>
                    </tr>
                </table>
                <button style="margin-top: 30px" class="button w-20" type="button" onclick="changePwd()">비밀번호 변경
                </button>
            </form>
            <br>
            <span style="font-size: 10pt;">- 비밀번호는 8자 이상이어야 하며, 숫자/대문자/소문자/특수문자를 모두 포함해야 합니다.</span>
        </div>
    </article>
</section>

</body>
</html>
