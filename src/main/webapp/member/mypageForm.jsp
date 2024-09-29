<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>InbeomStarGram</title>
<link rel="stylesheet" href="../css/mypage.css">
</head>
<body>
<jsp:include page="../component/header.jsp" />
	<div class="mypage">
		<div class="profile">
			<input type="submit" value="W" class="submitprofile"/>
		</div>
		<div class="username">
			${memDTO.name }
		</div>
		<div class="userid">
			<div class="icondiv">
				<img src="../img/icon.jpg">
			</div>
			<div class="iddiv">
				${memDTO.id }
			</div>
		</div>
		<div class="update">
			<a href="${pageContext.request.contextPath}/member/updateForm.do"><input type="button" value="프로필 수정"/></a>
		</div>
		<div class="save">
			저장됨
			<hr>
		</div>
		<div> <!-- 저장된 핀이 없을 경우 만 노출되게 해야함 -->
			아직 저장된 핀이 없네요! 저장하고 싶은 핀들을 저장하세요!
		</div>
		<div class="pincreation">
			<a href="${pageContext.request.contextPath}/board/boardWriteForm.do"><input type="button" value="핀 만들기"/></a>
		</div>
	</div>
</body>
</html>