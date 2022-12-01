<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<html>
<head>
    <title>Promote</title>

    <style>
        .Main_Box {
            width: 1200px;
            margin: 0 auto;
        }

        #share:after {
            content: "";
        }

        .shareBox {
            border-bottom: 3px solid #dcdcdc;
            margin-left: 10px;
        }

        .share1 {

            margin-top: 2px;
            margin-bottom: 2px;
            width: 30px;
            height: 30px;

        }

        .share6 {
            margin-top: 2px;
            margin-bottom: 2px;
            width: 30px;
            height: 30px;


        }

        .share2 {
            margin-top: 2px;
            margin-bottom: 2px;
            width: 30px;
            height: 30px;


        }

        .share3 {
            margin-top: 2px;
            margin-bottom: 2px;
            width: 30px;
            height: 30px;


        }

        .share4 {
            margin-top: 2px;
            margin-bottom: 2px;
            width: 30px;
            height: 30px;


        }

        .share5 {
            margin-top: 2px;
            margin-bottom: 2px;
            width: 30px;
            height: 30px;
        }

        .promoHead {
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px;
        }

        .promoBody {
            width: 80%;
            border: 4px solid #dcdcdc;
            outline: 3px solid #828282;
            -webkit-box-shadow: inset 0 2px 45px #828282;
            -moz-box-shadow: inset 0 2px 45px #828282;
            -ms-box-shadow: inset 0 2px 45px #828282;
            box-shadow: inset 0 2px 45px #828282;
            text-align: left;
        }

        .promoBody div p {
            margin: 0 5em;
            padding: 0 0 0 1em;
            background: url("https://www.cng.go.kr/portal/_common/img/inc/li1bg.png") no-repeat 0 0.3em;
        }

        .promoSearch {
            position: relative;
            width: 100%;
            margin: 2em 0;
        }

        .sell1 {
            margin: 0;
            padding: 0;
        }

        .sell2 {

            margin: 0;
            padding: 0;
            display: grid;
            grid-template-columns: 1fr 2fr;
            text-decoration-line: none;
        }

        .sell3 {
            display: grid;
            grid-template-rows: 2fr 2.5fr 1fr;
        }

        .text {
            text-align: left;
        }

        .aLink {
            margin-bottom: 20px;
        }

        .promoSearch {
            margin-top: 4.5%;
            margin-bottom: 4.5%;
        }
    </style>
    <script src="https://kit.fontawesome.com/b8a7fea4d4.js"></script>
</head>
<body>

<%--몸통--%>
<section>
    <article>
        <div class="Main_Box" align="center" style="margin-top: 30px">
            <div class="promoHead">
                <h2 style="position:relative;left:43.2%;">홍보 게시판</h2>
                <div class="shareBox" class="shareBox">공유하기
                    <a href=""><img src="${contextPath}/resources/image/Promote/facebook.jpg" href="#" class="share1"/></a>
                    <a href=""><img src="${contextPath}/resources/image/Promote/google.jpg" href="#"
                                    class="share2"/></a>
                    <a href=""><img src="${contextPath}/resources/image/Promote/kakao.jpg" href="#" class="share3"/></a>
                    <a href=""><img src="${contextPath}/resources/image/Promote/twitter.jpg" href="#"
                                    class="share4"/></a>
                    <a href=""><img src="${contextPath}/resources/image/Promote/promo.jpg" href="#" class="share5"/></a>
                    <a href=""><img src="${contextPath}/resources/image/Promote/print.jpg" href="#" class="share6"/></a>
                </div>
            </div>
            <div class="promoBody">
                <div>
                    <div>
                        <p>
                            홍보게시판은 농업인분들께서 로그인후 게시물을 홍보목적으로 자유롭게 쓰실 수 있는 공간입니다. 저희 스마트팜에서 작성하는 글이 아니기때문에 외부링크나 연락처 기재등에
                            유의해주시기 바랍니다.
                        </p>
                    </div>
                    <div>
                        <p>
                            개업공인중개사는 중개대상물의 표시광고 시 공인중개사법 제18조의2(중개대상물의 표시광고) 규정을 준수하여야 하며 위반 시 같은 법에 따라 처벌될 수 있습니다.
                        </p>
                    </div>
                    <div>
                        <p>
                            답변이 필요한 사항은 건의내용에 따라 <strong><a href="#" class="aLink">Q&A게시판</a></strong> 상담사항은 <strong><a
                                href="#"
                                class="aLink">상담게시판</a></strong>
                            신고사항은 <strong><a href="" class="aLink">신고게시판</a></strong>을 이용해주세여
                        </p>
                    </div>
                    <div>
                        <p>
                            개업공인중개사는 중개대상물의 표시광고 시 공인중개사법 제18조의2(중개대상물의 표시광고) 규정을 준수하여야 하며 위반 시 같은 법에 따라 처벌될 수 있습니다.
                        </p>
                    </div>
                    <div>
                        <p>
                            개업공인중개사는 중개대상물의 표시광고 시 공인중개사법 제18조의2(중개대상물의 표시광고) 규정을 준수하여야 하며 위반 시 같은 법에 따라 처벌될 수 있습니다.
                        </p>
                    </div>
                </div>
            </div>
            <div class="promoSearch">
                <div>
                    <form method="get">
                        <select title="검색 분류" class="">
                            <option value="title" selected="selected">제목</option>
                            <option value="writer">작성자</option>
                            <option value="comment">제목</option>
                        </select>
                        <input type="text" title="검색어 입력" size=65/>
                        <button type="submit" class="">검색</button>
                    </form>
                </div>
            </div>
            <div>
                <c:forEach var="i" begin="0" end="4">
                    <div class="sell1" style="margin-bottom: 15px">
                        <a href="" class="sell2" class="aLink">
                            <div class="find1">
                                <img src="${contextPath}/resources/image/Find/question.png" alt="Not Image"
                                     class="findImg"/>
                            </div>
                            <div class="sell3">
                                <div class="text1" class="text">
                                    <strong>제목입니다</strong>
                                </div>
                                <div class="text2" class="text">
                                    내용을 적어야할 칸이에요.
                                </div>
                                <i class="text3wrap" class="text">
                                    <span class="text3">2022-11-02</span>
                                    <span class="text3">작성자</span>
                                    <span class="text3">조회수</span>
                                    <span class="text3">추천</span>
                                </i>
                            </div>
                        </a>
                    </div>
                </c:forEach>
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

        </div>
    </article>
</section>

</body>
</html>
