package com.movie.domain.board;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class ReplyDTO {
	private int rno;//	number
	private String content;//	varchar2(2000 byte)
	private String writer;//	varchar2(30 byte)
	private String regdate;//	date
	private int bno;//	number
}
