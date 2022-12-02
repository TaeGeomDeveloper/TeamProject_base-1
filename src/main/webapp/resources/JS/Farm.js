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
        document.getElementById("FruitPic").innerHTML = "<img src=\"/gwinongin/resources/image/FV/" + map.cd_idx + ".jpg\" width=\"300px\" height=\"300px\" style=\"border-radius: 20px\" >";

        // 상세 정보
        $('#nutrition').html(map.cd_nutritionEfficacy);
        $('#sowing').html(sowing);
        $('#harvest').html(harvest);
        $('#content2').html(map.cd_methodCultivation);
        $('#pest').html(map.cd_pest);
        $('#cd_marketValue').html(map.cd_marketValue+" 원");
        $('#cd_operatingCost').html("10a당 경영비[만 원] : "+map.cd_operatingCost);
        $('#cd_income').html("10a당 소득[만 원] : "+map.cd_income);

        document.getElementById("FVS").innerHTML = "<button type=\"button\" onclick=\"FVResult_Click()\" class=\"btn btn-success\">작물 최종 선택</button>";

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

$(document).ready(function () {
    var area0 = [
        "도 선택",
        "강원도",
        "경기도",
        "충청남도",
        "충청북도",
        "경상남도",
        "경상북도",
        "전라남도",
        "전라북도",
    ];
    var area1 = [
        "시 선택",
        "춘천시",
        "원주시",
        "강릉시",
        "동해시",
        "태백시",
        "속초시",
        "삼척시",
        "홍천시",
        "횡성시",
        "영월시",
        "평창시",
        "정선시",
        "철원시",
        "화천시",
        "양구시",
        "인제시",
        "고성시",
        "양양시",
    ];
    var area2 = [
        "시 선택",
        "수원시",
        "안양시",
        "안산시",
        "용인시",
        "부천시",
        "광명시",
        "평택시",
        "과천시",
        "오산시",
        "시흥시",
        "군포시",
        "의왕시",
        "하남시",
        "이천시",
        "안성시",
        "김포시",
        "화성시",
        "광주시",
        "여주시",
        "양평시",
        "고양시",
        "의정부",
        "동두천",
        "구리시",
        "남양주시",
        "파주시",
        "양주시",
        "포천시",
        "연천시",
        "가평시",
    ];
    var area3 = [
        "시 선택",
        "천안시",
        "공주시",
        "보령시",
        "아산시",
        "서산시",
        "논산시",
        "계룡시",
        "당진시",
        "금산군",
        "부여군",
        "서천군",
        "청양군",
        "홍성군",
        "예산군",
        "태안군",
    ];
    var area4 = [
        "시 선택",
        "청주시",
        "충주시",
        "제천시",
        "보은군",
        "옥천군",
        "영동군",
        "증평군",
        "진천군",
        "괴산군",
        "음성군",
        "단양군",
    ];
    var area5 = [
        "시 선택",
        "창원시",
        "진주시",
        "통영시",
        "사천시",
        "김해시",
        "밀양시",
        "거제시",
        "양산시",
        "의령군",
        "함안군",
        "창녕군",
        "고성군",
        "남해군",
        "하동군",
        "산청군",
        "함양군",
        "거창군",
        "합천군",
    ];
    var area6 = [
        "시 선택",
        "포항시",
        "경주시",
        "김천시",
        "안동시",
        "구미시",
        "영주시",
        "영천시",
        "상주시",
        "문경시",
        "경산시",
        "군위군",
        "의성군",
        "청송군",
        "영양군",
        "영덕군",
        "청도군",
        "고령군",
        "성주군",
        "칠곡군",
        "예천군",
        "봉화군",
        "울진군",
        "울릉군",
    ];
    var area7 = [
        "시 선택",
        "목포시",
        "여수시",
        "순천시",
        "나주시",
        "광양시",
        "담양군",
        "곡성군",
        "구례군",
        "고흥군",
        "보성군",
        "화순군",
        "장흥군",
        "강진군",
        "해남군",
        "영암군",
        "무안군",
        "함평군",
        "영광군",
        "장성군",
        "완도군",
        "진도군",
        "신안군",
    ];
    var area8 = [
        "시 선택",
        "전주시",
        "군산시",
        "익산시",
        "정읍시",
        "남원시",
        "김제시",
        "완주군",
        "진안군",
        "무주군",
        "장수군",
        "임실군",
        "순창군",
        "고창군",
        "부안군",
    ];

    // 시/도 선택 박스 초기화

    $("select[name^=msi_desiredArea]").each(function () {
        $msi_desiredArea = $(this);
        $.each(eval(area0), function () {
            $msi_desiredArea.append(
                "<option value='" + this + "'>" + this + "</option>"
            );
        });
        $msi_desiredArea.next().append("<option value=''>시 선택</option>");
    });

    // 시/도 선택시 구/군 설정

    $("select[name^=msi_desiredArea]").change(function () {
        var area =
            "area" + $("option", $(this)).index($("option:selected", $(this))); // 선택지역의 구군 Array
        var $msi_desiredAreaDetail = $(this).next(); // 선택영역 군구 객체
        $("option", $msi_desiredAreaDetail).remove(); // 구군 초기화

        if (area == "area0")
            $msi_desiredAreaDetail.append("<option value=''>시 선택</option>");
        else {
            $.each(eval(area), function () {
                $msi_desiredAreaDetail.append(
                    "<option value='" + this + "'>" + this + "</option>"
                );
            });
        }
    });

    $("#menu1").click(function () {
        $("#Info_menu1").slideDown("slow");
        $("#Info_menu2").slideUp("slow");
        $("#Info_menu3").slideUp("slow");
    });
    $("#menu2").click(function () {
        $("#Info_menu1").slideUp("slow");
        $("#Info_menu2").slideDown("slow");
        $("#Info_menu3").slideUp("slow");
    });
    $("#menu3").click(function () {
        $("#Info_menu1").slideUp("slow");
        $("#Info_menu2").slideUp("slow");
        $("#Info_menu3").slideDown("slow");
    });

    //console.log('in');
    $("#flip").on("click", function (event) {
        //alert(event.target.id);
        let memberId = $("#msi_id").val();
        let msi_id = $("#msi_id").val();
        let msi_memberName = $("#msi_memberName").val();
        let msi_memberAge = $("#msi_memberAge").val();
        let msi_memberGender = $("#msi_memberGender").val();
        let msi_desiredArea = $("#msi_desiredArea").val();
        let msi_desiredAreaDetail = $("#msi_desiredAreaDetail").val();
        let msi_desiredTimeSowing = $("#msi_desiredTimeSowing").val();
        let msi_desiredTimeSowingPart = $(
            "input:radio[name=msi_desiredTimeSowingPart]:checked"
        ).val();
        let msi_desiredHarvestTime = $("#msi_desiredHarvestTime").val();
        let msi_desiredHarvestTimePart = $(
            "input:radio[name=msi_desiredHarvestTimePart]:checked"
        ).val();
        let msi_cropClassification = $("#msi_cropClassification").val();
        let msi_cultivationMethod = $("#msi_cultivationMethod").val();
        let msi_farmingExperience = $("#msi_farmingExperience").val();
        let msi_hadMachinery = $("#msi_hadMachinery").val();
        // let msi_capital = $("#msi_capital").val();
        // let msi_holdingLand = $("#msi_holdingLand").val();

        let param = {
            msi_id: msi_id,
            msi_memberName: msi_memberName,
            msi_memberGender: msi_memberGender,
            msi_memberAge: msi_memberAge,
            msi_desiredArea: msi_desiredArea,
            msi_desiredAreaDetail: msi_desiredAreaDetail,
            msi_desiredTimeSowing: msi_desiredTimeSowing,
            msi_desiredTimeSowingPart: msi_desiredTimeSowingPart,
            msi_desiredHarvestTime: msi_desiredHarvestTime,
            msi_desiredHarvestTimePart: msi_desiredHarvestTimePart,
            msi_cropClassification: msi_cropClassification,
            msi_cultivationMethod: msi_cultivationMethod,
            msi_farmingExperience: msi_farmingExperience,
            msi_hadMachinery: msi_hadMachinery,
            // msi_capital: msi_capital,
            // msi_holdingLand: msi_holdingLand,
        };

        //alert(memberId);
        $.ajax({
            type: "get",
            dataType: "text",
            url: "./CropRecIdCheck.do",
            data: { msi_id: memberId },
            success: function (data, status) {
                //alert(data);
                if (data == "true") {
                    //$("#window").slideUp("slow");
                    alert(
                        "이미 동일 아이디로 입력하신 이력이 존재합니다. " +
                        "\n기존에 있던 이력을 삭제해주세요 *^^*"
                    );
                    const deleteData = confirm("기존에 있던 이력을 삭제 하시겠습니까?");
                    if (deleteData) {
                        $.ajax({
                            type: "POST",
                            dataType: "text",
                            url: "./DeleteSurvey.do",
                            data: {msi_id: memberId},
                            success: function (data, status) {
                                if(data=="false"){
                                    alert("삭제 완료");
                                    window.location.reload();
                                }
                            },
                            error: function (data, status) {
                                alert(data + status);
                            },
                        });
                    }
                } else {
                    $.ajax({
                        type: "POST",
                        url: "./FarmProcess.do",
                        // dataType: "text",
                        contentType: "application/json; charset=UTF-8",
                        dataType: "json",
                        data: JSON.stringify(param),
                        success: function (result) {
                            alert("성공!");
                            $("#window").slideDown("slow");
                            var table = "";

                            for (var i = 0; i < result.length; i++) {
                                var map = result[i];

                                var container = document.getElementById("hold-this");

                                function myFunction(map) {
                                    var el = document.createElement("div"),
                                        button = document.createElement("button");

                                    if (button != null) {
                                        button.innerHTML =
                                            '<button id="Fbtn" data-bs-toggle="modal" data-bs-target="#exampleModal">' +
                                            '<img id="FV" src="/gwinongin/resources/image/FV/' +
                                            map.cd_idx +
                                            '.jpg">' +
                                            "</button>";
                                    }

                                    button.onclick = function (e) {
                                        listener(e, map);
                                        FarmInfo(map);
                                        //Test(map);
                                    };
                                    el.appendChild(button);
                                    container.appendChild(el);
                                }

                                function listener(e, map) {
                                    //e.target.innerHTML = map.cd_cropName;
                                }

                                myFunction(map);
                            } // end for loop
                        }, // end function
                        error: function (data, status) {
                            // 실패시
                            alert(data + status);
                        },
                    });
                }
            },
            error: function (data, status) {
                alert("error" + status);
            },
            complete: function (xhr, status) {
                //alert(xhr.status);
            },
        });
    });
});

