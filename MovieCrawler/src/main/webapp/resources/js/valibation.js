var joinValidate = {
	// 결과 메시지 출력시 사용하는
	resultCode : {
		empty_val : {
			code : 1,
			desc : '필수입력 정보입니다.'
		},
		space_length_val : {
			code : 2,
			desc : '공백없이 입력해주세요.'
		},
		success_id : {
			code : 0,
			desc : '멋진 아이디네요'
		},
		invalid_id : {
			code : 3,
			desc : '올바른 아이디를 입력해주세요.'
		},
		length_id : {
			code : 4,
			desc : '아이디는 공백없이 5자이상 20자이하로 작성해주세요.'
		},
		overlap_id : {
			code : 5,
			desc : '이미 사용중인 아이디입니다.'
		},
		// 비밀번호 체크
		success_pw : {
			code : 0,
			desc : "사용가능한 비밀번호입니다."
		},
		invalid_pw : {
			code : 3,
			desc : "올바른 비밀번호(4~12자)를 입력하세요."
		},
		other_pw :{
			code: 4,
			desc:"비밀번호가 일치하지않습니다."
		},
		equal_pw :{
			code: 5,
			desc:"현재 비밀번호와 다르게 입력해주세요."
		},
		success_name : {
			code: 0,
			desc:"멋진 이름이네요"
		} ,
		length_name : {
			code:3,
			desc:"2자 이상 10자 이하로만 입력해주세요"
		},
		// 핸드폰 번호 체크
		success_phone :{
			code :0,
			desc:"사용가능한 전화번호입니다.."
		},
		invalid_phone :{
			code:3,
			desc:"휴대폰 번호가 올바르지 않습니다."
		},
		length_phone :{
			code:4,
			desc:"(-)없이 10자, 11자로 입력해주세요"
		},
		number_phone :{
			code:5,
			desc:"숫자만 입력해주세요"
		}
	},
	// 아이디 유효성채크
	checkId : function(memId) {
		var regEmpty = /\s/g;// 공백문자
		var regId = /[^a-z0-9-_.]+/g; // ID 유효성 채크
		if (memId == "" || memId.length == 0) { // null 채크
			return this.resultCode.empty_val;
		} else if (memId.match(regEmpty)) { // 공백채크
			return this.resultCode.space_length_val;
		} else if (regId.test(memId)) { // 아이디 정규식 채크
			return this.resultCode.invalid_id;
		} else if ((memId.length < 5) || (memId.length > 20)) { // 길이채크
			return this.resultCode.length_id;
		} else {
			// 중복체크 미완성
			return this.resultCode.success_id;
		}
	},
	//비밀번호 유효성 체크
	checkPw : function(memPw, memRpw) {
		var regEmpty = /\s/g;// 공백문자
		var pwReg = RegExp(/^[a-zA-Z0-9]{4,12}$/); // PASSWORD 유효성 채크
		if ((memPw == "") || (memPw.length == 0)) { // null 체크
			return this.resultCode.empty_val;
		} else if (memPw.match(regEmpty)) {
			return this.resultCode.space_length_val;// 공백 체크
		} else if (!pwReg.test(memPw)) {
			return this.resultCode.invalid_pw; // pw정규식(+길이) 체크
		} else if ((memRpw != "") || (memRpw.length != 0)) {
			// 비빌번호와 비밀번호 재확인 일치하는지 확인
			if (memPw == memRpw) {
				return this.resultCode.success_pw;
			} else {
				return this.resultCode.other_pw;
			}

		} else {
			return this.resultCode.success_pw;
		}

	},
	checkRpw: function(memPw,memRpw){
		if ((memRpw == "") || (memRpw.length == 0)) { // null 체크
			return this.resultCode.empty_val;
		} else if ((memRpw != "") || (memRpw.length != 0)) {
			// 비빌번호와 비밀번호 재확인 일치하는지 확인
			if (memPw == memRpw) {
				return this.resultCode.success_pw;
			} else {
				return this.resultCode.other_pw;
			}

		} else {
			return this.resultCode.success_pw;
		} 
	},
	checkName: function(name){
		var regEmpty = /\s/g;// 공백문자
		var regLang = /[^a-zA-Z가-힣0-9]/; // 영문,한글
		if((name=="")||(name.length == 0)) { // null 채크
			return this.resultCode.empty_val;
		}else if (name.match(regEmpty)){
			return this.resultCode.space_length_val;// 공백 체크
		} else if (regLang.test(name)){
			return this.resultCode.invalid_name;
		}else if((name.length <2)||(name.length > 10)){
			return this.resultCode.length_name;
		}else{
			return this.resultCode.success_name;
		}
	},
	checkPhone : function(phone) {
		var regEmpty = /\s/g;
		var regPhone = /^(?:(010\d{4})|(01[1|6|7|8|9]\d{3,4}))(\d{4})$/; // 영문,한글
		if ((phone == "") || (phone== 0)) { // null 체크
			return this.resultCode.empty_val;
		} else if (phone.match(regEmpty)) { // 공백채크
			return this.resultCode.space_length_val;
		}else if ($.isNumeric(phone) == false){
			return this.resultCode.number_phone ;
		}else if (regPhone.test(phone)){
			return this.resultCode.invalid_phone;
		}else if((phone.length != 10)||(phone.length != 11)){
			return this.resultCode.length_phone;	
		} else{
			return this.resultCode.success_phone;
		}
	}

}

// AJAX ID 중복 체크
function ajaxCheck(memId) {
	$.ajax({
		type : "POST",
		url : "idcheck?id=" + memId,
		contentType : "application.json",
		success : function(data) {
			if (data == 1) {
				console.log(data);
				$("#inputid").next().text('이미 사용중인 아이디입니다').css('display',
						'block').css('color', '#ff3636')
				return "overlap";
			} else {
				$("#inputid").next().text('멋진 아이디네요').css('display', 'block')
						.css('color', '#0000ff')
				return "ok";
			}
		},
		error : function() {
			alert("System Error o0o");
		}
	})

}