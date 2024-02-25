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

<div class="container mt-5">
    <h1>Diary Detail</h1>
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
            <h5 class="card-title">Title: <%= diary.getTitle() %></h5>
            <p class="card-text">Content: <%= diary.getContent() %></p>
            <p class="card-text">Date: <%= diary.getDate() %></p>
            <p class="card-text">Mood: <%= diary.getMood() %></p>
            <p class="card-text">Teacher: <%= diary.getTeacher() %></p>
            <% 
            String teacherResponse = "";
            if (diary.getMood() != null) {
                switch (diary.getMood()) {
                    case "기쁨":
                        switch (diary.getTeacher()) {
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
                        break;
                    case "슬픔":
                        switch (diary.getTeacher()) {
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
                        break;
                    // 여기에 다른 감정에 대한 처리를 추가할 수 있습니다.
                }
            }
            String[] words = diary.getContent().split("\\s+");
            if (words.length < 5) {
                teacherResponse += " 다음에는 좀 더 많은 내용을 써보세요!";
            }
            %>
            <p class="card-text">Teacher's Response: <%= teacherResponse %></p>
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
