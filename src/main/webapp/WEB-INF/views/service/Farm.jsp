<%@ page import="com.tp.farm.vo.FarmlandPriceVO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<html>
<head>
    <title>Farm</title>

    <!-- 스타일시트 & 스크립트 연결 -->
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <link rel="stylesheet" href="${contextPath}/resources/CSS/Farm.css" type="text/css"/>

    <%-- 차트 --%>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

    <script src="${contextPath}/resources/JSON/Farm2.json"></script>
    <script src="${contextPath}/resources/JS/Farm.js"></script>

    <style>
        .WForm {
            font-size: 24px;
            margin-bottom: 6px;
        }

        .h2_selector {
            margin-top: 60px;
        }
    </style>

<%--    <script>--%>
<%--        $(document).ready(function() {--%>
<%--            $("#flip").on('click', function (event) {--%>

<%--                let msi_id = $("#msi_id").val();--%>
<%--                let msi_memberName = $("#msi_memberName").val();--%>
<%--                let msi_memberAge = $("#msi_memberAge").val();--%>
<%--                let msi_memberGender = $("#msi_memberGender").val();--%>
<%--                let msi_desiredArea = $("#msi_desiredArea").val();--%>
<%--                let msi_desiredTimeSowing = $("#msi_desiredTimeSowing").val();--%>
<%--                let msi_desiredTimeSowingPart = $('input:radio[name=msi_desiredTimeSowingPart]:checked').val();--%>
<%--                let msi_desiredHarvestTime = $("#msi_desiredHarvestTime").val();--%>
<%--                let msi_desiredHarvestTimePart = $('input:radio[name=msi_desiredHarvestTimePart]:checked').val();--%>
<%--                let msi_cropClassification = $("#msi_cropClassification").val();--%>
<%--                let msi_cultivationMethod = $("#msi_cultivationMethod").val();--%>
<%--                let msi_farmingExperience = $("#msi_farmingExperience").val();--%>
<%--                let msi_hadMachinery = $("#msi_hadMachinery").val();--%>
<%--                let msi_capital = $("#msi_capital").val();--%>
<%--                let msi_holdingLand = $("#msi_holdingLand").val();--%>

<%--                console.log(msi_id);--%>
<%--                console.log(msi_memberName);--%>
<%--                console.log(msi_memberAge);--%>
<%--                console.log(msi_memberGender);--%>
<%--                console.log(msi_desiredArea);--%>
<%--                console.log(msi_desiredTimeSowing);--%>
<%--                console.log(msi_desiredTimeSowingPart);--%>
<%--                console.log(msi_desiredHarvestTime);--%>
<%--                console.log(msi_desiredHarvestTimePart);--%>
<%--                console.log(msi_cropClassification);--%>
<%--                console.log(msi_cultivationMethod);--%>
<%--                console.log(msi_farmingExperience);--%>
<%--                console.log(msi_hadMachinery);--%>
<%--                console.log(msi_capital);--%>
<%--                console.log(msi_holdingLand);--%>



<%--                // let param = {--%>
<%--                //     "msi_id":msi_id,--%>
<%--                //     "msi_memberName":msi_memberName,--%>
<%--                //     "msi_memberGender":msi_memberGender,--%>
<%--                //     "msi_memberAge":msi_memberAge,--%>
<%--                //     "msi_desiredArea":msi_desiredArea,--%>
<%--                //     "msi_desiredTimeSowing":msi_desiredTimeSowing,--%>
<%--                //     "msi_desiredTimeSowingPart":msi_desiredTimeSowingPart,--%>
<%--                //     "msi_desiredHarvestTime":msi_desiredHarvestTime,--%>
<%--                //     "msi_desiredHarvestTimePart":msi_desiredHarvestTimePart,--%>
<%--                //     "msi_cropClassification":msi_cropClassification,--%>
<%--                //     "msi_cultivationMethod":msi_cultivationMethod,--%>
<%--                //     "msi_farmingExperience":msi_farmingExperience,--%>
<%--                //     "msi_hadMachinery":msi_hadMachinery,--%>
<%--                //     "msi_capital":msi_capital,--%>
<%--                //     "msi_holdingLand":msi_holdingLand,--%>
<%--                // }--%>

<%--               $.ajax({--%>
<%--                   type: 'POST',--%>
<%--                   url: "${contextPath}/service/FarmProcess.do",--%>
<%--                   contentType: "application/json; charset=UTF-8",--%>
<%--                   dataType: "json",--%>
<%--                   data: {--%>
<%--                       msi_id:msi_id,--%>
<%--                       msi_memberName:msi_memberName,--%>
<%--                       msi_memberGender:msi_memberGender,--%>
<%--                       msi_memberAge:msi_memberAge,--%>
<%--                       msi_desiredArea:msi_desiredArea,--%>
<%--                       msi_desiredTimeSowing:msi_desiredTimeSowing,--%>
<%--                       msi_desiredTimeSowingPart:msi_desiredTimeSowingPart,--%>
<%--                       msi_desiredHarvestTime:msi_desiredHarvestTime,--%>
<%--                       msi_desiredHarvestTimePart:msi_desiredHarvestTimePart,--%>
<%--                       msi_cropClassification:msi_cropClassification,--%>
<%--                       msi_cultivationMethod:msi_cultivationMethod,--%>
<%--                       msi_farmingExperience:msi_farmingExperience,--%>
<%--                       msi_hadMachinery:msi_hadMachinery,--%>
<%--                       msi_capital:msi_capital,--%>
<%--                       msi_holdingLand:msi_holdingLand,--%>
<%--                   },--%>
<%--                   success: function (data,status){--%>
<%--                        alert("성공!");--%>
<%--                       $("#window").slideDown("slow");--%>
<%--                   },--%>
<%--                   error : function(data,status){--%>
<%--                       // 실패시--%>
<%--                       alert(data + status);--%>
<%--                   }--%>
<%--               }) ;--%>
<%--            });--%>
<%--        });--%>
<%--    </script>--%>

    <script>
        function recommendCrop(){
            const FarmInfo = document.FarmInfo;
            FarmInfo.action = "./FarmProcess.do";
            FarmInfo.method = "POST";
            FarmInfo.submit();
            $("#window").slideDown("slow");
        }
    </script>

    <script>
        $("document").ready(function () {
            var area0 = [
                "도 선택",
                "강원도",
                "경기도",
                "충청남도",
                "충청북도",
                "경상남도",
                "경상북도",
                "전라남도",
                "전라북도",
            ];
            var area1 = [
                "춘천시",
                "원주시",
                "강릉시",
                "동해시",
                "태백시",
                "속초시",
                "삼척시",
                "홍천시",
                "횡성시",
                "영월시",
                "평창시",
                "정선시",
                "철원시",
                "화천시",
                "양구시",
                "인제시",
                "고성시",
                "양양시",
            ];
            var area2 = [
                "수원시",
                "안양시",
                "안산시",
                "용인시",
                "부천시",
                "광명시",
                "평택시",
                "과천시",
                "오산시",
                "시흥시",
                "군포시",
                "의왕시",
                "하남시",
                "이천시",
                "안성시",
                "김포시",
                "화성시",
                "광주시",
                "여주시",
                "양평시",
                "고양시",
                "의정부",
                "동두천",
                "구리시",
                "남양주시",
                "파주시",
                "양주시",
                "포천시",
                "연천시",
                "가평시",
            ];
            var area3 = [
                "천안시",
                "공주시",
                "보령시",
                "아산시",
                "서산시",
                "논산시",
                "계룡시",
                "당진시",
                "금산군",
                "부여군",
                "서천군",
                "청양군",
                "홍성군",
                "예산군",
                "태안군",
            ];
            var area4 = [
                "청주시",
                "충주시",
                "제천시",
                "보은군",
                "옥천군",
                "영동군",
                "증평군",
                "진천군",
                "괴산군",
                "음성군",
                "단양군",
            ];
            var area5 = [
                "창원시",
                "진주시",
                "통영시",
                "사천시",
                "김해시",
                "밀양시",
                "거제시",
                "양산시",
                "의령군",
                "함안군",
                "창녕군",
                "고성군",
                "남해군",
                "하동군",
                "산청군",
                "함양군",
                "거창군",
                "합천군",
            ];
            var area6 = [
                "포항시",
                "경주시",
                "김천시",
                "안동시",
                "구미시",
                "영주시",
                "영천시",
                "상주시",
                "문경시",
                "경산시",
                "군위군",
                "의성군",
                "청송군",
                "영양군",
                "영덕군",
                "청도군",
                "고령군",
                "성주군",
                "칠곡군",
                "예천군",
                "봉화군",
                "울진군",
                "울릉군",
            ];
            var area7 = [
                "목포시",
                "여수시",
                "순천시",
                "나주시",
                "광양시",
                "담양군",
                "곡성군",
                "구례군",
                "고흥군",
                "보성군",
                "화순군",
                "장흥군",
                "강진군",
                "해남군",
                "영암군",
                "무안군",
                "함평군",
                "영광군",
                "장성군",
                "완도군",
                "진도군",
                "신안군",
            ];
            var area8 = [
                "전주시",
                "군산시",
                "익산시",
                "정읍시",
                "남원시",
                "김제시",
                "완주군",
                "진안군",
                "무주군",
                "장수군",
                "임실군",
                "순창군",
                "고창군",
                "부안군",
            ];

            // 시/도 선택 박스 초기화

            $("select[name^=msi_desiredArea]").each(function () {
                $msi_desiredArea = $(this);
                $.each(eval(area0), function () {
                    $msi_desiredArea.append(
                        "<option value='" + this + "'>" + this + "</option>"
                    );
                });
                $msi_desiredArea.next().append("<option value=''>시 선택</option>");
            });

            // 시/도 선택시 구/군 설정

            $("select[name^=msi_desiredArea]").change(function () {
                var area =
                    "area" + $("option", $(this)).index($("option:selected", $(this))); // 선택지역의 구군 Array
                var $msi_desiredAreaDetail = $(this).next(); // 선택영역 군구 객체
                $("option", $msi_desiredAreaDetail).remove(); // 구군 초기화

                if (area == "area0")
                    $msi_desiredAreaDetail.append("<option value=''>시 선택</option>");
                else {
                    $.each(eval(area), function () {
                        $msi_desiredAreaDetail.append(
                            "<option value='" + this + "'>" + this + "</option>"
                        );
                    });
                }
            });
        });
    </script>