$("input").change(function () {
    let mpf_averagePrice = $("#mpf_averagePrice").val();
    let cd_operatingCost = $("#cd_operatingCost").val();
    let cd_income = $("#cd_income").val();
    let mso_holdingLand1 = $("#mso_holdingLand1").val();
    let mso_holdingLand2 = $("#mso_holdingLand2").val();
    let mso_holdingLand3 = $("#mso_holdingLand3").val();
    let result1 = mpf_averagePrice * mso_holdingLand1;
    let result2 = cd_operatingCost * mso_holdingLand2;
    let result3 = cd_income * mso_holdingLand3;
    // $("#price1") = result1;
    let lineTotal1 = $("input[name=price1]").attr("value", result1).val();
    let lineTotal2 = $("input[name=price2]").attr("value", result2).val();
    let lineTotal3 = $("input[name=price3]").attr("value", result3).val();
    const linetotals =
        Number(lineTotal3) - Number(Number(lineTotal1) + Number(lineTotal2));
    //console.log(linetotals);
    let subtotal = $("input[name=subtotal]").attr("value", linetotals);
    // console.log(mpf_averagePrice);
    // console.log(cd_operatingCost);
    // console.log(cd_income);
    console.log(mso_holdingLand1);
    console.log(mso_holdingLand2);
    console.log(mso_holdingLand3);
});