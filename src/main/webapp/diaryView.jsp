<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="diary.DiaryDAO" %>
<%@ page import="diary.DiaryDTO" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>DnA sample - Diary View</title>
    <link rel="stylesheet" href="./css/bootstrap.min.css">
    <link rel="stylesheet" href="./css/custom.css">
</head>
<body>

    <div class="container mt-5">
        <h1>Diary View</h1>
        <%
            int diaryID = Integer.parseInt(request.getParameter("diaryID"));
            DiaryDAO diaryDAO = new DiaryDAO();
            DiaryDTO diary = diaryDAO.getDiary(diaryID);

            if (diary != null) {
        %>
        <h2><%= diary.getTitle() %></h2>
        <p>Date: <%= diary.getDate() %></p>
        <p>Mood: <%= diary.getMood() %></p>
        <p><%= diary.getContent() %></p>
        <p><%= diary.getAnswer() %></p>
        <%
            } else {
                out.println("<p>해당 일기를 찾을 수 없습니다.</p>");
            }
        %>
    </div>

    <script src="./js/jquery.min.js"></script>
    <script src="https://unpkg.com/@popperjs/core@2/dist/umd/popper.js"></script>
    <script src="./js/bootstrap.min.js"></script>
</body>
</html>