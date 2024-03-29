package diary;

public class DiaryDTO{
    int diaryID;
    String userID;
    int date;
    String title;
    String content;
    String mood;
    String answer;
    String image;
    String teacher; // 추가된 필드

    public DiaryDTO() {
    }

    public DiaryDTO(String userID, int date, String title, String content, String mood, String answer, String teacher) {
        this.userID = userID;
        this.date = date;
        this.title = title;
        this.content = content;
        this.mood = mood;
        this.answer = answer;
        this.teacher = teacher; // 추가된 필드 초기화
    }

    public DiaryDTO(int diaryID, String userID, int date, String title, String content, String mood, String answer,
            String image, String teacher) {
        super();
        this.diaryID = diaryID;
        this.userID = userID;
        this.date = date;
        this.title = title;
        this.content = content;
        this.mood = mood;
        this.answer = answer;
        this.image = image;
        this.teacher = teacher; // 추가된 필드 초기화
    }
	public int getDiaryID() {
		return diaryID;
	}
	public void setDiaryID(int diaryID) {
		this.diaryID = diaryID;
	}

	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}

	public int getDate() {
		return date;
	}
	public void setDate(int date) {
		this.date = date;
	}

	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}

	public String getMood() {
		return mood;
	}
	public void setMood(String mood) {
		this.mood = mood;
	}

	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getTeacher() { // 추가된 getter 메소드
        return teacher;
    }

    public void setTeacher(String teacher) { // 추가된 setter 메소드
        this.teacher = teacher;
    }
}