</head>
<body>

<%--몸통--%>
<section>
    <article>
        <main>

            <div class="p-5 mb-4 rounded-3">
                <div class="container-fluid py-0">
                    <h1 class="display-5 fw-bold">작물 선택</h1>
                    <p class="col-md-8 fs-4"><br/>
                        자신의 여건과 적성, 기술수준, 자본능력 등에 적합한 작물을 신중하게 선택해야 합니다.<br/>
                        지역 환경 고려 하고 지역 특산물을 우선 하는게 좋습니다.<br/>
                    </p>

<%--작물 선택--%>
                    <form id="FarmForm" name="FarmInfo" style="padding: 20px; border-radius: 25px; margin-bottom: 20px; margin-top: 50px; background: #f7f7cb">
                        <h2>회원 정보입력 (필수)</h2>
                        <hr class="featurette-divider" style="border-top: 8px solid">
                        <div class="d-flex justify-content-center">
                            <div style="width: 25%; padding: 20px">
                                <input type="hidden" value="${user.mi_id}" name="msi_id" id="msi_id">
                                <p class="WForm">이름</p>
                                <input class="form-control form-control" type="text" value="${user.mi_name}" name="msi_memberName" id="msi_memberName" readonly>
                            </div>
                            <div style="width: 25%; padding: 20px">
                                <p class="WForm">나이</p>
                                <input class="form-control form-control" type="text" placeholder="나이" name="msi_memberAge" id="msi_memberAge">
                            </div>
                            <div style="width: 25%; padding: 20px">
                                <p class="WForm">성별</p>
                                <select class="form-select form-select mb-3" name="msi_memberGender" id="msi_memberGender">
                                    <option selected value="남자">남자</option>
                                    <option value="여자">여자</option>
                                </select>
                            </div>
                        </div>
                        <hr class="featurette-divider">
                        <h2 class="h2_selector">귀농 희망지역 및 수확시기 (필수)</h2>
                        <hr class="featurette-divider" style="border-top: 8px solid">
                        <div class="d-flex justify-content-center">
                            <div style="width: 25%; padding: 20px">
                                <p class="WForm">귀농 희망지역(도/시)</p>
                                <select class="form-select form-select mb-3" name="msi_desiredArea" id="msi_desiredArea"></select>
                                <select class="form-select form-select mb-3" name="msi_desiredAreaDetail" id="msi_desiredAreaDetail"></select>
                            </div>
                            <div style="width: 25%; padding: 20px">
                                <p class="WForm">파종시기</p>
                                <select class="form-select form-select mb-3" name="msi_desiredTimeSowing" id="msi_desiredTimeSowing">
                                    <option selected value="1">1월</option>
                                    <option value="2">2월</option>
                                    <option value="3">3월</option>
                                    <option value="4">4월</option>
                                    <option value="5">5월</option>
                                    <option value="6">6월</option>
                                    <option value="7">7월</option>
                                    <option value="8">8월</option>
                                    <option value="9">9월</option>
                                    <option value="10">10월</option>
                                    <option value="11">11월</option>
                                    <option value="12">12월</option>
                                </select>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="msi_desiredTimeSowingPart" id="inlineRadio1" value="상">
                                    <label class="form-check-label" for="inlineRadio1">상</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="msi_desiredTimeSowingPart" id="inlineRadio2" value="중">
                                    <label class="form-check-label" for="inlineRadio2">중</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="msi_desiredTimeSowingPart" id="inlineRadio3" value="하">
                                    <label class="form-check-label" for="inlineRadio3">하</label>
                                </div>
                            </div>
                            <div style="width: 25%; padding: 20px">
                                <p class="WForm">수학 시기</p>
                                <select class="form-select form-select mb-3" name="msi_desiredHarvestTime" id="msi_desiredHarvestTime">
                                    <option selected value="1월">1월</option>
                                    <option value="2">2월</option>
                                    <option value="3">3월</option>
                                    <option value="4">4월</option>
                                    <option value="5">5월</option>
                                    <option value="6">6월</option>
                                    <option value="7">7월</option>
                                    <option value="8">8월</option>
                                    <option value="9">9월</option>
                                    <option value="10">10월</option>
                                    <option value="11">11월</option>
                                    <option value="12">12월</option>
                                </select>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="msi_desiredHarvestTimePart" id="inlineRadio4" value="상">
                                    <label class="form-check-label" for="inlineRadio4">상</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="msi_desiredHarvestTimePart" id="inlineRadio5" value="중">
                                    <label class="form-check-label" for="inlineRadio5">중</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="msi_desiredHarvestTimePart" id="inlineRadio6" value="하">
                                    <label class="form-check-label" for="inlineRadio6">하</label>
                                </div>
                            </div>
                        </div>
                        <hr class="featurette-divider">
                        <h2 class="h2_selector">고려사항 (선택)</h2>
                        <hr class="featurette-divider" style="border-top: 8px solid">
                        <div class="d-flex justify-content-center">
                            <div style="width: 25%; padding: 20px">
                                <p class="WForm">작물분류</p>
                                <select class="form-select form-select mb-3" name="msi_cropClassification" id="msi_cropClassification">
                                    <option selected value="전체">전체</option>
                                    <option value="과일">과일</option>
                                    <option value="채소">채소</option>
                                </select>
                            </div>
                            <div style="width: 25%; padding: 20px">
                                <p class="WForm">재배 방법</p>
                                <select class="form-select form-select mb-3" aria-label=".form-select-lg example" name="msi_cultivationMethod" id="msi_cultivationMethod">
                                    <option selected value="둘다">둘다</option>
                                    <option value="노지">노지</option>
                                    <option value="비닐하우스">비닐하우스</option>
                                </select>
                            </div>
                            <div style="width: 25%; padding: 20px">
                                <p class="WForm">농사 경험 유무</p>
                                <select class="form-select form-select mb-3" name="msi_farmingExperience" id="msi_farmingExperience">
                                    <option selected value="없음">없음</option>
                                    <option value="3개월">3개월 이상</option>
                                    <option value="6개월">6개월 이상</option>
                                    <option value="1년이상">1년 이상</option>
                                    <option value="3년이상">3년 이상</option>
                                </select>
                            </div>
                        </div>
                        <div class="d-flex justify-content-center">
                            <div style="width: 25%; padding: 20px">
                                <p class="WForm">농기계 및 설비 유무</p>
                                <select class="form-select form-select mb-3" name="msi_hadMachinery" id="msi_hadMachinery">
                                    <option selected value="N">없음</option>
                                    <option value="Y">충분</option>
                                </select>
                            </div>
                            <div style="width: 25%; padding: 20px">
                                <p class="WForm">자본금</p>
                                <input class="form-control form-control" type="text" placeholder="자본금" name="msi_capital" id="msi_capital" >
                            </div>
                            <div style="width: 25%; padding: 20px">
                                <p class="WForm">토지크기 (ha)</p>
                                <input class="form-control form-control" type="text" placeholder="토지크기" name="msi_holdingLand" id="msi_holdingLand">
                            </div>
                        </div>
                        <hr class="featurette-divider">
                        <div align="center">
                            <button class="btn btn-primary btn-lg" type="button" id="flip" style="margin: auto" onclick="recommendCrop()">작물 확인
                            </button>
                        </div>
                    </form>

                </div>
            </div>

