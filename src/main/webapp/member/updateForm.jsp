<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/update.css">
</head>
<body>
<jsp:include page="../component/header.jsp" />
<form name="updateForm" id="updateForm">
	<div class="updatepage">
		<div class="updatepagebody">
			<div class="container">
				<div class="coment">
					<h1>
						프로필 수정
					</h1>
					<p>개인 정보는 비공개로 유지하세요. 여기에 추가한 정보는<br>
					회원님의 프로필을 볼 수 있는 모든 사람에게 표시됩니다.</p>
				</div>
				
				<div class="userprofilecoment">
					<a>사진</a>
				</div>
				<div class="userprofiledomain">
					<div class="userprofile">
						
					</div>
					<div class="profilebutton">
						<input type="submit" value="변경"/>
					</div>
				</div>
				
				<div class="namecomentdomain">
					<a>이름</a>
				</div>
				<div class="name">
				<input type="text" name="name" id="name" value="${sessionScope.memDTO.name}">
				</div>
				<div id="nameDiv" class="nameDiv"></div>
				
				<div class="idcomentdomain">
					<a>아이디</a>
				</div>
				<div class="id">
				<input type="text" name="id" id="id" size="30" value="${sessionScope.memDTO.id}" readonly>
				</div>
				
				<div class="pwdcomentdomain">
					<a>비밀번호</a>
				</div>
				<div class="pwd">
				<input type="password" name="password" id="pwd" size="40" placeholder="비밀번호 입력">
				</div>
				<div id="pwdDiv"></div>
				
				<div class="repwdcomentdomain">
					<a>재확인</a>
				</div>
				<div class="repwd">
				<input type="password" id="repwd" size="40" placeholder="비밀번호 입력">
				</div>
				
				<div class="gendercomentdomain">
					<a>성별</a>
				</div>
				<div class="gender">
				    <input type="radio" name="gender" value="0" />남자
		            <input type="radio" name="gender" value="1" />여자
				</div>
		
				<div class="emailcomentdomain">
				    <a>이메일</a>
				</div>
				<div class="email">
				    <div class="input-container">
				        <input type="text" name="email1" value="${fn:split(sessionScope.memDTO.email, '@')[0]}">
				    </div>
				    @
				    <div class="input-container">
				        <input type="text" name="email2" id="email2" value="${fn:split(sessionScope.memDTO.email, '@')[1]}">
				    </div>
				    <div class="input-container">
				        <input type="email" name="email3" id="email3" list="email3_list" oninput="change()">        
				        <datalist id="email3_list">
				            <option value="직접입력"></option>
				            <option value="naver.com"/>
				            <option value="gmail.com"/>
				            <option value="daum.net"/>
				        </datalist>
				    </div>
				</div>
				<div id="emailDiv"></div>
				
				<div class="phonedomain">
					<a>휴대폰</a>
				</div>
				<div class="phone">
				    <div class="input-container">
				        <select name="tel1">
				            <optgroup label="hp">
				                <option value="010">010</option>
				                <option value="011">011</option>
				                <option value="019">019</option>
				            </optgroup>
				        </select>
				    </div>
				    -
				    <div class="input-container">
				        <input type="text" name="tel2" size="4" maxlength="4" value="${fn:split(sessionScope.memDTO.phoneNumber, '-')[1]}">
				    </div>
				    -
				    <div class="input-container">
				        <input type="text" name="tel3" size="4" maxlength="4" value="${fn:split(sessionScope.memDTO.phoneNumber, '-')[2]}">
				    </div>
				</div>
				<div id="telDiv"></div>
				
				<div class="addressdomain">
				    <a>주소</a>
				</div>
				<div class="address">
				    <div class="input-container">
				        <input type="text" name="zipcode" id="zipcode" readonly value="${sessionScope.memDTO.zipcode}">
				        <button type="button" onclick="checkPost(); return false;">우편번호 검색</button>
				    </div>
				    <br/>
				    <div class="input-container">
				        <input type="text" name="addr1" id="addr1" readonly value="${fn:split(sessionScope.memDTO.address, ',')[0]}">
				    </div>
				    <br/>
				    <div class="input-container">
				        <input type="text" name="addr2" id="addr2" value="${fn:split(sessionScope.memDTO.address, ',')[1]}">
				    </div>
				</div>
				<div id="addrDiv"></div>
				
				<div class="commit">
					<div class="commit-container">
						<input type="button" value="회원정보수정" id="updateBtn" />
					</div>
					<div class="commit-container">
					<input type="reset" value="다시작성" onclick="location.reload()" />
					</div>
					<div class="commit-container">
						<input type="button" value="회원탈퇴" id="memberDelete" />
					</div>
				</div>
				<div class="bottom">
				</div>
			</div>
		</div>
	</div>	
</form>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="../js/member/update.js"></script>
<script src="../js/member/delete.js"></script>
<script type="text/javascript">
window.onload = function(){
	document.updateForm.gender['${sessionScope.memDTO.gender}'].checked = true;
	document.updateForm.tel1.value = '${fn:split(sessionScope.memDTO.phoneNumber, '-')[0]}';
}
</script>
</body>
</html>
