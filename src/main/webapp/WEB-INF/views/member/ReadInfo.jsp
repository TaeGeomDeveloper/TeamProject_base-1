<%@ page import="com.tp.farm.vo.MemberVO" %><%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2022-10-05
  Time: 오후 2:38
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>ReadInfo</title>

    <!-- 스타일시트 연결 -->
    <script src="http://code.jquery.com/jquery-latest.js"></script>

    <%-- 폰트 --%>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Jua&display=swap');
    </style>

    <script>
        function fn_updateForm() {
            var updateform = document.updateForm;

            updateForm.method = "post";
            updateForm.action = "ReadInfo.do?mi_id=${member.mi_id}&mode=u";
            updateForm.submit();
        }

        function fn_Update() {
            var updateMember = document.updateMember;

            updateMember.method = "post";
            updateMember.action = "UpdateMember.do?mi_id=${member.mi_id}";
            updateMember.submit();
        }

        function fn_deleteMember(){
            var updateForm = document.updateForm;

            let result = confirm("정말 회원탈퇴를 하시겠습니까?");
            if(result){
                updateForm.method = "post";
                updateForm.action = "deleteMember.do?mi_id=${member.mi_id}";
                updateForm.submit();
            }
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
            bottom: -1000px;
        }
        th {
            text-align: center;
            background: #aeed9d;
            border-radius: 100px;
            max-width: 100px;
            min-width: 100px;
        }

        #sidebar{
        }
    </style>
</head>
<body>

<%
    String mode = request.getParameter("mode");
    //System.out.println(mode);
    String read_only = "readonly='readonly'";
    String width = "width:500px;";
    String border_none =
            "border:none;" +
            "border-right:0px;" +
            "border-top:0px;" +
            "border-left:0px;" +
            "border-bottom:0px";
    MemberVO member = (MemberVO)request.getAttribute("member");
    String mbId = member.getMi_id();
%>

<%--몸통--%>
<section>
    <article>
        <div id="Main_Box" align="center">
            <div id="MB" style="margin-top: 50px">
                <h1><h1 style="text-align: center;font-size: 60px"> 회원정보 </h1>
                    <%--            <form action="UpdateMember.do?id=${member.id}&mode=r" method="post">--%>
                        <%
                if(mode.equals("r")){
            %>
            <form name="updateForm">
                    <%
            } else if(mode.equals("u")){%>
                        <form name="updateMember">
                            <%}%>
                            <div style="width: 70%; padding: 20px">
                                <table id="list_table" style="margin-bottom: 20px;">
                                    <tr>
                                        <th>아이디</th>
                                        <td>
                                            <input class="form-control form-control" type="text" value="${member.mi_id}" name="" readonly="readonly"
                                                   style="border: none;"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>비밀번호</th>
                                        <td>
                                            <input class="form-control form-control" type="password" value="${member.mi_password}" name="mi_password" <%
                                                if (mode.equals("r")) {
                                                    out.print(read_only + " ");
                                                    out.print("style=" + border_none);
                                                }
                                            %>/>
                                        </td>
                                        <th>이메일</th>
                                        <td>
                                            <input class="form-control form-control" type="text" value="${member.mi_email}" name="mi_email" <%
                                                if (mode.equals("r")) {
                                                    out.print(read_only + " ");
                                                    out.print("style=" + border_none);
                                                }
                                            %>/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>이름</th>
                                        <td>
                                            <input class="form-control form-control" type="text" value="${member.mi_name}" <%
                                                if (mode.equals("r")) {
                                                    out.print(read_only + " ");
                                                    out.print("style=" + border_none);
                                                }
                                            %>/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>주민등록번호</th>
                                        <td>
                                            <input class="form-control form-control" type="text" value="${member.mi_regidentRegNumber}"
                                                   readonly="readonly"
                                                   style="border: none;"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>휴대 전화</th>
                                        <td>
                                            <input class="form-control form-control" type="text" value="${member.mi_phone}" name="mi_phone" <%
                                                if (mode.equals("r")) {
                                                    out.print(read_only + " ");
                                                    out.print("style=" + border_none);
                                                }
                                            %>/>
                                        </td>
                                        <th>주소</th>
                                        <td>
                                            <input class="form-control form-control" type="text" style="width:400px;" value="${member.mi_address}"
                                                   name="mi_address" <%
                                                if (mode.equals("r")) {
                                                    out.print(read_only + " ");
                                                    out.print("style=" + border_none);
                                                }
                                            %>/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>일반 전화</th>
                                        <td>
                                            <input class="form-control form-control" type="text" value="${member.mi_wireline}" name="mi_wireline" <%
                                                if (mode.equals("r")) {
                                                    out.print(read_only + " ");
                                                    out.print("style=" + border_none);
                                                }
                                            %>/>
                                        </td>
                                        <th>상세 주소</th>
                                        <td>
                                            <input class="form-control form-control" type="text" style="width:400px;" value="${member.mi_addressDetail}"
                                                   name="mi_addressDetail" <%
                                                if (mode.equals("r")) {
                                                    out.print(read_only + " ");
                                                    out.print("style=" + border_none);
                                                }
                                            %>/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>가입 날짜</th>
                                        <td><input class="form-control form-control" type="text" value="${member.mi_joinDate}" readonly="readonly"
                                                   style="border: none;"/></td>
                                        <th>우편번호</th>
                                        <td>
                                            <input class="form-control form-control" type="text" style="width:100px;" value="${member.mi_addressCode}"
                                                   name="mi_addressCode"<%
                                                if (mode.equals("r")) {
                                                    out.print(read_only + " ");
                                                    out.print("style=" + border_none);
                                                }
                                            %>/>
                                        </td>
                                    </tr>
                                </table>
                            </div>

                            <%
                                if (mode.equals("r")) {
                                    out.print("<button class='button2' onclick='fn_updateForm()' type='button'> 수정 하기 </button>");
                                } else if (mode.equals("u")) {
                                    out.print("<button class='button2' onclick='fn_Update()' type='button'> 수정 완료 </button>");
                                }
                            %>
<%--                            <a href="deleteMember.do?mi_id=${member.mi_id}" style="text-decoration:none">--%>
                                <button class="button2" onclick="fn_deleteMember()" type='button'>회원 탈퇴</button>
<%--                            </a>--%>
                        </form>

            </div>
        </div>
    </article>
</section>
<div id="BG">
    <img src="${contextPath}/resources/image/background/배경.jpg" alt="배경" style="height: 100%; width: 100%">
</div>
</body>
</html>
