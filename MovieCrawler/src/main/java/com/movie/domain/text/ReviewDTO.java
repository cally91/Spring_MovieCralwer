package com.movie.domain.text;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class ReviewDTO {
	private int movieno;	//NUMBER
	private String movie;	//nvarchar2(2000 char)
	private String grade;	//number(4,2)
	private String review;	//nvarchar2(2000 char)
	private String	writer;	//nvarchar2(2000 char)
	private String reviewdate;	//date
}
