
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
    var pop = window.open("/gwinongin/resources/PDF/Pdf1.jsp", "pop", "width=600,height=800, scrollbars=yes, resizable=yes");
}

// 정보
function fn_click(number) {

    $(document).ready(function () {

        // 정렬
        $("#menu1").click(function () {
            $("#Info_menu1").slideDown("slow");
            $("#Info_menu2").slideUp("slow");
            $("#Info_menu3").slideUp("slow");
            $("#Info_menu4").slideUp("slow");
            $("#Info_menu5").slideUp("slow");
        });
        $("#menu2").click(function () {
            $("#Info_menu1").slideUp("slow");
            $("#Info_menu2").slideDown("slow");
            $("#Info_menu3").slideUp("slow");
            $("#Info_menu4").slideUp("slow");
            $("#Info_menu5").slideUp("slow");
        });
        $("#menu3").click(function () {
            $("#Info_menu1").slideUp("slow");
            $("#Info_menu2").slideUp("slow");
            $("#Info_menu3").slideDown("slow");
            $("#Info_menu4").slideUp("slow");
            $("#Info_menu5").slideUp("slow");
        });
        $("#menu4").click(function () {
            $("#Info_menu1").slideUp("slow");
            $("#Info_menu2").slideUp("slow");
            $("#Info_menu3").slideUp("slow");
            $("#Info_menu4").slideDown("slow");
            $("#Info_menu5").slideUp("slow");
        });
        $("#menu5").click(function () {
            $("#Info_menu1").slideUp("slow");
            $("#Info_menu2").slideUp("slow");
            $("#Info_menu3").slideUp("slow");
            $("#Info_menu4").slideUp("slow");
            $("#Info_menu5").slideDown("slow");
        });

        $.ajax({
            url: "/gwinongin/resources/JSON/Farm2.json",
            dataType: "json",
            success: function (data) {
                if (data.length > 0) {

                    // 기본 정보
                    document.getElementById("Fruit_Title").innerHTML = data[number].name;
                    document.getElementById("content1").innerHTML = data[number].content;
                    document.getElementById("FruitPic").innerHTML = "<img src=\"/gwinongin/resources/image/과일/과일" + (number + 1) + ".jpg\" width=\"300px\" height=\"300px\" style=\"border-radius: 20px\" >";
                    document.getElementById("SmallInfo").innerHTML = data[number].SmallInfo;

                    // 재배 기술
                    document.getElementById("FruitPic2").innerHTML = "<img src=\"/gwinongin/resources/image/method/Fruit" + (number + 1) + ".jpg\" width=\"300px\" height=\"300px\" style=\"border-radius: 20px\" >";
                    document.getElementById("level").innerHTML = "재배 난이도 : " + data[number].rating + "<br/>";
                    document.getElementById("Fruit_Title2").innerHTML = data[number].name;

                    document.getElementById("content2").innerHTML = data[number].content2 + "<br/>";
                    document.getElementById("content3").innerHTML = "현재 시세 : " + data[number].price;
                }
            },
            error: function (data, status) {
            },
            complete: function (data, status) {
            }
        }); // ajax end
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
        url: "/gwinongin/resources/JSON/Farm2.json",
        dataType: "json",
        success: function (data) {
            if (data.length > 0) {
                document.getElementById("content4").innerHTML = data[number].name + "<br/>"
                    + data[number].content;
                document.getElementById("FruitPic").innerHTML = "<img src=\"gwinongin/resources/image/과일/과일" + (number + 1) + ".jpg\" width=\"300px\" height=\"300px\" style=\"border-radius: 20px\" >";
                document.getElementById("FruitPic2").innerHTML = "<img src=\"gwinongin/resources/image/method/Fruit" + (number + 1) + ".jpg\" width=\"300px\" height=\"300px\" style=\"border-radius: 20px\" >";


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