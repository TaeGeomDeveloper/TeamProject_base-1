$(document).ready(function()
	{
	    var fontSizes = [ '8', '9', '10', '11', '12', '14','16', '18', '20', '22', '24', '28', '30', '36', '50', '72','100' ];
		var fontNames = [ '맑은 고딕', '궁서', '굴림체', '굴림', '바탕체', 'Arial', 'Arial Black','Comic Sans MS', 'Courier New' ];
		var lineHeights = ['0.2', '0.3', '0.4', '0.5', '0.6', '0.8', '1.0', '1.2', '1.4', '1.5', '2.0', '3.0'];
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
			lineHeights : lineHeights,
            //여기 부분이 이미지를 첨부하는 부분
            callbacks : {
                onImageUpload : function(files, editor, welEditable) {
                    for (var i = 0; i < files.length; i++) {
                        sendFile(files[i], this);
                    }
                }
            }
        };

        $('#cb_content').summernote(setting);
        $('#cb_content').summernote('fontName', '맑은 고딕');
		$('#cb_content').summernote('lineHeight', 0.5);
		$('#cb_content').summernote('code', '<p style="line-height: 0.5;"><font face="맑은 고딕">﻿</font></p>');

		$('#nb_content').summernote(setting);
		$('#nb_content').summernote('fontName', '맑은 고딕');
		$('#nb_content').summernote('lineHeight', 0.5);
		$('#nb_content').summernote('code', '<p style="line-height: 0.5;"><font face="맑은 고딕">﻿</font></p>');
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
