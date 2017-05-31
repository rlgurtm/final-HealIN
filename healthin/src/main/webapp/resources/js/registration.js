		var data;
		var connLocation;
		$(document)
				.ready(
						function() {
							data = [
									{
										"cityName" : "강남구",
										"viewOrder" : "1"
									},
									{
										"cityName" : "서초구",
										"viewOrder" : "2"
									},
									{
										"cityName" : "은평구",
										"viewOrder" : "3"
									},
									{
										"cityName" : "노원구",
										"viewOrder" : "4"
									},
									{
										"cityName" : "용산구",
										"viewOrder" : "5"
									},
									{
										"cityName" : "용인시",
										"viewOrder" : "6"
									},
									{
										"cityName" : "안양시",
										"viewOrder" : "7"
									},
									{
										"cityName" : "성남시",
										"viewOrder" : "8"
									},
									{
										"cityName" : "양평시",
										"viewOrder" : "9"
									},
									{
										"cityName" : "의정부시",
										"viewOrder" : "10"
									} ];

							$("#inpNationInfo")
									.autocomplete(
											{
												minLength : 0,
												source : $
														.map(
																data,
																function(item) {
																	return {
																		label : item.countryNameKo
																				+ " / "
																				+ item.countryName,
																		value : item.phoneCode,
																		code : item.countryCode
																	}
																}),
												response : function(event, ui) {
													$(".list_nationinfo")
															.empty();
													if (ui.content.length > 0) {
														$(".list_nationinfo")
																.append(
																		'<ul id="list_nation" class="list_nation"></div');
													} else {
														$(".list_nationinfo")
																.html(
																		'<div class="wrap_nodata"><strong class="tit_nodata">검색 결과가 없습니다.</strong><p class="txt_nodata">검색할 국가명(영문,국문) 또는 국가번호를<br>다시 입력해 주세요.</p></div>');
													}
												},
												open : function(event, ui) {
													$(".ui-autocomplete")
															.hide();
												}

											}).data('uiAutocomplete')._renderItem = function(
									ul, item) {
								var label = item.label;
								if (this.term != "") {
									var re = new RegExp("(" + this.term + ")",
											"gi"), cls = "txt_emph", template = "<span class='" + cls + "'>$1</span>", label = item.label
											.replace(re, template);
								}
								var element = '<a href="javascript:;"  class="item_info"><span class="num_item">(+'
										+ item.value
										+ ')</span>'
										+ label
										+ '</a>';

								return $('<li id="' + item.value + '"></li>')
										.append(element)
										.appendTo(".list_nationinfo")
										.on(
												"click",
												function() {
													$(".link_nationnum").html(
															'+' + item.value);
													countryNo.val(item.value);
													countryCode.val(item.code);
													showObject
															.removeClass("input_on");

												})
										.keyup(
												function(e) {
													if (e.keyCode == 13) {
														$(".link_nationnum")
																.html(
																		'+'
																				+ item.value);
														countryNo
																.val(item.value);
														countryCode
																.val(item.code);
														showObject
																.removeClass("input_on");
													}
												});
							};

							$("#inpNationInfo").autocomplete("search").on(
									"keydown", function(e) {
										if (e.keyCode == 13) {
											return false;
										}
									});

							$(".link_nationnum").on("click", function() {
								showObject.toggleClass("input_on");
							});

							$(document)
									.on(
											"keyup mouseup",
											function(e) {
												if (($('.wrap_nationinfo').has(
														$(e.target)).length == 0)
														&& (e.target.className != 'link_nationnum')) {
													if (showObject
															.hasClass("input_on")) {
														showObject
																.removeClass("input_on");
													}
												}
											});

						});
		var showObject;
		var countryNo;
		var countryCode;

		var initAutoComplete = function(showObj, countryNoObj, countryCodeObj) {
			this.showObject = showObj;
			this.countryNo = countryNoObj;
			this.countryCode = countryCodeObj;
			initConnLocation();
		}

		var initConnLocation = function() {
			$.each(data, function(index, item) {
				if (item.countryCode == connLocation) {
					$('.link_nationinfo').html(
							"(+" + item.phoneCode + ") " + item.countryNameKo
									+ " / " + item.countryName)
							.on(
									"click",
									function() {
										$(".link_nationnum").html(
												'+' + item.phoneCode);
										countryNo.val(item.phoneCode);
										countryCode.val(item.countryCode);
										showObject.removeClass("input_on");

									}).keyup(
									function(e) {
										if (e.keyCode == 13) {
											$(".link_nationnum").html(
													'+' + item.phoneCode);
											countryNo.val(item.phoneCode);
											countryCode.val(item.countryCode);
											showObject.removeClass("input_on");
										}
									});

					$('.link_nationinfo').html(
							"(+" + item.phoneCode + ") " + item.countryNameKo
									+ " / " + item.countryName)
					$(".link_nationnum").html('+' + item.phoneCode);
					countryNo.val(item.phoneCode);
					countryCode.val(item.countryCode);
				}
			});
		}

		var setConnLocation = function(searchCountryNo) {
			if (searchCountryNo == "") {
				return;
			}

			$.each(data, function(index, item) {
				if (item.phoneCode == searchCountryNo) {
					$(".link_nationnum").html('+' + item.phoneCode);
					countryNo.val(item.phoneCode);
					countryCode.val(item.countryCode);
				}
			});
		}
		$(document)
				.ready(
						function() {
							var isPassPW = false;
							var nationalClick = false;

							$("form")
									.initValidation(
											{
												inputEvent : "keydown focus",
												validationEvent : "blur",
												    id : {
													rules : {
														required : true,
														rangelength : [ 4, 15 ],
														onlydigits : true,
														notUpperCase : true,
														idinvalid : true,
														checkjuminnoformat : true
													},
													inputListener : function(
															input) {
														formInput(input);
														hideRecommendIds();
													},
													errorListener : function(
															input, result) {
														var extra = result.extra;
														if (extra !== undefined) {
															var uniqueDaumidExtra = extra.uniqueDaumid;
															if (uniqueDaumidExtra !== undefined) {
																if (uniqueDaumidExtra.recommendId1 !== undefined
																		&& uniqueDaumidExtra.recommendId2 !== undefined) {
																	showRecommendIds(
																			uniqueDaumidExtra.recommendId1,
																			uniqueDaumidExtra.recommendId2);
																} else if (uniqueDaumidExtra.responseCode == "403") {
																	redirectFirstPageForError(result.message);
																	return;
																}
															}
														}

														formError(input, result);
													}
												},
												name : {
													rules : {
														required : true,
														strTrim : true,
														nameinvalid : true,
														minKoreanNameLength : true,
														maxKoreanNameLength : true,
														englishnamelength : true
													}
												},
												nickname : {
													rules : {
														required : true,
														strTrim : true,
														nicknameinvalid : true,
														minKoreanNameLength : true,
														maxKoreanNameLength : true,
														englishnamelength : true
													}
												},
												email : {
													nullable : true,
													rules : {
														strTrim : true,
														notUpperCase : true,
														email : true
													},
													errorListener : function(
															input, result) {
														if (result.extra !== undefined) {
															var activeEmailCheckError = result.extra['activeEmail'];
															if (activeEmailCheckError != undefined
																	&& activeEmailCheckError.responseCode == "403") {
																redirectFirstPageForError(result.message);
																return;
															}
														}

														if ($.trim(input.val()) == "") {
															$(input).val("");
															formReset(input);
														} else {
															formError(input,
																	result);
														}
													}
												},
												password : {
													inputEvent : "focus",
													validationEvent : "blur keyup",
													rules : {
														pwValid : function() {
															return {
																id : "#id"
															}
														}
													},
													errorListener : function(
															input, result) {
														if (GlobalValidationInfo.currEventType == "keyup"
																&& input.val() == "") {
															return true;
														}
														isPassPW = false;
														setInputError(input,
																result.message);
														showValidIcon(input)
																.text("불가");
														checkPwReconfirm(input,
																$("#password2"));
													},
													inputListener : function(
															input) {
														if (isPassPW) {
															showTypingBox(input);
															hideErrorMessage($("#password2"));
														}
													},
													successListener : function(
															input, result) {
														isPassPW = true;
														setInputSuccess(input);
														if (result !== undefined
																&& result['pwValid'].extra !== undefined
																&& result['pwValid'].extra.isStrong === true) {
															showValidIcon(input)
																	.addClass(
																			"txt_strong")
																	.text("강력");
														} else {
															showValidIcon(input)
																	.removeClass(
																			"txt_strong")
																	.text("안전");
														}
														checkPwReconfirm(input,
																$("#password2"));
													}
												},
												password2 : {
													inputEvent : "focus",
													resultCaching : false,
													rules : {
														isSameValue : $("#password")
													},
													errorListener : function(
															input, result) {
														if (isPassPW) {
															passwordNotMatched(input);
														} else {
															hideTypingBox(input);
														}
													},
													successListener : function(
															input) {
														if (isPassPW) {
															passwordMatched(input);
														} else {
															hideTypingBox(input);
														}
													},
													inputListener : function(
															input) {
														if (isPassPW) {
															setInputFocus(input);
															hideValidIcon(input);
														}
													}
												},
												errorListener : formError,
												resetListener : formReset,
												inputListener : formInput,
												successListener : formSuccess
											});

							function formError(input, result) {
								setInputError(input, result.message);
								hideValidIcon(input);
							}

							function formReset(input) {
								setInputReset(input);
								hideValidIcon(input);
							}

							function formInput(input) {
								setInputFocus(input);
								hideValidIcon(input);
							}

							function formSuccess(input) {
								setInputSuccess(input);
								showValidIcon(input);
							}

							function setInputError(input, message) {
								showErrorBox(input);
								showErrorMessage(
										getProperErrorMessageTarget(input),
										message);
							}

							function setInputReset(input) {
								resetBox(input);
							}

							function setInputSuccess(input) {
								if (GlobalValidationInfo.currEventType == "keyup") {
									showTypingBox(input);
								} else {
									showSuccessBox(input);
								}
								hideErrorMessage(getProperErrorMessageTarget(input));
							}

							function setInputFocus(input) {
								showTypingBox(input);
								hideErrorMessage(getProperErrorMessageTarget(input));
							}

							function showValidIcon(input) {
								var target = $(input).siblings(".mark_valid");
								if (target.length > 0) {
									target.show();
								}
								return target;
							}

							function hideValidIcon(input) {
								var target = $(input).siblings(".mark_valid");
								if (target.length > 0) {
									target.hide();
								}
								return target;
							}

							function setInputErrorCert(input, message) {
								showErrorBox(input);
								showErrorMessage(
										getProperErrorMessageTarget(input),
										message);
							}

							$("form input:text, form input:password").focus(
									function() {
										offPlaceHolder(this);
									}).blur(function() {
								onPlaceHolder(this);
							}).on("keyup keypress", function(e) {
								return e.which !== 13;
							});

							function offPlaceHolder(input) {
								$(input).siblings(".txt_placeholder").addClass(
										"screen_out");
							}

							function onPlaceHolder(input) {
								if ($(input).val() == "") {
									$(input).siblings(".txt_placeholder")
											.removeClass("screen_out");
								}
							}

							$("form")
									.submit(
											function() {
												var errorCnt = 0;

												if (!$("form").valid()) {
													errorCnt++;
												}
												if (isAuthenticated != true
														&& $("#tel")
																.isValid() == true) {
													if (!isSendCode) {
														sendCertCodeFail($.fn.messages.sendAndInputCertCode);
													} else {
														confirmCertCodeFail($.fn.messages.inputAndConfirmCertCode);
													}
													errorCnt++;
												}
												if (errorCnt == 0) {
													$("#submitBtn").attr(
															"disabled", true);
													return true;
												}
												return false;
											});

							$("form")
									.keydown(
											function(event) {
												var activeElement = document.activeElement;
												if (event.keyCode === 13
														&& (activeElement.nodeName == 'INPUT' || $(
																activeElement)
																.attr('type') == 'submit')) {
													$(activeElement).blur();
													$("form").submit();
												}
											});

							function checkPwReconfirm(pw1, pw2) {
								if (pw2.val() == "" || !isPassPW) {
									setInputReset(pw2);
									hideValidIcon(pw2);
								} else {
									if (pw1.val() == pw2.val()) {
										passwordMatched(pw2);
									} else {
										passwordNotMatched(pw2);
									}
								}
							}

							function passwordMatched(input) {
								setInputSuccess(input);
								showValidIcon(input).text("일치");
							}

							function passwordNotMatched(input) {
								setInputError(input,
										$.fn.messages.passwordNotMatched);
								showValidIcon(input).text("불일치");
							}

							var isSendCode = false;
							var isAuthenticated = false;

							$("#tel")
									.initValidation(
											{
												inputEvent : "focus",
												validationEvent : "blur keyup",
												rules : {
													required : true,
													mobile : function() {
														return {
															mobileNationalCode : $(
																	"#mobileNationalCode")
																	.val(),
															mobileNational : $(
																	"#mobileNational")
																	.val(),
															mobileInternationalFormat : "#mobileInternationalFormat"
														}
													}
												},
												errorListener : function(input,
														result) {

													if (nationalClick == true
															&& $(input).val() == "") {
														return true;
													}

													setCertCodeBtnDisable(
															"certBtn", true);
													if (GlobalValidationInfo.currEventType != "keyup") {
														if (result.extra !== undefined) {
															var certcodePolicyCheckError = result.extra['certcodePolicy'];
															if (certcodePolicyCheckError != undefined
																	&& certcodePolicyCheckError.responseCode == "403") {
																redirectFirstPageForError(result.message);
																return;
															}
														}

														setInputErrorCert(
																input,
																result.message);
													}
												},
												inputListener : function(input,
														result) {
													isAuthenticated = false;

													showTypingBoxForAuth(input);

													$("#tel").val("");
													resetBox($("#tel"));
													hideErrorMessage($("#tel"));
													setCertCodeBtnDisable(
															"confirmBtn", true);
													onPlaceHolder($("#tel"));
													$("#matchedCertCodeText")
															.hide();

													if (isSendCode) {
														$("#tel").attr(
																"disabled",
																false);
													}
												},
												successListener : function(
														input, result) {
													if (isAuthenticated == false) {
														setCertCodeBtnDisable(
																"certBtn",
																false);
														if (GlobalValidationInfo.currEventType == "blur") {
															showSuccessBox(input);
														}
													}
												}
											});

							$("#numNation").on("mouseenter touchstart",
									function() {
										nationalClick = true;
									});

							$("#numNation").on("mouseleave touchend",
									function() {
										nationalClick = false;
									});

							$("#numNation").on("click touch", function() {
								nationalClick = false;
							});

							// 국가 선택 후 #inpPhone으로 포커싱 -- 보완예정
							//        $("#numNation").on("focusout", function (event) {
							//            console.log("focusout");
							//            console.log("event :"+event.type);
							//            $(".num_nation").trigger("clickNumNation");
							//        });
							//
							//        $("#numNation").on("clickNumNation", function (event) {
							//            console.log("clickNumNation");
							//            console.log("event :"+event.type);
							//            setTimeout(function(){$("#inpPhone").focus();}, 100);
							//        });

							$("#inpCertCode")
									.initValidation(
											{
												inputEvent : "focus",
												validationEvent : "blur keyup",
												rules : {
													required : true,
													onlyNumber : true,
													rangelength : [ 6, 6 ]
												},

												errorListener : function(input,
														result) {
													hideTypingBox(input);
													if ($("#tel")
															.isValid() == true) {
														setCertCodeBtnDisable(
																"confirmBtn",
																true);
														if (GlobalValidationInfo.currEventType != "keyup") {
															setInputErrorCert(
																	input,
																	result.message);
														}
													}
												},
												inputListener : function(input,
														result) {
													showTypingBoxForAuth(input);
													if ($("#tel")
															.isValid() == true) {
														hideErrorMessage($("#inpCertCode"));
													}
												},
												successListener : function(
														input, result) {
													if (GlobalValidationInfo.currEventType == "blur") {
														hideTypingBox($("#inpCertCode"));
													}
													if ($("#tel")
															.isValid()) {
														setCertCodeBtnDisable(
																"confirmBtn",
																false);
													}
												}
											});

							$("#certBtn")
									.click(
											function() {

												if ($("#certBtn").hasClass(
														"disabled")) {
													return false;
												}
												hideTypingBox($("#inpCertCode"));

												//인증번호 발송 정책체크
												var val = $.fn.methods
														.certcodePolicy($(
																"#inpPhone")
																.val(), "",
																NumberInfo);


												if (confirm($(
														"#mobileInternationalFormat")
														.val()
														+ " 입력하신 번호로 인증번호를 발송합니다.\n번호가 정확한지 확인해 주세요.")) {
													setInputReset($("#inpCertCode"));
													setCertCodeBtnDisable(
															"confirmBtn", true);
													$("#inpCertCode").val("")
															.attr("disabled",
																	true);
													$("#matchedCertCodeText")
															.hide();
													isAuthenticated = false;
													isSendCode = false;

													$
															.post(
																	"https://member.daum.net/api/auth/send.do?v=2",
																	{
																		PAGEID : "9414",
																		serviceType : "join",
																		authType : "phone",
																		mobile : $(
																				"#inpPhone")
																				.val(),
																		countryCode : $(
																				"#mobileNationalCode")
																				.val(),
																		countryNo : $(
																				"#mobileNational")
																				.val()

																	},
																	function(
																			data) {
																		if (data.code == "200") {
																			if (data.message == "OK") {
																				sendCertCodeOK();
																			} else {
																				sendCertCodeFail(data.result.message);
																			}
																		} else if (data.code == "500") {
																			sendCertCodeFail($.fn.messages.failSendCertCode);
																		} else {
																			sendCertCodeFail(data.result.message);
																		}
																	});
												}
											});

							$("#confirmBtn")
									.click(
											function() {

												if ($("#confirmBtn").hasClass(
														"disabled")) {
													return false;
												}

												if ($("#inpCertCode").isValid() == false) {
													$("#inpCertCode").valid();
													return false;
												}

												if ($("#inpPhone").isValid() == false) {
													return false;
												}

												var extra = {};
												$
														.post(
																"https://member.daum.net/api/auth/collate.do?v=2",
																{
																	PAGEID : "9414",
																	serviceType : "join",
																	authType : "phone",
																	inputValue : $(
																			"#inpCertCode")
																			.val(),
																	mobile : $(
																			"#inpPhone")
																			.val(),
																	countryCode : $(
																			"#mobileNationalCode")
																			.val(),
																	countryNo : $(
																			"#mobileNational")
																			.val()

																},
																function(data) {
																	if (data.code == "200") {
																		if (data.message == "MATCH") {
																			confirmCertCodeOK();
																		} else if (data.message == "NOT_MATCH") {
																			confirmCertCodeFail(
																					data.result.message,
																					extra);
																		} else if (data.message == "NOT_VALID") {
																			sendCertCodeFail(data.result.message);
																			$(
																					"#inpCertCode")
																					.val(
																							"");
																		} else {
																			confirmCertCodeFail(
																					data.result.message,
																					extra);
																		}
																	} else if (data.code == '403') {
																		result = 'fail';
																		message = $.fn.messages.invalidAccess
																		extra.responseCode = data.code;
																		confirmCertCodeFail(
																				message,
																				extra);
																	} else if (data.code == "500") {
																		confirmCertCodeFail(
																				$.fn.messages.failConfirmCertCode,
																				extra);
																	} else {
																		confirmCertCodeFail(
																				data.message,
																				extra);
																	}
																});
											});


							function confirmCertCodeOK() {
								setInputSuccess($("#inpCertCode"));

								$("#inpPhone").attr("disabled", true);
								setCertCodeBtnDisable("certBtn", true);

								$("#inpCertCode").attr("disabled", true);

								setCertCodeBtnDisable("confirmBtn", true);
								$("#matchedCertCodeText").show();
								$(".num_nation").css({
									"pointer-events" : "none"
								});
								isAuthenticated = true;
							}



							function showErrorBox(input) {
								$(input).parent().addClass("info_error")
										.removeClass("wrap_valid").removeClass(
												"wrap_typing");
							}

							function showErrorMessage(input, message) {
								if (message !== undefined && message != "") {
									$(input).parent().siblings(".txt_message")
											.html(message).show();
								}
							}

							function hideErrorMessage(input) {
								$(input).parent().siblings(".txt_message")
										.hide();
							}

							function resetBox(input) {
								$(input).parent().removeClass("info_error")
										.removeClass("wrap_valid").removeClass(
												"wrap_typing");
							}

							function hideTypingBox(input) {
								$(input).parent().removeClass("info_error")
										.removeClass("wrap_typing");
							}

							function showTypingBox(input) {
								$(input).parent().removeClass("info_error")
										.addClass("wrap_valid").addClass(
												"wrap_typing");
							}

							function showTypingBoxForAuth(input) {
								$(input).parent().removeClass("info_error")
										.addClass("wrap_typing");
							}

							function showSuccessBox(input) {
								$(input).parent().removeClass("info_error")
										.addClass("wrap_valid").removeClass(
												"wrap_typing");
							}

							function existErrorMessage(input) {
								return $(input).parent().siblings(
										".txt_message").length > 0;
							}

							function getProperErrorMessageTarget(input) {
								var target;
								var id = $(input).attr("id");
								if ("inpPhone" == id) {
									target = $("#inpCertCode");
								} else if ("password" == id) {
									target = $("#password2");
								} else {
									target = input;
								}
								return target;
							}

							$(".link_back").click(function() {
								var prev = "https://member.daum.net/join/terms"
								if ("" != "") {
									prev = prev + "?rtnUrl=";
								}
								location.href = prev;
							});

							initAutoComplete($("#countryListContainer"),
									$("#mobileNational"),
									$("#mobileNationalCode"));
						});

		function redirectFirstPageForError(message) {
			alert(message);
			location.href = "https://member.daum.net/join/terms";
		}
