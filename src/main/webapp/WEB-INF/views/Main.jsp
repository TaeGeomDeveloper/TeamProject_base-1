<!--
    작성자 : 윤태검
    내용 : 메인 페이지 설계 및 구성. / Main.jsp

    일시 : 2022.10.10 ~
-->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%request.setCharacterEncoding("UTF-8");%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>메인 페이지</title>

    <!-- 스크립트 & 스타일시트 -->

</head>

<body>
<%--몸통--%>
<section>
    <article>
        <div id="Main_Box" align="center">
            <img src="${contextPath}/resources/image/Job/알바.jpg" alt="promo1" width="800" height="450">
        </div>



    </article>
</section>

<%--슬라이더--%>
<main style="width: 80%; height: 700px; margin: auto">
    <div id="carouselExampleDark" class="carousel carousel-dark slide" data-bs-ride="carousel">
        <div class="carousel-indicators">
            <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
            <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="1" aria-label="Slide 2"></button>
            <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="2" aria-label="Slide 3"></button>
        </div>
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="${contextPath}/resources/image/지원사업1.jpg" width="100%" height="700" alt="promo1">

                <div class="container">
                    <div class="carousel-caption text-start">
                        <%--<p><a class="btn btn-lg btn-primary" href="#">Sign up today</a></p>--%>
                        <p><a class="btn btn-lg btn-primary" href="#">상세보기</a></p>
                    </div>
                </div>
            </div>
            <div class="carousel-item">
                <img src="${contextPath}/resources/image/지원사업2.jpg" width="100%" height="700" alt="promo2">

                <div class="container">
                    <div class="carousel-caption">
                        <p><a class="btn btn-lg btn-primary" href="#">상세보기</a></p>
                    </div>
                </div>
            </div>
            <div class="carousel-item">
                <img src="${contextPath}/resources/image/지원사업3.jpg" width="100%" height="700" alt="promo3">

                <div class="container">
                    <div class="carousel-caption text-end">
                    <%--<p><a class="btn btn-lg btn-primary" href="#">Browse gallery</a></p>--%>
                            <p><a class="btn btn-lg btn-primary" href="#">상세보기</a></p>
                    </div>
                </div>
            </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>
</main>

<%--지원 사업 관련--%>
<main class="main">
    <div class="album py-5 bg-light">

        <div class="container" style="margin-top: 30px">

            <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">

                <c:forEach var="i" begin="1" end="6">
                    <div class="col">
                        <div class="card shadow-sm">
                            <svg class="bd-placeholder-img card-img-top" width="100%" height="1"
                                 xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail"
                                 preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title>
                                    <%--                            <rect width="100%" height="100%" fill="#55595c"/>--%>
                                <img src="${contextPath}/resources/image/Support/지원사업${i}.jpg" alt="promo1" width="100%"
                                     height="100%">
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
</main>
</body>
</html>