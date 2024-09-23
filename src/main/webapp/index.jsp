<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main Page</title>
</head>
<body>

<header>
    <h1>Welcome to My Website</h1>

    <nav>
        <ul>
            <%-- JSTL을 이용한 세션 값 확인 --%>
            <c:if test="${not empty sessionScope.memDTO}">
                <li>
                    <button onclick="logout()">로그아웃</button>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/member/updateForm.do">회원정보수정</a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/member/mypage.do">마이페이지</a>
                </li>
            </c:if>
            <%-- memId가 없을 때 로그인/회원가입 버튼 --%>
            <c:if test="${empty sessionScope.memDTO}">
                <li>
                    <a href="${pageContext.request.contextPath}/member/loginForm.do">로그인</a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/member/joinForm.do">회원가입</a>
                </li>
            </c:if>
        </ul>
    </nav>
</header>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="js/logout.js"></script>

</body>
</html>
