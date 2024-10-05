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
	public String gettitle() {
		return title;
	}
	public void settitle(String title) {
		this.title = title;
	}
	public String getcontent() {
		return content;
	}
	public void setcontent(String content) {
		this.content = content;
	}
	public String getimage() {
		return Image;
	}
	public void setimage(String image) {
		Image = image;
	}
	public Date getpostedDate() {
		return PostedDate;
	}
	public void setpostedDate(Date postedDate) {
		PostedDate = postedDate;
	}
	public String getauthor() {
		return Author;
	}
	public void setAuthor(String author) {
		Author = author;
	}
	public int getviewcount() {
		return ViewCount;
	}
	public void setviewcount(int viewCount) {
		ViewCount = viewCount;
	}
	public String getcategoryId() {
		return CategoryId;
	}
	public void setCategoryId(String categoryId) {
		CategoryId = categoryId;
	}
	public boolean ishome() {
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
