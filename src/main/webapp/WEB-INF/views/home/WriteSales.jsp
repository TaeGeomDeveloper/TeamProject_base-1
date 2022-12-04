<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<html>
<head>
    <title>WriteSales</title>

    <!-- 스타일시트 연결 -->
    <script src="http://code.jquery.com/jquery-latest.js"></script>

    <%-- 폰트 --%>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Jua&display=swap');
    </style>

    <script>
        var frm = document.getElementById("frm");
        function save() {
            oEditors.getById["testContent"].exec("UPDATE_CONTENTS_FIELD",[]);
            frm.submit();

        }
    </script>

    <script type="text/javascript">
        var oEditors = [];

        $(function(){
            nhn.husky.EZCreator.createInIFrame({
                oAppRef: oEditors,
                elPlaceHolder: "ir1",
                //SmartEditor2Skin.html 파일이 존재하는 경로
                sSkinURI: "../${contextPath}/resources/static/smarteditor/SmartEditor2Skin.html",
                htParams : {
                    // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
                    bUseToolbar : true,
                    // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
                    bUseVerticalResizer : true,
                    // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
                    bUseModeChanger : true,
                    fOnBeforeUnload : function(){

                    }
                },
                fOnAppLoad : function(){
                    //textarea 내용을 에디터상에 바로 뿌려주고자 할때 사용
                    oEditors.getById["ir1"].exec("PASTE_HTML", ["ㅎㅇ 시작하자마자 이문구 작성됨."]);
                },
                fCreator: "createSEditor2"
            })
        });
    </script>

    <style>
        textarea {
            margin: auto;
            width: 100%;
            height: auto;
        }
    </style>

</head>
<body>

<%--몸통--%>
<section>
    <article>
        <div id="Main_Box" align="center" style="margin-top: 50px;">
            <h1> 상품 판매 작성 페이지 </h1>
                <form name="frm" id="frm">
                    <div>
                        <table class="list_table">
                            <tr>
                                <th colspan="2">상품 정보</th>
                            </tr>
                            <tr>
                                <th>상품명(작물/품종)</th>
                                <td><input type="text" name="itemName"></td>
                            </tr>
                            <tr>
                                <th>원산지</th>
                                <td><input type="text" name="itemOrigin"></td>
                            </tr>
                            <tr>
                                <th>출하 날짜</th>
                                <td><input type="text" name="deployDate"></td>
                            </tr>
                            <tr>
                                <th>상품 카테고리</th>
                                <td><input type="text" name="itemType"></td>
                            </tr>
                            <tr>
                                <th>판매량</th>
                                <td><input type="text" name="salesVolume"></td>
                            </tr>
                            <tr>
                                <th>원가</th>
                                <td><input type="text" name="price"></td>
                            </tr>
                            <tr>
                                <th>이미지 파일</th>
                                <td><input type="file" name="attachedFile"></td>
                            </tr>
                        </table>
                    </div>
                    <div style="margin: auto">
                        <input class="title" type="text" name="title" style="width: 100%" placeholder="제목을 입력해주세요">
                        <textarea name="ir1" id="ir1" ></textarea>
                        <input type="button" onclick="save();" value="작성">
                    </div>
                </form>
            </div>
        </div>
    </article>
</section>

</body>
</html>
