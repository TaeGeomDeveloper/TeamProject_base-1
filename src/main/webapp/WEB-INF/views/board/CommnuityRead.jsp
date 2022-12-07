<!--
작성자 : 윤태검, 이영록
내용 : 자유게시판 상세페이지 화면 설계 및 구성. / CommnuityRead.jsp

일시 : 2022.10.10 ~
-->

<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
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
        function reReplyForm_check(bundleSeq){
            let reReplyForm = document.reReplyForm;
            let number = bundleSeq;
            let cb_seq = $('#cb_reSeq' + number).val();
            let cbr_currentSeq = $('#cbr_reCurrentSeq' + number).val();
            let cbr_reReplyId = $('#cbr_reReplyId' + number).val();
            let cbr_reContent = $('#cbr_reContent' + number).val();

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

            let param = {
                "cbr_replyId" : cbr_reReplyId,
                "cbr_content" : cbr_reContent,
                "cb_seq" : cb_seq,
                "cbr_currentSeq" : cbr_currentSeq,
                "cbr_bundleSeq" : number
            }

            $.ajax({
                anyne: true,
                type: 'POST',
                data: JSON.stringify(param),
                url:"${contextPath}/board/writeReReply.do",
                contentType: "application/json; charset=UTF-8",
                dataType: "text",
                success : function(data) {
                    // alert("성공");
                    location.href="${contextPath}/board/ReadBoard.do?cb_seq=" + cb_seq;
                },
                error: function(jqXHR, textStatus, errorThrown) {
                    alert(this.data);
                    alert("ERROR : " + textStatus + " : " + errorThrown);
                }
            });
            // $("#reReplyForm").attr("action","writeReReply.do").submit();
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
                        <th scope="col" >번호</th>
                        <th scope="col" >제목</th>
                        <th scope="col" >작성자</th>
                        <th scope="col" >등록일</th>
                        <th scope="col" >조회수</th>
                        <th scope="col" >첨부파일</th>
                        <th scope="col" >다운 횟수</th>
                        <c:if test="${user.mi_id==board.cb_id}">
                            <th scope="col" >수정</th>
                            <th scope="col" >삭제</th>
                        </c:if>
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
                        <c:if test="${user.mi_id==board.cb_id}">
                            <td><a href="viewUpdatePage.do?cb_seq=${board.cb_seq}">
                                <button class="button3">수정</button>
                            </a></td>
                            <td><a href="delete.do?cb_seq=${vo.cb_seq}">
                                <button class="button3">삭제</button>
                            </a></td>
                        </c:if>
                    </tr>
                    </tbody>
                </table>
            </div>
            <div style="width: 80%; border: 5px solid #04AA6D; border-radius: 20px; padding: 20px; text-align: left">
                ${board.cb_content}
            </div>

            <%--댓글--%>
            <div class="d-flex justify-content-center" style="width: 80%; text-align: center;">
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
                            <c:when test="${reply.cbr_currentSeq == 1 || reply.cbr_currentSeq == 0}">
                                <tr>
                                    <td>${reply.cbr_seq}</td>
                                    <td>${reply.cbr_replyId}</td>
                                    <td style="height: 100%"; align="left";>${reply.cbr_content}</td>
                                    <td>${reply.cbr_regDate}</td>
                                    <c:choose>
                                        <c:when test="${user.mi_id==reply.cbr_replyId}">
                                            <td>
                                                <a href="viewUpdateReply.do?cb_seq=${reply.cb_seq}&cbr_seq=${reply.cbr_seq}">
                                                    <button class="button3">수정</button>
                                                </a>
                                            </td>
                                            <td>
                                                <a href="deleteReply.do?cb_seq=${reply.cb_seq}&cbr_seq=${reply.cbr_seq}&cbr_bundleSeq=${reply.cbr_bundleSeq}&cbr_currentSeq=${reply.cbr_currentSeq}">
                                                    <button class="button3">삭제</button></a></td>
                                            </td>
                                        </c:when>
                                        <c:otherwise>
                                            <td></td>
                                            <td></td>
                                        </c:otherwise>
                                    </c:choose>
                                </tr>
                                <tr>
                                    <td colspan="7">
                                        <button class="button" onclick="fn_click(${reply.cbr_bundleSeq})" style="float: left;">답글</button>
                                        <div id="${reply.cbr_bundleSeq}"
                                             style="display: none; background-color: lightgray">
                                            <div>
                                                <table id="reReplyTable" style="width: 100%;" >
                                                    <c:forEach var="Rereply" items="${replyList}">
                                                        <c:choose>
                                                            <c:when test="${Rereply.cbr_currentSeq != 1 && Rereply.cbr_currentSeq != 0 && reply.cbr_bundleSeq == Rereply.cbr_bundleSeq}">
                                                                <tr>
                                                                    <td style="width: 5%;" >${Rereply.cbr_seq}</td>
                                                                    <td style="width: 10%;" >${Rereply.cbr_replyId}</td>
                                                                    <td colspan="7" style="width: 55%; height: 100px; border: 1px solid black">${Rereply.cbr_content}</td>
                                                                    <td style="width: 10%;" >${Rereply.cbr_regDate}</td>
                                                                    <c:choose>
                                                                        <c:when test="${user.mi_id==Rereply.cbr_replyId}">
                                                                            <td>
                                                                                <a href="viewUpdateReply.do?cb_seq=${Rereply.cb_seq}&cbr_seq=${Rereply.cbr_seq}">
                                                                                    <button class="button3">수정</button>
                                                                                </a>
                                                                            </td>
                                                                            <td>
                                                                                <a href="deleteReply.do?cb_seq=${reply.cb_seq}&cbr_seq=${Rereply.cbr_seq}&cbr_bundleSeq=${Rereply.cbr_bundleSeq}&cbr_currentSeq=${Rereply.cbr_currentSeq}">
                                                                                    <button class="button3">삭제</button></a></td>
                                                                            </td>
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <td style="width: 5%;"></td>
                                                                            <td style="width: 5%;"></td>
                                                                        </c:otherwise>
                                                                    </c:choose>
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
                                                <form name="reReplyForm" id="reReplyForm" >
                                                    <table>
                                                        <tr>
                                                            <td>아이디</td>
                                                            <td><input class="form-control" placeholder="ID" type="text"
                                                                       name="cbr_replyId${reply.cbr_bundleSeq}" id="cbr_reReplyId${reply.cbr_bundleSeq}"
                                                                       value="${user.mi_id}" readonly="readonly" style="width: 150px"/></td>
                                                        </tr>
                                                        <tr>
                                                            <td>내용</td>
                                                            <td><textarea class="form-control"
                                                                          id="cbr_reContent${reply.cbr_bundleSeq}"
                                                                          style="height: 100px; width: 600px"
                                                                          name="cbr_content${reply.cbr_bundleSeq}"></textarea></td>
                                                        </tr>
                                                        <tr>
                                                            <td><input type="hidden" name="cb_seq${reply.cbr_bundleSeq}"
                                                                       id="cb_reSeq${reply.cbr_bundleSeq}"
                                                                       readonly="readonly" value="${reply.cb_seq}"></td>
                                                            <td><input type="hidden" name="cbr_bundleSeq${reply.cbr_bundleSeq}"
                                                                       readonly="readonly" value="${reply.cbr_bundleSeq}"/></td>
                                                            <td><input type="hidden" name="cbr_currentSeq${reply.cbr_bundleSeq}"
                                                                       id="cbr_reCurrentSeq${reply.cbr_bundleSeq}"
                                                                       readonly="readonly" value="${reply.cbr_currentSeq}"/></td>
                                                        </tr>
                                                    </table>
                                                    <button class="button2" type="button" onclick="reReplyForm_check(${reply.cbr_bundleSeq})" >댓글등록</button>
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
                        <td><input class="form-control" type="text" name="cbr_replyId" id="cbr_replyId"
                                   value="${user.mi_id}" readonly="readonly" style="width: 150px"/></td>
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
