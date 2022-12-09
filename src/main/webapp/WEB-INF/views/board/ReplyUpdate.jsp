<!--
작성자 : 윤태검, 이영록
내용 : 자유게시판 상세페이지 화면 설계 및 구성. / CommnuityRead.jsp

일시 : 2022.10.10 ~
-->

<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Main</title>
    <!-- 스타일시트 연결 -->

    <!-- 댓글업데이트 button -->
    <script>
        function replyUpdateForm_check() {
            var replyUpdateForm = document.replyUpdateForm;
            let cbr_content1 = $("#cbr_content1").val();
            let cbr_content2 = $("#cbr_content2").val();

            if (cbr_content1 == "") {
                alert("내용을 입력해주세요");
                cbr_content1.focus();
                return false;
            };

            if (cbr_content2 == "") {
                alert("내용을 입력해주세요");
                cbr_content2.focus();
                return false;
            };

            replyUpdateForm.method = "post";
            replyUpdateForm.action = "./updateReply.do";
            replyUpdateForm.submit();
        }
    </script>

    <script>
        // 대댓글 출력하기
        function fn_click(number) {
            $(document).ready(function () {
                $('#' + number).slideToggle("slow");
            });
        }

        // 댓글
        function fn_click2(number) {
            $(document).ready(function () {
                $('.' + number).slideToggle("slow");
            });
        }
    </script>

</head>
<body>

