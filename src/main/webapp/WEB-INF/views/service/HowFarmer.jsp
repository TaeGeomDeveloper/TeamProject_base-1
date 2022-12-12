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
  <title>HowFarmer</title>

  <!-- 스타일시트 연결 -->
  <script src="http://code.jquery.com/jquery-latest.js"></script>

  <%-- 폰트 --%>
  <style>
    @import url('https://fonts.googleapis.com/css2?family=Jua&display=swap');
  </style>

  <style>
  .FarmInfo {
  display: inline-block;
  margin: 0 auto;
  margin-left: 30px;
  width: 22%;
  height: 70vh;
  margin-top: auto;
  margin-bottom: auto;
  }

  .FarmInfoAll {
  width: 100%;
  height: 100%;
  display: flex;
  justify-content: center;
  }

  .linkStyle {
  cursor: pointer;
  text-decoration-line: none;
  color: inherit;
  }

  .linkStyle {
  cursor: pointer;
  text-decoration-line: none;
  color: inherit;
  }

  .FarmInfoImg {
  width: 22vw;
  height: 38vh;
  margin-bottom: 10px;

  }
  p {
    font-size: 18px;
  }
  </style>

</head>
<body>

<%--몸통--%>
<section>
  <article>
    <div id="Main_Box" align="center" style="margin-top: 30px">
      <h1 style="font-size: 60px; color: #f7cc4a; margin-bottom: 10px; text-align: center"> 귀농 절차 </h1>

      <img src="${contextPath}/resources/image/HowFarmer/귀농절차2.jpg" alt="promo1" width="90%" height="50%">

      <hr class="featurette-divider">
      <h1 style="font-size: 60px; color: #f7cc4a; margin-bottom: 30px"> 귀농 정보 </h1>
      <p>
        농업 관련 교육과 기타 지원제도 안내 페이지 입니다.<br/>
        관심분야를 클릭 하시면 관련사이트로 이동하실 수 있습니다.
      </p>

      <div class="FarmInfoAll" style="margin-top: 30px">

        <div class="FarmInfo">
          <a href="https://www.returnfarm.com:444/cmn/main/main.do" target="_blank" class="linkStyle">
            <button class="button">귀농 귀촌</button>
            <img class="FarmInfoImg" src="${contextPath}/resources/image/Info/SupportFarmHouse.jpg" width="20%" height="350px"/>
          </a>
          <p>
            다른 삶을 살아보기 위해서, 그리고 자연과 함께 더불어 살아보고 싶어서 귀농,귀촌을 원하는 분들이 많습니다.
          </p>
        </div>

        <div class="FarmInfo">
          <a href="https://www.fbo.or.kr/contents/Contents.do?menuId=0400100010" target="_blank"
             class="linkStyle">
            <button class="button">농지연금제도</button>
            <img class="FarmInfoImg" src="${contextPath}/resources/image/Info/SupportFarmOld.jpg" width="20%" height="350px"/>
          </a>
          <p>
            귀농인들의 초기 부족한 자금을 지원하여 농촌에 안정적으로 정착할 수 있도록 하고 농촌 지역의 경제 활성화를 도모합니다.
          </p>
        </div>

        <div class="FarmInfo">
          <a href="https://www.fbo.or.kr/contents/Contents.do?menuId=0400100010" target="_blank"
             class="linkStyle">
            <button class="button">농기계 임대</button>
            <img class="FarmInfoImg" src="${contextPath}/resources/image/Info/SupportFarmRent.jpg" width="20%" height="350px"/>
          </a>
          <p>
            귀농을 시작한 후에는 필요한 장비들이 상당히 많습니다. 처음부터 구매하기보단 각지자체나 농협에서 농기계 및 장비를 임대해주는 사업이 있으니 이용해보세요.
          </p>
        </div>

        <div class="FarmInfo">
          <a href="https://agriedu.net/" target="_blank" class="linkStyle">
            <button class="button">온라인 교육</button>
            <img class="FarmInfoImg" src="${contextPath}/resources/image/Info/SupportFarmOn.jpg" width="20%" height="350px"/>
          </a>
          <p>
            귀농인분들께서 작물, 축산, 관리등 여러분류의 교육을 받아보실 수 있습니다. 온라인과정뿐만 아니라 집체교육, 참여형 화상교육, 혼합교육등도 있습니다.
          </p>
        </div>
      </div>

    </div>
  </article>
</section>

</body>
</html>
