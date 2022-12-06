<%@ page import="com.tp.farm.vo.FarmlandPriceVO" %>
<%@ page import="com.tp.farm.vo.CropDataVO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
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

    <style>
        #FV {
            width: 100px;
            height: 100px;
            border-radius: 50%;
        }
    </style>

    <script>
        function FVResult_Click() {
            var FVResult = document.FVResult;

            FVResult.method = "post";
            FVResult.action = "FarmResult.do";
            FVResult.submit();
        }
    </script>

    <script type="text/javascript">
        $(document).ready(function () {


            $("input").change(function () {
                let mpf_averagePrice = $("#mpf_averagePrice").val();
                let cd_operatingCost = $("#cd_operatingCost").val();
                let cd_income = $("#cd_income").val();
                let mso_holdingLand = $("#mso_holdingLand").val();
                let result1 = mpf_averagePrice * mso_holdingLand;
                let result2 = cd_operatingCost * mso_holdingLand;
                let result3 = cd_income * mso_holdingLand;
                // $("#price1") = result1;
                let lineTotal1 = $("input[name=mso_landCost]").attr("value", result1).val();
                let lineTotal2 = $("input[name=mso_managementExpenses]").attr("value", result2).val();
                let lineTotal3 = $("input[name=mso_incomeCrops]").attr("value", result3).val();
                const linetotal = Number(lineTotal3) - Number(Number(lineTotal1) + Number(lineTotal2));

                $("input[name=mso_finalIncome]").attr("value", linetotal);

            });
        });
    </script>

    <script>
        // $(document).ready(function(){
        //     let jumin = $("#msi_memberAge").val();
        //     if(jumin.includes('-')){
        //         jumin = jumin.replace('-','');
        //     }
        //
        //     let today = new Date();	// 현재 날짜 및 시간
        //
        //     let juminFront = jumin.substr(0,6); // 주민번호앞자리
        //     let juminBackFirstVal = jumin.substr(6,1); //주민번호뒷자리 첫 문자열(2000년도 이전생인지 확인)
        //
        //     let age = 0;
        //     let birthDate = null;
        //     let juminYear = null;
        //     let juminMonth = jumin.substr(2,2);//10
        //     let juminDate = jumin.substr(4,2);//03
        //
        //     let monthCheck = 0;
        //
        //     if(juminBackFirstVal == 1 || juminBackFirstVal == 2){
        //         // 2000년생 이전일 경우
        //         juminYear = "19" + jumin.substr(0,2);//93~~
        //
        //         // 문법상 Month(월)은 0부터 시작하기 때문에 -1 처리해야 됨.
        //         birthDate = new Date(juminYear*1, juminMonth-1, juminDate*1);
        //
        //         // 현재 연도에서 - 태어난 연도
        //         age = today.getFullYear() - birthDate.getFullYear();
        //
        //         // 현재 월에서 - 태어난 월
        //         monthCheck = today.getMonth() - birthDate.getMonth();
        //
        //         // 생일 월이 현재 월을 지나지 않았을 경우 만 나이기 때문에 -1
        //         if(monthCheck < 0 || (monthCheck === 0 && today.getDate() < birthDate.getDate())){
        //             age--;
        //         }
        //     }else{
        //         // 2000년생 이후
        //         juminYear = "20" + jumin.substr(0,2);//01~~
        //
        //         birthDate = new Date(juminYear*1, juminMonth-1, juminDate*1);
        //
        //         age = today.getFullYear() - birthDate.getFullYear();
        //
        //         monthCheck = today.getMonth() - birthDate.getMonth();
        //
        //         if(monthCheck < 0 || (monthCheck === 0 && today.getDate() < birthDate.getDate())){
        //             age--;
        //         }
        //     }
        //
        //     console.log("=====================만 나이: ",age + "세");
        //
        //     return age;
        // });
    </script>

