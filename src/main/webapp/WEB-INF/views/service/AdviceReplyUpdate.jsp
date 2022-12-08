<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<html>
<head>
    <title>AdviceReplyUpdate</title>

    <!-- 댓글업데이트 button -->
    <script>
        function replyUpdateForm_check() {
            var replyUpdateForm = document.replyUpdateForm;
            let ecbr_content1 = $("#ecbr_content1").val();
            let ecbr_content2 = $("#ecbr_content2").val();

            if (ecbr_content1 == "") {
                alert("내용을 입력해주세요");
                ecbr_content1.focus();
                return false;
            };

            if (ecbr_content2 == "") {
                alert("내용을 입력해주세요");
                ecbr_content2.focus();
                return false;
            };

            replyUpdateForm.method = "post";
            replyUpdateForm.action = "./updateReply.do";
            replyUpdateForm.submit();
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
                <table class="table align-middle" style="margin-top: 30px;  border: 5px solid #f7a063;">
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
            <div style="border: 5px solid #f7a063; border-radius: 20px; padding: 20px; height: 700px; text-align: left">
                ${consultation.ecb_content}
            </div>

            <h2 class="pb-2 border-bottom" style="font-size: 60px; color:#04AA6D; margin-top: 50px">전문가 의견</h2>

            <%--댓글--%>
            <div class="d-flex justify-content-center" style="width: 90%; text-align: center;">
                <form name="replyUpdateForm" method="post" style="width: 100%">
                    <table class="table align-middle" style="margin-top: 30px; border: 5px solid #04AA6D;">
                        <thead>
                        <tr class="table-warning">
                            <th scope="col" style="width: 10%">댓글번호</th>
                            <th scope="col" style="width: 10%">작성자</th>
                            <th scope="col" style="width: 50%"></th>
                            <th scope="col" style="width: 10%">작성일</th>
                        </tr>
                        </thead>
                        <tbody class="table-group-divider">
                        <c:forEach var="reply" items="${replyList}">
                            <c:choose>
                                <c:when test="${reply.ecbr_currentSeq == 1 || reply.ecbr_currentSeq == 0}">
                                    <tr>
                                        <td>${reply.ecbr_seq}</td>
                                        <td>${reply.ecbr_replyId}</td>
                                        <td></td>
                                        <td>${reply.ecbr_regDate}</td>
                                    </tr>
                                    <tr>
                                        <c:choose>
                                            <c:when test="${reply.ecbr_seq == ecbr_seq}">
                                                <td colspan="3"><textarea class="form-control"
                                                                          style="height: 200px; width: 100%;"
                                                                          id="ecbr_content1"
                                                                          name="ecbr_content">${reply.ecbr_content}</textarea>
                                                    <input type="hidden" name="ecb_seq" value="${consultation.ecb_seq}">
                                                    <input type="hidden" name="ecbr_seq" value="${ecbr_seq}">
                                                </td>
                                                <td>
                                                    <button type="button" class="button2"
                                                            onclick="replyUpdateForm_check()">댓글수정
                                                    </button>
                                                </td>
                                            </c:when>
                                            <c:otherwise>
                                                <td colspan="4" style="height: 100px">${reply.ecbr_content}</td>
                                            </c:otherwise>
                                        </c:choose>
                                    </tr>
                                </c:when>
                            </c:choose>
                        </c:forEach>
                        </tbody>
                    </table>
                </form>
            </div>
            <%-- end of 댓글--%>

        </div>
    </article>
</section>

</body>
</html>
