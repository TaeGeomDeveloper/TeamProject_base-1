$(document).ready(function(){
    $(".note-editing-area").on("click", function(){
        let description = $("#description").remove();
    });
});

function category() {
    let cb_category = $("#cb_category").val();

    if(cb_category == "일반"){
        $('#cb_content').summernote('fontName', '맑은 고딕');
        $('#cb_content').summernote('code', '<p style="line-height: 0.5;"><font face="맑은 고딕">﻿</font></p>');
    };

    if(cb_category == "정보"){
        $('#cb_content').summernote('fontName', '맑은 고딕');
        $('#cb_content').summernote('code',
            '<p id="description" style="line-height: 0.5;"><font face="맑은 고딕" color="#9c9c94">' +
            '<b style="">&lt;게시판 양식은 자유롭게 수정하실 수 있지만 주제에 벗어난 글은 삭제 처리될 수 있습니다&gt;</b>' +
            '</font></p><p style="line-height: 0.5;"><font face="맑은 고딕"><b>정보종류</b> :&nbsp;</font></p>' +
            '<p style="line-height: 0.5;"><font face="맑은 고딕"><br></font></p><p style="line-height: 0.5;">' +
            '<font face="맑은 고딕"><b>주제</b> :&nbsp;</font></p><p style="line-height: 0.5;"><font face="맑은 고딕"><br>' +
            '</font></p><p style="line-height: 0.5;"><font face="맑은 고딕"><b>내용</b> :&nbsp;</font></p>' +
            '<p style="line-height: 0.5;"><font face="맑은 고딕"><br></font></p><p style="line-height: 0.5;">' +
            '<p style="line-height: 0.5;"><font face="맑은 고딕"><br></font></p><p style="line-height: 0.5;">' +
            '<p style="line-height: 0.5;"><font face="맑은 고딕"><br></font></p><p style="line-height: 0.5;">' +
            '<font face="맑은 고딕"><b>참고자료</b> :&nbsp;</font></p><p style="line-height: 0.5;"><font face="맑은 고딕"><br>' +
            '</font></p><p style="line-height: 0.5;"><font face="맑은 고딕"><b>관련링크</b> :&nbsp;</font></p>' +
            '<p style="line-height: 0.5;"><font face="맑은 고딕"><br></font></p>');
    };

    if(cb_category == "나눔"){
        $('#cb_content').summernote('fontName', '맑은 고딕');
        $('#cb_content').summernote('code',
            '<p id="description" style="line-height: 0.5;"><font face="맑은 고딕" color="#9c9c94">' +
            '<b style="">&lt;게시판 양식은 자유롭게 수정하실 수 있지만 주제에 벗어난 글은 삭제 처리될 수 있습니다&gt;</b>' +
            '</font></p><p style="line-height: 0.5;"><font face="맑은 고딕"><b>나눔물품</b> :&nbsp;</font></p>' +
            '<p style="line-height: 0.5;"><font face="맑은 고딕"><br></font></p><p style="line-height: 0.5;">' +
            '<font face="맑은 고딕"><b>내용</b> :&nbsp;</font></p><p style="line-height: 0.5;"><font face="맑은 고딕"><br>' +
            '</font></p><p style="line-height: 0.5;"><font face="맑은 고딕"><br></font></p><p style="line-height: 0.5;">' +
            '<font face="맑은 고딕"><b>나눔조건</b> :&nbsp;</font></p><p style="line-height: 0.5;"><font face="맑은 고딕"><br>' +
            '</font></p><p style="line-height: 0.5;"><font face="맑은 고딕"><b>나눔방법</b> :&nbsp;</font></p>' +
            '<p style="line-height: 0.5;"><font face="맑은 고딕"><br></font></p>');
    };

    if(cb_category == "질문"){
        $('#cb_content').summernote('fontName', '맑은 고딕');
        $('#cb_content').summernote('code',
            '<p id="description" style="line-height: 0.5;"><font face="맑은 고딕" color="#9c9c94">' +
            '<b style="">&lt;게시판 양식은 자유롭게 수정하실 수 있지만 주제에 벗어난 글은 삭제 처리될 수 있습니다&gt;</b>' +
            '</font></p><p style="line-height: 0.5;"><font face="맑은 고딕"><b>질문종류</b> :&nbsp;</font></p>' +
            '<p style="line-height: 0.5;"><font face="맑은 고딕"><br></font></p><p style="line-height: 0.5;">' +
            '<font face="맑은 고딕"><b>질문내용</b> :&nbsp;</font></p><p style="line-height: 0.5;"><font face="맑은 고딕"><br>' +
            '</font></p><p style="line-height: 0.5;"><font face="맑은 고딕"><br></font></p><p style="line-height: 0.5;">' +
            '<font face="맑은 고딕"><br></font></p>');
    };
}
