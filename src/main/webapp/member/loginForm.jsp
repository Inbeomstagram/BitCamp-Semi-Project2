<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
table {
	border-collapse: collapse;
}

th, td {
	padding: 5px;
}

#loginForm {
	display: flex;
	flex-direction: column;
	align-items: center;
	margin: 30px auto;
	text-align: left;
}

#loginForm div {
	color: red;
	font-size: 8pt;
	font-weight: bold;
}
</style>
</head>
<body>
<form id="loginForm">
	<h1>
		<img src="../image/4.jpg" width="100" height="100" alt="홈" 
			 onclick="location.href='${ pageContext.request.contextPath }/index.do'" style="cursor: pointer;"> 로그인
	</h1>
	<table border="1">
		<tr>
	        <th>아이디</th>
	        <td>
	        	<input type="text" name="id" id="id" size="30" placeholder="아이디 입력">
	        	<div id="idDiv"></div>
	        </td>
	    </tr>
	    
	    <tr>
	        <th>비밀번호</th>
	        <td>
	        	<input type="password" name="password" id="password" size="40" placeholder="비밀번호 입력">
	        	<div id="pwdDiv"></div>
	        </td>
	    </tr>
	    
	    <tr>
	    	<td colspan="2" align="center">
	    		<input type="button" value="로그인" id="loginBtn" onclick="handleLogin()" />
	    		<input type="button" value="회원가입" 
	    		onclick="location.href='${ pageContext.request.contextPath }/member/writeForm.do'" />      
	    	</td>
	    </tr>
	</table>
	
	<div id="loginResult"></div>
</form>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="../js/login.js"></script>
</body>
</html>











