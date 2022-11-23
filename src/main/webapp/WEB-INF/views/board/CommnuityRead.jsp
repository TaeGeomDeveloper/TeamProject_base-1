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

    <!-- 댓글등록 button -->
    <script>
        function replyForm_check(){
            var replyForm = document.replyForm;
            let cbr_replyId = $("#cbr_replyId").val();
            let cbr_content = $("#cbr_content").val();
            alert(cbr_replyId);
            if(cbr_replyId == ""){
                alert("로그인이 필요합니다");
                console.log(cbr_replyId);
                cbr_replyId.focus();
                return false;
            };

            if(cbr_content == ""){
                alert("내용을 입력해주세요");
                cbr_content.focus();
                return false;
            };

            replyForm.method = "post";
            replyForm.action = "./writeReply.do";
            replyForm.submit();
        }
    </script>

    <!-- 대댓글등록 button -->
    <script>
        function reReplyForm_check(){
            var reReplyForm = document.reReplyForm;
            let cbr_reReplyId = $("#cbr_reReplyId").val();
            let cbr_reContent = $("#cbr_reContent").val();
            alert(cbr_reReplyId);
            if(cbr_reReplyId == ""){
                alert("로그인이 필요합니다");
                cbr_reReplyId.focus();
                return false;
            };

            if(cbr_reContent == ""){
                alert("내용을 입력해주세요");
                cbr_reContent.focus();
                return false;
            };

            reReplyForm.method = "post";
            reReplyForm.action = "./writeReReply.do";
            reReplyForm.submit();
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
                        <th scope="col" style="width: 10%">수정</th>
                    </tr>
                    </thead>
                    <tbody class="table-group-divider">
                    <tr style="margin: auto">
                        <td>${board.cb_seq}</td>
                        <td>${board.cb_title}</td>
                        <td>${board.mi_id}</td>
                        <td>${board.cb_regDate}</td>
                        <td>${board.cb_viewCount}</td>
                        <td><a href="download.do?cb_seq=${board.cb_seq}&token=on">
                            ${board.cb_originFileName}</a></td>
                        <td>${board.cb_downloadCount}</td>
                        <td><a href="viewUpdatePage.do?cb_seq=${board.cb_seq}">
                            <button class="button3">수정</button>
                        </a></td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <div style="width: 80%; border: 5px solid #04AA6D; border-radius: 20px; text-align: left">
                ${board.cb_content}
            </div>

            <%--댓글--%>
            <div class="d-flex justify-content-center" style="width: 80%; text-align: center;">
                <table class="table align-middle" style="margin-top: 30px; border: 5px solid #04AA6D;">
                    <thead>
                    <tr class="table-warning">
                        <th scope="col" style="width: 10%">글번호</th>
                        <th scope="col" style="width: 30%">작성자</th>
                        <th scope="col" style="width: 10%">번들Seq</th>
                        <th scope="col" style="width: 10%">현재Seq</th>
                        <th scope="col" style="width: 20%">작성일</th>
                        <th scope="col" style="width: 10%">수정</th>
                        <th scope="col" style="width: 10%">삭제</th>
                    </tr>
                    </thead>
                    <tbody class="table-group-divider">
                    <c:forEach var="reply" items="${replyList}">
                        <c:choose>
                            <c:when test="${reply.cbr_currentSeq == 1 || reply.cbr_currentSeq == 0}">
                                <tr>
                                    <td>${reply.cbr_seq}</td>
                                    <td>${reply.cbr_replyId}</td>
                                    <td>
                                        <a href="viewWriteReReply.do?cb_seq=${board.cb_seq}&cbr_bundleSeq=${reply.cbr_bundleSeq}&cbr_currentSeq=${reply.cbr_currentSeq}">${reply.cbr_bundleSeq}</a>
                                    </td>
                                    <td>${reply.cbr_currentSeq}</td>
                                    <td>${reply.cbr_regDate}</td>
                                    <td>
                                        <a href="viewUpdateReply.do?cb_seq=${reply.cb_seq}&cbr_seq=${reply.cbr_seq}">
                                            <button class="button3">수정</button>
                                        </a>
                                    </td>
                                    <td>
                                        <a href="deleteReply.do?cb_seq=${reply.cb_seq}&cbr_seq=${reply.cbr_seq}&cbr_bundleSeq=${reply.cbr_bundleSeq}&cbr_currentSeq=${reply.cbr_currentSeq}">
                                            <button class="button3">삭제</button></a></td>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="7" style="height: 100px">${reply.cbr_content}</td>
                                </tr>
                                <tr>
                                    <td colspan="7">
                                        <button class="button" onclick="fn_click(${reply.cbr_bundleSeq})">답글</button>
                                        <div id="${reply.cbr_bundleSeq}"
                                             style="display: none; background-color: lightgray">
                                            대댓글이 나옵니다.
                                            <div>
                                                <table style="width: 100%">
                                                    <c:forEach var="Rereply" items="${replyList}">
                                                        <c:choose>
                                                            <c:when test="${Rereply.cbr_currentSeq != 1 && Rereply.cbr_currentSeq != 0 && reply.cbr_bundleSeq == Rereply.cbr_bundleSeq}">
                                                                <tr>
                                                                    <td>${Rereply.cbr_seq}</td>
                                                                    <td>${Rereply.cbr_replyId}</td>
                                                                    <td>
                                                                        <a href="viewWriteReReply.do?cb_seq=${board.cb_seq}&cbr_bundleSeq=${Rereply.cbr_bundleSeq}&cbr_currentSeq=${Rereply.cbr_currentSeq}">${reply.cbr_bundleSeq}</a>
                                                                    </td>
                                                                    <td>${Rereply.cbr_currentSeq}</td>
                                                                    <td>${Rereply.cbr_regDate}</td>
                                                                    <td>
                                                                        <a href="viewUpdateReply.do?cb_seq=${Rereply.cb_seq}&cbr_seq=${Rereply.cbr_seq}">
                                                                            <button class="button3">수정</button>
                                                                        </a>
                                                                    </td>
                                                                    <td>
                                                                    <td>
                                                                    <a href="deleteReply.do?cb_seq=${reply.cb_seq}&cbr_seq=${reply.cbr_seq}&cbr_bundleSeq=${reply.cbr_bundleSeq}&cbr_currentSeq=${reply.cbr_currentSeq}">
                                                                        <button class="button3">삭제</button></a></td>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td colspan="7"
                                                                        style="height: 100px">${Rereply.cbr_content}</td>
                                                                </tr>
                                                            </c:when>
                                                        </c:choose>
                                                    </c:forEach>
                                                </table>
                                            </div>
                                            <button class="button" onclick="fn_click2(${reply.cbr_bundleSeq})">답글 달기</button>
                                            <div class="${reply.cbr_bundleSeq}" style="display: none; align-content: center">
                                                <form name="reReplyForm" method="post">
                                                    <table>
                                                        <tr>
                                                            <td>아이디</td>
                                                            <td><input class="form-control" placeholder="ID" type="text"
                                                                       name="cbr_replyId" id="cbr_reReplyId" style="width: 150px"/></td>
                                                        </tr>
                                                        <tr>
                                                            <td>내용</td>
                                                            <td><textarea class="form-control"
                                                                          id="cbr_reContent"
                                                                          style="height: 100px; width: 600px"
                                                                          name="cbr_content"></textarea></td>
                                                        </tr>
                                                        <tr>
                                                            <td><input type="hidden" name="cb_seq"
                                                                       value="${reply.cb_seq}"></td>
                                                            <td><input type="text" name="cbr_bundleSeq"
                                                                       value="${reply.cbr_bundleSeq}"/></td>
                                                            <td><input type="text" name="cbr_currentSeq"
                                                                       value="${reply.cbr_currentSeq}"/></td>
                                                        </tr>
                                                    </table>
                                                    <button class="button2" type="button" onclick="reReplyForm_check()" >수정하기</button>
                                                </form>
                                            </div>

                                        </div>
                                    </td>
                                </tr>
                            </c:when>
                        </c:choose>
                    </c:forEach>
                    </tbody>
                </table>
            </div>

            <form name="replyForm" method="post">
                <table style="margin-bottom: 30px">
                    <tr>
                        <th>아이디</th>
                        <td><input class="form-control" type="text" name="cbr_replyId" id="cbr_replyId" style="width: 150px"/></td>
                    </tr>
                    <tr>
                        <th>댓글</th>
                        <td><textarea class="form-control" id="cbr_content" style="height: 100px; width: 600px"
                                      name="cbr_content"></textarea></td>
                        <input type="hidden" name="cb_seq" value="${board.cb_seq}">
                    </tr>
                </table>
                <button type="button" class="button2" onclick="replyForm_check()" >댓글등록</button>
            </form>
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