<%--몸통--%>
<section>
    <article>
        <div id="Main_Box" align="center" style="margin-top: 30px">
            <h1> 게시글 </h1>

            <div class="d-flex justify-content-center" style="width: 80%; text-align: center; ">
                <table class="table align-middle" style="margin-top: 30px;  border: 5px solid #04AA6D;">
                    <thead>
                    <tr class="table-success">
                        <th scope="col" style="width: 5%">번호</th>
                        <th scope="col" style="width: 35%">제목</th>
                        <th scope="col" style="width: 10%">작성자</th>
                        <th scope="col" style="width: 15%">등록일</th>
                        <th scope="col" style="width: 5%">조회수</th>
                        <th scope="col" style="width: 10%">첨부파일</th>
                        <th scope="col" style="width: 10%">다운 횟수</th>
                    </tr>
                    </thead>
                    <tbody class="table-group-divider">
                    <tr style="margin: auto">
                        <td>${board.cb_seq}</td>
                        <td>${board.cb_title}</td>
                        <td>${board.cb_id}</td>
                        <td>${board.cb_regDate}</td>
                        <td>${board.cb_viewCount}</td>
                        <td><a href="download.do?cb_seq=${board.cb_seq}&token=on">
                            ${board.cb_originFileName}</a></td>
                        <td>${board.cb_downloadCount}</td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <div style="width: 80%; border: 5px solid #04AA6D; border-radius: 20px; text-align: left">
                ${board.cb_content}
            </div>

            <%--댓글--%>
            <div class="d-flex justify-content-center" style="width: 80%; text-align: center;">
                <form name="replyUpdateForm" method="post" style="width: 100%">
                    <table class="table align-middle" style="width: 100%; margin-top: 30px; border: 5px solid #04AA6D;">
                        <thead>
                        <tr class="table-warning">
                            <th scope="col" style="width: 10%">글번호</th>
                            <th scope="col" style="width: 30%">작성자</th>
                            <th scope="col" style="width: 10%">번들Seq</th>
                            <th scope="col" style="width: 10%">현재Seq</th>
                            <th scope="col" style="width: 20%">작성일</th>
                        </tr>
                        </thead>
                        <tbody class="table-group-divider">
                        <c:forEach var="reply" items="${replyList}">
                            <c:choose>
                                <c:when test="${reply.cbr_currentSeq == 1 || reply.cbr_currentSeq == 0}">
                                    <tr>
                                        <td>${reply.cbr_seq}</td>
                                        <td>${reply.cbr_replyId}</td>
                                        <td>${reply.cbr_bundleSeq}</td>
                                        <td>${reply.cbr_currentSeq}</td>
                                        <td>${reply.cbr_regDate}</td>
                                    </tr>
                                    <tr>
                                        <c:choose>
                                            <c:when test="${reply.cbr_seq == cbr_seq}">
                                                <td colspan="4"><textarea class="form-control"
                                                                          style="height: 100px; width: 100%;"
                                                                          id="cbr_content1"
                                                                          name="cbr_content">${reply.cbr_content}</textarea>
                                                    <input type="hidden" name="cb_seq" value="${board.cb_seq}">
                                                    <input type="hidden" name="cbr_seq" value="${cbr_seq}">
                                                </td>
                                                <td>
                                                    <button type="button" class="button2"
                                                            onclick="replyUpdateForm_check()">댓글수정
                                                    </button>
                                                </td>
                                            </c:when>
                                            <c:otherwise>
                                                <td colspan="7"
                                                    style="height: 100px">${reply.cbr_content}</td>
                                            </c:otherwise>
                                        </c:choose>
                                    </tr>
                                    <tr>
                                        <td colspan="7">
                                            <button class="button" type="button"
                                                    onclick="fn_click(${reply.cbr_bundleSeq})">답글
                                            </button>
                                            <div id="${reply.cbr_bundleSeq}"
                                                 style="display: none; background-color: lightgray">
                                                <div>
                                                    <table style="width: 100%">
                                                        <c:forEach var="Rereply" items="${replyList}">
                                                            <c:choose>
                                                                <c:when test="${Rereply.cbr_currentSeq != 1 && Rereply.cbr_currentSeq != 0 && reply.cbr_bundleSeq == Rereply.cbr_bundleSeq}">
                                                                    <tr>
                                                                        <td>${Rereply.cbr_seq}</td>
                                                                        <td>${Rereply.cbr_replyId}</td>
                                                                        <td>${reply.cbr_bundleSeq}</td>
                                                                        <td>${Rereply.cbr_currentSeq}</td>
                                                                        <td>${Rereply.cbr_regDate}</td>
                                                                        <td>
                                                                    </tr>
                                                                    <tr>
                                                                        <c:choose>
                                                                            <c:when test="${Rereply.cbr_seq == cbr_seq}">
                                                                                <td colspan="5"><textarea
                                                                                        class="form-control"
                                                                                        style="height: 100px; width: 100%;"
                                                                                        id="cbr_content2"
                                                                                        name="cbr_content">${Rereply.cbr_content}</textarea>
                                                                                    <input type="hidden" name="cb_seq" value="${board.cb_seq}">
                                                                                    <input type="hidden" name="cbr_seq" value="${cbr_seq}">
                                                                                </td>
                                                                                <td>
                                                                                    <button type="button"
                                                                                            class="button2"
                                                                                            onclick="replyUpdateForm_check()">
                                                                                        댓글수정
                                                                                    </button>
                                                                                </td>
                                                                            </c:when>
                                                                            <c:otherwise>
                                                                                <td colspan="7"
                                                                                    style="height: 100px">${Rereply.cbr_content}</td>
                                                                            </c:otherwise>
                                                                        </c:choose>
                                                                    </tr>
                                                                </c:when>
                                                            </c:choose>
                                                        </c:forEach>
                                                    </table>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                </c:when>
                            </c:choose>
                        </c:forEach>
                        </tbody>
                    </table>
                </form>
            </div>
        </div>

        <nav aria-label="Page navigation example">
            <ul class="pagination justify-content-center">
                <li class="page-item disabled">
                    <a class="page-link" href="#" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                </li>
                <li class="page-item"><a class="page-link" href="#">1</a></li>
                <li class="page-item"><a class="page-link" href="#">2</a></li>
                <li class="page-item"><a class="page-link" href="#">3</a></li>
                <li class="page-item">
                    <a class="page-link" href="#" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
            </ul>
        </nav>

    </article>
</section>

</body>
</html>
