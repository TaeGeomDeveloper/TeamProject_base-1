// 차트
google.charts.load('current', {'packages': ['corechart']});
google.charts.setOnLoadCallback(drawChart);

function drawChart() {
    var data = google.visualization.arrayToDataTable([
        ['Element', 'Density', {role: 'style'}],
        ['Copper', 8.94, '#b87333'],            // RGB value
        ['Silver', 10.49, 'silver'],            // English color name
        ['Gold', 19.30, 'gold'],

        ['Platinum', 21.45, 'color: #e5e4e2'], // CSS-style declaration
    ]);


    var options = {
        title: 'World Wide Wine Production'
    };

    var chart = new google.visualization.ColumnChart(document.getElementById('myChart'));
    chart.draw(data, options);
}

// PDF
function PDF_popup() {
    //${contextPath}/resources/PDF/Pdf1.jsp
    var pop = window.open("/smartfarm/resources/PDF/Pdf1.jsp", "pop", "width=600,height=800, scrollbars=yes, resizable=yes");
}

// 작물 정보
function FarmInfo(map) {

    $(document).ready(function () {
        <!-- Modal Test-->
        var textTest = "";
        var cropName = "";
        var sowing = "";
        var harvest = "";

        // textTest += "<br>번호 : " + map.cd_idx;
        // textTest += "<br>이름 : " + map.cd_cropName;
        // $('#TestForm').html(textTest);

        // 기본 정보
        //document.getElementById("Fruit_Title").innerHTML = obj.cd_cropName;
        sowing += "파종시기 : "+ map.cd_sowingStart + map.cd_sowingSemiannual;
        harvest += "수학 시작 시점 : " + map.cd_harvestStart + map.cd_harvestSemiannual + "<br>" +"수학 종료 시점 : " + map.cd_harvestEnd;

        cropName += map.cd_cropName;
        $('#Fruit_Title').html(cropName);
        $('#SmallInfo').html(map.cd_basicInformation);
        document.getElementById("FruitPic").innerHTML = "<img src=\"/smartfarm/resources/image/FV/" + map.cd_idx + ".jpg\" width=\"300px\" height=\"300px\" style=\"border-radius: 20px\" >";

        // 상세 정보
        $('#nutrition').html(map.cd_nutritionEfficacy);
        $('#sowing').html(sowing);
        $('#harvest').html(harvest);
        $('#content2').html(map.cd_methodCultivation);
        $('#pest').html(map.cd_pest);

        document.getElementById("FVS").innerHTML = "  <a href=\"/smartfarm/service/FarmInfo.do?cd_idx="+map.cd_idx+"\">\n" +
            "                                            <button type=\"button\" class=\"btn btn-success\">작물 최종 선택</button>\n" +
            "                                        </a>";

        //             document.getElementById("content1").innerHTML = data[number].content;

        //             document.getElementById("SmallInfo").innerHTML = data[number].SmallInfo;
        //
        //             // 재배 기술
        //             document.getElementById("FruitPic2").innerHTML = "<img src=\"/smartfarm/resources/image/method/Fruit" + (number + 1) + ".jpg\" width=\"300px\" height=\"300px\" style=\"border-radius: 20px\" >";
        //             document.getElementById("level").innerHTML = "재배 난이도 : " + data[number].rating + "<br/>";
        //             document.getElementById("Fruit_Title2").innerHTML = data[number].name;
        //
        //             document.getElementById("content2").innerHTML = data[number].content2 + "<br/>";
        //             document.getElementById("content3").innerHTML = "현재 시세 : " + data[number].price;

    });
}

function fn_clcik2(number) {
    var display = document.getElementById("Information2");

    if (display.style.display == "none") {
        display.style.display = "block";
    } else {
        display.style.display = "none";
    }

    $.ajax({
        url: "/smartfarm/resources/JSON/Farm2.json",
        dataType: "json",
        success: function (data) {
            if (data.length > 0) {
                document.getElementById("content4").innerHTML = data[number].name + "<br/>"
                    + data[number].content;
                document.getElementById("FruitPic").innerHTML = "<img src=\"smartfarm/resources/image/과일/과일" + (number + 1) + ".jpg\" width=\"300px\" height=\"300px\" style=\"border-radius: 20px\" >";
                document.getElementById("FruitPic2").innerHTML = "<img src=\"smartfarm/resources/image/method/Fruit" + (number + 1) + ".jpg\" width=\"300px\" height=\"300px\" style=\"border-radius: 20px\" >";


                document.getElementById("content5").innerHTML = "재배 난이도 : " + data[number].rating + "<br/>";
                document.getElementById("content6").innerHTML = "현재 시세 : " + data[number].price;

            }
        },
        error: function (data, status) {
        },
        complete: function (data, status) {
        }
    }); // ajax end
}