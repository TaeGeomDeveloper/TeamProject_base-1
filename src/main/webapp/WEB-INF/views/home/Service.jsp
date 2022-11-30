
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>s=/service</title>

    <style>
        .serviceDl {
            border-right: 1px solid black;
            padding: 10px;
        }

        .service_text {
            font-size: 20px;
        }

        .serviceDl dt {
            text-align: center;
            border: 1px solid black;
            border-radius: 7px;
            margin-top: -1.5em;
            background-color: #6DD66D;
        }

        .serviceDl p {
            font-size: 17px;
        }

        .serviceBody dl {
            position: relative;
            display: table-cell;
            width: 25%;
        }

        .serviceBody {
            display: table;
            width: 90%;
            background-color: lightgreen;
            margin-left: auto;
            margin-right: auto;
            border: 1px solid black;
            margin-top: 2em;
            min-height: 15em;
        }

        .serviceDl span {
            color: white;
        }


        #content_head img {
            width: 520px;
            height: 280px;
            margin-top: auto;
            margin-bottom: 10px;
        }


        #content_head {
            display: grid;
            grid-template-columns: 4fr 0.5fr 5fr;
        }

        .service_headLine {
            margin-left: -70px;
            margin-top: 30px;
            margin-bottom: 30px;
            color: transparent;
            border-left: 5px solid #e1e1e1;
            border-radius: 3px 3px 3px 3px;

        }

        .content_second {
            border-top: 1px solid #e1e1e1;
            border-bottom: 1px solid #e1e1e1;

        }

        .content_second p {
            font-size: 2vw;
            margin-bottom: 1em;
            margin-top: 1em;
            text-align: center;
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
                <img src="../resources/image/Info/bong.jpg">
             </span>
            </div>
            <div class="service_headLine">11</div>
            <div>
                <p class="service_text">
                    저희 스마트팜에 방문해주셔서 감사합니다.<br/>
                    처음 접하시는분들이나 이미 정착하고계신 농업인분들까지 아울러 모두가 이용해보실수 있습니다.<br/>

                </p>
            </div>
        </div>
        <div class="content_second">
            <p>
                어떤 내용을 적을지 모르겠어서 채워둔 말
            </p>
        </div>
        <div class="serviceHead">
            <h5 style="text-align:center;margin-top:20px;">
                <span>서비스 내용 정리</span>
            </h5>
            <div class="serviceBody">
                <dl class="serviceDl">
                    <dt>
                        <span>작물선택 서비스</span>
                    </dt>
                    <dd>
                        <p>
                            단계별 필터링을 거쳐 고객님의 니즈에 최적으로 맞는 작물을 선별해드립니다.
                        </p>
                    </dd>
                </dl>
                <dl class="serviceDl">
                    <dt>
                        <span>시세 집계</span>
                    </dt>
                    <dd>
                        <p>
                            농산물유통정보(KAMIS), 통계청, 농림수산 식품교육문화정보원, 축산물품질평가원, 농산물수출입 정보(KATI) 등 다양한 데이터를 원시 데이터, Open-API
                            형태로 수집하여 거래 단위별로 연간, 월간 나누어 조사한다.
                        </p>
                    </dd>

                </dl>
                <dl class="serviceDl">
                    <dt>
                        <span>재배 기술</span>
                    </dt>
                    <dd>
                        <p>
                            병충해 예방, 재배력, 작물별 관리법, 재배 난이도, 토양관리(비료 정보 포함)등을 관련영상과 함께 소개하려합니다.
                        </p>
                    </dd>

                </dl>
                <dl class="serviceDl">
                    <dt>
                        <span>재반 시설 정보</span>
                    </dt>
                    <dd>
                        <p>
                            땅, 농기계ㆍ농기구, 스마트팜 지원여부, 기타지원정보 등을 작물별로 제공하고 지원받을수 있는 혜택과, 스마트팜 관련 지원 정책, 사업도 같이 제공할 것입니다.
                        </p>
                    </dd>

                </dl>
            </div>
        </div>
    </div>
</article>
</body>
</html>
