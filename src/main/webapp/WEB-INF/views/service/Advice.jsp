<%--
  작성자 : 윤태검

  작성일시 : 2022-11-11
  내용 : 상담 View 작성.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<html>
<head>
    <title>Advice</title>

    <!-- 스타일시트 연결 -->
    <script src="http://code.jquery.com/jquery-latest.js"></script>

    <script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
    <link rel="stylesheet" href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.min.css">

    <%-- summernote 라이브러리 추가 --%>
    <script type="text/javascript" src="${contextPath}/resources/summernote/js/summernote-lite.js"
            charset="UTF-8"></script>
    <script type="text/javascript" src="${contextPath}/resources/summernote/lang/summernote-ko-KR.js"
            charset="UTF-8"></script>
    <link rel="stylesheet" href="${contextPath}/resources/summernote/css/summernote-lite.css">
    <script type="text/javascript" src="${contextPath}/resources/summernote/js/summernoteFunction.js" charset="UTF-8"></script>

    <script>
        $(document).ready(function () {
            $('#table_Adivce').DataTable();

        });
    </script>

    <style>
        .Mbtn {
            border-radius: 15px;
            background-color: #f2b285;
            border: none;
            color: white;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 20px;
            margin: 4px 2px;
            cursor: pointer;
        }

        .Mbtn:hover {
            background-color: #f58e45;
        }
    </style>

    <style>
        #Advice th {
            width: 100px;
            text-align: center;
        }

        .dropdown-toggle::after {
            display: none;
        }
    </style>

</head>
<body>

<%--몸통--%>
<section>
    <article>
        <div id="Main_Box" align="center" style="margin-top: 30px">
            <h1 class="Title" style="color: #f58e45; margin-bottom: 30px;"> 전문가 상담 및 문의 </h1>

            <div class="container marketing" style="margin-top: 30px">

                <!-- Three columns of text below the carousel -->
                <div class="row">
                    <div class="col-lg-4">
                        <img src="${contextPath}/resources/image/Advice/전문가1.jpg" alt="전문가1" width="140" height="140"
                             class="rounded-circle">

                        <h2 class="fw-normal">김 모씨</h2>
                        <p>전문가 김모씨 에 대한 설명</p>
                        <p><a class="btn btn-secondary" href="#">상세보기 &raquo;</a></p>
                    </div><!-- /.col-lg-4 -->
                    <div class="col-lg-4">
                        <img src="${contextPath}/resources/image/Advice/전문가2.jpg" alt="전문가2" width="140" height="140"
                             class="rounded-circle">

                        <h2 class="fw-normal">안 모씨</h2>
                        <p>전문가 안모씨 에 대한 설명</p>
                        <p><a class="btn btn-secondary" href="#">상세보기 &raquo;</a></p>
                    </div><!-- /.col-lg-4 -->
                    <div class="col-lg-4">
                        <img src="${contextPath}/resources/image/Advice/전문가3.jpg" alt="전문가3" width="140" height="140"
                             class="rounded-circle">

                        <h2 class="fw-normal">윤 모씨</h2>
                        <p>전문가 윤모씨 에 대한 설명</p>
                        <p><a class="btn btn-secondary" href="#">상세보기 &raquo;</a></p>
                    </div><!-- /.col-lg-4 -->
                </div><!-- /.row -->


                <!-- START THE FEATURETTES -->

                <hr class="featurette-divider">

                <div class="row featurette">
                    <div class="col-md-7">
                        <h2 class="featurette-heading fw-normal lh-1"> 전문가 김모씨 <span class="text-muted">(농사 경험 20년이상)</span>
                        </h2>
                        <p class="lead"><br> 20년이상의 농사 노하우를 바탕으로 당신의 문제를 해결해드립니다.</p>
                        <p><br> 귀농을 고민하는 당신!  </p>
                        <p> 과일 농사 전문가인 저한태 맡겨주세요.  </p>
                        <p><br> 연락처 : 010 - 0000 - 0000 </p>
                    </div>
                    <div class="col-md-5">
                        <img src="${contextPath}/resources/image/Advice/전문가1.jpg" alt="전문가1" width="500" height="500">
                    </div>
                </div>

                <hr class="featurette-divider">

                <div class="row featurette">
                    <div class="col-md-7 order-md-2">
                        <h2 class="featurette-heading fw-normal lh-1">전문가 안모씨 <span
                                class="text-muted">(농사 경험 15년 이상)</span></h2>
                        <p class="lead"><br> 농사 최고의 도우미 </p>
                        <p><br> 귀농을 고민하는 당신!  </p>
                        <p> 야채 농사 전문가인 저와 함께 하세요.  </p>
                        <p><br> 연락처 : 010 - 0000 - 0000 </p>
                    </div>
                    <div class="col-md-5 order-md-1">
                        <img src="${contextPath}/resources/image/Advice/전문가2.jpg" alt="전문가2" width="500" height="500">
                    </div>
                </div>

                <hr class="featurette-divider">

                <div class="row featurette">
                    <div class="col-md-7">
                        <h2 class="featurette-heading fw-normal lh-1">전문가 윤모씨 <span class="text-muted">(귀농 전문가)</span>
                        </h2>
                        <p class="lead"><br> 당신의 농사를 설계 해줍니다. </p>
                        <p><br> 귀농 계획! 이제부터 저와 함께라면 모두 해결!  </p>
                        <p> 귀농 계획 전문가인 저와 함께 하세요.  </p>
                        <p><br> 연락처 : 010 - 0000 - 0000 </p>
                    </div>
                    <div class="col-md-5">
                        <img src="${contextPath}/resources/image/Advice/전문가3.jpg" alt="전문가3" width="500" height="500">
                    </div>
                </div>

                <hr class="featurette-divider">

                <!-- Button trigger modal -->
                <div style="margin-top: 20px;margin-bottom: 20px">
                    <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#exampleModal"
                            style="width: 50%; height: 80px; font-size: 40px">
                        상담 예약
                    </button>
                </div>

                <hr class="featurette-divider">

                <div style="margin-top: 30px">
                    <%-- 상담 게시판 현황 --%>
                    <h1> 상담 현황 </h1>
                    <table id="table_Adivce" class="table table-striped table-bordered" style="width:100%;">
                        <thead style="background-color: #7afacb">
                        <tr>
                            <th>글번호</th>
                            <th style="width: 40%">제목</th>
                            <th>작성자</th>
                            <th>등록일</th>
                            <th>조회수</th>
                            <th>변경 버튼</th>
                            <th>삭제 버튼</th>
                            <th>첨부파일</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="i" begin="0" end="15">
                            <tr>
                                <td>${i}</td>
                                <td> 제목 ${i}</td>
                                <td>김 모씨</td>
                                <td>2022-11-11</td>
                                <td>0</td>
                                <td>
                                    <button class="button3">변경</button>
                                </td>
                                <td>
                                    <button class="button3">삭제</button>
                                </td>
                                <td>
                                    <button class="button3">첨부파일</button>
                                </td>
                            </tr>
                            <tr>
                                <td>${i}</td>
                                <td> 상담 리스트 ${i}</td>
                                <td>윤 모씨</td>
                                <td>2022-11-11</td>
                                <td>0</td>
                                <td>
                                    <button class="button3">변경</button>
                                </td>
                                <td>
                                    <button class="button3">삭제</button>
                                </td>
                                <td>
                                    <button class="button3">첨부파일</button>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                        <tfoot>
                        <tr>
                            <th>글번호</th>
                            <th>제목</th>
                            <th>작성자</th>
                            <th>등록일</th>
                            <th>조회수</th>
                            <th>변경 버튼</th>
                            <th>삭제 버튼</th>
                            <th>첨부파일</th>
                        </tr>
                        </tfoot>
                    </table>
                </div>

                <!-- /END THE FEATURETTES -->
            </div>

        </div>
    </article>
