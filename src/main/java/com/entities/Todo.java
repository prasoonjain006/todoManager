package com.entities;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;



@Entity
@Table(name="todo")
public class Todo {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int todoId;
	private String title;
	private String content;
	private Date date;
	public Todo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Todo(String title, String content, Date date) {
		super();
		this.title = title;
		this.content = content;
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
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public int getTodoId() {
		return todoId;
	}
	public void setTodoId(int todoId) {
		this.todoId = todoId;
	}
	@Override
	public String toString() {
		return "Todo [title= " + title + ", content= " + content + ", date= " + date + "]";
	}
}
