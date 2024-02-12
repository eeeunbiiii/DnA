<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.io.PrintWriter, java.text.SimpleDateFormat"%>
<%@ page import="user.*, util.*, diary.*"%>
<%@ page import="java.io.*, java.net.*" %>

<%

	DiaryDAO diaryDAO = new DiaryDAO();
	Date now = new Date();
	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
	String userID = null;
	
	if(session.getAttribute("userID") != null)
		userID = (String) session.getAttribute("userID");
	
	userID = "sampleID";
	
	if(userID==null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 해주세요');");
		script.println("location.href = 'index.jsp'");
		script.println("</script>");
		script.close();
		return;
	}
	
	request.setCharacterEncoding("UTF-8");
	int diaryDate = Integer.parseInt(dateFormat.format(now));
	String diaryTitle = null;
	String diaryContent = null;
	String diaryMood = null;
	String diaryAnswer = null;
	
	if(request.getParameter("diaryTitle")!= null)
		diaryTitle = request.getParameter("diaryTitle");
	if(request.getParameter("diaryContent") != null)
		diaryContent = request.getParameter("diaryContent");
	if(request.getParameter("diaryMood")!=null)
		diaryMood = request.getParameter("diaryMood");
	
	if(diaryTitle == null || diaryContent == null || diaryMood == null || diaryTitle.equals("") || diaryContent.equals("") || diaryMood.equals("")){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안된 사항이 있습니다.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}
	
	diaryAnswer = "answer";
	
	

	int result = diaryDAO.diarySubmit(userID, diaryDate, diaryTitle, diaryContent, diaryMood, diaryAnswer);
	
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
		script.println("alert('선생님 : 오늘 일기도 수고했어!');");
		script.println("location.href = 'index.jsp'");
		script.println("</script>");
		script.close();
		return;
	}
	
%>