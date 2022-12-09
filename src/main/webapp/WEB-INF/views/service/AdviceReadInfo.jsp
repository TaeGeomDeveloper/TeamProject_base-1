<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<html>
<head>
    <title>AdviceReadInfo</title>

    <!-- 댓글등록 button -->
    <script>
        function replyForm_check() {
            var replyForm = document.replyForm;
            let ecbr_replyId = $("#ecbr_replyId").val();
            let ecbr_content = $("#ecbr_content").val();

            if (ecbr_replyId == "") {
                alert("로그인이 필요합니다");
                console.log(ecbr_replyId);
                ecbr_replyId.focus();
                return false;
            }
            ;

            if (ecbr_content == "") {
                alert("내용을 입력해주세요");
                ecbr_content.focus();
                return false;
            }
            ;

            replyForm.method = "post";
            replyForm.action = "./writeReply.do";
            replyForm.submit();
        }
    </script>

</head>
<body>

<%--몸통--%>
<section>
    <article>
        <div id="Main_Box" align="center" style="width: 90%; margin:auto;">
            <h2 class="pb-2 border-bottom" style="font-size: 60px; color: #f58e45; margin-top: 50px">귀농 문의</h2>

            <div class="d-flex justify-content-center" style="text-align: center; ">
                <table class="table align-middle" style="margin-top: 30px; border: 5px solid #f7a063;">
                    <thead style="background-color: #f7a063">
                    <tr>
                        <th scope="col" style="width: 5%">번호</th>
                        <th scope="col" style="width: 35%">제목</th>
                        <th scope="col" style="width: 10%">작성자</th>
                        <th scope="col" style="width: 15%">등록일</th>
                        <th scope="col" style="width: 5%">조회수</th>
                        <th scope="col" style="width: 10%">첨부파일</th>
                        <th scope="col" style="width: 10%">다운 횟수</th>
                        <c:if test="${user.mi_id == consultation.ecb_id}">
                            <th scope="col">수정</th>
                            <th scope="col">삭제</th>
                        </c:if>
                    </tr>
                    </thead>
                    <tbody class="table-group-divider">
                    <tr style="margin: auto">
                        <td>${consultation.ecb_seq}</td>
                        <td>${consultation.ecb_title}</td>
                        <td>${consultation.ecb_id}</td>
                        <td>${consultation.ecb_regDate}</td>
                        <td>${consultation.ecb_viewCount}</td>
                        <td><a href="download.do?ecb_seq=${consultation.ecb_seq}&token=on">
                            ${consultation.ecb_originFileName}</a></td>
                        <td>${consultation.ecb_downloadCount}</td>
                        <c:if test="${user.mi_id == consultation.ecb_id}">
                            <td><a href="viewUpdatePage.do?ecb_seq=${consultation.ecb_seq}">
                                <button class="button3">수정</button>
                            </a></td>
                            <td><a href="delete.do?ecb_seq=${consultation.ecb_seq}">
                                <button class="button3">삭제</button>
                            </a></td>
                        </c:if>
                    </tr>
                    </tbody>
                </table>
            </div>
            <div style="border: 5px solid #f7a063; border-radius: 20px; padding: 20px; height: auto; text-align: left">
                ${consultation.ecb_content}
            </div>

            <h2 class="pb-2 border-bottom" style="font-size: 60px; color:#04AA6D; margin-top: 50px">전문가 의견</h2>

            <%--댓글--%>
            <div class="d-flex justify-content-center" style="width: 90%; text-align: center;">
                <table class="table align-middle" style="margin-top: 30px; border: 5px solid #04AA6D;">
                    <thead>
                    <tr class="table-warning">
                        <th scope="col" style="width: 10%">댓글번호</th>
                        <th scope="col" style="width: 10%">작성자</th>
                        <th scope="col" style="width: 50%">내용</th>
                        <th scope="col" style="width: 10%">작성일</th>
                        <th scope="col" style="width: 10%"></th>
                        <th scope="col" style="width: 10%"></th>
                    </tr>
                    </thead>
                    <tbody class="table-group-divider">
                    <c:forEach var="reply" items="${replyList}">
                        <c:choose>
                            <c:when test="${reply.ecbr_currentSeq == 1 || reply.ecbr_currentSeq == 0}">
                                <tr>
                                    <td>${reply.ecbr_seq}</td>
                                    <td>${reply.ecbr_replyId}</td>
                                    <td style="height: 100%" ; align="left" ;>
                                        <textarea class="form-control" placeholder="Leave a comment here" id="floatingTextarea2" readonly style="height: 200px">
                                                ${reply.ecbr_content}
                                        </textarea>
                                    </td>
                                    <td>${reply.ecbr_regDate}</td>
                                    <c:choose>
                                        <c:when test="${user.mi_id==reply.ecbr_replyId}">
                                            <td>
                                                <a href="viewUpdateReply.do?ecb_seq=${reply.ecb_seq}&ecbr_seq=${reply.ecbr_seq}">
                                                    <button class="button3">수정</button>
                                                </a>
                                            </td>
                                            <td>
                                                <a href="deleteReply.do?ecb_seq=${reply.ecb_seq}&ecbr_seq=${reply.ecbr_seq}&ecbr_bundleSeq=${reply.ecbr_bundleSeq}&ecbr_currentSeq=${reply.ecbr_currentSeq}">
                                                    <button class="button3">삭제</button>
                                                </a></td>
                                            </td>
                                        </c:when>
                                    </c:choose>
                                </tr>
                            </c:when>
                        </c:choose>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
            <%-- end of 댓글--%>
            <form name="replyForm" method="post" style="border: 5px solid #04AA6D; border-radius: 30px; width: 90%">
                <table style="margin-bottom: 30px;">
                    <tr>
                        <th>아이디</th>
                        <td><input class="form-control" type="text" name="ecbr_replyId" id="ecbr_replyId"
                                   value="${user.mi_id}" readonly="readonly" style="width: 150px"/></td>
                    </tr>
                    <tr>
                        <th>댓글</th>
                        <td><textarea class="form-control" id="ecbr_content" style="height: 200px; width: 600px"
                                      name="ecbr_content"></textarea></td>
                        <input type="hidden" name="ecb_seq" value="${consultation.ecb_seq}">
                    </tr>
                </table>
                <button type="button" class="button2" onclick="replyForm_check()">댓글등록</button>
            </form>
        </div>

    </article>
</section>

</body>
</html>
