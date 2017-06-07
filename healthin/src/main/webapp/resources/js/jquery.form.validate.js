(function(a) {
	a.extend(a.fn, {
		validate : function(b) {
			if (!this.length) {
				return
			}
			var c = a.data(this[0], "validator");
			if (c) {
				return c
			}
			c = new a.validator(b, this[0]);
			a.data(this[0], "validator", c);
			return c
		},
		rules : function() {
			var b = this[0];
			var c = a.validator.normalizeRules(a.extend({}, a.validator
					.staticRules(b)), b);
			if (c.required) {
				var d = c.required;
				delete c.required;
				c = a.extend({
					required : d
				}, c)
			}
			return c
		},
		type : function() {
			var b = this[0];
			var c = a.validator.staticType(b);
			return c
		}
	});
	a.validator = function(b, c) {
		this.settings = a.extend(true, {}, a.validator.defaults, b);
		this.currentForm = c;
		this.init()
	};
	a.validator.format = function(b, c) {
		if (arguments.length === 1) {
			return function() {
				var d = a.makeArray(arguments);
				d.unshift(b);
				return a.validator.format.apply(this, d)
			}
		}
		if (arguments.length > 2 && c.constructor !== Array) {
			c = a.makeArray(arguments).slice(1)
		}
		if (c.constructor !== Array) {
			c = [ c ]
		}
		a.each(c, function(d, e) {
			b = b.replace(new RegExp("\\{" + d + "\\}", "g"), function() {
				return e
			})
		});
		return b
	};
	a
			.extend(
					a.validator,
					{
						defaults : {
							messages : {},
							rules : {}
						},
						messages : {
							required : "내용을 입력해 주세요.",
							email : "이메일 주소를 정확하게 입력해 주세요.",
							findemail : "이메일 주소를 정확하게 입력해 주세요.",
							url : "URL를 정확하게 입력해 주세요.",
							date : "날짜를 정확하게 입력해 주세요.",
							dateISO : "날짜를 정확하게 입력해 주세요.",
							number : "숫자를 정확하게 입력해 주세요.",
							mobile : "잘못된 휴대폰 번호 입니다. 휴대폰 번호를 확인한 후 다시 입력해 주세요.",
							passwordinvalid : "비밀번호는 영문 소문자,숫자,특수문자만 입력해 주세요!",
							nameinvalid : "사용할 수 없는 이름입니다. 다시 입력해 주세요.",
							koreannamelength : "한글 이름은 2~15자 까지 입력 가능해요.",
							englishnamelength : "영문 이름은 2~30자 까지 입력 가능해요.",
							daumidinvalid : "3~15자의 영문 소문자와 숫자, 빼기(-), 밑줄(_), 마침표(.)만 사용할 수 있습니다. (단, .은 처음과 끝에 사용불가, 숫자만 사용불가)",
							checkjuminnoformat : "개인정보(주민등록번호) 형태를 포함한 아이디는 사용할 수 없습니다.",
							existdaumidinvalid : "Daum 아이디를 정확히 입력해 주세요.",
							digits : "숫자만 입력 가능해요.",
							minlength : a.validator.format("{0}자 이상 입력해주세요."),
							maxlength : a.validator.format("{0}자 까지 입력 가능해요."),
							rangelength : a.validator
									.format("{0}~{1}자 까지 입력 가능해요."),
							min : a.validator.format("{0}자 이상 입력해주세요."),
							max : a.validator.format("{0}자 까지 입력 가능해요."),
							range : a.validator.format("{0}~{1}자 까지 입력 가능해요."),
							equalTo : "같은 값을 입력 해주세요.",
							notUpperCase : "대문자는 입력할 수 없습니다.",
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
							regnum : "사업자 등록번호가 잘못되었습니다.",
							contact : "휴대폰 또는 이메일 주소를 다시 확인해 주세요.",
							whitespace : "공백이 포함되어 있습니다.",
							onlydigits : "숫자만 입력 되어있습니다.",
							consecutive : "다른 사람이 추측하기 쉬운 비밀번호는 사용할 수 없어요!",
							isasciiprintable : "영문자, 숫자, 특수문자만 비밀번호에 입력해 주세요!"
						},
						methods : {
							required : function(c, b, e) {
								if (!this.depend(e, b)) {
									return "dependency-mismatch"
								}
								if (b.nodeName.toLowerCase() === "select") {
									var d = a(b).val();
									return d && d.length > 0
								}
								if (this.checkable(b)) {
									return this.getLength(c, b) > 0
								}
								return a.trim(c).length > 0
							},
							email : function(c, b) {
								if (!a.validator.methods.maxlength.call(this,
										c, b, 100)) {
									return false
								}
								return this.optional(b)
										|| /^([a-z0-9._-]+)@([a-z0-9_-]+)(\.[a-z0-9]+){1,2}$/
												.test(c)
							},
							findemail : function(c, b) {
								if (!a.validator.methods.maxlength.call(this,
										c, b, 100)) {
									return false
								}
								return this.optional(b)
										|| /^([a-z0-9.+_-]+)@([a-z0-9_-]+)(\.[a-z0-9]+){1,}$/
												.test(c)
							},
							othermail : function(c, b) {
								if (!a.validator.methods.maxlength.call(this,
										c, b, 100)) {
									return false
								}
								return this.optional(b)
										|| /^([a-z0-9.+_-]+)@([a-z0-9_-]+)(\.[a-z0-9]+){1,2}$/
												.test(c)
							},
							url : function(c, b) {
								return this.optional(b)
										|| /^(https?|s?ftp):\/\/(((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:)*@)?(((\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5]))|((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?)(:\d*)?)(\/((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)+(\/(([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)*)*)?)?(\?((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)|[\uE000-\uF8FF]|\/|\?)*)?(#((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)|\/|\?)*)?$/i
												.test(c)
							},
							date : function(c, b) {
								return this.optional(b)
										|| !/Invalid|NaN/.test(new Date(c)
												.toString())
							},
							dateISO : function(c, b) {
								return this.optional(b)
										|| /^\d{4}\d{1,2}[\/\-]\d{1,2}$/
												.test(c)
							},
							number : function(c, b) {
								return this.optional(b)
										|| /^-?(?:\d+|\d{1,3}(?:,\d{3})+)?(?:\.\d+)?$/
												.test(c)
							},
							mobile : function(c, b) {
								return this.optional(b)
										|| /^[0-9-]{4,13}$/.test(c)
							},
							passwordinvalid : function(c, b) {
								return this.optional(b)
										|| /^[^ㄱ-ㅎ|ㅏ-ㅣ|가-힣]+$/.test(c)
							},
							nameinvalid : function(c, b) {
								return this.optional(b)
										|| /(^[A-Za-z\s]+$)|(^[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]+$)/
												.test(c)
							},
							daumnamekoreannamelength : function(e, b) {
								var c = /^[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]+$/.test(e);
								var d = a.isArray(e) ? e.length : this
										.getLength(a.trim(e), b);
								if (c) {
									return this.optional(b)
											|| (d >= 1 && d <= 15)
								}
								return true
							},
							daumnameenglishnamelength : function(e, c) {
								var b = /^[A-Za-z\s]+$/.test(e);
								var d = a.isArray(e) ? e.length : this
										.getLength(a.trim(e), c);
								if (b) {
									return this.optional(c)
											|| (d >= 2 && d <= 30)
								}
								return true
							},
							koreannamelength : function(e, b) {
								var c = /^[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]+$/.test(e);
								var d = a.isArray(e) ? e.length : this
										.getLength(a.trim(e), b);
								if (c) {
									return this.optional(b)
											|| (d >= 2 && d <= 15)
								}
								return true
							},
							englishnamelength : function(e, c) {
								var b = /^[A-Za-z\s]+$/.test(e);
								var d = a.isArray(e) ? e.length : this
										.getLength(a.trim(e), c);
								if (b) {
									return this.optional(c)
											|| (d >= 2 && d <= 30)
								}
								return true
							},
							daumidinvalid : function(e, c) {
								var b = (/^([a-z0-9-_])([a-z0-9-_\.]+)([a-z0-9-_])$/
										.test(e));
								var d = /^.*[a-z-_\.]+.*$/.test(e);
								return this.optional(c) || (b && d)
							},
							checkjuminnoformat : function(h, f) {
								var c = [ 2, 3, 4, 5, 6, 7, 8, 9, 2, 3, 4, 5 ];
								var b = h.replace(/[^0-9]/g, "");
								if (b.length != 13) {
									return true
								}
								var d = new Array(13);
								for (var e = 0; e < 13; e++) {
									d[e] = parseInt(b.charAt(e))
								}
								for (var g = 0, e = 0; e < 12; e++) {
									g += (d[e] *= c[e])
								}
								if ((11 - (g % 11)) % 10 == d[12]) {
									return false
								}
								return true
							},
							existdaumidinvalid : function(d, c) {
								var b = (/^([\*\+]?[a-z0-9-_+])([a-z0-9-_\.]+)([a-z0-9-_])$/
										.test(d));
								return this.optional(c) || (b)
							},
							digits : function(c, b) {
								return this.optional(b) || /^\d+$/.test(c)
							},
							minlength : function(d, b, e) {
								var c = a.isArray(d) ? d.length : this
										.getLength(a.trim(d), b);
								return this.optional(b) || c >= e
							},
							maxlength : function(d, b, e) {
								var c = a.isArray(d) ? d.length : this
										.getLength(a.trim(d), b);
								return this.optional(b) || c <= e
							},
							rangelength : function(d, b, e) {
								var c = a.isArray(d) ? d.length : this
										.getLength(a.trim(d), b);
								return this.optional(b)
										|| (c >= e[0] && c <= e[1])
							},
							min : function(c, b, d) {
								return this.optional(b) || c >= d
							},
							max : function(c, b, d) {
								return this.optional(b) || c <= d
							},
							range : function(c, b, d) {
								return this.optional(b)
										|| (c >= d[0] && c <= d[1])
							},
							equalTo : function(c, b, e) {
								var d = a(e);
								if (this.settings.onfocusout) {
									d.unbind(".validate-equalTo").bind(
											"blur.validate-equalTo",
											function() {
												a(b).valid()
											})
								}
								return c === d.val()
							},
							notUpperCase : function(c, b) {
								return this.optional(b) || /^[^A-Z]*$/.test(c)
							},
							daumemailinvalid : function(d, b) {
								var c = d.split("@");
								var e = true;
								if (c[1]) {
									if (c[1].toLowerCase().indexOf(
											"hanmail.net") != -1
											|| c[1].toLowerCase().indexOf(
													"daum.net") != -1) {
										e = false
									}
								}
								return this.optional(b) || e
							},
							daumemailnotsame : function(d, b, f) {
								if (!a.validator.methods.daumemailinvalid.call(
										this, d, b)) {
									var e = a("#" + f);
									var c = d.split("@");
									if (c[1]) {
										return !(c[0].toLowerCase() === e.val())
									}
								}
								return true
							},
							birthyearlimit : function(c) {
								var b = new Date().getFullYear();
								if (c !== "") {
									if (c < 1900 || c > b) {
										return false
									}
								}
								return true
							},
							birthyear : function(c, b) {
								if (c !== "") {
									return this.optional(b) || /^\d+$/.test(c)
								}
								return true
							},
							telephone : function(c, b) {
								return this.optional(b)
										|| /^(02|0[3-9]{1}[0-9]{1})-?[0-9]{3,4}-?[0-9]{4}$/
												.test(c)
							},
							daumemailnotsameByValue : function(d, b, e) {
								if (!a.validator.methods.daumemailinvalid.call(
										this, d, b)) {
									var c = d.split("@");
									if (c[1]) {
										return !(c[0].toLowerCase() === e)
									}
								}
								return true
							},
							daumnameinvalid : function(c, b) {
								return this.optional(b)
										|| /^[a-zA-Z0-9가-힣\s_-]*$/.test(c)
							},
							numberdaumnamelength : function(e, c) {
								var b = /^[0-9-_\s]+$/.test(e);
								var d = a.isArray(e) ? e.length : this
										.getLength(a.trim(e), c);
								if (b) {
									return this.optional(c)
											|| (d > 1 && d <= 30)
								}
								return true
							},
							regnum : function(c, b) {
								return this.optional(b)
										|| /^\d{3}-?\d{2}-?\d{5}$/.test(c)
							},
							contact : function(c, b) {
								return this.optional(b)
										|| /^([a-z0-9.+_-]+)@([a-z0-9_-]+)(\.[a-z0-9]+){1,}$/
												.test(c)
										|| /^01([0|1|6|7|8|9])[-]?([0-9]{3,4})[-]?([0-9]{4})$/
												.test(c)
							},
							whitespace : function(c, b) {
								return this.optional(b) || /^\S+$/.test(c)
							},
							onlydigits : function(c, b) {
								return this.optional(b) || !/^\d+$/.test(c)
							},
							consecutive : function(f, d) {
								var e = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
								var c = "abcdefghijklmnopqrstuvwxyz";
								for (var b = 0; b < e.length - f.length + 1; b++) {
									if (e.substring(b, b + f.length) == f) {
										return this.optional(d) || false
									}
								}
								for (b = 0; b < c.length - f.length + 1; b++) {
									if (c.substring(b, b + f.length) == f) {
										return this.optional(d) || false
									}
								}
								if (this.__isSequenceOnKeyboard(f)) {
									return this.optional(d) || false
								}
								for (b = 1; b < f.length; b++) {
									if (f.substring(0, 1) != f.substring(b,
											b + 1)) {
										return this.optional(d) || true
									}
								}
								return this.optional(d) || false
							},
							isasciiprintable : function(e, c) {
								var f = e.length;
								for (var b = 0; b < f; b++) {
									var d = e.charCodeAt(b);
									if (!(d >= 32 && d < 127)) {
										return this.optional(c) || false
									}
								}
								return this.optional(c) || true
							}
						},
						prototype : {
							init : function() {
								this.reset();
								var b = this.settings.rules;
								a.each(b, function(c, d) {
									b[c] = a.validator.normalizeRule(d)
								})
							},
							form : function() {
								this.reset();
								elements = (this.currentElements = this
										.getElements());
								for (var b = 0; elements[b]; b++) {
									this.hideError(elements[b]);
									this.checkElement(elements[b])
								}
								this.showErrors();
								if (this.errorList.length !== 0) {
									a("#" + this.errorList[0].element.id)
											.focus();
									return false
								}
								return true
							},
							element : function(b) {
								this.reset();
								elements = (this.currentElements = this
										.getElements());
								for (var c = 0; elements[c]; c++) {
									if (elements[c].id == b) {
										this.hideError(elements[c]);
										this.checkElement(elements[c])
									}
								}
								this.showErrors();
								if (this.errorList.length !== 0) {
									return false
								}
								return true
							},
							getFormErrorList : function() {
								this.reset();
								elements = (this.currentElements = this
										.getElements());
								for (var b = 0; elements[b]; b++) {
									this.checkElement(elements[b])
								}
								return this.errorList
							},
							getElementErrorList : function(b) {
								this.reset();
								elements = (this.currentElements = this
										.getElementsBySelector(b));
								for (var c = 0; elements[c]; c++) {
									this.checkElement(elements[c])
								}
								return this.errorList
							},
							initElementError : function(b) {
								elements = (this.currentElements = this
										.getElements());
								for (var c = 0; elements[c]; c++) {
									if (elements[c].id == b) {
										this.hideError(elements[c])
									}
								}
							},
							showElementError : function(b, c) {
								elements = (this.currentElements = this
										.getElements());
								for (var d = 0; elements[d]; d++) {
									if (elements[d].id == b) {
										this.showError(elements[d], c)
									}
								}
							},
							showElementInfo : function(c, b) {
								elements = (this.currentElements = this
										.getElements());
								for (var d = 0; elements[d]; d++) {
									if (elements[d].id == c) {
										this.showInfo(elements[d], b)
									}
								}
							},
							showErrors : function() {
								for (var c = 0; this.errorList[c]; c++) {
									var b = this.errorList[c];
									if (b.type === "alert") {
										a("#" + b.element.id + "_input_info")
												.addClass("input_wrong")
												.removeClass("input_ok");
										alert(b.message);
										return
									}
									this.showError(b.element, b.message)
								}
							},
							showError : function(b, c) {
								if ((b.id === "policyAgree" || b.id === "privacyAgree")
										&& b.type === "checkbox") {
									var d = a("#agree_notice");
									d.html(c);
									d.show()
								} else {
									var d = a("#" + b.id + "_notice");
									if (b.id === "password") {
										d.removeClass("emph_allow");
										d.removeClass("emph_pass")
									}
									d.html(c);
									d.show();
									a("#" + b.id + "_input_info").addClass(
											"input_wrong").removeClass(
											"input_ok")
								}
							},
							showInfo : function(b, c) {
								var d = a("#" + b.id + "_notice");
								if (b.id === "password") {
									d.addClass("emph_allow");
									d.addClass("emph_pass")
								}
								d.html(c);
								d.show();
								a("#" + b.id + "_input_info").addClass(
										"input_ok").removeClass("input_wrong")
							},
							hideError : function(b) {
								if ((b.id === "policyAgree" || b.id === "privacyAgree")
										&& b.type === "checkbox") {
									var c = a("#agree_notice");
									c.html("");
									c.hide()
								} else {
									var c = a("#" + b.id + "_notice");
									if ((b.id === "password")
											&& c.hasClass("emph_allow")) {
										return
									}
									c.html("");
									c.hide();
									a("#" + b.id + "_input_info").removeClass(
											"input_wrong");
									a(".lab_g").filter(a("[for=" + b.id + "]"))
											.hide()
								}
							},
							checkElement : function(c) {
								var i = a(c).rules();
								var d = a(c).type();
								var h = this.elementValue(c);
								var b;
								for ( var j in i) {
									var g = {
										method : j,
										parameters : i[j]
									};
									try {
										b = a.validator.methods[j].call(this,
												h, c, g.parameters);
										if (!b) {
											this.formatAndAdd(d, c, g);
											return false
										}
									} catch (f) {
										throw f
									}
								}
								return true
							},
							customMessage : function(c, d) {
								var b = this.settings.messages[c];
								return b
										&& (b.constructor === String ? b : b[d])
							},
							findDefined : function() {
								for (var b = 0; b < arguments.length; b++) {
									if (arguments[b] !== undefined) {
										return arguments[b]
									}
								}
								return undefined
							},
							defaultMessage : function(b, c) {
								return this.findDefined(this.customMessage(
										b.name, c), !this.settings.ignoreTitle
										&& b.title || undefined,
										a.validator.messages[c],
										"<strong>Warning: No message defined for "
												+ b.name + "</strong>")
							},
							formatAndAdd : function(d, c, f) {
								var e = this.defaultMessage(c, f.method), b = /\$?\{(\d+)\}/g;
								if (b.test(e)) {
									e = a.validator.format(
											e.replace(b, "{$1}"), f.parameters)
								}
								this.errorList.push({
									type : d,
									message : e,
									element : c
								})
							},
							elementValue : function(b) {
								var c = a(b).attr("type"), d = a(b).val();
								if (c === "radio" || c === "checkbox") {
									return a(
											"input[name='" + a(b).attr("name")
													+ "']:checked").val()
								}
								if (typeof d === "string") {
									return d.replace(/\r/g, "")
								}
								return d
							},
							getElements : function() {
								return a(this.currentForm).find(
										"input, select, textarea").not(
										":submit, :reset, :image").not(
										this.settings.ignore)
							},
							getElementsBySelector : function(b) {
								return a(this.currentForm).find(b).not(
										":submit, :reset, :image").not(
										this.settings.ignore)
							},
							checkable : function(b) {
								return (/radio|checkbox/i).test(b.type)
							},
							findByName : function(b) {
								return a(this.currentForm).find(
										"[name='" + b + "']")
							},
							getLength : function(c, b) {
								switch (b.nodeName.toLowerCase()) {
								case "select":
									return a("option:selected", b).length;
								case "input":
									if (this.checkable(b)) {
										return this.findByName(b.name).filter(
												":checked").length
									}
								}
								return c.length
							},
							depend : function(c, b) {
								return this.dependTypes[typeof c] ? this.dependTypes[typeof c]
										(c, b)
										: true
							},
							dependTypes : {
								"boolean" : function(c, b) {
									return c
								},
								string : function(c, b) {
									return !!a(c, b.form).length
								},
								"function" : function(c, b) {
									return c(b)
								}
							},
							optional : function(b) {
								var c = this.elementValue(b);
								return !a.validator.methods.required.call(this,
										c, b)
										&& "dependency-mismatch"
							},
							reset : function() {
								this.successList = [];
								this.errorList = [];
								this.errorMap = {};
								this.toShow = a([]);
								this.toHide = a([]);
								this.currentElements = a([])
							},
							__isSequenceChar : function(d) {
								var b = [ "qwertyuiop", "poiuytrewq",
										"asdfghjkl", "lkjhgfdsa", "zxcvbnm",
										"mnbvcxz", "1234567890", "0987654321" ];
								for (var c = 0; c < b.length; c++) {
									if (b[c].indexOf(d) == 0) {
										return true
									}
								}
								return false
							},
							__isSequenceOnKeyboard : function(k) {
								var j = /^[0-9A-Za-z]+$/;
								var f = j.test(k);
								if (!f) {
									return false
								}
								var c = 0;
								var d = -1;
								var l;
								for (var e = 0; e < k.length; e++) {
									var g = k[e];
									var b = g.charCodeAt();
									var h;
									if (b >= 48 && b <= 57) {
										h = "num"
									} else {
										if ((b >= 65 && b <= 90)
												|| (b >= 97 && b <= 122)) {
											h = "char"
										}
									}
									if (!(l === undefined || l == h)) {
										c++;
										d = e
									}
									l = h
								}
								if (c > 1) {
									return false
								}
								var m;
								if (d === -1) {
									m = this.__isSequenceChar(k)
								} else {
									m = this.__isSequenceOnKeyboard(k
											.substring(0, d))
											&& this.__isSequenceOnKeyboard(k
													.substring(d, k.length))
								}
								return m
							}
						},
						staticRules : function(c) {
							var d = {};
							var b = a.data(c.form, "validator");
							if (b.settings.rules) {
								d = a.validator
										.normalizeRule(b.settings.rules[c.name])
										|| {}
							}
							return d
						},
						staticType : function(c) {
							var d = "";
							var b = a.data(c.form, "validator");
							if (b.settings.types) {
								d = b.settings.types[c.name] || ""
							}
							return d
						},
						normalizeRules : function(c, b) {
							a.each(c, function(f, e) {
								if (e === false) {
									delete c[f];
									return
								}
								if (e.param || e.depends) {
									var d = true;
									switch (typeof e.depends) {
									case "string":
										d = !!a(e.depends, b.form).length;
										break;
									case "function":
										d = e.depends.call(b, b);
										break
									}
									if (d) {
										c[f] = e.param !== undefined ? e.param
												: true
									} else {
										delete c[f]
									}
								}
							});
							a.each(c, function(d, e) {
								c[d] = a.isFunction(e) ? e(b) : e
							});
							a.each([ "minlength", "maxlength" ], function() {
								if (c[this]) {
									c[this] = Number(c[this])
								}
							});
							a.each([ "rangelength", "range" ], function() {
								var d;
								if (c[this]) {
									if (a.isArray(c[this])) {
										c[this] = [ Number(c[this][0]),
												Number(c[this][1]) ]
									} else {
										if (typeof c[this] === "string") {
											d = c[this].split(/[\s,]+/);
											c[this] = [ Number(d[0]),
													Number(d[1]) ]
										}
									}
								}
							});
							if (a.validator.autoCreateRanges) {
								if (c.min && c.max) {
									c.range = [ c.min, c.max ];
									delete c.min;
									delete c.max
								}
								if (c.minlength && c.maxlength) {
									c.rangelength = [ c.minlength, c.maxlength ];
									delete c.minlength;
									delete c.maxlength
								}
							}
							return c
						},
						normalizeRule : function(c) {
							if (typeof c === "string") {
								var b = {};
								a.each(c.split(/\s/), function() {
									b[this] = true
								});
								c = b
							}
							return c
						}
					});
	a.format = a.validator.format
}(jQuery));