</head>
<body>
<%%>
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
                    <form id="FarmForm" name="FarmInfo"
                          style="padding: 20px; border-radius: 25px; margin-bottom: 20px; margin-top: 50px; background: #f7f7cb">
                        <h2>회원 정보입력 (필수)</h2>
                        <hr class="featurette-divider" style="border-top: 8px solid">
                        <div class="d-flex justify-content-center">
                            <div style="width: 25%; padding: 20px">
                                <input type="hidden" value="${user.mi_id}" name="msi_id" id="msi_id">
                                <p class="WForm">이름</p>
                                <input class="form-control form-control" type="text" value="${user.mi_name}"
                                       name="msi_memberName" id="msi_memberName" readonly>
                            </div>
                            <div style="width: 25%; padding: 20px">
                                <p class="WForm">나이</p>
                                <input class="form-control form-control" type="text" placeholder="나이"
                                       name="msi_memberAge" id="msi_memberAge" value="${user.mi_regidentRegNumber}">
                            </div>
                            <div style="width: 25%; padding: 20px">
                                <p class="WForm">성별</p>
                                <select class="form-select form-select mb-3" name="msi_memberGender"
                                        id="msi_memberGender">
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
                                <select class="form-select form-select mb-3" name="msi_desiredArea"
                                        id="msi_desiredArea"></select>
                                <select class="form-select form-select mb-3" name="msi_desiredAreaDetail"
                                        id="msi_desiredAreaDetail"></select>
                            </div>
                            <div style="width: 25%; padding: 20px">
                                <p class="WForm">파종시기</p>
                                <select class="form-select form-select mb-3" name="msi_desiredTimeSowing"
                                        id="msi_desiredTimeSowing">
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
                                    <input class="form-check-input" type="radio" name="msi_desiredTimeSowingPart"
                                           id="inlineRadio1" value="상">
                                    <label class="form-check-label" for="inlineRadio1">상</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="msi_desiredTimeSowingPart"
                                           id="inlineRadio2" value="중">
                                    <label class="form-check-label" for="inlineRadio2">중</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="msi_desiredTimeSowingPart"
                                           id="inlineRadio3" value="하">
                                    <label class="form-check-label" for="inlineRadio3">하</label>
                                </div>
                            </div>
                            <div style="width: 25%; padding: 20px">
                                <p class="WForm">수학 시기</p>
                                <select class="form-select form-select mb-3" name="msi_desiredHarvestTime"
                                        id="msi_desiredHarvestTime">
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
                                    <input class="form-check-input" type="radio" name="msi_desiredHarvestTimePart"
                                           id="inlineRadio4" value="상">
                                    <label class="form-check-label" for="inlineRadio4">상</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="msi_desiredHarvestTimePart"
                                           id="inlineRadio5" value="중">
                                    <label class="form-check-label" for="inlineRadio5">중</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="msi_desiredHarvestTimePart"
                                           id="inlineRadio6" value="하">
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
                                <select class="form-select form-select mb-3" name="msi_cropClassification"
                                        id="msi_cropClassification">
                                    <option selected value="전체">전체</option>
                                    <option value="과일">과일</option>
                                    <option value="채소">채소</option>
                                </select>
                            </div>
                            <div style="width: 25%; padding: 20px">
                                <p class="WForm">재배 방법</p>
                                <select class="form-select form-select mb-3" aria-label=".form-select-lg example"
                                        name="msi_cultivationMethod" id="msi_cultivationMethod">
                                    <option selected value="둘다">둘다</option>
                                    <option value="노지">노지</option>
                                    <option value="비닐하우스">비닐하우스</option>
                                </select>
                            </div>
                            <div style="width: 25%; padding: 20px">
                                <p class="WForm">농사 경험 유무</p>
                                <select class="form-select form-select mb-3" name="msi_farmingExperience"
                                        id="msi_farmingExperience">
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
                                <select class="form-select form-select mb-3" name="msi_hadMachinery"
                                        id="msi_hadMachinery">
                                    <option selected value="N">없음</option>
                                    <option value="Y">충분</option>
                                </select>
                            </div>
                            <input class="form-control form-control" type="hidden" placeholder="자본금"
                                   name="msi_capital" id="msi_capital">
                            <input class="form-control form-control" type="hidden" placeholder="토지크기"
                                   name="msi_holdingLand" id="msi_holdingLand">
                        </div>
                        <hr class="featurette-divider">
                        <div align="center">
                            <button class="btn btn-primary btn-lg" type="button" id="flip" style="margin: auto">작물 확인
                            </button>
                        </div>
                    </form>
                </div>
            </div>
            <div id="TestForm"></div>
            <%-- <jsp:include page="FarmResult.jsp"></jsp:include> --%>

            <%-- 작물 정보 리스트 출력 --%>
            <div id="window" style="display: none">
                <div id="Main_Box" align="center">
                    <div class="align-self-center" style="margin-bottom: 30px">
                        <div id="hold-this"></div>
                    </div>

                    <!-- Modal -->
                    <form name="FVResult">

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

                                            <div style="margin-top: 20px; margin-bottom: 20px; padding: 10px">
                                                <button type="button" class="btn btn-outline-primary" id="menu1">기본 정보
                                                </button>
                                                <button type="button" class="btn btn-outline-success" id="menu2">재배 기술
                                                </button>
                                                <button type="button" class="btn btn-outline-secondary" id="menu3">시세 정보
                                                </button>
                                            </div>

                                            <!-- START THE FEATURETTES -->
                                            <hr class="featurette-divider">

                                            <div id="Info_menu1" style="display: none">
                                                <h1> 작물 정보 </h1>
                                                <div class="row featurette">
                                                    <div class="col-md-7">
                                                        <h2 class="featurette-heading fw-normal lh-1" id="Fruit_Title">
                                                            제목
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
                                                <h1> 상세정보 </h1>

                                                <div id="carouselExampleControls" class="carousel slide"
                                                     data-bs-ride="carousel">

                                                    <div class="carousel-inner">
                                                        <div class="carousel-item">
                                                            <svg class="bd-placeholder-img bd-placeholder-img-lg d-block w-100"
                                                                 width="800"
                                                                 height="400" xmlns="http://www.w3.org/2000/svg"
                                                                 role="img"
                                                                 aria-label="Placeholder: First slide"
                                                                 preserveAspectRatio="xMidYMid slice"
                                                                 focusable="false"><title>Placeholder</title>

                                                                <rect width="100%" height="100%" fill="#ffaa00"></rect>
                                                            </svg>
                                                            <div class="carousel-caption text-start">
                                                                <h1>파종시기 와 수학시기</h1>
                                                                <p id="sowing"></p>
                                                                <p id="harvest"></p>

                                                                <p><a class="btn btn-lg btn-primary" href="#">상세보기</a>
                                                                </p>
                                                            </div>

                                                        </div>

                                                        <div class="carousel-item active">
                                                            <svg class="bd-placeholder-img bd-placeholder-img-lg d-block w-100"
                                                                 width="800"
                                                                 height="400" xmlns="http://www.w3.org/2000/svg"
                                                                 role="img"
                                                                 aria-label="Placeholder: Second slide"
                                                                 preserveAspectRatio="xMidYMid slice"
                                                                 focusable="false"><title>Placeholder</title>

                                                                <rect width="100%" height="100%" fill="#ffaa00"></rect>
                                                            </svg>

                                                            <div class="carousel-caption text-start">
                                                                <h1>영양가</h1>
                                                                <p id="nutrition"></p>

                                                                <p><a class="btn btn-lg btn-primary" href="#">상세보기</a>
                                                                </p>
                                                            </div>

                                                        </div>

                                                        <div class="carousel-item">
                                                            <svg class="bd-placeholder-img bd-placeholder-img-lg d-block w-100"
                                                                 width="800"
                                                                 height="400" xmlns="http://www.w3.org/2000/svg"
                                                                 role="img"
                                                                 aria-label="Placeholder: third slide"
                                                                 preserveAspectRatio="xMidYMid slice"
                                                                 focusable="false"><title>Placeholder</title>

                                                                <rect width="100%" height="100%" fill="#ffaa00"></rect>
                                                            </svg>

                                                            <div class="carousel-caption text-start">

                                                                <h1>추가설명</h1>
                                                                <p> 아직 없음 .</p>
                                                                <p><a class="btn btn-lg btn-primary" href="#">상세보기</a>
                                                                </p>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <%-- 버튼 --%>
                                                    <button class="carousel-control-prev" type="button"
                                                            data-bs-target="#carouselExampleControls"
                                                            data-bs-slide="prev">
                                                        <span class="carousel-control-prev-icon"
                                                              aria-hidden="true"></span>
                                                        <span class="visually-hidden">Previous</span>
                                                    </button>
                                                    <button class="carousel-control-next" type="button"
                                                            data-bs-target="#carouselExampleControls"
                                                            data-bs-slide="next">
                                                        <span class="carousel-control-next-icon"
                                                              aria-hidden="true"></span>
                                                        <span class="visually-hidden">Next</span>
                                                    </button>
                                                </div>

                                                <hr class="featurette-divider">
                                                <h1> 부가설명 </h1>
                                                <div></div>
                                            </div>
                                            <%-- end of menu1 --%>

                                            <div id="Info_menu2" style="display: none">
                                                <h1> 재배방법 </h1>
                                                <div>
                                                    <p class="lead" id="content2" style="padding: 20px"> 부가 설명 입니다. </p>
                                                </div>

                                                <hr class="featurette-divider">
                                                <h1> 병충해 </h1>
                                                <div id="pest"></div>
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
                                            <%-- end of menu2 --%>

                                            <div id="Info_menu3" style="display: none">
                                                <h1> 과일 시세 </h1>
                                                <div class="row featurette">
                                                    <div class="col-md-7">
                                                        <h2 class="featurette-heading fw-normal lh-1"> 작물 시세 </h2>
                                                        <p class="lead" id="cd_marketValue"> 부가 설명 입니다. </p>
                                                        <div class="InfoBox">
                                                            <div id="content3"></div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-5">
                                                    </div>
                                                </div>
                                                <hr class="featurette-divider">
                                                <h1> 경영 및 관리비 </h1>

