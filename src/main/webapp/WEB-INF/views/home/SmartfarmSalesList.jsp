<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"   isELIgnored="false"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

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

</head>
<body>
<%--몸통--%>
<section>
  <article>
    <div id="Main_Box" align="center">
      <h1> 감자 / 고구마 / 옥수수 </h1>
      <img src="${contextPath}/resources/image/Mix1.jpg" alt="promo1" width="1000" height="500">
    </div>
  </article>
</section>

<main class="main">
  <div class="album py-5 bg-light">
    <div class="container">

      <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">

        <div class="col">
          <div class="card shadow-sm">
            <svg class="bd-placeholder-img card-img-top" width="100%" height="1"
                 xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail"
                 preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title>
<%--              <rect width="100%" height="100%" fill="#55595c"/>--%>
              <img src="${contextPath}/resources/image/potato3.jpg" alt="promo1" width="100%" height="100%">
              <%--                            <text x="50%" y="50%" fill="#eceeef" dy=".3em" al>Thumbnail</text>--%>
            </svg>

            <div class="card-body">
              <p class="card-text">This is a wider card with supporting text below as a natural lead-in to
                additional content. This content is a little bit longer.</p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
                  <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
                </div>
                <small class="text-muted">9 mins</small>
              </div>
            </div>
          </div>
        </div>

        <div class="col">
          <div class="card shadow-sm">
            <svg class="bd-placeholder-img card-img-top" width="100%" height="1"
                 xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail"
                 preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title>
<%--              <rect width="100%" height="100%" fill="#55595c"/>--%>
              <img src="${contextPath}/resources/image/potato2.jpg" alt="promo1" width="100%" height="100%">
            </svg>

            <div class="card-body">
              <p class="card-text">This is a wider card with supporting text below as a natural lead-in to
                additional content. This content is a little bit longer.</p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
                  <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
                </div>
                <small class="text-muted">9 mins</small>
              </div>
            </div>
          </div>
        </div>


        <div class="col">
          <div class="card shadow-sm">
            <svg class="bd-placeholder-img card-img-top" width="100%" height="1"
                 xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail"
                 preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title>
<%--              <rect width="100%" height="100%" fill="#55595c"/>--%>
              <img src="${contextPath}/resources/image/sweetpotato1.jpg" alt="promo1" width="100%" height="100%">
            </svg>

            <div class="card-body">
              <p class="card-text">This is a wider card with supporting text below as a natural lead-in to
                additional content. This content is a little bit longer.</p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
                  <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
                </div>
                <small class="text-muted">9 mins</small>
              </div>
            </div>
          </div>
        </div>

        <div class="col">
          <div class="card shadow-sm">
            <svg class="bd-placeholder-img card-img-top" width="100%" height="1"
                 xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail"
                 preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title>
              <%--              <rect width="100%" height="100%" fill="#55595c"/>--%>
              <img src="${contextPath}/resources/image/sweetpotato2.jpg" alt="promo1" width="100%" height="100%">
            </svg>

            <div class="card-body">
              <p class="card-text">This is a wider card with supporting text below as a natural lead-in to
                additional content. This content is a little bit longer.</p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
                  <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
                </div>
                <small class="text-muted">9 mins</small>
              </div>
            </div>
          </div>
        </div>

        <div class="col">
          <div class="card shadow-sm">
            <svg class="bd-placeholder-img card-img-top" width="100%" height="1"
                 xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail"
                 preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title>
              <%--              <rect width="100%" height="100%" fill="#55595c"/>--%>
              <img src="${contextPath}/resources/image/과일/옥수수1.jpg" alt="promo1" width="100%" height="100%">
            </svg>

            <div class="card-body">
              <p class="card-text">This is a wider card with supporting text below as a natural lead-in to
                additional content. This content is a little bit longer.</p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
                  <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
                </div>
                <small class="text-muted">9 mins</small>
              </div>
            </div>
          </div>
        </div>

        <div class="col">
          <div class="card shadow-sm">
            <svg class="bd-placeholder-img card-img-top" width="100%" height="1"
                 xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail"
                 preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title>
              <%--              <rect width="100%" height="100%" fill="#55595c"/>--%>
              <img src="${contextPath}/resources/image/옥수수2.jpg" alt="promo1" width="100%" height="100%">
            </svg>

            <div class="card-body">
              <p class="card-text">This is a wider card with supporting text below as a natural lead-in to
                additional content. This content is a little bit longer.</p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
                  <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
                </div>
                <small class="text-muted">9 mins</small>
              </div>
            </div>
          </div>
        </div>

      </div>

    </div>
  </div>
</main>
</body>
</html>