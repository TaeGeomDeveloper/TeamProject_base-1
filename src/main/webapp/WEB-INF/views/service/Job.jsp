<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<html>
<head>
    <title>Main</title>

    <!-- 스타일시트 연결 -->
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <script type="text/javascript"
            src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2c6741a104f1846dfcf89a12bc5b105f"></script>

    <style>
        .carousel-indicators {
            position: relative;
        }

        #Information {
            margin: 20px;
            border-radius: 20px;
        }

        p {
            text-align: left;
        }
    </style>

    <script>
        $(document).ready(function () {
            $("#exampleModal").on('shown.bs.modal', function () {
                var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
                var options = { //지도를 생성할 때 필요한 기본 옵션
                    center: new kakao.maps.LatLng(35.278647, 128.658421), //지도의 중심좌표.
                    level: 3 //지도의 레벨(확대, 축소 정도)
                };

                var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴

                // 마커가 표시될 위치입니다
                var markerPosition = new kakao.maps.LatLng(35.278647, 128.658421);

                // 마커를 생성합니다
                var marker = new kakao.maps.Marker({
                    position: markerPosition
                });

                // 마커가 지도 위에 표시되도록 설정합니다
                marker.setMap(map);

                var iwContent = '<div style="padding:5px;"> 창원 농장 <br><a href="https://map.kakao.com/link/map/Hello World!,33.450701,126.570667" style="color:blue" target="_blank">큰지도보기</a> <a href="https://map.kakao.com/link/to/Hello World!,35.278647,128.658421" style="color:blue" target="_blank">길찾기</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
                    iwPosition = new kakao.maps.LatLng(35.278647, 128.658421); //인포윈도우 표시 위치입니다

                // 인포윈도우를 생성합니다
                var infowindow = new kakao.maps.InfoWindow({
                    position: iwPosition,
                    content: iwContent
                });
                // 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
                infowindow.open(map, marker);
            });
        });
    </script>

</head>
<body>

