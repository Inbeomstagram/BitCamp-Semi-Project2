<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/header.css">
<header>
	<div class="logo">
		<a href="${pageContext.request.contextPath}/index.do"> <!-- 홈으로 이동할 수 있는 로고 -->
			<img alt="home으로 이동" src="/Inbeomstagram/img/logo.png" width="100"
			height="30">
		</a>
	</div>

	<!-- 검색할 수 있는 영역 (로그인 시 노출) -->
	<div class="search-area">
		<c:if test="${not empty sessionScope.memDTO}">
			<nav class="navigation">
				<ul>
					<li><a href="${pageContext.request.contextPath}/board/boardWriteForm.do">핀 생성</a></li>
				</ul>
			</nav>
                <div class="search-box">
                    <img src="/Inbeomstagram/img/serch.jpg" alt="serch">
                    <input type="text" name="searchKeyword" id="searchKeyword" placeholder="검색에 필요한 제목을 기입해주세요">
                </div>
		</c:if>
	</div>

	<div class="auth-buttons">
		<c:if test="${empty sessionScope.memDTO}">
			<a href="#" class="login" data-toggle="modal" data-target="#loginModal">로그인</a>
			<a href="#" class="signup" data-toggle="modal" data-target="#joinModal">가입하기</a>
		</c:if>
		<c:if test="${not empty sessionScope.memDTO}">
			<a
				href="${pageContext.request.contextPath}/popularPage/popularPage.do"
				class="info">인기 게시글</a>
			<a href="${pageContext.request.contextPath}/member/mypageForm.do"
				class="info">${memDTO.name }님</a>
			<button onclick="logout()" class="logout">로그아웃</button>
		</c:if>
	</div>	
</header>
<jsp:include page="../member/loginForm.jsp" />
<jsp:include page="../member/joinForm.jsp" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/member/logout.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/header/header.js"></script>