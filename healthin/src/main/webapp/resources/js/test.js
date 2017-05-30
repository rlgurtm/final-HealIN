(function(a) {
	a
			.extend(
					a.fn,
					{
						messages : {
							daumId : {
								required : "Daum 아이디를 입력해 주세요.",
								rangelength : "조금 더! 아이디는 3자 이상이에요.",
								onlydigits : "숫자로 된 아이디는 사용할 수 없어요. 영문 소문자를 추가해서 다시 입력해 주세요."
							},
							daumid : {
								required : "Daum 아이디를 입력해 주세요.",
								rangelength : "조금 더! 아이디는 3자 이상이에요.",
								onlydigits : "숫자로 된 아이디는 사용할 수 없어요. 영문 소문자를 추가해서 다시 입력해 주세요."
							},
							name : {
								required : "이름을 입력해 주세요."
							},
							inpPhone : {
								required : "휴대폰 번호를 입력해 주세요."
							},
							inpCertCode : {
								required : "인증번호 입력 후 확인 버튼을 눌러주세요.",
								onlyNumber : "잘못된 인증번호 입니다. 인증번호(6자리) 확인 후 다시 입력해 주세요.",
								rangelength : "잘못된 인증번호 입니다. 인증번호(6자리) 확인 후 다시 입력해 주세요."
							},
							regNum : {
								required : "사업자등록번호(또는 고유번호)를 입력해 주세요.",
								regnum : "유효하지 않은 사업자등록번호입니다. 정확하게 다시 입력해 주세요."
							},
							corpName : {
								required : "사업자등록증의 회사명을 입력해 주세요.",
								daumnamekoreannamelength : "한글 15자, 영어 30자까지 입력할 수 있어요.",
								daumnameenglishnamelength : "한글 15자, 영문 30자까지 입력할 수 있어요.",
								daumnamemaxlength : "한글 15자, 영문 30자까지 입력할 수 있어요."
							},
							repName : {
								required : "사업자등록증의 대표자명을 입력해 주세요.",
								nameinvalid : "사용할 수 없는 문자가 있어요. 한글(성과 이름을 공백없이 입력) 또는 영문만 입력해 주세요."
							},
							required : "내용을 입력해 주세요.",
							email : "이메일 주소 형식이 아닙니다. 본인확인이 가능한 이메일 주소를 입력해 주세요.",
							findemail : "이메일 주소를 정확하게 입력해 주세요.",
							url : "URL를 정확하게 입력해 주세요.",
							date : "날짜를 정확하게 입력해 주세요.",
							dateISO : "날짜를 정확하게 입력해 주세요.",
							number : "숫자를 정확하게 입력해 주세요.",
							mobile : "잘못된 휴대폰 번호 입니다. 휴대폰 번호를 확인한 후 다시 입력해 주세요.",
							passwordinvalid : "비밀번호는 영문 소문자,숫자,특수문자만 입력해 주세요!",
							nameinvalid : "사용할 수 없는 문자가 있어요. 한글(성과 이름을 공백없이 입력) 또는 영문만 입력해 주세요.",
							koreannamelength : "한글 이름은 2~15자 까지 입력 가능해요.",
							englishnamelength : "영어 이름은 2~30자 까지 입력할 수 있어요.",
							daumidinvalid : "사용할 수 없는 문자가 있어요. <br>영문 소문자, 숫자, 빼기(-), 밑줄(_), 마침표(.)만 사용할 수 있어요. (단, .은 처음과 끝에 사용불가)",
							checkjuminnoformat : "개인정보(주민등록번호) 형태가 포함된 아이디는 사용할 수 없어요.",
							existdaumidinvalid : "Daum 아이디를 정확히 입력해 주세요.",
							digits : "숫자만 입력 가능해요.",
							equalTo : "같은 값을 입력 해주세요.",
							notUpperCase : "영문 대문자는 사용할 수 없어요. 소문자로 다시 입력해 주세요.",
							daumemailinvalid : "Daum 메일(@daum.net,@hanmail.net)은 사용할 수 없어요.",
							daumemailnotsame : "지금 로그인한 다음메일은 입력할 수 없어요. 다른 이메일 주소를 입력해 주세요.",
							birthyearlimit : "1900-2014 입력해 주세요.",
							birthyear : "년도는 숫자만 입력해 주세요.",
							daumemailnotsameByValue : "지금 로그인한 다음메일은 입력할 수 없어요. 다른 이메일 주소를 입력해 주세요.",
							daumnameinvalid : "닉네임은 한글, 영문, 숫자 또는 '-', '_' 를 이용해 주세요.",
							othermail : "잘못된 이메일 주소 입니다. 이메일 주소를 확인한 다음 다시 입력해 주세요.",
							numberdaumnamelength : "닉네임은 한글 1~15자, 영문 2~30자까지 가능해요.",
							daumnamekoreannamelength : "닉네임은 한글 1~15자, 영문 2~30자까지 가능해요.",
							daumnameenglishnamelength : "닉네임은 한글 1~15자, 영문 2~30자까지 가능해요.",
							contact : "휴대폰 또는 이메일 주소를 다시 확인해 주세요.",
							whitespace : "공백이 포함되어 있습니다.",
							onlydigits : "숫자만 입력 되어있습니다.",
							consecutive : "다른 사람이 추측하기 쉬운 비밀번호는 사용할 수 없어요!",
							isasciiprintable : "영문자, 숫자, 특수문자만 비밀번호에 입력해 주세요!",
							passwordNotMatched : "비밀번호와 일치하지 않습니다. 다시 입력해 주세요.",
							checked : "동의해주세요.",
							minKoreanNameLength : "성과 이름(2자 또는 3자 이상)을 함께 입력해 주세요.",
							maxKoreanNameLength : "한글 이름은 15자까지 입력할 수 있어요.",
							sendAndInputCertCode : "인증 버튼을 선택 후 인증번호(6자리)를 입력해 주세요.",
							inputAndConfirmCertCode : "인증번호 입력 후 확인 버튼을 눌러주세요.",
							invalidCertcode : "잘못된 인증번호 입니다. 인증번호(6자리) 확인 후 다시 입력해 주세요.",
							invalidAccess : "유효시간이 초과되거나, 잘못된 접근입니다. 처음부터 다시 시작해 주세요.",
							failSendCertCode : "인증번호 발송 중 오류가 발생했습니다. 잠시 후 다시 이용해 주세요.",
							failConfirmCertCode : "인증번호 확인에 실패했습니다. 다시 한번 확인 버튼을 눌러 주세요."
						}
					})
}(jQuery));