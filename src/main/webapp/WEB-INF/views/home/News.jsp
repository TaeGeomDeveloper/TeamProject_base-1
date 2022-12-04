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
    <title>News</title>

    <!-- 스타일시트 연결 -->
    <script src="http://code.jquery.com/jquery-latest.js"></script>

    <script>
        document.cookie = "safeCookie1=foo; SameSite=Lax";
        document.cookie = "safeCookie2=foo";
        document.cookie = "crossCookie=bar; SameSite=None; Secure";
    </script>

    <%-- 폰트 --%>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Jua&display=swap');
    </style>

</head>
<body>

<div class="container px-4 py-5" id="custom-cards">
    <h2 class="pb-2 border-bottom" style="font-size: 60px; color: #ff4a4a">News</h2>

    <div class="row row-cols-1 row-cols-lg-2 align-items-stretch g-4 py-5">

        <div class="col" style="height: 400px">
            <div class="card card-cover h-100 overflow-hidden text-bg-dark rounded-4 shadow-lg">
                <iframe class="embed-responsive-item" src="https://www.youtube-nocookie.com/embed/YlJVylU3XpM"
                        style="height: 100%"></iframe>
            </div>
        </div>

        <div class="col" style="height: 400px">
            <div class="card card-cover h-100 overflow-hidden text-bg-dark rounded-4 shadow-lg">
                <iframe class="embed-responsive-item" src="https://www.youtube-nocookie.com/embed/tFU0PAMG-Dc"
                        style="height: 100%"></iframe>
            </div>
        </div>
    </div>

    <hr class="featurette-divider">
    <div class="row row-cols-1 row-cols-lg-2 align-items-stretch g-4 py-5">
        <div class="col" style="height: 400px">
            <div class="card card-cover h-100 overflow-hidden text-bg-dark rounded-4 shadow-lg">
                <iframe class="embed-responsive-item" src="https://www.youtube-nocookie.com/embed/KfW6Ixeuvq4"
                        style="height: 100%"></iframe>
            </div>
        </div>

        <div class="col" style="height: 400px">
            <div class="card card-cover h-100 overflow-hidden text-bg-dark rounded-4 shadow-lg">
                <iframe class="embed-responsive-item" src="https://www.youtube-nocookie.com/embed/RZNgNwCXE10"
                        style="height: 100%"></iframe>
            </div>
        </div>

    </div>
</div>

<%--몸통--%>
<section>
    <article>



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
