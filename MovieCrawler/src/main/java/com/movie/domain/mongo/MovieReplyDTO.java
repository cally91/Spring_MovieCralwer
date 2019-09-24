package com.movie.domain.mongo;

import java.util.Date;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
@Document(collection = "MovieReply")
public class MovieReplyDTO {
	
	@Id
	private String id;
	private String code; //이거은 다음 영화코드다
	private String movie;
	private String score;
	private String content;
	private String writer;
	private String date;
	public MovieReplyDTO(String code, String movie, String score, String content, String writer, String date) {
		super();
		this.code = code;
		this.movie = movie;
		this.score = score;
		this.content = content;
		this.writer = writer;
		this.date = date;
	}
	
}
