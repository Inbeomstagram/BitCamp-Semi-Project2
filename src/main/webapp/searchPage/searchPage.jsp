<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>InbeomStarGram</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/searchPage.css">
</head>
<body>
<jsp:include page="../component/header.jsp" />
<section class="gallery">
    <c:forEach var="boardDTO" items="${list}">
        <div class="grid-item">
            <a href="${pageContext.request.contextPath}/board/boardView.do?seq_board=${boardDTO.seq_board}">
                <img src="${pageContext.request.contextPath}/storage/${boardDTO.image}" alt="${boardDTO.imageSubject}" />
                <span class="hit">${boardDTO.hit}</span>
            </a>
        </div>
    </c:forEach>   
<a href="${pageContext.request.contextPath}/board/boardWriteForm.do">핀 작성</a>
</section>
	<script type="text/javascript" src="http://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script src="https://unpkg.com/imagesloaded@4/imagesloaded.pkgd.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/searchPage/searchPage.js"></script>
</body>
</html>
