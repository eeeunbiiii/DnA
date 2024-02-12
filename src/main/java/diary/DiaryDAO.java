package diary;

import java.sql.Connection;
import java.sql.PreparedStatement;

import util.DatabaseUtil;

public class DiaryDAO{
	
	public int diarySubmit(String userID, int date, String title, String content, String mood, String answer) {
		String SQL = "INSERT INTO DIARY VALUES(?,?,?,?,?,?)";
		try {
			Connection conn = DatabaseUtil.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			pstmt.setInt(2, date);
			pstmt.setString(3, title);
			pstmt.setString(4, content);
			pstmt.setString(5, mood);
			pstmt.setString(6, answer);
			return pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
}