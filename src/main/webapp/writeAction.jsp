<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.io.PrintWriter, java.text.SimpleDateFormat"%>
<%@ page import="user.*, util.*, diary.*"%>
<%@ page import="java.io.*, java.net.*" %>

<%

DiaryDAO diaryDAO = new DiaryDAO();
Date now = new Date();
SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");

//IP 주소 가져오기
String userID = request.getRemoteAddr();

request.setCharacterEncoding("UTF-8");
int diaryDate = Integer.parseInt(dateFormat.format(now));
String diaryTitle = request.getParameter("diaryTitle");
String diaryContent = request.getParameter("diaryContent");
String diaryMood = request.getParameter("diaryMood");
String diaryAnswer = request.getParameter("diaryAnswer");
String diaryTeacher = request.getParameter("teacher");

//입력값이 null이거나 빈 문자열인 경우 오류 메시지 출력
if(diaryTitle == null || diaryContent == null || diaryMood == null || diaryTitle.trim().equals("") || diaryContent.trim().equals("") || diaryMood.trim().equals("")) {
    PrintWriter script = response.getWriter();
    script.println("<script>");
    script.println("alert('입력이 안된 사항이 있습니다.');");
    script.println("history.back();");
    script.println("</script>");
    script.close();
    return;
}



DiaryDTO diary = new DiaryDTO(userID, diaryDate, diaryTitle, diaryContent, diaryMood, diaryAnswer, diaryTeacher); // 수정된 코드
int result = diaryDAO.diarySubmit(diary);

if(result == -1) {
    PrintWriter script = response.getWriter();
    script.println("<script>");
    script.println("alert('일기 제출에 실패했습니다.');");
    script.println("history.back();");
    script.println("</script>");
    script.close();
    return;
} else {
    PrintWriter script = response.getWriter();
    script.println("<script>");
    script.println("alert('일기가 성공적으로 제출되었습니다.');");
    script.println("location.href = 'index.jsp'");
    script.println("</script>");
    script.close();
    return;
}
	
%>