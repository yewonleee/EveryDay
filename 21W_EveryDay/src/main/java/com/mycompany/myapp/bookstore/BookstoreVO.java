package com.mycompany.myapp.bookstore;

public class BookstoreVO {
	private int seq;
	private String title;
	private String writer;
	private String publisher;
	private String publicationDate;
	private int price;
	private String comment;
	private String underline;
	private String notes;
	private String cover;
	private String writingName;
	private String discoloration;
	private String damage;
	
	
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	//책제목
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	//책저자
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	//출판사
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	//출판일
	public String getPublicationDate() {
		return publicationDate;
	}
	public void setPublicationDate(String publicationDate) {
		this.publicationDate = publicationDate;
	}
	//가격
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	//판매자의 말
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	//밑줄상태
	public String getUnderline() {
		return underline;
	}
	public void setUnderline(String underline) {
		this.underline = underline;
	}
	//필기상태
	public String getNotes() {
		return notes;
	}
	public void setNotes(String notes) {
		this.notes = notes;
	}
	//겉표지상태
	public String getCover() {
		return cover;
	}
	public void setCover(String cover) {
		this.cover = cover;
	}
	//이름적었는지
	public String getWritingName() {
		return writingName;
	}
	public void setWritingName(String writingName) {
		this.writingName = writingName;
	}
	//페이지 변색
	public String getDiscoloration() {
		return discoloration;
	}
	public void setDiscoloration(String discoloration) {
		this.discoloration = discoloration;
	}
	//페이지 훼손
	public String getDamage() {
		return damage;
	}
	public void setDamage(String damage) {
		this.damage = damage;
	}
	
	
	
	
}
