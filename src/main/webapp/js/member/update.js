var updatepwdRegex = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[!@#$%^&*])[a-zA-Z\d!@#$%^&*]{8,100}$/; // 비밀번호는 8자 이상
// 비밀번호 검증
$('#updatepwd').focusout(function() {
    var updatepwdValue = $('#updatepwd').val();
    $('#updatepwdDiv').empty();
    
    if (!updatepwdRegex.test(updatepwdValue)) {
        $('#updatepwdDiv').html('비밀번호는 영문, 숫자, 특수문자 포함 8자 이상, 100자 이내로 입력하세요.').css('color', 'red');
    } else {
        $('#updatepwdDiv').html('사용 가능한 비밀번호입니다.').css('color', 'blue');
    }
});

//이메일
function change() {
	document.getElementById("updateemail2").value = document.getElementById("updateemail3").value;
}


// 회원정보 수정
$(document).ready(function() {
    $('#updatebutton').click(function(){
        $('#updatenameDiv').html("");
        $('#updatepwdDiv').html("");
        $('#updateemailDiv').html("");
        $('#updatetelDiv').html("");
        $('#updateaddrDiv').html("");

        var pwdValue = $('#updatepwd').val();
        var repwdValue = $('#updaterepwd').val();
        var email1 = $('#updateemil1').val();
        var email2 = $('#updateemail2').val();
        var tel2 = $('#updatetel2').val();
        var tel3 = $('#updatetel3').val();
        var zipcode = $('#updatezipcode').val();
        var addr1 = $('#updateaddr1').val();
        var addr2 = $('#updateaddr2').val();

        // 이름 확인
        if ($('#updatename').val() == "") {
            $('#updatenameDiv').html("이름을 입력하세요.").css("color" ,"red");
            return;
        }
        // 비밀번호 확인
        if (pwdValue == "") {
            $('#updatepwdDiv').html("비밀번호를 입력하세요.").css("color" ,"red");
            return;
        } else if (!pwdRegex.test(pwdValue)) {
            $('#updatepwdDiv').html("비밀번호는 영문, 숫자, 특수문자 포함 8자 이상, 100자 이내로 입력하세요.").css("color" ,"red");
            return;
        }

        // 비밀번호 재확인
        if (pwdValue != repwdValue) {
            $('#updatepwdDiv').html("비밀번호가 맞지 않습니다.").css("color" ,"red");
            return;
        }

        // 이메일 확인
        if (email1 == "" || email2 == "") {
            $('#updateemailDiv').html("이메일을 입력하세요.").css("color" ,"red");
            return;
        }

        // 전화번호 확인
        if (tel2 == "" || tel3 == "") {
            $('#updatetelDiv').html("휴대전화 번호를 정확히 입력하세요.").css("color" ,"red");
            return;
        }

        // 주소 확인
        if (zipcode == "" || addr1 == "" || addr2 == "") {
            $('#updateaddrDiv').html("주소를 모두 입력하세요.").css("color" ,"red");
            return;
        }

        // 모든 조건이 통과하면 서버로 데이터 전송
        $.ajax({
            type: 'post',
            url: '/Inbeomstagram/member/update.do',
            data: $('#updateForm').serialize(),
            success: function() {
                alert('회원정보가 성공적으로 수정되었습니다.');
                location.href = '/Inbeomstagram/index.jsp';
            },
            error: function(e) {
                console.log(e);
            }
        });
    });
});




//우편번호 - Daum API
function checkPost() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('updatezipcode').value = data.zonecode;
            document.getElementById("updateaddr1").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("updateaddr2").focus();
        }
    }).open();
}