<%--몸통--%>
<section>
    <article>
        <div id="Main_Box" align="center">
            <img src="${contextPath}/resources/image/Job/알바.jpg" alt="promo1" width="800" height="450">

        </div>

        <div id="carouselExampleDark" class="carousel carousel-dark slide" data-bs-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active">

                    <div style="width: 80%; margin: auto">
                        <div class="row mb-2">
                            <h1>인기 알바</h1>

                            <c:forEach var="i" begin="0" end="3">
                                <div class="col-md-6">
                                    <div class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
                                        <div class="col p-4 d-flex flex-column position-static">
                                            <strong class="d-inline-block mb-2 text-primary">시급</strong>
                                            <h3 class="mb-0">농장 알바 모집</h3>
                                            <div class="mb-1 text-muted">Nov 12</div>
                                            <p class="card-text mb-auto">가족 같은 분위기로 함께일하실분 구함</p>
                                            <!-- Button trigger modal -->
                                            <button type="button" class="btn btn-primary" data-bs-toggle="modal"
                                                    data-bs-target="#exampleModal" style="width: 50%; margin-top: 20px">
                                                상세보기
                                            </button>
                                        </div>
                                        <div class="col-auto d-none d-lg-block">
                                            <img src="${contextPath}/resources/image/Job/알바2.jpg" alt="promo1"
                                                 width="250"
                                                 height="250">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
                                        <div class="col p-4 d-flex flex-column position-static">
                                            <strong class="d-inline-block mb-2 text-success">월급</strong>
                                            <h3 class="mb-0">농장 관리자 구함</h3>
                                            <div class="mb-1 text-muted">Nov 11</div>
                                            <p class="mb-auto">가족 같은 분위기로 함께일하실분 구함.</p>
                                            <!-- Button trigger modal -->
                                            <button type="button" class="btn btn-success" data-bs-toggle="modal"
                                                    data-bs-target="#exampleModal" style="width: 50%">
                                                상세보기
                                            </button>
                                        </div>
                                        <div class="col-auto d-none d-lg-block">

                                            <img src="${contextPath}/resources/image/Job/알바3.jpg" alt="promo1"
                                                 width="250"
                                                 height="250">
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>

                </div>
                <div class="carousel-item">
                    <div style="width: 80%; margin: auto">
                        <div class="row mb-2">
                            <h1>대박 알바</h1>

                            <c:forEach var="i" begin="0" end="3">
                                <div class="col-md-6">
                                    <div class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
                                        <div class="col p-4 d-flex flex-column position-static">
                                            <strong class="d-inline-block mb-2 text-primary">시급</strong>
                                            <h3 class="mb-0">농장 알바 모집</h3>
                                            <div class="mb-1 text-muted">Nov 12</div>
                                            <p class="card-text mb-auto">가족 같은 분위기로 함께일하실분 구함</p>
                                            <!-- Button trigger modal -->
                                            <button type="button" class="btn btn-primary" data-bs-toggle="modal"
                                                    data-bs-target="#exampleModal" style="width: 50%; margin-top: 20px">
                                                상세보기
                                            </button>
                                        </div>
                                        <div class="col-auto d-none d-lg-block">
                                            <img src="${contextPath}/resources/image/Job/알바4.jpg" alt="promo1"
                                                 width="250"
                                                 height="250">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
                                        <div class="col p-4 d-flex flex-column position-static">
                                            <strong class="d-inline-block mb-2 text-success">월급</strong>
                                            <h3 class="mb-0">농장 관리자 구함</h3>
                                            <div class="mb-1 text-muted">Nov 11</div>
                                            <p class="mb-auto">가족 같은 분위기로 함께일하실분 구함.</p>
                                            <!-- Button trigger modal -->
                                            <button type="button" class="btn btn-success" data-bs-toggle="modal"
                                                    data-bs-target="#exampleModal" style="width: 50%">
                                                상세보기
                                            </button>
                                        </div>
                                        <div class="col-auto d-none d-lg-block">

                                            <img src="${contextPath}/resources/image/Job/알바5.jpg" alt="promo1"
                                                 width="250"
                                                 height="250">
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>

                </div>
                <div class="carousel-item">
                    <div style="width: 80%; margin: auto">
                        <div class="row mb-2">
                            <h1>화제의 알바</h1>

                            <c:forEach var="i" begin="0" end="3">
                                <div class="col-md-6">
                                    <div class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
                                        <div class="col p-4 d-flex flex-column position-static">
                                            <strong class="d-inline-block mb-2 text-primary">시급</strong>
                                            <h3 class="mb-0">농장 알바 모집</h3>
                                            <div class="mb-1 text-muted">Nov 12</div>
                                            <p class="card-text mb-auto">가족 같은 분위기로 함께일하실분 구함</p>
                                            <!-- Button trigger modal -->
                                            <button type="button" class="btn btn-primary" data-bs-toggle="modal"
                                                    data-bs-target="#exampleModal" style="width: 50%; margin-top: 20px">
                                                상세보기
                                            </button>
                                        </div>
                                        <div class="col-auto d-none d-lg-block">
                                            <img src="${contextPath}/resources/image/Job/알바6.jpg" alt="promo1"
                                                 width="250"
                                                 height="250">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
                                        <div class="col p-4 d-flex flex-column position-static">
                                            <strong class="d-inline-block mb-2 text-success">월급</strong>
                                            <h3 class="mb-0">농장 관리자 구함</h3>
                                            <div class="mb-1 text-muted">Nov 11</div>
                                            <p class="mb-auto">가족 같은 분위기로 함께일하실분 구함.</p>
                                            <!-- Button trigger modal -->
                                            <button type="button" class="btn btn-success" data-bs-toggle="modal"
                                                    data-bs-target="#exampleModal" style="width: 50%">
                                                상세보기
                                            </button>
                                        </div>
                                        <div class="col-auto d-none d-lg-block">

                                            <img src="${contextPath}/resources/image/Job/알바7.jpg" alt="promo1"
                                                 width="250"
                                                 height="250">
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>

                </div>
                <div class="carousel-item">
                    <div style="width: 80%; margin: auto">
                        <div class="row mb-2">
                            <h1>화제의 알바</h1>

                            <c:forEach var="i" begin="0" end="3">
                                <div class="col-md-6">
                                    <div class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
                                        <div class="col p-4 d-flex flex-column position-static">
                                            <strong class="d-inline-block mb-2 text-primary">시급</strong>
                                            <h3 class="mb-0">농장 알바 모집</h3>
                                            <div class="mb-1 text-muted">Nov 12</div>
                                            <p class="card-text mb-auto">가족 같은 분위기로 함께일하실분 구함</p>
                                            <!-- Button trigger modal -->
                                            <button type="button" class="btn btn-primary" data-bs-toggle="modal"
                                                    data-bs-target="#exampleModal" style="width: 50%; margin-top: 20px">
                                                상세보기
                                            </button>
                                        </div>
                                        <div class="col-auto d-none d-lg-block">
                                            <img src="${contextPath}/resources/image/Job/알바8.jpg" alt="promo1"
                                                 width="250"
                                                 height="250">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
                                        <div class="col p-4 d-flex flex-column position-static">
                                            <strong class="d-inline-block mb-2 text-success">월급</strong>
                                            <h3 class="mb-0">농장 관리자 구함</h3>
                                            <div class="mb-1 text-muted">Nov 11</div>
                                            <p class="mb-auto">가족 같은 분위기로 함께일하실분 구함.</p>
                                            <!-- Button trigger modal -->
                                            <button type="button" class="btn btn-success" data-bs-toggle="modal"
                                                    data-bs-target="#exampleModal" style="width: 50%">
                                                상세보기
                                            </button>
                                        </div>
                                        <div class="col-auto d-none d-lg-block">

                                            <img src="${contextPath}/resources/image/Job/알바9.jpg" alt="promo1"
                                                 width="250"
                                                 height="250">
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>

                </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleDark"
                    data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleDark"
                    data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>

            <div class="carousel-indicators">
                <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="0" class="active"
                        aria-current="true" aria-label="Slide 1"
                        style="height: 30px ;width: 30px; border-radius: 50%"></button>
                <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="1" aria-label="Slide 2"
                        style="height: 30px ;width: 30px; border-radius: 50%"></button>
                <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="2" aria-label="Slide 3"
                        style="height: 30px ;width: 30px; border-radius: 50%"></button>
                <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="3" aria-label="Slide 4"
                        style="height: 30px ;width: 30px; border-radius: 50%"></button>
            </div>
        </div>

    </article>
