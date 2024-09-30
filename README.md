# 핀터레스트 클론코딩

## 소개
핀터레스트 UI/UX를 본떠서 클론코딩을 진행했습니다. 이 프로젝트는 사용자가 사진과 이미지를 공유하고 탐색할 수 있는 플랫폼을 구현하는 것을 목표로 하였습니다. 

## 주요 기능
- **사용자 관리**
  - 회원가입, 로그인, 회원 정보 수정, 회원 탈퇴, 로그아웃 기능
- **메인 페이지**
  - 로그인 전 사용자에게 제공되는 메인 페이지
- **탐색 페이지**
  - 로그인 후 전체 게시판을 최신 등록순으로 조회할 수 있는 탐색 페이지
  - 인기 게시글 기능 (조회수 기반)
- **검색 기능**
  - 게시글 제목을 기반으로 한 검색 기능
- **마이 페이지**
  - 사용자가 올린 게시글을 확인할 수 있는 마이 페이지
- **게시판 관리**
  - 게시판 생성, 특정 게시판 조회, 수정, 삭제 기능
- **댓글 관리**
  - 댓글 생성, 조회, 수정, 삭제 기능
- **페이징 처리**
  - 스크롤 기반으로 페이징 처리 기능

## 역할 분담
- **오영수**
  - 사용자 회원가입 및 로그인, 회원 정보 수정, 회원 탈퇴, 로그아웃 기능 구현
  - 로그인 후 전체 게시판 조회를 위한 탐색 페이지 개발 (최신 등록순)
  - 인기 게시글 기능 구현 (조회수 기반)
  - 스크롤 기반 페이징 처리 기능 개발

- **장 훈**
  - 로그인 전 메인 페이지 디자인 및 구현
  - 제목을 바탕으로 한 검색 기능 개발
  - 마이 페이지 조회 기능 구현 (사용자가 올린 게시글 확인)

- **정진범**
  - 게시판 생성 기능 구현
  - 특정 게시판 조회, 수정, 삭제 기능 개발
  - 댓글 생성, 조회, 수정, 삭제 기능 구현

## ERD
![스크린샷(370)](https://github.com/user-attachments/assets/2bf2d14f-dc04-4f30-a67a-bd17c38ed996)
- 한 member는 여러 개의 게시판을 작성할 수 있다. ( 1: N )
- 한 게시판에는 여러 개의 댓글을 달 수 있다. ( 1: N )

## 기능 화면

- **로그인 전 메인 페이지**
![mainpage](https://github.com/user-attachments/assets/0962bee1-2a00-44aa-b287-ae38d11a8f51)

- **로그인 & 회원 가입 창 & 로그아웃**
![login](https://github.com/user-attachments/assets/238986bd-8413-458f-84ea-e88868e24868)
![join](https://github.com/user-attachments/assets/8bcb04a7-f283-4bbe-ba0d-5baa5b91ac3f)
- Bootstrap을 이용한 modal 방식으로 구현
![logout](https://github.com/user-attachments/assets/0dcda1a4-5a67-40e8-a7a3-3850b6d32317)

- **로그인 후 탐색 페이지**

- **마이 페이지 & 프로필 수정**
![myPage](https://github.com/user-attachments/assets/7df06745-2d2d-46d4-9ab3-1e1dc3bd543e)
![updateProfile](https://github.com/user-attachments/assets/60fc3ffd-a701-4e72-8d01-0098ea89aac2)


## 기술 스택
- **프론트엔드**: HTML, CSS, JavaScript (jQuery), Bootstrap
- **백엔드**: Java, MyBatis
- **DB**: Oracle
- **기타**: Git, JSP
