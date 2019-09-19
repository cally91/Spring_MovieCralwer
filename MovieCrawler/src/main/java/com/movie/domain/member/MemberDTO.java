package com.movie.domain.member;

import java.util.Date;

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
public class MemberDTO {

	private String userid;
	private String passpw;
	private String name;
	private	String phone; //	varchar2(30 byte)
	private String email;//	varchar2(50 byte)
	private String zipcode;//	varchar2(20 byte)
	private String addr1;//	varchar2(200 byte)
	private String  addr2;//	varchar2(200 byte)
	private Date regdate;
		
}