</section>

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
                <h1 style="font-size: 60px; color: #f58e45; margin-bottom: 10px; text-align: center"> 전문가 상담 및 문의 </h1>
                <form name="WriteForm" id="frm" enctype="multipart/form-data">
                    <div style="border: 10px solid #f58e45; border-radius: 20px; width: 100%; margin-bottom: 20px">
                        <h3 style="text-align: center">작물선택 결과</h3>
                        <table>
                            <tr>
                                <th>
                                    선택한 작물
                                </th>
                                <td>
                                    작물A
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    작물 A의 시세
                                </th>
                                <td>
                                    얼마
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    작물 A의 파종기와 수학시기
                                </th>
                                <td>
                                    1월 ~ 12월 상중하
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div style="border: 10px solid #f58e45; border-radius: 20px; width: 100%; margin-bottom: 20px">
                        <table id="Advice" style="margin: 20px">
                            <tr>
                                <th>아이디</th>
                                <td><input class="form-control" placeholder="ID" type="text" name="mi_id"
                                           style="width: 25%"/>
                                </td>
                            </tr>
                            <tr>
                                <th>제목</th>
                                <td><input class="form-control" placeholder="Title" type="text" name="cb_title"
                                           style="width: 50%"/></td>
                            </tr>
                            <tr>
                                <th>내용</th>
                                <td style="width: 900px;">
                                    <div>
                                        <textarea name="cb_content" id="cb_content" placeholder=""></textarea>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </div>
                </form>

                <div align="center">
                    <button class="Mbtn" type="submit" onclick="fn_click()" id="savebutton"> 작성하기</button>
                </div>
            </div>

        </div>
    </div>
</div>

</body>
</html>
