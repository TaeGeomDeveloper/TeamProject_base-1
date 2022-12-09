<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  작성자 : 윤태검

  일시 : 2022-11-17
  내용 : 회원 가입 화면 수정.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>Main</title>

    <!-- 스타일시트 연결 -->
    <script src="http://code.jquery.com/jquery-latest.js"></script>

    <%-- 폰트 --%>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Jua&display=swap');
    </style>
    <!-- 스타일시트 연결 -->
    <link rel="stylesheet" href="${contextPath}/resources/CSS/addrlinkSample.css" type="text/css"/>

    <script language="javascript">
        function goPopup() {
            // 주소검색을 수행할 팝업 페이지를 호출합니다.
            // 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://business.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
            var pop = (window.open("${contextPath}/resources/jusoPopup.jsp", "pop", "width=570,height=420, scrollbars=yes, resizable=yes"));

            // 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://business.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
            //var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes");
        }

        function jusoCallBack(roadFullAddr, mi_address, mi_addressDetail, roadAddrPart2, engAddr, jibunAddr, mi_addressCode) {
            // 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
            document.SendPerson.roadFullAddr.value = roadFullAddr;
            document.SendPerson.mi_address.value = mi_address;
            document.SendPerson.roadAddrPart2.value = roadAddrPart2;
            document.SendPerson.mi_addressDetail.value = mi_addressDetail;
            document.SendPerson.engAddr.value = engAddr;
            document.SendPerson.jibunAddr.value = jibunAddr;
            document.SendPerson.mi_addressCode.value = mi_addressCode;
        }
    </script>

    <script>
        let idCheckYN = "N";
        let phoneCheckYN = "N";
        $(document).ready(function () {
            //console.log('in');
            $('#idCheck').on('click', function (event) {
                //alert(event.target.id);
                let memberId = $('#mi_id').val();
                let idCheck = /^[A-Za-z0-9]{6,12}$/;
                console.log(idCheckYN);
                //alert(memberId);
                $.ajax({
                    type : 'get',
                    dataType : 'text',
                    url : "${contextPath}/member/idCheck.do",
                    data : {mi_id : memberId},
                    success : function (data, status) {
                        //alert(data);
                        if(memberId == ""){
                            alert("아이디를 입력해주세요");
                            memberId.focus();
                            idCheckYN = "N"
                        }
                        if(!idCheck.test(memberId)){
                            $("#unrightId").css('display', 'inline-block');
                            $('#unrightId').html("사용할 수 없는 아이디 입니다.")
                            $("#rightId").css('display', 'none');
                            $('#mi_id').val("");
                            $('#mi_id').focus();
                            idCheckYN = "N"
                        }
                        if(data=='true'){
                            $("#unrightId").css('display', 'inline-block');
                            $('#unrightId').html("중복된 아이디 입니다.")
                            $("#rightId").css('display', 'none');
                            $('#mi_id').val("");
                            $('#mi_id').focus();
                            idCheckYN = "N"
                        }
                        if(idCheck.test(memberId)){
                            $("#rightId").css('display', 'inline-block');
                            $('#rightId').html("사용할 수 있는 아이디 입니다.")
                            $("#unrightId").css('display', 'none');
                            $('#isIdCheck').val('true');
                            idCheckYN = "Y"
                        }
                        console.log("idCheckYN :"+idCheckYN);
                    },
                    error : function (data, status){
                        alert('error'+status);
                    },
                    complete : function (xhr, status){
                        //alert(xhr.status);
                    }
                });
            });

            // $('#validate').on('click', function (event){
            //     let temp = $('#isIdCheck').val();
            //     if(temp!=null){
            //         alert('ID 중복체크를 해주세요');
            //         event.preventDefault();
            //     }else{
            //         $('#frm').action = '/smartfarm/Main.do';
            //         $('#frm').submit();
            //         alert('환영합니다^^');
            //     }
            // });
        });

        $(function () {
            $("#sendSMS").click(function () {
                const submitPop = document.getElementById("submitPop");
                submitPop.style.display = 'inline-block';
                let phoneNum = $("#mi_phone").val();
                let phoneNum1 = $("#mi_phone1").val();
                let phoneNum2 = $("#mi_phone2").val();
                let sendNumber = phoneNum+phoneNum1+phoneNum2;
                if(sendNumber=="010"){
                    alert("휴대폰 번호가 올바르지 않습니다.");
                    phoneCheckYN = "N";
                }else if(phoneNum1=="") {
                    alert("휴대폰 번호가 올바르지 않습니다.");
                    phoneCheckYN = "N";
                }else if(phoneNum2==""){
                    alert("휴대폰 번호가 올바르지 않습니다.");
                    phoneCheckYN = "N";
                }else{
                    $.ajax({
                        type: "get",
                        dataType: "text",
                        url: "${contextPath}/member/phoneCheck.do",
                        data: {mi_phone : sendNumber},
                        success: function (data, status){
                            if(data=='true'){
                                alert("이미 회원가입 된 전화번호 입니다.");
                                submitPop.style = "display:none";
                            }else{
                                $.ajax({
                                    type: "POST",
                                    url: "${contextPath}/member/sendSMS.do",
                                    data: {to : sendNumber},
                                    cache: false,
                                    success: function (data){
                                        submitPop.innerHTML = "인증번호 발송이 완료되었습니다. 혹시 인증번호가 오지 않는다면 재발송 해주십시오.";
                                        //alert("전송 완료");
                                        code2 = data;
                                    }
                                }); //인증번호 전송
                            }
                        },
                        error: function (data, status){
                            alert(data+status);
                        }
                    }); // 휴대전화 번호 중복 체크
                }
            });

            $("#checkQualifiedNumber").click(function () {
                const validate = document.getElementById("validate")
                if ($("#authNum").val() == "") {
                    alert("인증 실패");
                    phoneCheckYN = "N";
                    console.log("phoneCheckYN "+phoneCheckYN);
                }
                if ($("#authNum").val() == code2) {
                    alert("인증 성공");
                    phoneCheckYN = "Y";
                    console.log("phoneCheckYN "+phoneCheckYN);
                } else {
                    alert("인증 실패");
                    phoneCheckYN = "N";
                    console.log("phoneCheckYN "+phoneCheckYN);
                }
            })
        })
        $(document).focusout(function () {
            var pwd1 = $("#password_1").val();
            var pwd2 = $("#password_2").val();

            if ( pwd1 != '' && pwd2 == '' ) {
                null;
            } else if (pwd1 != "" || pwd2 != "") {
                if (pwd1 == pwd2) {
                    $("#success").css('display', 'inline-block');
                    $('#success').html("비밀번호가 일치합니다");
                    $("#fail").css('display', 'none');
                } else {
                    $("#success").css('display', 'none');
                    $("#fail").css('display', 'inline-block');
                    $('#fail').html("비밀번호가 일치하지 않습니다. 비밀번호를 재확인 해주세요.")
                }
            }
        });

        function joinform_check() {

            var SendPerson = document.SendPerson;
            var re = /^[a-zA-Z0-9]{4,12}$/ // 아이디와 패스워드가 적합한지 검사할 정규식
            var re2 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
            var arrNum1 = new Array(); // 주민번호 앞자리숫자 6개를 담을 배열
            var arrNum2 = new Array(); // 주민번호 뒷자리숫자 7개를 담을 배열

            let id = $("#mi_id").val();
            let password1 = $("#password_1").val();
            let password2 = $("#password_2").val();
            let name = $("#mi_name").val();
            let regNum1 = document.getElementById("regNum1");
            let regNum2 = document.getElementById("regNum2");
            let address = $("#mi_address").val();
            let addressCode = $("#mi_addressCode").val();
            let addressDetail = $("#mi_addressDetail").val();
            let mi_phone = $("#mi_phone").val()
            let mi_phone_1 = $("#mi_phone1").val()
            let mi_phone_2 = $("#mi_phone2").val();
            let authNum = $("#authNum").val();
            let email = $("#mi_email").val();
            let emailAddress = $("#mi_email1").val();
            console.log(id);
            console.log(password1);
            console.log(password2);
            console.log(name);
            console.log(regNum1);
            console.log(regNum2);
            console.log(address);
            console.log(addressCode);
            console.log(addressDetail);
            console.log(mi_phone);
            console.log(mi_phone_1);
            console.log(mi_phone_2);
            console.log(authNum);
            console.log(email);
            console.log(emailAddress);
            if (id == "") {
                alert("아이디를 입력해주세요");
                id.focus();
                return false;
            };

            // const idCheck = /^[A-Za-z0-9]{6,12}$/;
            // if (!idCheck.test(id)) {
            //     alert("아이디는 영문+숫자 조합으로 6~12자리 사용해야 합니다.");
            //     id.focus();
            //     return false;
            // }

            if(idCheckYN=="N"){
                alert("아이디 중복체크를 해주세요");
                return false;
            }

            if(phoneCheckYN=="N"){
                alert("인증번호를 확인해주세요.");
                return false;
            }

            if (password1 == "") {
                alert("비밀번호를 입력해주세요");
                password1.focus();
                return false;
            }

            if (password2 == "") {
                alert("비밀번호를 확인 해주세요");
                password2.focus();
                return false;
            }

            if(password1!=password2){
                alert("비밀번호가 일치하지 않습니다.");
                password1.focus();
                password2.focus();
                return false;
            }

            const pwdCheck = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/;
            if (!pwdCheck.test(password1)) {
                alert("비밀번호는 영문자+숫자+특수문자 조합으로 8자리 이상 사용해야 합니다.");
                password1.focus();
                return false;
            }

            if (name == "") {
                alert("이름을 입력해주세요");
                name.focus();
                return false;
            }

            if (regNum1 == "", regNum2 == "") {
                alert("주민등록번호를 입력해주세요");
                regNum1.focus();
                regNum2.focus();
                return false;
            }



            // for (let i=0; i<regNum1.value.length; i++) {
            //     arrNum1[i] = regNum1.value.charAt(i);
            // } // 주민번호 앞자리를 배열에 순서대로 담는다.
            //
            // for (let i=0; i<regNum2.value.length; i++) {
            //     arrNum2[i] = regNum2.value.charAt(i);
            // } // 주민번호 뒷자리를 배열에 순서대로 담는다.
            //
            // let tempSum=0;
            //
            // for (let i=0; i<regNum1.value.length; i++) {
            //     tempSum += arrNum1[i] * (2+i);
            // } // 주민번호 검사방법을 적용하여 앞 번호를 모두 계산하여 더함
            //
            // for (let i=0; i<regNum2.value.length-1; i++) {
            //     if(i>=2) {
            //         tempSum += arrNum2[i] * i;
            //     }
            //     else {
            //         tempSum += arrNum2[i] * (8+i);
            //     }
            // } // 같은방식으로 앞 번호 계산한것의 합에 뒷번호 계산한것을 모두 더함
            //
            // if((11-(tempSum%11))%10!=arrNum2[6]) {
            //     alert("올바른 주민번호가 아닙니다.");
            //     regNum1.value = "";
            //     regNum2.value = "";
            //     regNum1.focus();
            //     return false;
            // }
            if (address == "", addressDetail == "", addressCode == "") {
                alert("주소 관련 항목들을 입력해주세요");
                address.focus();
                addressDetail.focus();
                addressCode.focus();
                return false;
            }

            if (mi_phone == "010", mi_phone_1=="", mi_phone_2=="") {
                alert("휴대전화를 입력해주세요");
                mi_phone.focus();
                mi_phone_1.focus();
                mi_phone_2.focus();
                return false;
            }

            if (authNum == "") {
                alert("인증번호를 입력해주세요");
                authNum.focus();
                return false;
            }

            if (email == "") {
                alert("이메일을 입력해주세요");
                email.focus();
                return false;
            }

            if (emailAddress == "none") {
                alert("이메일 주소를 입력해주세요");
                emailAddress.focus();
                return false;
            }

            SendPerson.method = "post";
            SendPerson.action = "./registProcess.do";
            SendPerson.submit();
        }

        $(document).focusout(function () {
            let pwdCheck = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/;
            let password1 = $("#password_1").val();

            if (password1 != '') {
                null;
            }

            if (pwdCheck.test(password1)) {
                $("#rightPwd").css('display', 'inline-block');
                $('#rightPwd').html("적합");
                $("#unrightPwd").css('display', 'none');
            } else {
                $("#rightPwd").css('display', 'none');
                $("#unrightPwd").css('display', 'inline-block');
                $('#unrightPwd').html("부적합")
            }

        });

        window.onload = function() {
            // 도메인 직접 입력 or domain option 선택
            const domainListEl = document.querySelector('#domain_list')
            const domainInputEl = document.querySelector('#mi_email1')
            // select 옵션 변경 시
            domainListEl.addEventListener('change', (event) => {
                // option에 있는 도메인 선택 시
                if(event.target.value !== "type") {
                    // 선택한 도메인을 input에 입력하고 disabled
                    domainInputEl.value = event.target.value
                    domainInputEl.disabled = true
                } else { // 직접 입력 시
                    // input 내용 초기화 & 입력 가능하도록 변경
                    domainInputEl.value = ""
                    domainInputEl.disabled = false
                }
            })
        }
    </script>

    <style>
        .form-control {
            width: 200px;
        }

        th {
            text-align: center;
            background: #aeed9d;
            border-radius: 100px;
            max-width: 100px;
            min-width: 100px;
        }

        #BG {
            position: absolute;
            z-index: 1;
        }

        body {
            position: relative;
        }

        #MB {
            width: 100%;
            position: absolute;
            z-index: 2;
        }

        #footer{
            bottom: -1000px;
        }

    </style>


