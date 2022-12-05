<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<html>
<head>
    <title>Update</title>
    <%-- summernote 라이브러리 추가 --%>
    <script type="text/javascript" src="${contextPath}/resources/summernote/js/summernote-lite.js" charset="UTF-8"></script>
    <script type="text/javascript" src="${contextPath}/resources/summernote/lang/summernote-ko-KR.js" charset="UTF-8"></script>
    <link rel="stylesheet" href="${contextPath}/resources/summernote/css/summernote-lite.css">

    <script>
            $(document).ready(function()
            	{
            	    var fontSizes = [ '8', '9', '10', '11', '12', '14','16', '18', '20', '22', '24', '28', '30', '36', '50', '72','100' ];
            		var fontNames = [ '맑은 고딕', '궁서', '굴림체', '굴림', '바탕체', 'Arial', 'Arial Black','Comic Sans MS', 'Courier New' ];
            		var toolbar = [[ 'fontname', [ 'fontname' ] ],
            		[ 'fontsize', [ 'fontsize' ] ],
            		[ 'style',    [ 'bold', 'italic', 'underline','strikethrough', 'clear' ] ],
            		[ 'color', [ 'forecolor', 'color' ] ],
            		[ 'table', [ 'table' ] ],
            		[ 'para', [ 'paragraph', 'height' ] ],
            		[ 'insert',[ 'picture','link','video' ]],
            		[ 'view', [ 'codeview', 'help'] ]
            		];

                    var setting = {
                        height : 700,
                        width : '100%',
                        minHeight : 700,
                        maxHeight : 700,
                        focus : true,
                        lang : 'ko-KR',
                        toolbar : toolbar,
                        fontSizes : fontSizes,
                        fontNames : fontNames,
                        //여기 부분이 이미지를 첨부하는 부분
                        callbacks : {
                            onImageUpload : function(files, editor, welEditable) {
                                for (var i = 0; i < files.length; i++) {
                                    sendFile(files[i], this);
                                }
                            }
                        }
                    };

                    $('#nb_content').val('${fn:replace(notice.nb_content,"\'","\'")}');
                    $('#nb_content').summernote(setting);
                    $('#nb_content').summernote('fontName', '맑은 고딕');
            });

            function sendFile(file, editor) {
            	var form_data = new FormData();
            	form_data.append('file', file);
            	$.ajax({
            		data : form_data,
            		type : "POST",
            		url : '/gwinongin/board/summerimages.do',
            		cache : false,
            		contentType : false,
            		enctype : 'multipart/form-data',
            		processData : false,
            		success : function(url) {
            			$(editor).summernote('insertImage', url, function($image) {
            				$image.css('width', "25%");
            			});
            		}
            	});
            }
    </script>

    <script>
        function update_check(){
            var updateForm = document.updateForm;
            let nb_title = $("#nb_title").val();

            if(nb_title == ""){
                alert("제목를 입력해주세요");
                nb_title.focus();
                return false;
            };

            updateForm.method = "post";
            updateForm.action = "./updateBoard.do";
            updateForm.submit();
        }
    </script>

    <style>
        .dropdown-toggle::after { display: none; }
    </style>

</head>
<body>

<%--몸통--%>
<section>
    <article>

        <div id="Main_Box" align="center">
            <h1> 수정페이지 </h1>
            <form name="updateForm" enctype="multipart/form-data">
                <table>
                    <tr>
                        <th>제목</th>
                        <td><input type="text" name="nb_title" id="nb_title" maxlength='50' value="${notice.nb_title}"></td>
                        <td><input type="hidden" name="nb_seq" value="${notice.nb_seq}" ></td>
                    </tr>
                    <tr>
                        <th>내용</th>
                        <td width="1000px" ><textarea name="nb_content" id="nb_content" ></textarea>
                        </td>
                    </tr>
                    <tr>
                        <th>첨부파일</th> <td><input type="file" name="nb_attachedFile" >${nb_originFileName}</td>
                    </tr>
                </table>
                <div style="margin: auto">
                    <button class="button2" type="button" onclick="update_check()" >수정하기</button>
                </div>
            </form>

        </div>

    </article>
</section>

</body>
</html>
