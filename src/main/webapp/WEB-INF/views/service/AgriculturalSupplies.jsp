<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<%
    request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Sales List</title>

    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <!-- 스타일시트 연결 -->

    <%-- 폰트 --%>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Jua&display=swap');
    </style>

    <style>
        .Item_Information {
            border-radius: 10px;
            border: 5px solid #04AA6D;
            margin-left: auto;
            margin-right: auto;
            padding: 10px;
        }
    </style>

</head>
<body>

<%--몸통--%>
<section>
    <article>
        <div id="Main_Box" align="center" style="width: 90%; margin:auto;">
            <img src="${contextPath}/resources/image/ready.jpg" alt="notReady" width="800" height="600">


        </div>

<%--            <h1> 농업 용품 </h1>--%>

<%--            <!-- START THE FEATURETTES -->--%>
<%--            <hr class="featurette-divider">--%>

<%--            <div class="row featurette">--%>
<%--                <div class="col-md-7">--%>
<%--                    <h2 class="featurette-heading fw-normal lh-1"> 농업용 건조기 <span class="text-muted"> 농사 용품 A </span>--%>
<%--                    </h2>--%>
<%--                    <p class="lead"> 부가 설명 입니다. </p>--%>
<%--                </div>--%>
<%--                <div class="col-md-5">--%>
<%--                    <img src="${contextPath}/resources/image/농업용건조기.jpg" alt="promo1" width="500" height="500">--%>
<%--                </div>--%>
<%--            </div>--%>

<%--            <hr class="featurette-divider">--%>

<%--            <div class="row featurette">--%>
<%--                <div class="col-md-7 order-md-2">--%>
<%--                    <h2 class="featurette-heading fw-normal lh-1"> 농업용 탈곡기 <span class="text-muted"> 농사 용품 B </span>--%>
<%--                    </h2>--%>
<%--                    <p class="lead"> 부가 설명 입니다. </p>--%>
<%--                </div>--%>
<%--                <div class="col-md-5 order-md-1">--%>
<%--                    <img src="${contextPath}/resources/image/탈곡기.jpg" alt="promo1" width="500" height="500">--%>
<%--                </div>--%>
<%--            </div>--%>

<%--            <hr class="featurette-divider">--%>

<%--            <div class="row featurette">--%>
<%--                <div class="col-md-7">--%>
<%--                    <h2 class="featurette-heading fw-normal lh-1"> 농기계 <span--%>
<%--                            class="text-muted">농사 용품 C </span></h2>--%>
<%--                    <p class="lead"> 부가 설명 입니다. </p>--%>
<%--                </div>--%>
<%--                <div class="col-md-5">--%>
<%--                    <img src="${contextPath}/resources/image/농기계.jpg" alt="promo1" width="500" height="500">--%>
<%--                </div>--%>
<%--            </div>--%>

<%--            <hr class="featurette-divider">--%>
<%--            <!-- /END THE FEATURETTES -->--%>
<%--        </div>--%>
    </article>
</section>

<%--<main class="main">--%>
<%--    <div class="album py-5 bg-light">--%>
<%--        <div class="container">--%>

<%--            <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">--%>

<%--                <div class="col">--%>
<%--                    <div class="card shadow-sm">--%>
<%--                        <svg class="bd-placeholder-img card-img-top" width="100%" height="1"--%>
<%--                             xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail"--%>
<%--                             preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title>--%>
<%--                            &lt;%&ndash;                            <rect width="100%" height="100%" fill="#55595c"/>&ndash;%&gt;--%>
<%--                            <img src="${contextPath}/resources/image/신일종합건조기.jpg" alt="promo1" width="100%"--%>
<%--                                 height="100%">--%>
<%--                            &lt;%&ndash;                            <text x="50%" y="50%" fill="#eceeef" dy=".3em" al>Thumbnail</text>&ndash;%&gt;--%>
<%--                        </svg>--%>

<%--                        <div class="card-body">--%>
<%--                            <p class="card-text">This is a wider card with supporting text below as a natural lead-in to--%>
<%--                                additional content. This content is a little bit longer.</p>--%>
<%--                            <div class="d-flex justify-content-between align-items-center">--%>
<%--                                <div class="btn-group">--%>
<%--                                    <button type="button" class="btn btn-sm btn-outline-secondary">View</button>--%>
<%--                                    <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>--%>
<%--                                </div>--%>
<%--                                <small class="text-muted">9 mins</small>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>

<%--                <div class="col">--%>
<%--                    <div class="card shadow-sm">--%>
<%--                        <svg class="bd-placeholder-img card-img-top" width="100%" height="1"--%>
<%--                             xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail"--%>
<%--                             preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title>--%>
<%--                            &lt;%&ndash;                            <rect width="100%" height="100%" fill="#55595c"/>&ndash;%&gt;--%>
<%--                            <img src="${contextPath}/resources/image/성보탈곡기.jpg" alt="promo1" width="100%" height="100%">--%>
<%--                        </svg>--%>

<%--                        <div class="card-body">--%>
<%--                            <p class="card-text">This is a wider card with supporting text below as a natural lead-in to--%>
<%--                                additional content. This content is a little bit longer.</p>--%>
<%--                            <div class="d-flex justify-content-between align-items-center">--%>
<%--                                <div class="btn-group">--%>
<%--                                    <button type="button" class="btn btn-sm btn-outline-secondary">View</button>--%>
<%--                                    <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>--%>
<%--                                </div>--%>
<%--                                <small class="text-muted">9 mins</small>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>

<%--                <div class="col">--%>
<%--                    <div class="card shadow-sm">--%>
<%--                        <svg class="bd-placeholder-img card-img-top" width="100%" height="1"--%>
<%--                             xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail"--%>
<%--                             preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title>--%>
<%--                            &lt;%&ndash;                            <rect width="100%" height="100%" fill="#55595c"/>&ndash;%&gt;--%>
<%--                            <img src="${contextPath}/resources/image/곡물탈곡기.jpg" alt="promo1" width="100%" height="100%">--%>
<%--                        </svg>--%>

<%--                        <div class="card-body">--%>
<%--                            <p class="card-text">This is a wider card with supporting text below as a natural lead-in to--%>
<%--                                additional content. This content is a little bit longer.</p>--%>
<%--                            <div class="d-flex justify-content-between align-items-center">--%>
<%--                                <div class="btn-group">--%>
<%--                                    <button type="button" class="btn btn-sm btn-outline-secondary">View</button>--%>
<%--                                    <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>--%>
<%--                                </div>--%>
<%--                                <small class="text-muted">9 mins</small>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</main>--%>
</body>
</html>