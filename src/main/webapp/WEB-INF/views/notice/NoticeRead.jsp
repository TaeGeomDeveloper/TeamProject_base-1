<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Main</title>

    <!-- 스타일시트 연결 -->

</head>
<body>

<%--몸통--%>
<section>
    <article>
        <div id="Main_Box" align="center" style="width: 90%; margin:auto;">
            <h1 class="Title" style="color: #f58e45; margin-bottom: 30px;"> 공지사항 </h1>

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
                        <c:if test="${user.mi_id=='admin'}">
                            <th scope="col" >수정</th>
                            <th scope="col" >삭제</th>
                        </c:if>
                    </tr>
                    </thead>
                    <tbody class="table-group-divider">
                    <tr style="margin: auto">
                        <td>${notice.nb_seq}</td>
                        <td>${notice.nb_title}</td>
                        <td>${notice.nb_id}</td>
                        <td>${notice.nb_regDate}</td>
                        <td>${notice.nb_viewCount}</td>
                        <td><a href="download.do?nb_seq=${notice.nb_seq}&token=on">
                            ${notice.nb_originFileName}</a></td>
                        <td>${notice.nb_downloadCount}</td>
                        <c:if test="${user.mi_id=='admin'}">
                            <td><a href="viewUpdatePage.do?nb_seq=${notice.nb_seq}">
                                <button class="button3">수정</button>
                            </a></td>
                            <td><a href="delete.do?nb_seq=${notice.nb_seq}">
                                <button class="button3">삭제</button>
                            </a></td>
                        </c:if>
                    </tr>
                    </tbody>
                </table>
            </div>
            <div style="border: 5px solid #f7a063; border-radius: 20px; padding: 20px; height: auto; text-align: left">
                ${notice.nb_content}
            </div>
        </div>


    </article>
</section>

</body>
</html>
