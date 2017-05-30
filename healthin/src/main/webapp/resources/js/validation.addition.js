$(document)
		.ready(
				function() {
					$("#id")
							.keyup(
									function() {
										$("#id").val().length;

										if ($("#id").val().length < 4
												|| $("#id").val().length > 11) {
											$("#txt_message").text(
													"닉네임은 4자 이상 10자 이하여야만 함")
													.css('background-color',
															'pink');
										} else {
											$("#txt_message").text("");
											$
													.ajax({
														type : "POST",
														url : "findById.do",
														data : "id="
																+ $("#memId")
																		.val(),
														success : function(data) {
															if (data) {
																alert('아이디 중복확인을 해주세요.');
																$(
																		"#txt_message")
																		.text(
																				$(
																						"#id")
																						.val()
																						+ '>>> 아이디가 중복되었습니다.')
																		.css(
																				'background-color',
																				'pink');
															} else {
																$("#id")
																		.text(
																				$(
																						"#id")
																						.val()
																						+ '사용가능')
																		.css(
																				'background-color',
																				'yellow');
															}
														}
													});
										}
									})

					function inputBtn() {
						if ($("#txt_message").contains("아이디가 중복되었습니다")) {
							alert('아이디 중복확인을 해라.');
							$("#id").val = "";
							$("#id").focus();
							return false;
						}
					}

					$("#nextstepBtn").click(function() {
						var nickname = $("#nickname").val;
							if(nickname == null){
								$("#nickname_msg").	append(
								"<strong>닉네임 입력하라. </strong>");
							}

					});
					
					
				});
