<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="diary.DiaryDAO"%>
<%@ page import="diary.DiaryDTO"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>DnA sample</title>
<link rel="stylesheet" href="./css/bootstrap.min.css">
<link rel="stylesheet" href="./css/custom.css">
<style>
    .carousel-item img {
        max-width: 100%;
        height: auto;
    }
    /* 버튼 색상 변경 */
    .carousel-control-prev-icon, .carousel-control-next-icon {
        background-color: black;
    }
    /* 버튼 위치 변경 */
    .carousel-control-prev, .carousel-control-next {
        top: 50%;
        transform: translateY(-50%);
    }
    /* 글자 위치 변경 중앙으로 */
    .centered-text {
        text-align: center;
    }
</style>
</head>
<body>

	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand" href="index.jsp"><strong>DnA sample index</strong></a>
		<button class="navbar-toggler" type="button"
			data-bs-toggle="offcanvas" data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="offcanvas offcanvas-end" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link"
					href="index.jsp">Home </a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" role="button"
					data-bs-toggle="dropdown" aria-expanded="false"> Diary </a>
					<ul class="dropdown-menu">
						<li><a class="dropdown-item" href="write.jsp">오늘의 일기 쓰기</a></li>
						<li><a class="dropdown-item" href="#">Another action</a></li>
					</ul>
				</li>
			</ul>
		</div>
	</nav>

<!-- 그림 넘어가는 모션 -->
<div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
    <div class="carousel-inner">
        <div class="carousel-item active">
            <img src="images/DNA_LOGO.jpg" class="d-block w-50 mx-auto" alt="DNA Logo">
        </div>
        <div class="carousel-item">
            <img src="images/DNA_START.jpg" class="d-block w-50 mx-auto" alt="DNA Start">
        </div>
        <div class="carousel-item">
            <img src="images/DNA_METHOD.jpg" class="d-block w-50 mx-auto" alt="DNA Method">
        </div>
    </div>
    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev" style="width: 40%;">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Previous</span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next" style="width: 40%;">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Next</span>
    </button>
</div>

<!-- 하단 글자 설명 -->
<h5 class="centered-text"><strong>Diary n Answer!</strong></h5>
<h5 class="centered-text">일기를 작성하고, AI 선생님께 답변을 받아보아요 =^-^=</h5>

	<script src="./js/jquery.min.js"></script>
	<script src="https://unpkg.com/@popperjs/core@2/dist/umd/popper.js"></script>
	<script src="./js/bootstrap.min.js"></script>
</body>
</html>