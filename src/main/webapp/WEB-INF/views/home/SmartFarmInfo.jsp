<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<html>
<head>
    <title>SmartFarmInfo</title>

    <style>

        #Main_Box {
            text-align: center;
        }

        .SmartClick:hover {
            color: red;
        }

        #SmartContainer {
            width: 100%;
            margin-bottom: 5vw;
            display: flex;
        }

        .SmartClick {
            width: 33.33vw;
            border-left: 5px solid #04AA6D;
            border-right: 5px solid #04AA6D;
            border-bottom: 5px solid #04AA6D;

            background: #aeff9c;
            font-size: 20px;
            height: 30px;
        }
        .SmartClick:hover {
            background: #51eb2f;
        }

        .SmartFarmInfoHead {
            margin-left: auto;
            border: 5px solid #04AA6D;
            border-radius: 10px;
            background-color: #aeff9c;
            width: 100%;
        }

        #SmartFarmInfoFoot {
            padding-bottom: 20px;
        }

        #SmartFarmInfoFoot p {
            text-align: left;
        }

        .SmartFarmInfoHead span {
            color: red;
        }

        #centerLine {
            width: 50%;
            margin-right: 5px;
            color: transparent;
            border-right: 5px solid #04AA6D;
        }

        .imgHover {
            color: #8FBC8F;
        }
    </style>

    <script>
        $(document).ready(function () {
            $("#SmartFruit").click(function () {
                $("#SmartImg1").slideToggle("slow");
                $("#SmartImg2").slideUp("slow");
                $("#SmartImg3").slideUp("slow");
            });
            $("#SmartGarden").click(function () {
                $("#SmartImg1").slideUp("slow");
                $("#SmartImg2").slideToggle("slow");
                $("#SmartImg3").slideUp("slow");
            });
            $("#SmartGround").click(function () {
                $("#SmartImg1").slideUp("slow");
                $("#SmartImg2").slideUp("slow");
                $("#SmartImg3").slideToggle("slow");
            });
        });
    </script>

</head>
<body>

<%--몸통--%>
<div id="Main_Box">

    <div class="SmartFarmInfoHead" style="font-size: 20px">
        <span>스마트 팜</span>은 농촌 고령화와 인구 감소로 인해 노동력이 부족한 현실을 <br/>보완하기 위해 개발되어 직접적인 노동 인력 없이도
        자동으로 농작물을 <br/>관리할 수 있는정보통신기술(ICT), 바이오기술(BT), 녹색기술(GT), 사물인터넷(IoT) 등을<br/> 농업에 접목해 지능화한 스마트 농장을 일컫는다
    </div>
    <div id="centerLine">경계</div>
    <div style="border: 5px solid #04AA6D; border-radius: 10px ">
        <div id="SmartContainer">
            <div class="SmartClick" id="SmartFruit">과수분야</div>
            <div class="SmartClick" id="SmartGarden">시설원예분야</div>
            <div class="SmartClick" id="SmartGround">노지분야</div>
        </div>
        <div id="SmartFarmInfoBox">
            <img id="SmartImg1" src="../resources/image/Info/SmartFarmFruit.png" style="display: none"/>
            <img id="SmartImg2" src="../resources/image/Info/SmartFarmGarden.png" style="display: none"/>
            <img id="SmartImg3" src="../resources/image/Info/SmartFarmGround.png" style="display: none"/>
            <div class="imgHover">관심분야 제목을 클릭하시면 관련 이미지가 뜹니다.</div>

            <p><img src="../resources/image/Info/leaf.png" style="width:1.8vw;height:4vh;margin-left:10px;"/> 스마트팜 의의 : 작물 생육정보와
                환경정보에 대한 데이터를 기반으로 최적 생육환경을 조성하여, 노동력·에너지·양분 등을 종전보다 덜 투입하고도 농산물의 생산성과 품질 제고 가능</p> <br/>
            <p id="SmartFarmInfoFoot"><img src="../resources/image/Info/leaf.png" style="width:1.8vw;height:4vh;"/> 스마트팜 기대효과 :
                ICT를 접목한 스마트 팜이 보편적으로 확산되면 노동·에너지 등 투입 요소의 최적 사용을 통해 우리 농업의 경쟁력을 한층 높이고, 미래성장산업으로 견인 가능<br/>
                단순한 노동력 절감 차원을 넘어서 농작업의 시간적·공간적 구속으로부터 자유로워져 여유시간도 늘고, 삶의 질도 개선되어 우수 신규 인력의 농촌 유입 가능성도 증가할 것으로 기대
            </p>
        </div>
    </div>

</div>
<script>

</script>

</body>
</html>
