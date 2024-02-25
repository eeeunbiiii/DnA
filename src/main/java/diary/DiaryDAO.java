package diary;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import util.DatabaseUtil;

public class DiaryDAO {
    public int diarySubmit(DiaryDTO diary) {
        String sql = "INSERT INTO DIARY (userID, date, title, content, mood, answer, teacher) VALUES (?, ?, ?, ?, ?, ?, ?)";
        Connection conn = null;
        PreparedStatement pstmt = null;
        try {
            conn = DatabaseUtil.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, diary.getUserID());
            pstmt.setInt(2, diary.getDate());
            pstmt.setString(3, diary.getTitle());
            pstmt.setString(4, diary.getContent());
            pstmt.setString(5, diary.getMood());
            pstmt.setString(6, diary.getAnswer());
            pstmt.setString(7, diary.getTeacher());
            return pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
            return -1; // 데이터베이스 오류
        } finally {
            DatabaseUtil.close(conn, pstmt, null);
        }
    }

    public ArrayList<DiaryDTO> getList() {
		ArrayList<DiaryDTO> diaryList = new ArrayList<DiaryDTO>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = DatabaseUtil.getConnection();
			String sql = "SELECT * FROM diary"; // 테이블명 수정
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				// 일기 정보를 가져와서 DTO에 담기
				int diaryID = rs.getInt("diaryID"); // diaryID 추가
				String userID = rs.getString("userID");
				int diaryDate = rs.getInt("date");
				String diaryTitle = rs.getString("title");
				String diaryContent = rs.getString("content");
				String diaryMood = rs.getString("mood");
				String diaryAnswer = rs.getString("answer");
				String diaryTeacher = rs.getString("teacher");
				// DTO 객체 생성하여 리스트에 추가
				DiaryDTO diary = new DiaryDTO(diaryID, userID, diaryDate, diaryTitle, diaryContent, diaryMood, diaryAnswer, diaryTeacher);
				diaryList.add(diary);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DatabaseUtil.close(conn, pstmt, rs);
		}

		return diaryList;
	}

    public DiaryDTO getDiary(int diaryID) {
        DiaryDTO diary = null;
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = DatabaseUtil.getConnection();
            String sql = "SELECT * FROM diary WHERE diaryID = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, diaryID);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                String userID = rs.getString("userID");
                int diaryDate = rs.getInt("date");
                String diaryTitle = rs.getString("title");
                String diaryContent = rs.getString("content");
                String diaryMood = rs.getString("mood");
                String diaryAnswer = rs.getString("answer");
                String diaryTeacher = rs.getString("teacher");
                diary = new DiaryDTO(diaryID, userID, diaryDate, diaryTitle, diaryContent, diaryMood, diaryAnswer, diaryTeacher);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DatabaseUtil.close(conn, pstmt, rs);
        }

        return diary;
    }
}