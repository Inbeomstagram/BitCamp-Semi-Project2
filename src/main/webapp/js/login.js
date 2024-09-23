function handleLogin() {
    $('#idDiv').empty();
    $('#pwdDiv').empty();

    if($('#id').val() == '')
        $('#idDiv').html('아이디 입력');
    else if($('#password').val() == '')
        $('#pwdDiv').html('비밀번호 입력');
    else
        $.ajax({
            type: 'post',
            url: '/Inbeomstagram/member/login.do',  // URL은 pageContext가 없으므로 절대 경로로 변경
            data: {
                'id': $('#id').val(),
                'password': $('#password').val()
            },
            dataType: 'text',
            success: function(data){
                if(data.trim() == 'fail'){
                    $('#loginResult').html('아이디 또는 비밀번호가 틀렸습니다.');
                    $('#loginResult').css('font-size', '12pt');
                    $('#loginResult').css('padding', '10px');
                } else {
                    location.href = '/Inbeomstagram/index.do';
                }
            },
            error: function(e){
                console.log(e);
            }
        });
}