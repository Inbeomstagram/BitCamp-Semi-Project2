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
    position: relative; /* closeBtn의 위치 기준을 설정 */
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

#comment-box {
	margin-top: 20px;
}

#comment-num {
	font-size: 14px;
	margin-bottom: 10px;
	color: #333;
	font-weight: bold;
}

#comment-list {
	font-size: 14px;
	margin-bottom: 5px;
	color: #555;
}

#comment-input {
	display: flex;
	flex-direction: column;
	margin-top: 30px;
	position: relative;
	padding-right: 15px;
}

#commentContent {
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

#commentBtn {
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

#commentBtn:hover {
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

#comment-input {
	padding-right: 10px;
}

.closeBtn {
    font-size: 24px; /* 닫기 버튼 글자 크기 증가 */
    cursor: pointer;
    position: absolute; /* 절대 위치 지정 */
    top: 10px; /* 상단에서 10px 위치 */
    right: 10px; /* 오른쪽 끝에서 10px 위치 */
}

strong{
font-size: 14pt;
}

.options-btn {
    background-color: #ffffff; /* 버튼 배경색 */
    border: none; /* 테두리 없애기 */
    border-radius: 5px; /* 둥근 모서리 */
    color: #333; /* 글자 색상 */
    cursor: pointer; /* 커서 모양 변경 */
    padding: 5px 10px; /* 버튼 안쪽 여백 */
    font-size: 16px; /* 글자 크기 */
    transition: background-color 0.3s, color 0.3s; /* 부드러운 전환 효과 */
}

.options-btn:hover {
    background-color: #e0e0e0; /* 호버 시 배경색 변경 */
    color: #000; /* 호버 시 글자 색상 변경 */
}

.options-btn:focus {
    outline: none; /* 포커스 시 아웃라인 없애기 */
}


</style>
</head>
<body onload="onLoadpage()">
<jsp:include page="../component/header.jsp" />

	<form id="container" method="POST" action="${pageContext.request.contextPath}/board/boardUpdateForm.do">
		<span class="closeBtn" onclick="closePage()" >&times;</span>
		<input type="hidden" id="name" name="name" value="${memDTO.name}">
		<input type="hidden" id="seq_board" name="seq_board"
			value="${boardDTO.seq_board }">
		<input type="hidden" id="image" name="image" value="${boardDTO.image}">
		<input type="hidden" id="imageSubject" name="imageSubject" value="${boardDTO.imageSubject}">
		<input type="hidden" id="imageContent" name="imageContent" value="${boardDTO.imageContent}">
		<input type="hidden" id="password" name="password" value="${memDTO.password}">
		<div id="image">
			<img
				src="http://localhost:8080/Inbeomstagram/storage/${boardDTO.image }"/>
		</div>
		<div id="des">
			<!-- 제목 -->
			<div id="subject">
				<h2> ${boardDTO.imageSubject }</h2>
			</div>
			<!-- 내용 -->
			<div id="content">
				<p> ${boardDTO.imageContent }</p>
			</div>
			<!-- 작성자 -->
			<div id="userName">
				<h4>작성자 : ${boardDTO.name }	</h4>
			</div>
			<!-- 댓글 영역 -->
			<div id="comment-box">
				<!-- 댓글 수 -->
				<div id="comment-num">댓글 2개</div>
				<!-- 댓글 내용 -->
				<div id="comment-list">
				    <c:forEach var="comment" items="${commentList}">
				        <div>
				            <strong>${comment.name}</strong> : ${comment.commentContent} (${comment.logtime})
				        </div>
				    </c:forEach>
				</div>


				<!-- 댓글 작성 -->
				<div id="comment-input">
					<div id="commentDiv"></div>
					<textarea id="commentContent" name="commentContent"></textarea>
					<button type="button" id="commentBtn">작성</button>
				</div>

				<div id="pin-buttons">
					 <c:if test="${memDTO.seq_member == boardDTO.seq_member}">
        				<input type="submit" id="updateBtn" value="수정"/>
        				<input type="button" id="deleteBtn" value="삭제"/>
    				</c:if>
				</div>
				
			</div>
		</div>
	</form>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script type="text/javascript">
	
    $('#deleteBtn').click(function() {
        var confirmation = confirm("정말 삭제하시겠습니까?");
        if (confirmation) {
            $('#container').attr('action', '${pageContext.request.contextPath}/board/boardDelete.do');
            $('#container').submit();
        } else {
            console.log("삭제가 취소되었습니다.");
        }
    });
	
	function onLoadpage(){
		let seq_Board = '${boardDTO.seq_board}';
		console.log('seq : ', seq_board);
		
		 // 게시글 조회수 증가
		 $.ajax({
		        type: 'post',
		        url: '/Inbeomstagram/comment/commentHit.do', // 조회수 증가를 위한 URL
		        data: { 'seq_board': seq_Board },
		        dataType: 'json',
		        success: function(response) {
		            console.log('조회수 증가 성공: ', response);
		        },
		        error: function(e) {
		            console.log("조회수 증가 AJAX 실패: ", e);
		        }
		    });
		
		// 댓글목록 뿌리기
		$.ajax({
			type:'post',
			url:'/Inbeomstagram/comment/commentView.do',
			data: { 'seq_board': seq_Board },
			dataType:'json',
			success : function(data){
				console.log('데이터 받아왔다 목록 : ', data)
				updateCommentList(data.commentList);
			},
			error : function(e){
				console.log("ajax 실패 : ", e);
			}
		});
		 
	}
	
	function closePage() {
       window.history.back(); // 이전 페이지로 이동
    }
	   
	$(function(){
		$('#commentBtn').click(function(){
			event.preventDefault();
			if($('#commentContent').val() == ''){
				$('#commentDiv').html('작성하실 댓글을 입력하세요').css('color','red');
			}else{
				$.ajax({
					type:'post',
					url : '/Inbeomstagram/comment/commentWrite.do',
					data : {
						'commentContent' : $('#commentContent').val(),
						'name' : $('#name').val(),
						'seq_board' : $('#seq_board').val()
					},
					dataType:'json',
					success:function(data){
						alert("댓글 등록 완료");		
						console.log("AJAX성공")
						$('#commentContent').val('');
						updateCommentList(data.commentList);
						
					},
					error:function(e){
						console.log("AJAX 실패 : ",e);
					}
					
				});
			}
			
		});
	});
	
	function updateCommentList(commentList) {
        // 기존 댓글 목록 초기화
        $('#comment-list').empty();

        // 새로운 댓글 추가
        commentList.forEach(function(comment) {
            $('#comment-list').append(
                '<div id=comment-content>' +
                '<strong>' + comment.name + ' : ' + '</strong>' +
                comment.commentContent + 
                '<br>' +
                ' (' + comment.logtime + ')' +
                '<button class="options-btn">⋯</button>' +
                '</div>'
            );
        });
    }
	
	
	
	</script>
</body>
</html>