const API_KEY = "Qw6IqpBRoB%2FU5ikhIgG0SUDoPWZOe9dbP0LcM6htOLtgjm1IZUjiP92272R%2BTtx5ihlkEMyaHMk6LPlDc37x3Q%3D%3D"

$(document).ready(function () {

    var area0 = [
        "시 선택",
        "진주시",
        "통영시",
        "사천시",
        "김해시",
        "밀양시",
        "거제시",
        "양산시",
        "의령군",
        ];
    var area1 = [
        "애호박",
        "쥬키니",
        "오이",
        "붉은고추",
        "배",
        "단감",
    ];
    var area2 = [
        "참다래",
        "고구마",
    ];
    var area3 = [
        "참다래",
        "마늘",
        "단감",
        "녹두",
    ];
    var area4 = [
        "오이",
        "봄 배추",
        "봄 대파",
        "봄 당근",
        "단감",
    ];
    var area5 = [
        "봄 당근",
        "단감",
        "깻잎",
        "봄 감자",
    ];
    var area6 = [
        "캠벨얼리",
        "고구마",
    ];
    var area7 = [
        "봄 당근",
        "겨울 당근",
    ];
    var area8 = [
        "고구마",
        "양파",
        "봄 배추",
    ];

    // 선택 박스 초기화

    $("select[name^=AREA_ID]").each(function () {
        $AREA_ID = $(this);

        var A_ID = [
          "4811000000",
          "4817000000",
          "4822000000",
          "4824000000",
          "4825000000",
          "4827000000",
          "4831000000",
          "4833000000",
          "4872000000",
        ];

        var item = 0;
        $.each(eval(area0), function () {
            $AREA_ID.append(
                "<option value='" + A_ID[item] + "'>" + this + "</option>"
            );
            item++;
        });
        $AREA_ID.next().append("<option value=''>작물 선택</option>");
    });

    // 선택시 작물 설정
    var crop_id = [
        [],
        [
            "PA360101",
            "PA360201",
            "PA280201",
            "PA190101",
            "PA160101",
            "PA070101",
        ],
        [
            "PA310101",
            "PA040101",
        ],
        [
            "PA310101",
            "PA120301",
            "PA070101",
            "PA060101",
        ],
        [
            "PA280201",
            "PA240101",
            "PA090101",
            "PA080101",
            "PA070101",
        ],
        [
            "PA080101",
            "PA070101",
            "PA050101",
            "PA020101",
        ],
        [
            "PA340101",
            "PA040101",
        ],
        [
            "PA080101",
            "PA080301",
        ],
        [
            "PA040101",
            "PA250201",
            "PA170201",
        ]
    ];

    $("select[name^=AREA_ID]").change(function () {
        var area =
            "area" + $("option", $(this)).index($("option:selected", $(this))); // 선택지역의 Array
        var $PA_CROP_SPE_ID = $(this).next(); // 선택영역 객체
        $("option", $PA_CROP_SPE_ID).remove(); // 초기화

        var idx = $("option", $(this)).index($("option:selected", $(this)));
        if (area == "area0")
            $PA_CROP_SPE_ID.append("<option value=''>시 선택</option>");
        else {
            var item = 0;
            $.each(eval(area), function () {
                $PA_CROP_SPE_ID.append(
                    "<option value='" + crop_id[idx][item] + "'>" + this + "</option>"
                );
                item++;
            });
        }
    });
});


$(document).ready(function () {

    $("#WT").on("click", function (event) {
        var Day = $("#Day").val();
        var AREA_ID = $("#AREA_ID").val();
        var PA_CROP_SPE_ID = $("#PA_CROP_SPE_ID").val();

        var xhr = new XMLHttpRequest();
        var url = 'http://apis.data.go.kr/1360000/FmlandWthrInfoService/getDayStatistics'; /*URL*/
        var queryParams = '?' + encodeURIComponent('serviceKey') + '=' + API_KEY; /*Service Key*/
        queryParams += '&' + encodeURIComponent('pageNo') + '=' + encodeURIComponent('1'); /*페이지 번호*/
        queryParams += '&' + encodeURIComponent('numOfRows') + '=' + encodeURIComponent('10'); /*한 페이지 결과 수*/
        queryParams += '&' + encodeURIComponent('dataType') + '=' + encodeURIComponent('XML'); /*응답 자료 형식*/
        queryParams += '&' + encodeURIComponent('ST_YMD') + '=' + encodeURIComponent(Day); /*시작 연월일*/
        queryParams += '&' + encodeURIComponent('ED_YMD') + '=' + encodeURIComponent(Day); /*종료 연월일*/
        queryParams += '&' + encodeURIComponent('AREA_ID') + '=' + encodeURIComponent(AREA_ID); /*지역 아이디*/
        queryParams += '&' + encodeURIComponent('PA_CROP_SPE_ID') + '=' + encodeURIComponent(PA_CROP_SPE_ID); /*작물별 특성 아이디*/

        xhr.open('GET', url + queryParams);
        xhr.onreadystatechange = function () {
            if (this.readyState == 4) {
                //alert('Status: ' + this.status + 'nHeaders: ' + JSON.stringify(this.getAllResponseHeaders()) + 'nBody: ' + this.responseText);
                parseXML(this.responseXML);
            }

            function parseXML(xmlDOM) {
                var item = xmlDOM.getElementsByTagName("item");
                var table = "<table class=\"table table-dark table-sm\">";
                table += "<tr>";
                table += "<th>지역 이름</th>" + "<td>" + item[0].getElementsByTagName("areaName")[0].childNodes[0].nodeValue + "</td>";
                table += "<th>작물 명</th>" + "<td>" + item[0].getElementsByTagName("paCropName")[0].childNodes[0].nodeValue + "</td>";
                table += "<th>일 평균기온</th>" + "<td>" + item[0].getElementsByTagName("dayAvgTa")[0].childNodes[0].nodeValue + " C</td>";
                table += "<th>일 최고기온</th>" + "<td>" + item[0].getElementsByTagName("dayMaxTa")[0].childNodes[0].nodeValue + " C</td>";
                table += "<th>일 최저 기온</th>" + "<td>" + item[0].getElementsByTagName("dayMinTa")[0].childNodes[0].nodeValue + " C</td>";
                table += "</tr>";
                table += "<tr>";
                table += "<th>일 평균상대습도</th>" + "<td>" + item[0].getElementsByTagName("dayAvgRhm")[0].childNodes[0].nodeValue + " %</td>";
                table += "<th>일 평균최저상대습도</th>" + "<td>" + item[0].getElementsByTagName("dayMinRhm")[0].childNodes[0].nodeValue + " %</td>";
                table += "<th>일 강수량</th>" + "<td>" + item[0].getElementsByTagName("daySumRn")[0].childNodes[0].nodeValue + "</td>";
                table += "<th>일 평균풍속</th>" + "<td>" + item[0].getElementsByTagName("dayAvgWs")[0].childNodes[0].nodeValue + "</td>";
                table += "<th>일 누적일조시간</th>" + "<td>" + item[0].getElementsByTagName("daySumSs")[0].childNodes[0].nodeValue + "</td>";
                table += "</tr>";
                table += "</table>";

                document.getElementById('weatherBox').innerHTML = table;
            }
        };

        xhr.send('');
    });
});



