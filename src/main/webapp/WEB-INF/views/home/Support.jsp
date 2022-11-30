<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2022-10-05
  Time: 오후 2:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<html>
<head>
    <title>Main</title>

    <!-- 스타일시트 연결 -->
    <script src="http://code.jquery.com/jquery-latest.js"></script>

    <%-- 폰트 --%>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Jua&display=swap');
    </style>


</head>
<body>

<%--몸통--%>
<section>
    <article>
        <div id="Main_Box" align="center" style="margin: auto; width: 90%">
            <h1 class="Title" style="color: #4c68f5;"> 지원 사업 </h1>

            <div class="container" style="margin-top: 30px">

                <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">

                    <c:forEach var="i" begin="1" end="6">
                    <div class="col">
                        <div class="card shadow-sm">
                            <svg class="bd-placeholder-img card-img-top" width="100%" height="1"
                                 xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail"
                                 preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title>
                                    <%--                            <rect width="100%" height="100%" fill="#55595c"/>--%>
                                <img src="${contextPath}/resources/image/Support/지원사업${i}.jpg" alt="promo1" width="100%" height="100%">
                                    <%--                            <text x="50%" y="50%" fill="#eceeef" dy=".3em" al>Thumbnail</text>--%>
                            </svg>

                            <div class="card-body">
                                <p class="card-text">지원 사업 관련 내용이 간략하게 들어갑니다.</p>
                                <div class="d-flex justify-content-between align-items-center">
                                    <div class="btn-group">
                                        <button type="button" class="btn btn-sm btn-outline-secondary" style="width: 100px">View</button>
                                    </div>
                                    <small class="text-muted">2022 11 11</small>
                                </div>
                            </div>
                        </div>
                    </div>
                    </c:forEach>

                </div>
            </div>

            <nav aria-label="Page navigation example" style="margin-top: 50px">
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

        </div>
    </article>
</section>

</body>
</html>
