<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">  
<title>이미지 게시글 폼</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #ffffff;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
	margin: 0;
}

#container {
	display: flex;
	width: 55%; 
	max-width: 1200px; 
	background-color: #fff;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	border-radius: 10px;
	overflow: hidden;
}

#image {
	flex: 1;
	display: flex;
	justify-content: center;
	align-items: center;
	padding: 20px;
}

#image img {
	max-width: 100%;
	border-radius: 10px;
}

#des {
	flex: 1; 
	padding: 20px;
	display: flex;
	flex-direction: column;
	justify-content: space-between;
}

h2 {
	font-size: 28px;
	margin-bottom: 5px;
	color: #333;
}

p {
	font-size: 16px;
	margin: 5px 0; 
	color: #555;
}

h4 {
	font-size: 14px;
	color: #888;
	margin: 5px 0;
}

#coment-box {
	margin-top: 20px;
}

#coment-num {
	font-size: 14px;
	margin-bottom: 10px;
	color: #333;
	font-weight: bold;
}

#coment-list {
	font-size: 14px;
	margin-bottom: 5px;
	color: #555;
}

#coment-input {
	display: flex;
	flex-direction: column;
	margin-top: 30px;
	position: relative;
	padding-right: 15px; 
}

#comentContent {
	width: 100%; 
	height: 70px; 
	padding: 10px;
	padding-right: 60px; 
	border: 1px solid #ddd;
	border-radius: 5px;
	resize: none;
	margin-bottom: 10px;
	box-sizing: border-box; 
}

#comentBtn {
	position: absolute;
	right: 30px;
	bottom: 10px; 
	padding: 5px 10px;
	background-color: #e60023;
	color: white;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}

#comentBtn:hover {
	background-color: #c7001b;
}


#pin-buttons {
	margin-top: 15px;
	display: flex; 
	justify-content: flex-end;
}

#updateBtn, #deleteBtn {
	padding: 5px 10px;
	background-color: #e60023; 
	color: white;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	margin-left: 10px; 
}

#updateBtn:hover, #deleteBtn:hover {
	background-color: #c7001b;
}


#coment-input {
	padding-right: 10px; 
}
</style>
</head>
<body>
	<form id="container">
		<div id="image">
			<img src="http://localhost:8080/Inbeomstagram/storage/${boardDTO.image }" />
		</div>
		<div id="des">
			<!-- 제목 -->
			<div id="subject">
				<h2>제목 : ${boardDTO.imageSubject }</h2>
			</div>
			<!-- 내용 -->
			<div id="content">
				<p>내용 : ${boardDTO.imageContent }</p>
			</div>
			<!-- 작성자 -->
			<div id="userName">
				<h4>작성자 시퀀스 : ${boardDTO.seq_member }</h4>
			</div>
			<!-- 댓글 영역 -->
			<div id="coment-box">
				<!-- 댓글 수 -->
				<div id="coment-num">댓글 2개</div>
				<!-- 댓글 내용 -->
				<div id="coment-list">장훈 : 스폰지밥과 뚱이네</div>
				<div id="coment-list">오영수 : 뚱이배꼽 ㅋㅋ</div>
				<div id="coment-list">오영수 : ㅎㅎㅎㅎㅎ</div>
				<!-- 댓글 작성 -->
				<div id="coment-input">
					<textarea id="comentContent" name="comentContent" placeholder="댓글을 입력하세요..."></textarea>
					<button type="submit" id="comentBtn">작성</button>
				</div>

				<div id="pin-buttons">
					<button id="updateBtn" onclick="">핀 수정</button>
					<button id="deleteBtn" onclick="">핀 삭제</button>	
				</div>
			</div>
		</div>
	</form>
</body>
</html>