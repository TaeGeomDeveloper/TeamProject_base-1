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
                        <td><a href="download.do?seq=${board.cb_seq}&token=on">
                            ${board.cb_originFileName}</a></td>
                        <td>${board.cb_downloadCount}</td>
                        <td><a href="viewUpdatePage.do?seq=${board.cb_seq}">
                            <button class="button3">수정</button>
                        </a></td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <div style="border: 5px solid #f7a063; border-radius: 20px; height: 700px; text-align: left">
                ${board.cb_content}
            </div>
        </div>


    </article>
</section>

</body>
</html>