<%-- 작물 정보 리스트 출력 --%>
            <div id="window" style="display: none">
                <div id="Main_Box" align="center">
                    <div class="align-self-center" style="margin-bottom: 30px">
                        <c:forEach var="i" begin="0" end="12">
                            <!-- Button trigger modal -->
                            <button id="Fbtn" onclick="fn_click(${i})" data-bs-toggle="modal"
                                    data-bs-target="#exampleModal">
                                <img src="${contextPath}/resources/image/과일채소/${i+1}.jpg" alt="과일채소${i+1}" width="100"
                                     height="100" class="rounded-circle">
                            </button>
                        </c:forEach>
                    </div>

<!-- Modal -->
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
                                    <div id="Information" style="background: #ffaa00">

                                        <div style="margin-top: 20px; padding: 10px">
                                            <button type="button" class="btn btn-outline-primary" id="menu1">기본 정보
                                            </button>
                                            <button type="button" class="btn btn-outline-success" id="menu2">재배 기술
                                            </button>
                                            <button type="button" class="btn btn-outline-secondary" id="menu3">시세 정보
                                            </button>
                                            <button type="button" class="btn btn-outline-danger" id="menu4">동영상
                                            </button>
                                            <button type="button" class="btn btn-outline-dark" id="menu5"> 갤러리
                                            </button>
                                        </div>

                                        <!-- START THE FEATURETTES -->
                                        <hr class="featurette-divider">

                                        <div id="Info_menu1" style="display: none">
                                            <h1> 과일 정보 </h1>
                                            <div class="row featurette">
                                                <div class="col-md-7">
                                                    <h2 class="featurette-heading fw-normal lh-1" id="Fruit_Title"> 제목
                                                        A </h2>
                                                    <p class="lead" id="SmallInfo" style="color: #f0f0f0"> 부가 설명
                                                        입니다. </p>
                                                    <div class="InfoBox">
                                                        <p id="content1" style="width: 80%;"></p>
                                                    </div>
                                                </div>
                                                <div class="col-md-5">
                                                    <div id="FruitPic"></div>
                                                </div>
                                            </div>

                                            <hr class="featurette-divider">
                                            <h1> 종류 </h1>
                                            <div id="carouselExampleControls" class="carousel slide"
                                                 data-bs-ride="carousel">

                                                <div class="carousel-inner">
                                                    <div class="carousel-item">
                                                        <svg class="bd-placeholder-img bd-placeholder-img-lg d-block w-100"
                                                             width="800"
                                                             height="400" xmlns="http://www.w3.org/2000/svg" role="img"
                                                             aria-label="Placeholder: First slide"
                                                             preserveAspectRatio="xMidYMid slice"
                                                             focusable="false"><title>Placeholder</title>

                                                            <rect width="100%" height="100%" fill="#ffaa00"></rect>
                                                        </svg>
                                                        <div class="carousel-caption text-start">

                                                            <h1>동양계자두(P.salicina)</h1>
                                                            <p>동양자두의 대표적인 품종은 과피가 빨갛고 과육이 노란색인 것과 껍질이 녹색이고 과육이 새빨간 것이
                                                                있다. 모든 품종이 과즙이 많으며 새콤달콤하므로 날것으로 먹기에 적합하다.</p>
                                                            <p><a class="btn btn-lg btn-primary" href="#">상세보기</a></p>
                                                        </div>

                                                    </div>

                                                    <div class="carousel-item active">
                                                        <svg class="bd-placeholder-img bd-placeholder-img-lg d-block w-100"
                                                             width="800"
                                                             height="400" xmlns="http://www.w3.org/2000/svg" role="img"
                                                             aria-label="Placeholder: Second slide"
                                                             preserveAspectRatio="xMidYMid slice"
                                                             focusable="false"><title>Placeholder</title>

                                                            <rect width="100%" height="100%" fill="#ffaa00"></rect>
                                                        </svg>

                                                        <div class="carousel-caption text-start">

                                                            <h1>유럽계자두(P.domestica)</h1>
                                                            <p>서양자두는 풍만한 타원형이나 계란형이 많으며 껍질은 보라색이 많다. 과육은 보통 노란색이며 향기가
                                                                좋다. 신맛이 강해서 날것으로 먹는 것 보다는 말리거나, 잼. 젤리. 통조림 등으로 가공된다.
                                                                서양자두 중에서 가장 향기가 좋고 프랑스에서 파이와 같은 과자 재료로 사용되는 품종에 미라벨이라고
                                                                하는 품종이 있다. 이것은 매실보다는 조금 작고 노란색으로 표피가 거의 투명하다.
                                                            </p>
                                                            <p><a class="btn btn-lg btn-primary" href="#">상세보기</a></p>
                                                        </div>

                                                    </div>

                                                    <div class="carousel-item">
                                                        <svg class="bd-placeholder-img bd-placeholder-img-lg d-block w-100"
                                                             width="800"
                                                             height="400" xmlns="http://www.w3.org/2000/svg" role="img"
                                                             aria-label="Placeholder: third slide"
                                                             preserveAspectRatio="xMidYMid slice"
                                                             focusable="false"><title>Placeholder</title>

                                                            <rect width="100%" height="100%" fill="#ffaa00"></rect>
                                                        </svg>

                                                        <div class="carousel-caption text-start">

                                                            <h1>미국자두(P.americana)</h1>
                                                            <p>미국자두는 껍질이 빨갛거나 오렌지색으로 과육은 노랗고 즙이 많으며 신맛이 강하다.</p>
                                                            <p><a class="btn btn-lg btn-primary" href="#">상세보기</a></p>
                                                        </div>
                                                    </div>
                                                </div>

                                                <%-- 버튼 --%>
                                                <button class="carousel-control-prev" type="button"
                                                        data-bs-target="#carouselExampleControls" data-bs-slide="prev">
                                                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                                    <span class="visually-hidden">Previous</span>
                                                </button>
                                                <button class="carousel-control-next" type="button"
                                                        data-bs-target="#carouselExampleControls" data-bs-slide="next">
                                                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                                    <span class="visually-hidden">Next</span>
                                                </button>
                                            </div>

                                            <hr class="featurette-divider">
                                            <h1> 품종 </h1>

                                            <div class="d-flex justify-content-center" style="width: 90%">
                                                <div class="card">
                                                    <img width="200" height="200"
                                                         src="http://atis.rda.go.kr/rdais/commonModule/fileDownloadToApp.vw?file_name=%2Fatis%2Fspciesoutput%2Fspcies%2F20181217%2F%EC%9B%90%EA%B5%90%EB%A7%88-22%ED%98%B8.jpg"
                                                         alt="젤리하트(Jelly Heart)">
                                                    <div class="card-body">
                                                        <h5 class="card-title">Card 제목</h5>
                                                        <p class="card-text">내용.</p>
                                                    </div>
                                                </div>
                                                <div class="card">
                                                    <img width="200" height="200"
                                                         src="http://atis.rda.go.kr/rdais/commonModule/fileDownloadToApp.vw?file_name=%2Fatis%2Fspciesoutput%2Fspcies%2F20170113%2F20160804_141709_004.jpg"
                                                         alt="썸머스타(Summer Star)">
                                                    <div class="card-body">
                                                        <h5 class="card-title">Card 제목</h5>
                                                        <p class="card-text">내용.</p>
                                                    </div>
                                                </div>
                                                <div class="card">
                                                    <img width="200" height="200"
                                                         src="http://atis.rda.go.kr/rdais/commonModule/fileDownloadToApp.vw?file_name=%2Fatis%2Fspciesoutput%2Fspcies%2F20180723%2F%EC%9E%90%EB%91%90-%EC%8D%A8%EB%8B%88%ED%80%B81.jpg"
                                                         alt="써니퀸(Sunny Queen)">
                                                    <div class="card-body">
                                                        <h5 class="card-title">Card 제목</h5>
                                                        <p class="card-text">내용.</p>
                                                    </div>
                                                </div>
                                                <div class="card">
                                                    <img width="200" height="200"
                                                         src="http://atis.rda.go.kr/rdais/commonModule/fileDownloadToApp.vw?file_name=%2Fatis%2Ftctspciesinfo%2F97046.jpg"
                                                         alt="플럼코트 심포니(원교사-08호">
                                                    <div class="card-body">
                                                        <h5 class="card-title">Card 제목</h5>
                                                        <p class="card-text">내용.</p>
                                                    </div>
                                                </div>
                                                <div class="card">
                                                    <img width="200" height="200"
                                                         src="http://atis.rda.go.kr/rdais/commonModule/fileDownloadToApp.vw?file_name=%2Fatis%2Ftctspciesinfo%2F97031.jpg"
                                                         alt="썸머 판타지아(원교마-07호)">
                                                    <div class="card-body">
                                                        <h5 class="card-title">Card 제목</h5>
                                                        <p class="card-text">내용.</p>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>

                                        <div id="Info_menu2" style="display: none">
                                            <h1> 농업기술 길잡이 </h1>
                                            <div class="row featurette">
                                                <div class="col-md-7 order-md-2">
                                                    <h2 class="featurette-heading fw-normal lh-1" id="Fruit_Title2"> 제목
                                                        B </h2>
                                                    <p class="lead" id="content2"> 부가 설명 입니다. </p>
                                                    <div class="InfoBox">
                                                        <div id="level"></div>
                                                    </div>
                                                </div>
                                                <div class="col-md-5 order-md-1">
                                                    <div id="FruitPic2" onclick="PDF_popup()"></div>
                                                </div>
                                            </div>

                                            <hr class="featurette-divider">
                                            <h1> 최신 영농활용 기술 </h1>
                                            <div class="d-flex justify-content-center"
                                                 style="width: 80%; height: 300px; text-align: center; overflow: auto">
                                                <table class="table table-striped table-hover"
                                                       style="margin-top: 10px; background: #f0f0f0">
                                                    <thead>
                                                    <tr class="table-success">
                                                        <th scope="col" style="width: 5%">번호</th>
                                                        <th scope="col" style="width: 60%">제목</th>
                                                        <th scope="col" style="width: 10%">작성자</th>
                                                        <th scope="col" style="width: 15%">등록일</th>
                                                        <th scope="col" style="width: 10%">조회수</th>
                                                    </tr>
                                                    </thead>
                                                    <tbody class="table-group-divider">
                                                    <c:forEach var="i" begin="1" end="15">
                                                        <tr>
                                                            <th scope="row">${i}</th>
                                                            <td>제목 ${i}</td>
                                                            <td>작성자 ${i}</td>
                                                            <td>2022.10.24</td>
                                                            <td>100</td>
                                                        </tr>
                                                    </c:forEach>
                                                    </tbody>
                                                </table>
                                            </div>

                                        </div>

                                        <div id="Info_menu3" style="display: none">
                                            <h1> 과일 시세 </h1>
                                            <div class="row featurette">
                                                <div class="col-md-7">
                                                    <h2 class="featurette-heading fw-normal lh-1"> 제목 C </h2>
                                                    <p class="lead"> 부가 설명 입니다. </p>
                                                    <div class="InfoBox">
                                                        <div id="content3"></div>
                                                    </div>

                                                </div>
                                                <div class="col-md-5">
                                                </div>
                                            </div>
                                            <hr class="featurette-divider">
                                            <h1> 최신 시세 현황 </h1>
                                            <hr class="featurette-divider">
                                            <h1> 거래량 </h1>
                                            <div id="myChart" style="width:100%; max-width:600px; height:500px;"></div>
                                        </div>

                                        <div id="Info_menu4" style="display: none">
                                            <h1> 동영상 </h1>
                                            <div class="d-flex p-2">
                                                <video width="50%" height="30%" controls>
                                                    <source src="${contextPath}/resources/Video/자두/자두재배.mp4"
                                                            type="video/mp4">
                                                    Your browser does not support the video tag.
                                                </video>
                                                <div>
                                                    <h2>새콤달콤 자두 재배하기</h2>
                                                    <p style="width: 80%">
                                                        자두는 6~7월에 복숭아보다 조금 일찍 생산된다. 마땅한 다른 과일이 없는 시기에 생산되어 입맛을 돋게 하는
                                                        과일이다.
                                                        자두의 재배면적이 증가하고 있지만 수분수에 대한 인식이 낮아 결실이 불안정한 문제점이 있다.
                                                        자두 품종에 대한 특성을 알아보고 결실관리기술에 대해 자세히 소개한다.
                                                    </p>
                                                </div>
                                            </div>
                                            <hr class="featurette-divider">
                                            <div class="d-flex p-2">
                                                <video width="50%" height="30%" controls>
                                                    <source src="${contextPath}/resources/Video/자두/품종과재배기술.mp4"
                                                            type="video/mp4">
                                                    Your browser does not support the video tag.
                                                </video>
                                                <div>
                                                    <h2>자두의 주요품종과 재배기술</h2>
                                                    <p style="width: 80%">
                                                        자두의 재배면적이 증가하고 있지만 수분수에 대한 인식이 낮아 결실이 불안정한 문제점이 있다.
                                                        자두 품종에 대한 특성을 알아보고 수분수의 식재, 토양관리, 적과 및 낙과방지 등 재배기술에 대해 자세히 소개한다.
                                                    </p>
                                                </div>
                                            </div>
                                        </div>

                                        <div id="Info_menu5" style="display: none">
                                            <h1> 갤러리 </h1>
                                        </div>

                                        <!-- /END THE FEATURETTES -->
                                        <hr class="featurette-divider">
                                        <div style="width: 90%">
                                            <div class="form-floating">
                                                <h1>운영 팁</h1>
                                                <div class="d-flex">
                                                    <div class="p-2 w-100">
                                    <textarea class="form-control" placeholder="Leave a comment here"
                                              id="floatingTextarea2" style="height: 100px"></textarea>
                                                        <%--                                    <label for="floatingTextarea2">Comments</label>--%>
                                                    </div>
                                                    <div class="p-2 flex-shrink-0">
                                                        <button class="button2">등록</button>
                                                    </div>
                                                </div>
                                            </div>
                                            <div style="padding: 10px">
                                                <table class="table table-sm" style="padding: 10px">
                                                    <c:forEach var="i" begin="0" end="5">
                                                        <tr class="table-secondary">
                                                            <td class="table-secondary" style="height: 100px">
                                                                댓글 입니다.
                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                </table>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <%--                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>--%>
                                <%--                                    <button type="button" class="btn btn-primary">Save changes</button>--%>
                            </div>
                        </div>
                    </div>
                </div>


<%--                <div id="Main_Box2" align="center" style="margin-bottom: 30px">--%>
<%--                    <div class="d-flex justify-content-center" style="margin-bottom: 30px; margin-top: 30px">--%>
<%--                        <c:forEach var="i" begin="0" end="5">--%>
<%--                            <button id="Fbtn" onclick="fn_clcik2(${i})">--%>
<%--                                <img src="${contextPath}/resources/image/채소/채소${i+1}.jpg" alt="과일${i+1}" width="100"--%>
<%--                                     height="100" class="rounded-circle">--%>
<%--                            </button>--%>
<%--                        </c:forEach>--%>
<%--                    </div>--%>
<%--                </div>--%>

            </div>

            <div class="b-example-divider"></div>

        </main>
    </article>
</section>

</body>
</html>
