<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="diary.DiaryDAO"%>
<%@ page import="diary.DiaryDTO"%>
<%@ page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>DnA sample - Diary View</title>
<link rel="stylesheet" href="./css/bootstrap.min.css">
<link rel="stylesheet" href="./css/custom.css">
</head>
<body>

	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand" href="index.jsp"><strong>DnA</strong></a>
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
					</ul></li>
			</ul>
		</div>
	</nav>
	<div class="container mt-5">
		<h1>Diary View</h1>
		<%
		DiaryDAO diaryDAO = new DiaryDAO();
		ArrayList<DiaryDTO> diaryList = diaryDAO.getList();

		if (diaryList != null) {
			for (DiaryDTO diary : diaryList) {
		%>
		<%-- Get diaryID from the current diary object in the loop --%>
		<%
		int diaryID = diary.getDiaryID();

		// Fetch diary details from database using DiaryDAO
		DiaryDTO diaryDetails = diaryDAO.getDiary(diaryID);

		// Check if diary exists
		if (diaryDetails != null) {
		%>
		<div class="container mt-5">
			<h2><%=diaryDetails.getTitle()%></h2>
			<p>
				Date:
				<%=diaryDetails.getDate()%></p>
			<p>
				Mood:
				<%=diaryDetails.getMood()%></p>
			<p><%=diaryDetails.getContent()%></p>
		</div>
		<div class="container mt-5">
			<h2>Teacher's Response</h2>
			<%-- Teacher's response for the current diary --%>
			<%
			String teacherResponse = "";
			if (diaryDetails.getMood()!=null && diaryDetails.getMood().equals("기쁨")) {
				switch (diaryDetails.getTeacher()) {
				case "국어":
					teacherResponse = "오늘 기분이 좋으니, 국어 공부도 잘 될 것 같아요!";
					break;
				case "수학":
					teacherResponse = "기분이 좋은 날에는 복잡한 수학 문제도 쉽게 풀 수 있어요!";
					break;
				case "영어":
					teacherResponse = "기분이 좋으니, 영어 단어를 많이 외워봐요!";
					break;
				}
			} else if (diaryDetails.getMood()!=null && diaryDetails.getMood().equals("슬픔")) {
				switch (diaryDetails.getTeacher()) {
				case "국어":
					teacherResponse = "슬픔도 국어로 표현해보세요. 글로 표현하면 마음이 조금 나아질 거예요.";
					break;
				case "수학":
					teacherResponse = "슬픔을 잊기 위해 수학 문제를 풀어보세요. 집중하면 마음이 조금 나아질 거예요.";
					break;
				case "영어":
					teacherResponse = "슬픔을 영어로 표현해보세요. 새로운 표현을 배우면서 마음이 조금 나아질 거예요.";
					break;
				}
			}

			String[] words = diaryDetails.getContent().split("\\s+");
			if (words.length < 5) {
				teacherResponse += " 다음에는 좀 더 많은 내용을 써보세요!";
			}
			%>
			<p><%=teacherResponse%></p>
		</div>
		<%
		} else {
		%>
		<%-- Print error message if diary is not found --%>
		<div class="container mt-5">
			<p>해당 일기를 찾을 수 없습니다.</p>
		</div>
		<%
		} // end if diaryDetails
		} // end for loop
		} // end if diaryList
		%>

		<script src="./js/jquery.min.js"></script>
		<script src="https://unpkg.com/@popperjs/core@2/dist/umd/popper.js"></script>
		<script src="./js/bootstrap.min.js"></script>
</body>
</html>