<%--                                                <div id="cd_operatingCost"></div>--%>
<%--                                                <div id="cd_income"></div>--%>
                                                <hr class="featurette-divider">
                                                <h1> 거래량 </h1>
                                                <div id="myChart"
                                                     style="width:100%; max-width:600px; height:500px;"></div>

                                            </div>

                                            <%-- end of menu3 --%>
                                            <div>
                                                <hr class="featurette-divider">
                                                <h1> 농작물 소득 계산기 </h1>

                                                <form name="invoice form" action="saveToDatabase.java">
                                                    <table border="2" height="30%" width="80%">
                                                        <tr>
                                                            <td align="center" colspan="3">농작물 소득 을 계산해줍니다.</td>
                                                            <td style="text-align: right">
                                                                <input class="form-control form-control" type="text" placeholder="자본금"
                                                                       name="mso_capital">
                                                            </td>
                                                        </tr>

                                                        <tr>
                                                            <td width="25%" bgcolor="#f7adad">목록</td>

                                                            <td width="25%" bgcolor="#f7adad">선택한 지역 과 작물에 따른 비용</td>
                                                            <td width="20%" bgcolor="#f7adad">
                                                                예상하는 농작지 면적(약 300평)
                                                            </td>
                                                            <td width="25%" bgcolor="#f7adad">
                                                                합계<br />(선택한 지역 및 작물에 따른 비용 * 예상하는
                                                                농작지 면적(10a))
                                                            </td>
                                                        </tr>

                                                        <tr>
                                                            <td width="25%">땅 지출</td>

                                                            <td width="25%">
                                                                <input class="form-control form-control" type="text" name="mpf_averagePrice" id="mpf_averagePrice"
                                                                       size="4" disabled/>
                                                            </td>
                                                            <td width="20%">
                                                                <input class="form-control form-control" type="text" id="mso_holdingLand" value="" size="2" name="mso_holdingLand"/>
                                                            </td>
                                                            <td width="25%">
                                                                <input class="form-control form-control" type="text" id="mso_landCost" name="mso_landCost" value="" size="4" />
                                                            </td>
                                                        </tr>

                                                        <tr>
                                                            <td width="25%">경영비(10a) 지출</td>

                                                            <td width="25%">
                                                                <input class="form-control form-control" type="text" id="cd_operatingCost" size="4" name="cd_operatingCost" disabled/>
                                                            </td>
                                                            <td width="20%">
                                                            </td>
                                                            <td width="25%">
                                                                <input class="form-control form-control" type="text" name="mso_managementExpenses" id="mso_managementExpenses" value="" size="4" />
                                                            </td>
                                                        </tr>

                                                        <tr>
                                                            <td width="25%">작물 소득</td>

                                                            <td width="25%">
                                                                <input class="form-control form-control" type="text" id="cd_income" name="cd_income"
                                                                       size="4" disabled/>
                                                            </td>
                                                            <td width="20%">
                                                            </td>
                                                            <td width="25%">
                                                                <input class="form-control form-control" type="text" name="mso_incomeCrops" id="mso_incomeCrops" value="" size="4" />
                                                            </td>
                                                        </tr>

                                                        <tr>
                                                            <td align="right" colspan="4">
                                                                Total <input type="text" name="mso_finalIncome" id="mso_finalIncome" value="" size="12" readonly/>
                                                            </td>
                                                        </tr>
                                                    </table>

                                                    <br/>
                                                    <input type="hidden" name="formatNumber" value="" />
                                                    <input type="hidden" name="unformatNumber" value="" />
                                                    <br/>
                                                </form>

                                                <input type="hidden" value="${user.mi_id}" name="mso_id">
                                                <div id="cropNameTitle"></div>

                                                <hr class="featurette-divider" style="width: 90%">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal-footer" style="display: flex; justify-content: center">
                                        <%-- 작물 최종 선택 --%>

                                        <div id="FVS">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>

            </div>

            <div class="b-example-divider"></div>

        </main>
    </article>
</section>
</body>
</html>