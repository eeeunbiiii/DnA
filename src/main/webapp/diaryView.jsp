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
