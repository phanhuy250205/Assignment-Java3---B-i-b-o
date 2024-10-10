package model;

import java.util.Date;

public class News {
	private String id;
	private String title;
	private String content;
	private String image;
	private Date postedDate;  // Consider changing to java.time.LocalDate
	private String author;
	private int viewCount;     // Updated naming convention
	private String categoryId;
	private boolean home;

	// Constructors
	public News() {
	}

	public News(String id, String title, String content, String image, Date postedDate, String author, int viewCount,
			String categoryId, boolean home) {
		this.id = id;
		this.title = title;
		this.content = content;
		this.image = image;
		this.postedDate = postedDate;
		this.author = author;
		this.viewCount = viewCount;
		this.categoryId = categoryId;
		this.home = home;
	}

	// Getters and Setters
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
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

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public Date getPostedDate() {
		return postedDate;
	}

	public void setPostedDate(Date postedDate) {
		this.postedDate = postedDate;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public int getViewCount() {
		return viewCount;
	}

	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}

	public String getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(String categoryId) {
		this.categoryId = categoryId;
	}

	public boolean isHome() {
		return home;
	}

	public void setHome(boolean home) {
		this.home = home;
	}

	@Override
	public String toString() {
		StringBuilder sb = new StringBuilder();
		sb.append("News {");
		sb.append("id='").append(id).append('\'');
		sb.append(", title='").append(title).append('\'');
		sb.append(", content='").append(content).append('\'');
		sb.append(", image='").append(image).append('\'');
		sb.append(", postedDate=").append(postedDate);
		sb.append(", author='").append(author).append('\'');
		sb.append(", viewCount=").append(viewCount); // Updated field name
		sb.append(", categoryId='").append(categoryId).append('\'');
		sb.append(", home=").append(home);
		sb.append('}');
		return sb.toString();
	}
}
