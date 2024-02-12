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
	
	String apiKey = "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";
	String apiURL = "https://api.openai.com/v1/chat/completions";
	String prompt = "너는 친절하고 따뜻한 초등학교 교사야 다음 학생의 일기를 보고 한문장의 따스한 답변을 해줘. 일기 내용 : "+diaryContent;
	String model = "gpt-3.5-turbo";
	String requestBody = "{\"prompt\": \"" + prompt + "\", \"max_tokens\": 200, \"model\": \"" + model + "\"}";
	String apiResponse = null;
	try{
		URL url = new URL(apiURL);
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("POST");
		conn.setRequestProperty("Content-Type", "application/json");
		conn.setRequestProperty("Authorization", "Bearer "+apiKey);
		conn.setDoOutput(true);
		
		OutputStream os = conn.getOutputStream();
		os.write(requestBody.getBytes());
		os.flush();
		
		BufferedReader br = new BufferedReader(new InputStreamReader((conn.getInputStream())));
		StringBuilder apiResponseBuilder = new StringBuilder();
		String line;
		while ((line = br.readLine()) != null) { 
	        apiResponseBuilder.append(line); 
	    }
		apiResponse = apiResponseBuilder.toString();
		
		conn.disconnect();
		
	}catch (Exception e) {
	    out.println("Error: " + e.getMessage());
		return;
	}
	
	if(apiResponse != null){
		PrintWriter script = response.getWriter();
	    script.println("Response: " + apiResponse);
	    diaryAnswer = apiResponse;
	    script.close();
	} else {
		PrintWriter script = response.getWriter();
	    script.println("<script>");
	    script.println("alert('선생님이 바쁘신가봐요...');");
	    script.println("history.back();");
	    script.println("</script>");
	    script.close();
	    return;
	}

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
