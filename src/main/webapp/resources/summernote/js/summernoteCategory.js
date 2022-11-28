$(document).ready(function(){
    $(".note-editing-area").on("click", function(){
        // let description = $("#description").remove();
    });
});

function category() {
    let cb_category = $("#cb_category").val();

    if(cb_category == "일반"){
        $('#cb_content').summernote('code', '<p style="line-height: 0.5;"><span style="font-family: &quot;맑은 고딕&quot;;">﻿</span><br></p>');
    };

    if(cb_category == "정보"){
        $('#cb_content').summernote('code',
            '<p id="description" style="line-height: 0.5;"><font face="맑은 고딕" color="#9c9c94">' +
            '<b style="">&lt;게시판 양식은 자유롭게 수정하실 수 있지만 주제에 벗어난 글은 삭제 처리될 수 있습니다&gt;</b>' +
            '</font></p><p style="line-height: 0.5;"><font face="맑은 고딕">안녕하세요</font></p>');
    };

    if(cb_category == "나눔"){
        $('#cb_content').summernote('code',
            '<p id="description" style="line-height: 0.5;"><font face="맑은 고딕" color="#9c9c94">' +
            '<b style="">&lt;게시판 양식은 자유롭게 수정하실 수 있지만 주제에 벗어난 글은 삭제 처리될 수 있습니다&gt;</b>' +
            '</font></p><p style="line-height: 0.5;"><font face="맑은 고딕">안녕하세요</font></p>');
    };

    if(cb_category == "질문"){
        $('#cb_content').summernote('code',
            '<p id="description" style="line-height: 0.5;"><font face="맑은 고딕" color="#9c9c94">' +
            '<b style="">&lt;게시판 양식은 자유롭게 수정하실 수 있지만 주제에 벗어난 글은 삭제 처리될 수 있습니다&gt;</b>' +
            '</font></p><p style="line-height: 0.5;"><font face="맑은 고딕">안녕하세요</font></p>');
    };
}
