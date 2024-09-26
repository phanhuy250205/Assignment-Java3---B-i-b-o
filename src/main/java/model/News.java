package model;

import java.awt.Image;
import java.util.Date;

public class News {
	private String Id;
	private String title;
	private String content;
	private String  Image;
	private Date PostedDate;
	private String Author;
	 private int ViewCount;
	 private String CategoryId;
	 private boolean Home;
	public News() {
		
	}
	public News(String id, String title, String content, String image, Date postedDate, String author, int viewCount,
			String categoryId, boolean home) {


		Id = id;
		this.title = title;
		this.content = content;
		Image = image;
		PostedDate = postedDate;
		Author = author;
		ViewCount = viewCount;
		CategoryId = categoryId;
		Home = home;
	}
	public String getId() {
		return Id;
	}
	public void setId(String id) {
		Id = id;
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
		return Image;
	}
	public void setImage(String image) {
		Image = image;
	}
	public Date getPostedDate() {
		return PostedDate;
	}
	public void setPostedDate(Date postedDate) {
		PostedDate = postedDate;
	}
	public String getAuthor() {
		return Author;
	}
	public void setAuthor(String author) {
		Author = author;
	}
	public int getViewCount() {
		return ViewCount;
	}
	public void setViewCount(int viewCount) {
		ViewCount = viewCount;
	}
	public String getCategoryId() {
		return CategoryId;
	}
	public void setCategoryId(String categoryId) {
		CategoryId = categoryId;
	}
	public boolean isHome() {
		return Home;
	}
	public void setHome(boolean home) {
		Home = home;
	}
	@Override
	public String toString() {
		return "News [Id=" + Id + ", title=" + title + ", content=" + content + ", Image=" + Image + ", PostedDate="
				+ PostedDate + ", Author=" + Author + ", ViewCount=" + ViewCount + ", CategoryId=" + CategoryId
				+ ", Home=" + Home + "]";
	}
	 
	
	
	 
}