</head>
<body>

<%--몸통--%>
<section>
    <article>
        <div id="Main_Box" align="center" style="padding: 0px;">
            <div id="MB">
                <h1 style="font-size: 60px; margin-top: 50px"> 회원가입 </h1>
                <form name="SendPerson"
                      style=" width: 60%;padding: 20px; margin-bottom: 20px; margin-top: 20px;">
                    <input type="hidden" name="" id="isIdCheck" value="false">
                    <table>
                        <tr>
                            <th>ID</th>
                            <td class="d-flex p-2">
                                <input class="form-control form-control" type="text" name="mi_id" id="mi_id"
                                       maxlength="12"
                                       oninput="this.value = this.value.replace(/[^A-Za-z0-9]/g, '').replace(/(\..*)\./g, '$1');">
                                <input type="button" class="button" name="id_check" value="중복확인" id="idCheck">
                                <span id="rightId" style="display: none; color:green"></span>
                                <span id="unrightId" style="display: none; color:red"></span>
                                <span style="font-size: 10pt;">아이디는 영문+숫자 조합으로 6~12자리 사용해야 합니다.</span>
                            </td>
                        </tr>
                        <tr>
                            <th>PWD</th>
                            <td class="d-flex p-2">
                                <input class="form-control form-control" type="password" name="mi_password"
                                       id="password_1">
                                <span id="rightPwd" style="display: none; color:green"></span>
                                <span id="unrightPwd" style="display: none; color:red"></span>
                                <span style="font-size: 10pt;">비밀번호는 8자 이상이어야 하며, 숫자/소문자/특수문자를 모두 포함해야 합니다.</span>
                            </td>
                        </tr>
                        <tr>
                            <th>비밀번호 확인</th>
                            <td>
                                <input class="form-control form-control" type="password" id="password_2">
                                <span id="success" style="display: none;"></span>
                                <span id="fail" style="display: none; color: red"></span>
                            </td>
                        </tr>
                        <tr>
                            <th>이름</th>
                            <td><input class="form-control form-control" type="text" name="mi_name" id="mi_name"></td>
                        </tr>
                        <tr>
                            <th>주민등록번호</th>
                            <td class="d-flex p-2"><input class="form-control form-control" type="text"
                                                          oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"
                                                          name="mi_regidentRegNumber" id="regNum1" maxlength="6"><span
                                    style="font-size: 20pt;"> - </span>
                                <input class="form-control form-control" type="password"
                                       oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"
                                       name="mi_regidentRegNumber" id="regNum2" maxlength="7">
                            </td>
                        </tr>
                        <div id="callBackDiv">
                            <input type="hidden" style="width:500px;" id="roadFullAddr" name="roadFullAddr"/>
                            <tr>
                                <th>도로명주소</th>
                                <td class="d-flex p-2"><input class="form-control form-control" type="text"
                                                              style="width:500px;" id="mi_address" name="mi_address"
                                                              readonly="readonly"/>
                                    <button class="button" type="button" onClick="goPopup();">주소 찾기</button>
                                </td>
                            </tr>
                            <tr>
                                <th>상세주소</th>
                                <td><input class="form-control form-control" type="text" style="width:500px;"
                                           id="mi_addressDetail" name="mi_addressDetail" readonly="readonly"/></td>
                            </tr>
                            <input type="hidden" style="width:500px;" id="roadAddrPart2" name="roadAddrPart2"/>
                            <input type="hidden" style="width:500px;" id="engAddr" name="engAddr"/>
                            <input type="hidden" style="width:500px;" id="jibunAddr" name="jibunAddr"/>
                            <tr>
                                <th>우편번호</th>
                                <td><input class="form-control form-control" type="text" style="width:100px;"
                                           id="mi_addressCode" name="mi_addressCode" readonly="readonly"/></td>
                            </tr>
                        </div>
                        <tr>
                            <th>휴대전화</th>
                            <td class="d-flex p-2">
                                <select class="form-select" style="width: 100px" name="mi_phone" id="mi_phone">
                                    <option value="010" selected="selected">010</option>
                                </select><span style="font-size: 20pt;"> - </span>
                                <input class="form-control form-control" style="width:100px;" type="text"
                                       name="mi_phone" id="mi_phone1" maxlength="4"
                                       oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"/>
                                <span style="font-size: 20pt;"> - </span>
                                <input class="form-control form-control" style="width:100px;" type="text"
                                       name="mi_phone" id="mi_phone2" maxlength="4"
                                       oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"/>
                                <input type="button"
                                       id="sendSMS"
                                       class="button"
                                       value="인증번호 받기"/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            <span id="submitPop" style="display: none; color: lightgray">

                            </span>
                            </td>
                        </tr>
                        <tr>
                            <th>인증 번호</th>
                            <td><input type="text" id="authNum" placeholder="인증 번호를 입력하세요">
                                <input type="button" value="확인" class="button" id="checkQualifiedNumber">
                            </td>
                        </tr>
                        <tr>
                            <th>일반전화</th>
                            <td class="d-flex p-2">
                                <select class="form-select" style="width: 100px" name="mi_wireline" id="mi_wireline">
                                    <option selected="selected" value="none">선택</option>
                                    <option value="031">031</option>
                                    <option value="032">032</option>
                                    <option value="033">033</option>
                                    <option value="041">041</option>
                                    <option value="042">042</option>
                                    <option value="043">043</option>
                                    <option value="044">044</option>
                                    <option value="051">051</option>
                                    <option value="052">052</option>
                                    <option value="053">053</option>
                                    <option value="054">054</option>
                                    <option value="055">055</option>
                                    <option value="061">061</option>
                                    <option value="062">062</option>
                                    <option value="063">063</option>
                                    <option value="064">064</option>
                                </select><span style="font-size: 20pt;"> - </span>
                                <input class="form-control form-control" style="width:100px;" type="text"
                                       name="mi_wireline" id="mi_wireline1" maxlength="3"
                                       oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"/><span
                                    style="font-size: 20pt;"> - </span>
                                <input class="form-control form-control" style="width:100px;" type="text"
                                       name="mi_wireline" id="mi_wireline2" maxlength="4"
                                       oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"/>
                            </td>
                        </tr>
                        <tr>
                            <th>이메일주소</th>
                            <td class="d-flex p-2">
                                <input class="form-control form-control" type="text" name="mi_email" id="mi_email"
                                       oninput="this.value = this.value.replace(/[^A-Za-z0-9]/g, '').replace(/(\..*)\./g, '$1');"><span
                                    style="font-size: 20pt;"> @ </span>
                                <input class="form-control form-control" type="text" name="mi_email1" id="mi_email1" />
                                <select class="form-select" style="width: 200px" name="domain_list" id="domain_list">
                                    <option value="type" selected="selected">직접입력</option>
                                    <option value="naver.com">naver.com</option>
                                    <option value="daum.net">daum.net</option>
                                    <option value="gmail.com">gmail.com</option>
                                    <option value="nate.com">nate.com</option>
                                </select>

                            </td>
                        </tr>
                        <tr>
                            <td><input type="hidden" name="mi_joinDate"></td>
                        </tr>
                    </table>
                    <button class="button2" type="button" onclick="joinform_check();" id="validate">가입 하기</button>
                </form>
            </div>

        </div>
        <div id="BG">
            <img src="${contextPath}/resources/image/background/배경.jpg" alt="배경" style="height: 100%; width: 100%;opacity: 0.5">
        </div>

    </article>
</section>

</body>
</html>
