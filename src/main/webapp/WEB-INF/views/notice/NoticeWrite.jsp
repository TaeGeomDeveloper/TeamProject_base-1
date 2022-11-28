<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<html>
<head>
  <title>Insert</title>

  <%-- summernote 라이브러리 추가 --%>
  <script type="text/javascript" src="${contextPath}/resources/summernote/js/summernote-lite.js" charset="UTF-8"></script>
  <script type="text/javascript" src="${contextPath}/resources/summernote/lang/summernote-ko-KR.js" charset="UTF-8"></script>
  <link rel="stylesheet" href="${contextPath}/resources/summernote/css/summernote-lite.css">
  <script type="text/javascript" src="${contextPath}/resources/summernote/js/summernoteFunction.js" charset="UTF-8"></script>

  <script>
    function fn_click() {
      var WriteForm = document.WriteForm;

      WriteForm.method = "post";
      WriteForm.action = "./createBoard.do";
      WriteForm.submit();
    }
  </script>
  <style>
    th{
      text-align: center;
      max-width: 100px;
      min-width: 100px;
    }
  </style>

</head>
<body>

<%--몸통--%>
<section>
  <article>
    <div id="Main_Box" align="center" style="width: 90%; margin:auto;">
      <h1 class="Title" style="color: #f58e45; margin-bottom: 30px;"> 공지사항 </h1>
      <form name="WriteForm" id="frm" enctype="multipart/form-data">
        <div style="border: 10px solid #f7a063; border-radius: 20px; margin-bottom: 20px; margin-top: 30px;">
          <table style="margin: 20px">
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
              <td style="width: 1000px"><textarea name="cb_content" id="cb_content" rows="30" cols="100"
                                                  placeholder="내용을 입력해주세요"></textarea></td>
            </tr>
            <tr>
              <th>첨부파일</th>
              <td><input class="form-control" placeholder="file" type="file" name="cb_attachedFile"
                         style="width: 50%"/></td>
            </tr>
          </table>
        </div>
      </form>

      <div style="margin: auto">
        <button class="button2" type="submit" onclick="fn_click()" id="savebutton"> 작성하기</button>
      </div>
    </div>

  </article>
</section>

</body>
</html>
