(function(a){
a.extend(
a.fn,
{methods:{							
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
							strTrim : function(c, b) {
								a(b).val(a.trim(c));
								return a.trim(c).length > 0
							},
							email : function(c, b) {
								if (!this.maxlength.call(this, c, b, 100)) {
									return false
								}
								return this.optional(b)
										|| /^([a-z0-9._-]+)@([a-z0-9_-]+)(\.[a-z0-9]+){1,2}$/
												.test(c)
							},
							findemail : function(c, b) {
								if (!this.maxlength.call(this, c, b, 100)) {
									return false
								}
								return this.optional(b)
										|| /^([a-z0-9.+_-]+)@([a-z0-9_-]+)(\.[a-z0-9]+){1,}$/
												.test(c)
							},
							othermail : function(c, b) {
								if (!this.maxlength.call(this, c, b, 100)) {
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
							birthdate : function(c, b) {
								return this.optional(b)
								|| /[1-2]{1}[0,9]{1}[0-9]{2}[0-1]{1}[1-9]{1}[0-3]{1}[0-1]{1}/.test(new Date(c).toString())
								||  !/Invalid|NaN/.test(new Date(c).toString())
								|| /^\d{4}\d{1,2}\d{1,2}$/	.test(new Date(c).toString())
							},
							dateISO : function(c, b) {
								return this.optional(b)
										|| /^\d{4}\d{1,2}\d{1,2}$/
												.test(c)
							},
							onlyNumber : function(c, b) {
								return this.optional(b) || /^[0-9]*$/.test(c)
							},
							number : function(c, b) {
								return this.optional(b)
										|| /^-?(?:\d+|\d{1,3}(?:,\d{3})+)?(?:\.\d+)?$/
												.test(c)
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
							namekoreannamelength : function(e, b) {
								var c = /^[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]+$/.test(e);
								var d = a.isArray(e) ? e.length : this
										.getLength(a.trim(e), b);
								if (c) {
									return this.optional(b)
											|| (d >= 1 && d <= 15)
								}
								return true
							},
							nameenglishnamelength : function(e, c) {
								var b = /^[A-Za-z\s]+$/.test(e);
								var d = a.isArray(e) ? e.length : this
										.getLength(a.trim(e), c);
								if (b) {
									return this.optional(c)
											|| (d >= 1 && d <= 30)
								}
								return true
							},
							namemaxlength : function(d, b) {
								var c = a.isArray(d) ? d.length : this
										.getLength(a.trim(d), b);
								return this.optional(b)
										|| this.__checkByte(d, c, 30)
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
							minKoreanNameLength : function(e, b) {
								var c = /^[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]+$/.test(e);
								var d = a.isArray(e) ? e.length : this
										.getLength(a.trim(e), b);
								if (c) {
									return this.optional(b) || (d >= 2)
								}
								return true
							},
							maxKoreanNameLength : function(e, b) {
								var c = /^[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]+$/.test(e);
								var d = a.isArray(e) ? e.length : this
										.getLength(a.trim(e), b);
								if (c) {
									return this.optional(b) || (d <= 15)
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
							telLength : function(e, c) {
								var b = /^[A-Za-z\s]+$/.test(e);
								var d = a.isArray(e) ? e.length : this
										.getLength(a.trim(e), c);
								if (b) {
									return this.optional(c)
									|| (d >= 2 && d <= 30)
								}
								return true
							},
							idinvalid : function(e, c) {
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
							existidinvalid : function(d, c) {
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
							nicknameinvalid : function(e, c) {
								var b = (/^([a-z0-9-_])([a-z0-9-_\.]+)([a-z0-9-_])$/
										.test(e));
								var d = /^.*[a-z-_\.]+.*$/.test(e);
								return this.optional(c) || (b && d)
							},
							existidinvalnickname : function(d, c) {
								var b = (/^([\*\+]?[a-z0-9-_+])([a-z0-9-_\.]+)([a-z0-9-_])$/
										.test(d));
								return this.optional(c) || (b)
							},
							emailinvalid : function(d, b) {
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
							emailnotsame : function(d, b, f) {
								if (!a.validator.methods.emailinvalid.call(
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
							startNumber : function(c, b) {
								return this.optional(b)
										|| /[0]{1}[1]{1}[0]{1}[0-9]{4}[0-9]{4}/.test(c)
							},
							birthdate : function(c, b) {
								return this.optional(b)
								|| /[1-2]{1}[0,9]{1}[0-9]{2}[0-1]{1}[1-9]{1}[0-3]{1}[0-1]{1}/.test(new Date(c).toString())
								||  !/Invalid|NaN/.test(new Date(c).toString())
								|| /^\d{4}\d{1,2}\d{1,2}$/	.test(new Date(c).toString())
							},
							telephone : function(c, b) {
								return this.optional(b)
								|| /^(02|0[3-9]{1}[0-9]{1})-?[0-9]{3,4}-?[0-9]{4}$/
								.test(c)
							},
							emailnotsameByValue : function(d, b, e) {
								if (!a.validator.methods.emailinvalid.call(
										this, d, b)) {
									var c = d.split("@");
									if (c[1]) {
										return !(c[0].toLowerCase() === e)
									}
								}
								return true
							},
							nameinvalid : function(c, b) {
								return this.optional(b)
										this.optional(b) || /^\d+$/.test(c)
							},
							birthdateinvalid : function(c, b) {
								return this.optional(b)
								|| /^\d+$[a-zA-Z가-힝\s]*$/.test(c)
							},
							numbernamelength : function(e, c) {
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
								return this.optional(b) || this.regNumCheck(c)
										&& /^\d{3}-?\d{2}-?\d{5}$/.test(c)
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
								for (b = 1; b < f.length; b++) {
									if (f.substring(0, 1) != f.substring(b,
											b + 1)) {
										return this.optional(d) || true
									}
								}
								return this.optional(d) || false
							},
							isasciiprintable : function(c, b) {
								return this.optional(b) || this.__onlyascii(c)
							},
							__onlyascii : function(d) {
								var e = d.length;
								for (var b = 0; b < e; b++) {
									var c = d.charCodeAt(b);
									if (!(c >= 32 && c < 127)) {
										return false
									}
								}
								return true
							},
							checked : function(c, b) {
								return b.checked
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
							checkLength : function(d, b, e) {
								var c = a.isArray(d) ? d.length : this
										.getLength(a.trim(d), b);
								return this.optional(b) || c == e
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
								return !this.required.call(this, c, b)
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
							regNumCheck : function(b) {
								b = b.replace(/-/g, "");
								if (b.length != 10 || b == "0000000000") {
									return false
								}
								var c = 0;
								c += parseInt(b.substring(0, 1));
								c += parseInt(b.substring(1, 2)) * 3 % 10;
								c += parseInt(b.substring(2, 3)) * 7 % 10;
								c += parseInt(b.substring(3, 4)) * 1 % 10;
								c += parseInt(b.substring(4, 5)) * 3 % 10;
								c += parseInt(b.substring(5, 6)) * 7 % 10;
								c += parseInt(b.substring(6, 7)) * 1 % 10;
								c += parseInt(b.substring(7, 8)) * 3 % 10;
								c += Math
										.floor(parseInt(b.substring(8, 9)) * 5 / 10);
								c += parseInt(b.substring(8, 9)) * 5 % 10;
								c += parseInt(b.substring(9, 10));
								if (c % 10 != 0) {
									return false
								}
								return true
							},
							uniqueid : function(h, e, i) {
								var g = h;
								if (g == null || g == "") {
									return false
								}
								var d=a.ajax({
																				type : "POST",
											url : "https://member.daum.net/api/check/member",
											dataType : "json",
											async : false,
											data : {
												PAGEID : i.pageId,
												type : "daumid",
												key : g
											}
										}).responseJSON;
								var c = "success";
								var f;
								var b = {};
								if (d.code == "200") {
									if (d.message == "EXIST") {
										c = "fail";
										f = "이미 사용된 Daum 메일 주소여서 또 사용할 수 없어요. 다른 아이디를 입력해 주세요.";
									} else {
										if (d.message == "NOT_USABLE") {
											c = "fail";
											f = "이미 사용된 Daum 메일 주소여서 또 사용할 수 없어요. 다른 아이디를 입력해 주세요."
										} else {
											f = d.message
										}
									}
								} else {
									if (d.code == "403") {
										c = "fail";
										if (d.message == "ABUSE") {
											f = "보안 정책에 의해 접근이 제한되었습니다."
										} else {
											if (d.message == "FORBIDDEN") {
												f = "유효시간이 초과되거나, 잘못된 접근입니다. 처음부터 다시 시도해 주세요."
											}
										}
										b.responseCode = d.code
									} else {
										c = "fail";
										f = d.message
									}
								}
								return {
									result : c,
									message : f,
									extra : b
								}
							},
							certcodePolicy : function(k, g, h) {
								if (h().eventType == "keyup"
										|| h().isAuthenticated == true) {
									return
								}
								var b = k;
								var e = h().pageId;
								var i = h().mobileNationalCode;
								var j = h().mobileNational;
								var c = h().serviceType;
								if (b == "" || i == "" || j == "") {
									m = "fail";
									l = "국가를 입력해주세요";
									return {
										result : m,
										message : l
									}
								}
								var f=a.ajax({
																				type : "POST",
											url : "https://member.daum.net/api/valid/certcodepolicy",
											dataType : "json",
											async : false,
											data : {
												PAGEID : e,
												countryCode : i,
												countryNo : j,
												mobile : b,
												serviceType : c,
												authType : "phone"
											}
										}).responseJSON;
								var m = "success";
								var l;
								var d = {};
								if (f.code == "200") {
									if (f.message == "NOT_VALID"
											|| f.message == "BLOCKED") {
										m = "fail";
										l = f.result
									} else {
										m = "success"
									}
								} else {
									if (f.code == "403") {
										m = "fail";
										l = "유효시간이 초과되거나, 잘못된 접근입니다. 처음부터 다시 시도해 주세요.";
										d.responseCode = f.code
									} else {
										m = "fail";
										l = f.result
									}
								}
								return {
									result : m,
									message : l,
									extra : d
								}
							},
							pwValid : function(e, c, f) {
								var b = {
									result : "fail",
									extra : {
										isStrong : false
									}
								};
								var d = a(f().Id).val();
								if (e == null || e.length == 0) {
									b.message = "비밀번호를 입력해 주세요."
								} else {
									if (e.length < 8) {
										b.message = "조금 더! 비밀번호는 8자 이상이에요!"
									} else {
										if (!this.__onlyascii(e)) {
											b.message = "영문자, 숫자, 특수문자만 비밀번호에 입력해 주세요!"
										} else {
											if (/^\d+$/.test(e)) {
												b.message = "숫자로 된 비밀번호는 사용할 수 없어요! 영문자, 특수문자를 함께 입력해 주세요."
											} else {
												if (!/^\S+$/.test(e)) {
													b.message = "비밀번호에 공백(space)을 넣을 수 없어요!"
												} else {
													if (this
															.__checkOnlyOneChar(e)
															|| this
																	.__isConsecutive(e)
															|| this
																	._isSequenceOnKeyboard(e)) {
														b.message = "다른 사람이 추측하기 쉬운 비밀번호는 사용할 수 없어요!"
													} else {
														if (this
																.__checkStrInclude(
																		e, d)) {
															b.message = "개인정보(아이디)가 포함된 비밀번호는 사용할 수 없어요!"
														} else {
															b.result = "success";
															b.extra.isStrong = false;
															if (this
																	.__isStrong(e)) {
																b.extra.isStrong = true
															}
														}
													}
												}
											}
										}
									}
								}
								return b
							},
							pwValidCorp : function(g, c, h) {
								var e = a(h().Id).val();
								var d = h().sirenName;
								var i = h().sirenBirYMD.substr(2,
										h().sirenBirYMD.length);
								var f = h().sirenCellNo.substr(1,
										h().sirenCellNo.length);
								var b = {
									result : "fail",
									extra : {
										isStrong : false
									}
								};
								if (g == null || g.length == 0) {
									b.message = "비밀번호를 입력해 주세요."
								} else {
									if (g.length < 8) {
										b.message = "조금 더! 비밀번호는 8자 이상이에요!"
									} else {
										if (!this.__onlyascii(g)) {
											b.message = "영문자, 숫자, 특수문자만 비밀번호에 입력해 주세요!"
										} else {
											if (/^\d+$/.test(g)) {
												b.message = "숫자로 된 비밀번호는 사용할 수 없어요! 영문자, 특수문자를 함께 입력해 주세요."
											} else {
												if (!/^\S+$/.test(g)) {
													b.message = "비밀번호에 공백(space)을 넣을 수 없어요!"
												} else {
													if (this.__checkStrInclude(
															g, e)) {
														b.message = "개인정보(아이디)가 포함된 비밀번호는 사용할 수 없어요!"
													} else {
														if (this
																.__checkStrInclude(
																		g, d)) {
															b.message = "개인정보(이름)가 포함된 비밀번호는 사용할 수 없어요!"
														} else {
															if (this
																	.__checkStrInclude(
																			this
																					.__convertEngToKor(g),
																			d)) {
																b.message = "개인정보(이름)가 포함된 비밀번호는 사용할 수 없어요!"
															} else {
																if (this
																		.__checkStrInclude(
																				g,
																				i)) {
																	b.message = "개인정보(생년월일)가 포함된 비밀번호는 사용할 수 없어요!"
																} else {
																	if (this
																			.__checkStrInclude(
																					g,
																					f)) {
																		b.message = "개인정보(연락처)가 포함된 비밀번호는 사용할 수 없어요!"
																	} else {
																		if (this
																				.__checkOnlyOneChar(g)
																				|| this
																						.__isConsecutive(g)
																				|| this
																						._isSequenceOnKeyboard(g)) {
																			b.message = "다른 사람이 추측하기 쉬운 비밀번호는 사용할 수 없어요!"
																		} else {
																			b.result = "success";
																			b.extra.isStrong = false;
																			if (this
																					.__isStrong(g)) {
																				b.extra.isStrong = true
																			}
																		}
																	}
																}
															}
														}
													}
												}
											}
										}
									}
								}
								return b
							},
							__convertEngToKor : function(e) {
								var g = "rRseEfaqQtTdwWczxvg";
								var i = "[" + g + "]";
								var j = {
									k : 0,
									o : 1,
									i : 2,
									O : 3,
									j : 4,
									p : 5,
									u : 6,
									P : 7,
									h : 8,
									hk : 9,
									ho : 10,
									hl : 11,
									y : 12,
									n : 13,
									nj : 14,
									np : 15,
									nl : 16,
									b : 17,
									m : 18,
									ml : 19,
									l : 20
								};
								var d = "hk|ho|hl|nj|np|nl|ml|k|o|i|O|j|p|u|P|h|y|n|b|m|l";
								var h = {
									"" : 0,
									r : 1,
									R : 2,
									rt : 3,
									s : 4,
									sw : 5,
									sg : 6,
									e : 7,
									f : 8,
									fr : 9,
									fa : 10,
									fq : 11,
									ft : 12,
									fx : 13,
									fv : 14,
									fg : 15,
									a : 16,
									q : 17,
									qt : 18,
									t : 19,
									T : 20,
									d : 21,
									w : 22,
									c : 23,
									z : 24,
									x : 25,
									v : 26,
									g : 27
								};
								var b = "rt|sw|sg|fr|fa|fq|ft|fx|fv|fg|qt|r|R|s|e|f|a|q|t|T|d|w|c|z|x|v|g|";
								var f = new RegExp("(" + i + ")(" + d + ")(("
										+ b + ")(?=(" + i + ")(" + d + "))|("
										+ b + "))", "g");
								var c = function(n, o, l, m) {
									return String.fromCharCode(g.indexOf(o)
											* 588 + j[l] * 28 + h[m] + 44032)
								};
								var k = e.replace(f, c);
								return k
							},
							__checkStrInclude : function(b, c) {
								if (c != null && c.length > 0
										&& b.indexOf(c) > -1) {
									return true
								} else {
									return false
								}
							},
							__checkOnlyOneChar : function(d) {
								var b = d.length;
								for (var c = 0; c < b; ++c) {
									if (d.charAt(0) != d.charAt(c)) {
										return false
									}
								}
								return true
							},
							__isConsecutive : function(d) {
								var b = d.length;
								var c;
								for (c = 1; c < b; c++) {
									if (d.charCodeAt(c - 1) + 1 != d
											.charCodeAt(c)) {
										break
									}
								}
								return b == c
							},
							__isStrong : function(f) {
								var d = 0, b = 0, e = 0, h = 0;
								for (var c = 0; c < f.length; c++) {
									var g = f.substr(c, 1);
									if (/[A-Z]/.test(g)) {
										d = 1
									} else {
										if (/[a-z]/.test(g)) {
											b = 1
										} else {
											if (/[0-9]/.test(g)) {
												e = 1
											} else {
												h = 1
											}
										}
									}
									if ((d + e + b + h) >= 3) {
										return true
									}
								}
								return false
							},
							_isSequenceChar : function(d) {
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
							_isSequenceOnKeyboard : function(k) {
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
									m = this._isSequenceChar(k)
								} else {
									m = this._isSequenceOnKeyboard(k.substring(
											0, d))
											&& this._isSequenceOnKeyboard(k
													.substring(d, k.length))
								}
								return m
							},
							isSameValue : function(d, c, b) {
								if (d == b.val()) {
									return true
								} else {
									return false
								}
							},
							isNotSpace : function(b) {
								if (/\s/g.test(b)) {
									return false
								} else {
									return true
								}
							},
							__checkByte : function(h, c, j) {
								var f = h;
								var k = c;
								var b = 0;
								var g = 0;
								var e = "";
								for (var d = 0; d < k; d++) {
									e = f.charAt(d);
									if (encodeURIComponent(e).length > 4) {
										b += 2
									} else {
										b++
									}
									if (b <= j) {
										g = d + 1
									}
								}
								if (b > j) {
									return false
								} else {
									return true
								}
							}
						}
					})
}(jQuery));
