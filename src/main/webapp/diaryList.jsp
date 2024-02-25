<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="diary.DiaryDAO" %>
<%@ page import="diary.DiaryDTO" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>DnA sample - Diary List</title>
    <link rel="stylesheet" href="./css/bootstrap.min.css">
    <link rel="stylesheet" href="./css/custom.css">
</head>
<body>

    <div class="container mt-5">
        <h1>Diary List</h1>
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

                    if (diaryList != null) { 
                        for (DiaryDTO diary : diaryList) {
                %>
                <tr>
                    <td><a href="diaryView.jsp?diaryID=<%= diary.getDiaryID() %>"><%= diary.getTitle() %></a></td>
                    <td><%= diary.getDate() %></td>
                    <td><%= diary.getMood() %></td>
                </tr>
                <% 
                        }
                    }
                %>
            </tbody>
        </table>
    </div>

    <script src="./js/jquery.min.js"></script>
    <script src="https://unpkg.com/@popperjs/core@2/dist/umd/popper.js"></script>
    <script src="./js/bootstrap.min.js"></script>
</body>
</html>
