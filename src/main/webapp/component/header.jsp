<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
header {
    display: flex; /* Flexbox를 사용하여 레이아웃 구성 */
    justify-content: space-between; /* 왼쪽과 오른쪽으로 요소 배치 */
    align-items: center; /* 수직 중앙 정렬 */
    background-color: #ffffff; /* 헤더 배경색 */
    padding: 20px; /* 헤더 패딩 */
    position: fixed;  /* 헤더를 고정 */
    top: 0;  /* 화면의 최상단에 위치 */
    width: 100%;  /* 전체 너비를 사용 */
    z-index: 1000; /* 헤더를 최상단에 표시 */
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
}

.logo {
    display: flex; /* Flexbox를 사용하여 로고와 탐색을 가로로 나열 */
    align-items: center; /* 수직 중앙 정렬 */
}

.logo a {
    font-size: 24px; /* 로고 크기 */
    font-weight: bold; /* 로고 두께 */
    text-decoration: none; /* 밑줄 제거 */
    color: #333; /* 로고 색상 */
    margin-right: 10px; /* 로고와 탐색 메뉴 간격 조정 */
}

.navigation ul {
    list-style-type: none; /* 목록 스타일 제거 */
    margin: 0; /* 기본 마진 제거 */
    padding: 0; /* 기본 패딩 제거 */
    display: flex; /* 탐색 메뉴를 가로로 나열 */
}

.navigation li {
    margin-right: 20px; /* 항목 간 간격 */
}

.navigation a {
    font-size: 10pt;
    text-decoration: none; /* 밑줄 제거 */
    color: #333; /* 링크 색상 */
}

.auth-buttons {
    display: flex; /* Flexbox 사용 */
}

.auth-buttons a {
    margin-left: 10px; /* 버튼 간 간격 */
    text-decoration: none; /* 밑줄 제거 */
    padding: 8px 15px; /* 버튼 패딩 */
    border-radius: 20px; /* 동그란 모서리 */
}

.auth-buttons a.login {
    background-color: #e60023; /* 로그인 버튼 배경색 */
    color: white; /* 로그인 버튼 글자색 */
}

.auth-buttons a.signup {
    background-color: #e9e9e9; /* 가입하기 버튼 배경색 */
    color: black; /* 가입하기 버튼 글자색 */
}

.auth-buttons button.logout {
    background-color: #e9e9e9; /* 로그아웃 버튼 배경색 */
    color: black; /* 로그아웃 버튼 글자색 */
    border: none; /* 버튼 테두리 없애기 */
    padding: 10px 15px; /* 버튼 내부 여백 */
    cursor: pointer; /* 커서 모양 변경 */
    text-decoration: none; /* 밑줄 없애기 */
    border-radius: 20px; /* 모서리 둥글게 */
}

.auth-buttons a.info {
    background-color: #e9e9e9; /* 로그아웃 버튼 배경색 */
    color: black; /* 로그아웃 버튼 글자색 */
    margin-right: 10px;
}
.search-area {
    flex: 1; /* 남은 공간을 채우도록 설정 */
    display: flex;
    justify-content: center; /* 가운데 정렬 */
}

.search-box {
    display: flex; /* Flexbox를 사용하여 내부 요소들을 가로로 배치하고 중앙 정렬 */
    align-items: center; /* 내부 요소들을 수직 중앙 정렬 */
    background-color: #f1f1f1; /* 배경색을 밝은 회색 */
    border-radius: 50px; /* 검색 창을 둥글게 */
    padding: 10px 20px; /* (위아래 10px, 좌우 20px) */
    width: 100%; /* 검색 창의 너비를 부모 요소의 60%로 설정 */
}

.search-box input {
    border: none; /* 입력 필드에 기본 테두리 제거 */
    outline: none; /* 포커스 상태에서도 테두리 제거 */
    background: none; /* 입력 필드의 배경 투명*/
    font-size: 14px; /* 입력 필드의 텍스트 크기를 14px로 설정 */
    margin-left: 10px; /* 입력 필드와 검색 아이콘 사이에 10px 간격 추가 */
    width: 100%; /* 입력 필드가 넓게 펼쳐지도록 설정  */
}

</style>
    <header>
        <div class="logo">
            <a href="#"><!-- 홈으로 이동할 수 있는 로고 -->
                <img alt="home으로 이동" src="/Inbeomstagram/img/logo.png" width="100" height="30">
            </a>
            <nav class="navigation">
                <ul>
                    <li><a href="#">탐색</a></li><!-- 탐색 버튼 -->
                </ul>
            </nav>
        </div>

        <!-- 검색할 수 있는 영역 (로그인 시 노출) -->
        <div class="search-area">
            <c:if test="${not empty sessionScope.memDTO}">
                <div class="search-box">
                    <img src="/Inbeomstagram/img/serch.jpg" alt="serch">
                    <input type="text" placeholder="검색">
                </div>
            </c:if>
        </div>

        <div class="auth-buttons">
            <c:if test="${empty sessionScope.memDTO}">
            	<a href="${pageContext.request.contextPath}/member/loginForm.do" class="login">로그인</a>
                <a href="${pageContext.request.contextPath}/member/joinForm.do" class="signup">가입하기</a>
            </c:if>
            <c:if test="${not empty sessionScope.memDTO}">
            	<a href="${pageContext.request.contextPath}/member/mypageForm.do" class="info">${memDTO.name }님</a>
                <button onclick="logout()" class="logout">로그아웃</button>
            </c:if>
        </div>
    </header>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="js/logout.js"></script>
