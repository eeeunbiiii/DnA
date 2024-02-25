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
<title>DnA sample</title>
<link rel="stylesheet" href="./css/bootstrap.min.css">
<link rel="stylesheet" href="./css/custom.css">
<script src="./js/jquery.min.js"></script>
</head>
<body>

	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand" href="index.jsp"><strong>DnA
				sample index</strong></a>
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
					</ul></li>
			</ul>

		</div>
	</nav>

	<div class="container mt-5">
		<h3>Diary List</h3>
		<table class="table">
			<thead>
				<tr>
					<th scope="col">Title</th>
					<th scope="col">Date</th>
					<th scope="col">Mood</th>
				</tr>
			</thead>
			<tbody>
				<%
				DiaryDAO diaryDAO = new DiaryDAO();
				ArrayList<DiaryDTO> diaryList = diaryDAO.getList();

				for (DiaryDTO diary : diaryList) {
				%>
				<tr>
					<td><a href="diaryView.jsp?diaryID=<%=diary.getDiaryID()%>"><%=diary.getTitle()%></a></td>
					<td><%=diary.getDate()%></td>
					<td><%=diary.getMood()%></td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>
	</div>

	<button type="button" class="btn btn-primary" data-bs-toggle="modal"
		data-bs-target="#reportModal">일기 쓰기</button>
	<div class="modal fade" id="reportModal" tabindex="-1" role="dialog"
		aria-labelledby="modal" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="modal">오늘의 일기</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form action="./writeAction.jsp" method="post">
						<div class="form-group">
							<label>제목</label> <input type="text" name="diaryTitle"
								class="form-control" maxlength="64">
						</div>
						<br>
						<div class="form-group">
							<label>오늘의 기분은?</label>
							<div class="form-group row">
								<div class="col">
									<button type="button" class="moodButton btn btn-secondary"
										value="기쁨">기쁨</button>
								</div>
								<div class="col">
									<button type="button" class="moodButton btn btn-secondary"
										value="슬픔">슬픔</button>
								</div>
							</div>
							<input type="hidden" name="diaryMood" id="diaryMood">
						</div>
						<br>
						<div class="form-group">
							<p>어떤 선생님께 제출할까요?</p>
							<div class="form-group row">
								<div class="col">
									<button type="button" class="teacherButton btn btn-secondary"
										value="상냥한 국어 선생님">상냥한 국어 선생님</button>
								</div>
								<div class="col">
									<button type="button" class="teacherButton btn btn-secondary"
										value="냉철한 수학 선생님">냉철한 수학 선생님</button>
								</div>
								<div class="col">
									<button type="button" class="teacherButton btn btn-secondary"
										value="이상한 영어 선생님">이상한 영어 선생님</button>
								</div>
							</div>
							<input type="hidden" name="teacher" id="teacher">
						</div>

						<input type="hidden" name="teacher" id="teacher">
					</form>
				</div>
			</div>
			<div class="modal-footer">
				<button type="submit" class="btn btn-primary">제출하기</button>
			</div>
		</div>
	</div>


	<script>
        $(document).ready(function() {
            $('.moodButton').click(function() {
                $('#diaryMood').val($(this).val());
            });
            $('.teacherButton').click(function() {
                $('#teacher').val($(this).val());
            });
        });
    </script>
    <script src="https://unpkg.com/@popperjs/core@2/dist/umd/popper.js"></script>
    <script src="./js/bootstrap.min.js"></script>
</body>
</html>