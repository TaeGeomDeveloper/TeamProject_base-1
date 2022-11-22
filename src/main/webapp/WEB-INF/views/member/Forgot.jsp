<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.tp.farm.vo.MemberVO" %>
<%@ page import="com.tp.farm.dao.MemberDAO" %><%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2022-10-17
  Time: 오전 11:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<html>
<head>
    <title>Forgot</title>

    <!-- 스타일시트 연결 -->
    <script src="http://code.jquery.com/jquery-latest.js"></script>

    <%-- 폰트 --%>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Jua&display=swap');
    </style>
    <script>

    $(document).ready(function (){
        $("#fn_find_id").on('click',function (event) {
            var Find = document.Find;

            let name = $("#floatingInputName").val();
            let phone = $("#floatingInputPhone").val();

            console.log(name);
            console.log(phone);
            $.ajax({
                url:"${contextPath}/member/findId.do",
                type : "get",
                data:{mi_name :name, mi_phone :phone},
                    success:function (data, status){
                        if(data==0){
                            alert("이름 또는 휴대전화를 잘못 입력하셨습니다.");
                            $("#floatingInputName").val('');
                            $("#floatingInputPhone").val('');
                        }else{
                            alert("회원님의 아이디는 "+data+"입니다");
                            Find.method = "post";
                            Find.action = "${contextPath}/member/Login.do";
                            Find.submit();
                        }
                    },
                    error:function (data,status){
                        alert(status);
                    }
            });
        });
    });
    </script>

    <script>
        $(document).ready(function (){
            $("#fn_find_pwd").on('click',function (event) {
                var Find = document.Find;

                let id = $("#floatingInputID").val();
                let email = $("#floatingInputEmail").val();
                console.log(id)
                console.log(email)
                $.ajax({
                    url: "${contextPath}/member/findPwd.do",
                    type: "POST",
                    data:{mi_id: id, mi_email: email},
                    success: function (data, status) {
                        if (data == "false") {
                            alert("아이디 또는 이메일을 잘못 입력하셨습니다.")
                            $("#floatingInputID").val('');
                            $("#floatingInputEmail").val('');
                        } else {
                            Find.method = "post";
                            Find.action = "${contextPath}/member/Login.do";
                            Find.submit();
                            alert("등록된 이메일로 비밀번호를 발송했습니다.");
                        }
                    },
                    error: function (data, status) {
                        alert(status);
                    }
                });
            });
        });
    </script>
</head>
<body>

<%--몸통--%>
<section>
    <article>

        <div id="Main_Box" align="center" style="margin-bottom: 30px">
            <form name="Find">
                <table style="margin-top: 100px">
                    <tr>
                        <td>
                            <table class="c" align="center">
                                <h1 style="text-align: center"> ID 찾기 </h1>
                                <tr>
                                    <td class="form-floating w-80" align="center">
                                        이름
                                        <input type="text" class="form-control" id="floatingInputName" placeholder="이름"
                                               name="mi_name">
                                        <label for="floatingInputName"></label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-floating w-80" align="center">
                                        휴대전화
                                        <input type="text" class="form-control" id="floatingInputPhone"
                                               placeholder="휴대전화"
                                               name="mi_phone">
                                        <label for="floatingInputPhone"></label>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        <button class="button w-100" type="button" id="fn_find_id" >ID 찾기
                                        </button>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td>
                            <table class="c" align="center">
                                <h1 style="text-align: center"> PW 찾기 </h1>
                                <tr>
                                    <td class="form-floating w-80" align="center">
                                        아이디
                                        <input type="text" class="form-control" id="floatingInputID" placeholder="아이디"
                                               name="mi_id">
                                        <label for="floatingInputID"></label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-floating w-80" align="center">
                                        이메일
                                        <input type="text" class="form-control" id="floatingInputEmail"
                                               placeholder="이메일"
                                               name="mi_email">
                                        <label for="floatingInputEmail"></label>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        <button class="button w-100" type="button" id="fn_find_pwd">PW 찾기
                                        </button>
                                    </td>
                                </tr>
                                </td>
                            </table>
                    </tr>
                </table>
            </form>
        </div>

    </article>
</section>


</body>
</html>
