package com.faisal.board.domain;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;

public class Message {
	
	
	private Long id;
	
	@NotEmpty
	@Size(min=3)
	private String author;
	
	@NotEmpty
	@Size(min=3)
	private String title;
	
	@NotEmpty
	@Size(min=9)
	private String body;
	
	public Message(){}
	
	public Message(Long id, String author, String title, String body) {
		super();
		this.id = id;
		this.author = author;
		this.title = title;
		this.body = body;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getBody() {
		return body;
	}

	public void setBody(String body) {
		this.body = body;
	}

	@Override
	public String toString() {
		return "Message [id=" + id + ", author=" + author + ", title=" + title + ", body=" + body + "]";
	}
	
	
	
}