</section>

<!-- Modal 1 -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog modal-xl">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">스마트 팜</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal"
                        aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div id="Information" style="background: #faeca0">

                    <div class="row featurette">
                        <div class="col-md-7 order-md-2">
                            <div style="margin: 30px">
                                <h1 class="featurette-heading fw-normal lh-1">창원 농장 알바 모집 </h1>
                                <br>
                                <h3 style="margin-top: 30px">정보</h3>
                                <br>
                                <p>시급 1만원</p>
                                <p>날짜 : 월~일 협의</p>
                                <p>시간 : 09:00~23:30</p>
                            </div>

                        </div>
                        <div class="col-md-5 order-md-1">
                            <div style="margin: 16px">
                                <img src="${contextPath}/resources/image/Job/알바모집1.jpg" alt="알바모집1"
                                     width="400"
                                     height="400" style="border-radius: 30px">
                            </div>

                        </div>
                    </div>

                    <hr class="featurette-divider">

                    <div class="text-bg-success me-md-3 pt-3 px-3 pt-md-5 px-md-5 text-center overflow-hidden"
                         style="margin: 16px; padding: 48px; border-radius: 20px">
                        <div class="my-3 py-3">
                            <h2 class="display-5">상세 내용</h2>
                        </div>
                        <div style="height: 500px">
                            <p>20대 중반 ~ 40대 까지 남/여 성별무관</p>
                            <p>약속 잘지키시는분 / 책임감 있으신분!</p>
                            <p>꼼꼼하신분! 손빠르신분 ,면허있으신분 대환영!</p>
                            <br>
                            <p>신입교육 1주후 누구라도 업무 가능하며 </p>
                            <p> 교육일수도 근무일수로  포함됩니다.</p>
                        </div>
                    </div>

                    <hr class="featurette-divider">
                    <h2 style="text-align: center">위치</h2>
                    <p style="margin-left: 10px">경상남도 창원시 의창구 동읍 남산리 398-1 </p>
                    <div id="map" style="width:100%;height:400px;"></div>
                </div>
            </div>

        </div>
    </div>
</div>


</body>
</html>
