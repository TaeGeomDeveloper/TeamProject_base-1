
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>s=/service</title>

    <style>
        .service_text {
            font-size: 20px;
            margin-top : 4em;
            margin-left : 5em;
        }
        #content_head img {
            width: 520px;
            height: 250px;
            margin-top: 10px;
            margin-bottom: 20px;
            margin-right : 5em;
        }
        #content_head {
            display: flex;
            justify-content: center;
        }

        .service_headLine {
            margin-left: -70px;
            margin-top: 30px;
            margin-bottom: 30px;
            color: transparent;
            border-radius: 3px 3px 3px 3px;
        }
        .service_Line h5{
            border-top : 2px solid #d2d2d2;
            border-bottom : 2px solid #d2d2d2;
        }
        #serviceHead h5 {
            border-top : 2px solid #d2d2d2;
            border-bottom : 2px solid #d2d2d2;
            text-align: center;
        }
        #serviceHead img {
            position : relative;
            margin-top : 2em;
            left : 30%;
            z-index: 1;
            width : 40%;
            height: 10%;
        }
        #serviceIntro {
            text-align: center;
            background-color : white;
            position : absolute;
            z-index: 2;
            width : 40%;
            height: 10%;
            border : 2px solid black;

            font-size: 2.5em;
        }
        #serviceHead p {
            background-color : white;
            position : absolute;
            z-index: 2;
            width : 40%;
            height: 25%;
            border : 2px solid black;
            right : 30%;
            top : 286.5%;
            font-size: 1.2em;
        }

        .content_second p {
            font-size: 1.4vw;
            margin-bottom: 1em;
            margin-top: 1em;
            text-align: center;
        }
        .serviceBody {
            margin-top : 2em;
            display : grid;
            grid-template-columns: 1fr 1fr 1fr 1fr;
            text-align: center;
        }

        .serviceDl img {
            width : 70%;
            height: 40%;
            border-radius: 10em;
        }
        .serviceDl div {
            margin-left : 23%;
            word-break: normal;
            width : 50%
        }
    </style>

</head>
<body>

<%--몸통--%>
<article>
    <div id="Main_Box">
        <div id="content_head">
            <div>
            <span>
                <img src="${contextPath}/resources/image/service.png">
             </span>
            </div>
            <div class="service_headLine">11</div>
            <div>
                <p class="service_text">
                    ' '에 방문해주셔서 감사합니다.<br />
                    저희 ' ' 는 귀농귀촌을 처음 시작하시려는 분들께 작물선택부터 전문가 상담까지<br/> 원스톱서비스를 제공합니다.
                    처음 접하시는분들이나 이미 정착하고계신 농업인분들까지<br/> 아울러 모두가 이용해보실수 있습니다.
                </p>
            </div>

        </div>
        <div class="content_second">
            <p>

            </p>
        </div>
        <div class="service_Line">
            <h5 style="text-align:center;margin-top:20px;">
                <span>서비스 내용 정리</span>
            </h5>
            <div class="serviceBody">
                <dl class="serviceDl">
                    <span>
                        <img src="${contextPath}/resources/image/quote.png" />
                    </span>
                    <div>[작물선택 서비스]</div>
                    <div>
                        단계별 필터링을 거쳐 고객님의 니즈에 최적으로 맞는 작물을 선별해드립니다.
                    </div>
                </dl>
                <dl class="serviceDl">
                        <span>
                            <img src="${contextPath}/resources/image/quote.png" />
                        </span>
                    <div>[시세집계]</div>
                    <div>
                        농산물유통정보(KAMIS), 통계청, 농림수산 식품교육문화정보원, 축산물품질평가원, 농산물수출입 정보(KATI) 등 다양한 데이터를 원시 데이터, Open-API
                        형태로 수집하여 거래 단위별로 연간, 월간 나누어 조사합니다.
                    </div>
                </dl>
                <dl class="serviceDl">
                        <span>
                            <img src="${contextPath}/resources/image/quote.png" />
                        </span>
                    <div>[재배기술]</div>
                    <div>
                        병충해 예방, 재배력, 작물별 관리법, 재배 난이도, 토양관리(비료 정보 포함)등을 관련영상과 함께 소개하려합니다.
                    </div>
                </dl>
                <dl class="serviceDl">
                        <span>
                            <img src="${contextPath}/resources/image/quote.png" />
                        </span>
                    <div>[상담/문의]</div>
                    <div>
                        성공적인 농업생활을 위한 맞춤형 서비스입니다. 상담예약을 통해 전문가와 1:1문의를 하거나 모든농업인이 정보공유를 할 수 있는 상담게시판이 준비되어있습니다.
                    </div>
                    </d>

                </dl>
            </div>
        </div>
        <div class="service_Line">
            <h5 style="text-align:center;margin-top:20px;">
                <span>서비스 내용 정리</span>
            </h5>
            <div class="serviceBody">
                <dl class="serviceDl">
                    <span>
                        <img src="${contextPath}/resources/image/quote.png" />
                    </span>
                    <div>[작물선택 서비스]</div>
                    <div>
                        단계별 필터링을 거쳐 고객님의 니즈에 최적으로 맞는 작물을 선별해드립니다.
                    </div>
                </dl>
                <dl class="serviceDl">
                        <span>
                            <img src="${contextPath}/resources/image/quote.png" />
                        </span>
                    <div>[시세집계]</div>
                    <div>
                        농산물유통정보(KAMIS), 통계청, 농림수산 식품교육문화정보원, 축산물품질평가원, 농산물수출입 정보(KATI) 등 다양한 데이터를 원시 데이터, Open-API
                        형태로 수집하여 거래 단위별로 연간, 월간 나누어 조사합니다.
                    </div>
                </dl>
                <dl class="serviceDl">
                        <span>
                            <img src="${contextPath}/resources/image/quote.png" />
                        </span>
                    <div>[재배기술]</div>
                    <div>
                        병충해 예방, 재배력, 작물별 관리법, 재배 난이도, 토양관리(비료 정보 포함)등을 관련영상과 함께 소개하려합니다.
                    </div>
                </dl>
                <dl class="serviceDl">
                        <span>
                            <img src="${contextPath}/resources/image/quote.png" />
                        </span>
                    <div>[상담/문의]</div>
                    <div>
                        성공적인 농업생활을 위한 맞춤형 서비스입니다. 상담예약을 통해 전문가와 1:1문의를 하거나 모든농업인이 정보공유를 할 수 있는 상담게시판이 준비되어있습니다.
                    </div>
                    </d>

                </dl>
            </div>
        </div>
    </div>
    <div id="serviceHead">
        <h5>팀 소개</h5>
        <%--<h5 style="text-align:center;margin-top:20px;">--%>

        </h5>
        <div>
            <div id="serviceIntro">TEAM 기가막히조</div>
            <img src="${contextPath}/resources/image/family.jpg" />
            <p>
            A : ~ ~ ~ ~ ~ ~ ~ ~ 하고있어요  역할을 맡았어요<br/>
            B : ~~~~~~~~~~~~~~~~하고있어요   역할을 맡았어요<br/>
            C :  @#@!@#@~!!~@!!!하고있어요   역할을 맡았어요<br/>
            D : !~~~~~~~~~!@~#~~하고있어요  역할을 맡았어요<br/>
            E : !~~$$**((#%##@##하고있어요  역할을 맡았어요<br/>
            F : ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
            </p>
        </div>
    </div>
</article>
</body>
</html>
