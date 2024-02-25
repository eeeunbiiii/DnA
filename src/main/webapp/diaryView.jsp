<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="diary.DiaryDAO" %>
<%@ page import="diary.DiaryDTO" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Diary Detail</title>
    <link rel="stylesheet" href="./css/bootstrap.min.css">
    <link rel="stylesheet" href="./css/custom.css">
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand" href="index.jsp"><strong>DnA_sample</strong></a>
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
					</ul>
				</li>
			</ul>
		</div>
	</nav>
	
<div class="container mt-5">
    <h3><strong>Today Diary</strong></h3>
    <% 
        // diaryID를 파라미터로 받아옴
        String diaryIDParam = request.getParameter("diaryID");

        // diaryID에 해당하는 다이어리 정보를 가져오기
        DiaryDAO diaryDAO = new DiaryDAO();
        DiaryDTO diary = diaryDAO.getDiary(Integer.parseInt(diaryIDParam));

        // 다이어리 정보가 null이 아니라면 출력
        if (diary != null) {
    %>
    <div class="card">
        <div class="card-body">
			<p class="card-text">Date: <%= diary.getDate() %> <span style="float:right; border: 1px solid black; padding: 3px;"><%= diary.getMood() %></span></p>
			<br><h4 class="card-title"><strong>Title: <%= diary.getTitle() %></strong></h4>
			<p class="card-text"><%= diary.getContent() %></p>            
			<br><p class="card-text">검토한 Teacher: <%= diary.getTeacher() %></p>

            <% 
            String teacherResponse = "";
            if (diary.getMood() != null) {
                switch (diary.getMood()) {
                    case "기쁨":
                        switch (diary.getTeacher()) {
                            case "국어":
                                teacherResponse = "일기를 읽었어요. 기쁨이 가득한 것 같아요! 기뻐하는 모습을 보니 저도 행복해요. 함께 기뻐하는 건 더 좋죠. 이 행복한 순간을 잊지 말고 오늘 하루도 즐겁게 보내세요!";
                                break;
                            case "수학":
                                teacherResponse = "일기를 즐겁게 읽었습니다! 기쁨이 느껴져서 기분이 좋아졌어요. 행복한 순간을 즐기는 것도 중요하죠. 그 기쁨을 기억하고 이어가세요. 다음에도 이런 순간들이 많기를 바라며!";
                                break;
                            case "영어":
                                teacherResponse = "Woo-hoo! Sounds like you're having a blast! Happiness is contagious, you know. Keep spreading those good vibes, and remember, even on cloudy days, there's always a rainbow waiting somewhere. Keep shining bright like a funky disco ball!";
                                break;
                        }
                        break;
                    case "슬픔":
                        switch (diary.getTeacher()) {
                            case "국어":
                                teacherResponse = "오늘 일기를 읽었어요. 마음이 울적하시군요. 그런 날도 있죠. 제가 항상 여기 있어요. 언제든지 이야기하거나 도움을 요청해도 좋아요. 함께 이겨내요.";
                                break;
                            case "수학":
                                teacherResponse = "일기를 읽었습니다. 슬픔이 묻어나네요. 감정이 힘들 때는 그 감정을 이해하고 받아들이는 것도 중요해요. 이 기분을 이겨내는 법을 찾아보면 좋겠어요. 저도 언제든지 도울 수 있습니다.";
                                break;
                            case "영어":
                                teacherResponse = "Oh dear, sounds like a gloomy day! But remember, even in the darkest clouds, there's a silver lining somewhere. Let's find that silver lining together. Don't hesitate to reach out if you need some weird English jokes to lighten the mood!";
                                break;
                        }
                        break;
                }
            }
            String[] words = diary.getContent().split("\\s+");
            if (words.length < 10) {
                teacherResponse += " 다만, 다음에는 좀 더 많은 내용을 써보세요!";
            }
            %>
            <p class="card-text">Teacher's Response: <br><%= teacherResponse %></p>
        </div>
    </div>
    <div class="row justify-content-center mt-3">
        <div class="col-auto">
            <a href="write.jsp" class="btn btn-primary">뒤로가기</a>
        </div>
    </div>
    <%
        } else {
    %>
    <div class="alert alert-danger" role="alert">
        Diary not found.
    </div>
    <%
        }
    %>
</div>

<script src="./js/jquery.min.js"></script>
<script src="https://unpkg.com/@popperjs/core@2/dist/umd/popper.js"></script>
<script src="./js/bootstrap.min.js"></script>
</body>
</html>