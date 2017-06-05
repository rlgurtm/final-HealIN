(function(a) {
	a.extend(a.fn, {
		getForm : function(b) {
			if (!this.length) {
				return
			}
			form = new a.form(b, this);
			return form
		}
	});
	a.form = function(b, c) {
		this.options = a.extend(true, {}, a.form.defaults, b);
		this.currentForm = c;
		this.init()
	};
	a
			.extend(
					a.form,
					{
						defaults : {
							inputOnClass : "input_on",
							inputWrongClass : "input_wrong",
							messageWrongClass : "emph_notice",
							messageInfoClass : "emph_pass",
							placeHolderImageClass : "",
							onLabelClass : "lab_g",
							outLabelClass : "screen_out",
							onFocusClass : "ico_focused",
							validationCheckPoint : "blur",
							validator : {},
							getElementForShowError : function(b) {
								return a(b).parent().parent()
							},
							getElementLabel : function(b) {
								return a(b).prev("label")
							},
							getElementErrorNotice : function(b) {
								return a(b).parent().parent().parent().find(
										"p.desc_add")
							},
							getElementDimmedLayer : function() {
								return a(".dimmed_layer, .bg_dimmed")
							},
							getElementAllLayer : function() {
								return a(".userinfo_layer, .user_layer")
							},
							getElementViewPassword : function(b) {
								return a("input:text", b.parent().parent())
							},
							getElementGuideMessage : function(b) {
							}
						},
						methods : {
							showWebFocus : function(b) {
								b.next().children("span").first().addClass(
										this.options.onFocusClass)
							},
							hideWebFocus : function(b) {
								b.next().children("span").first().first()
										.removeClass(this.options.onFocusClass)
							},
							showPlaceHolder : function(b, c) {
								if (this.options.placeHolderImageClass !== "") {
									b
											.addClass(this.options.placeHolderImageClass)
								} else {
									c.addClass(this.options.onLabelClass);
									c.removeClass(this.options.outLabelClass)
								}
							},
							hidePlaceHolder : function(b, c) {
								if (this.options.placeHolderImageClass !== "") {
									b
											.removeClass(this.options.placeHolderImageClass)
								} else {
									c.removeClass(this.options.onLabelClass);
									c.addClass(this.options.outLabelClass)
								}
							},
							initRow : function(c, b) {
								c.removeClass(this.options.inputWrongClass);
								b.html("").hide()
							},
							inputOn : function(b) {
								if (!b.hasClass(this.options.inputWrongClass)) {
									b.addClass(this.options.inputOnClass)
								}
							},
							inputOff : function(b) {
								b.removeClass(this.options.inputOnClass)
							},
							inputWrong : function(b) {
								b.addClass(this.options.inputWrongClass)
							},
							showWrongMessage : function(c, b) {
								c.removeClass(this.options.messageInfoClass)
										.addClass(
												this.options.messageWrongClass)
										.html(b).show()
							},
							showInfoMessage : function(c, b) {
								c
										.removeClass(
												this.options.messageWrongClass)
										.addClass(this.options.messageInfoClass)
										.html(b).show()
							},
							showGuideMessage : function(c, b) {
								c.removeClass("").removeClass(
										this.options.messageWrongClass).html(b)
										.show()
							},
							showRadioRow : function(f) {
								var d = this;
								var b = a("input[type=radio][value=" + f + "]");
								var c = b.parent().parent();
								b.attr("checked", true);
								a("ul.list_certify > li").removeClass("on");
								c.addClass("on");
								var e = a("ul.list_certify > li").not(c);
								e
										.each(function() {
											var g = a(
													"input[type=text], input[type=tel]",
													this);
											var k = d.options
													.getElementForShowError(g);
											var i = d.options
													.getElementLabel(g);
											var j = d.options
													.getElementErrorNotice(g);
											var h = a(".btn_del", k);
											g.val("");
											h.hide();
											a.form.methods.initRow
													.call(d, k, j);
											a.form.methods.showPlaceHolder
													.call(d, g, i)
										})
							}
						},
						prototype : {
							init : function() {
							},
							resetForm : function(b) {
								var d = this;
								var c = this.options;
								var e = a(b, this.currentForm);
								e
										.each(function() {
											var f = a(
													"input[type=text], input[type=password]",
													a(this));
											f
													.each(function() {
														var g = a(this);
														var h = c
																.getElementLabel(g);
														var j = c
																.getElementForShowError(g);
														var i = c
																.getElementErrorNotice(g);
														g.val("");
														g.blur();
														a.form.methods.initRow
																.call(d, j, i);
														a.form.methods.showPlaceHolder
																.call(d, g, h)
													})
										})
							},
							initWebRow : function(b) {
								var d = this;
								var c = this.options;
								var e = a(b, this.currentForm);
								e
										.each(function() {
											var f = a(
													"input[type=text], input[type=password]",
													a(this));
											f
													.each(function() {
														var g = a(this);
														var h = c
																.getElementLabel(g);
														var j = c
																.getElementForShowError(g);
														var i = c
																.getElementErrorNotice(g);
														if (typeof g.val() !== "undefined"
																&& a.trim(g
																		.val()) !== "") {
															a.form.methods.hidePlaceHolder
																	.call(d, g,
																			h)
														} else {
															a.form.methods.showPlaceHolder
																	.call(d, g,
																			h)
														}
														g
																.focus(
																		function() {
																			a.form.methods.inputOn
																					.call(
																							d,
																							j);
																			a.form.methods.hidePlaceHolder
																					.call(
																							d,
																							g,
																							h)
																		})
																.blur(
																		function() {
																			a.form.methods.inputOff
																					.call(
																							d,
																							j);
																			if (typeof g
																					.val() !== "undefined"
																					&& a
																							.trim(g
																									.val()) === "") {
																				g
																						.val("");
																				a.form.methods.showPlaceHolder
																						.call(
																								d,
																								g,
																								h)
																			}
																		})
																.keyup(
																		function(
																				l) {
																			if (l.which == 13) {
																				return true
																			} else {
																				if (typeof c
																						.getElementGuideMessage(g[0].id) !== "undefined") {
																					a.form.methods.initRow
																							.call(
																									d,
																									j,
																									i);
																					a.form.methods.inputOn
																							.call(
																									d,
																									j);
																					var k = c
																							.getElementGuideMessage(g[0].id);
																					a.form.methods.showGuideMessage
																							.call(
																									d,
																									i,
																									k)
																				} else {
																					a.form.methods.initRow
																							.call(
																									d,
																									j,
																									i);
																					a.form.methods.inputOn
																							.call(
																									d,
																									j)
																				}
																			}
																		})
													})
										})
							},
							initTabFocusWeb : function(b) {
								var c = this;
								var d = a(b, this.currentForm);
								d
										.each(function() {
											var e = a(
													"input[type=radio], input[type=checkbox]",
													a(this));
											e
													.each(function() {
														var f = a(this);
														f
																.focusin(
																		function() {
																			try {
																				a.form.methods.showWebFocus
																						.call(
																								c,
																								f)
																			} catch (g) {
																			}
																		})
																.focusout(
																		function() {
																			try {
																				a.form.methods.hideWebFocus
																						.call(
																								c,
																								f)
																			} catch (g) {
																			}
																		});
														if (f.attr("type") === "radio") {
															f
																	.click(
																			function() {
																				try {
																					a.form.methods.hideWebFocus
																							.call(
																									c,
																									f)
																				} catch (g) {
																				}
																			})
																	.keyup(
																			function() {
																				try {
																					c.methods
																							.showWebFocus(
																									c,
																									f)
																				} catch (g) {
																				}
																			})
														}
													})
										})
							},
							initMobileWebRow : function(b) {
								var d = this;
								var c = this.options;
								var e = a(b, this.currentForm);
								e
										.each(function() {
											var f = a(
													"input[type=text], input[type=password], input[type=tel]",
													a(this));
											f
													.each(function() {
														var g = a(this);
														var i = c
																.getElementLabel(g);
														var k = c
																.getElementForShowError(g);
														var j = c
																.getElementErrorNotice(g);
														var h = a(".btn_del", k);
														if (typeof g.val() !== "undefined"
																&& a.trim(g
																		.val()) !== "") {
															a.form.methods.hidePlaceHolder
																	.call(d, g,
																			i)
														} else {
															a.form.methods.showPlaceHolder
																	.call(d, g,
																			i)
														}
														if (g.val()) {
															h.show()
														}
														g
																.focus(
																		function() {
																			a.form.methods.inputOn
																					.call(
																							d,
																							k);
																			a.form.methods.hidePlaceHolder
																					.call(
																							d,
																							g,
																							i);
																			if (g
																					.val()) {
																				h
																						.show()
																			} else {
																				h
																						.hide()
																			}
																		})
																.blur(
																		function() {
																			a.form.methods.inputOff
																					.call(
																							d,
																							k);
																			if (typeof g
																					.val() !== "undefined"
																					&& a
																							.trim(g
																									.val()) === "") {
																				g
																						.val("");
																				a.form.methods.showPlaceHolder
																						.call(
																								d,
																								g,
																								i);
																				h
																						.hide()
																			}
																		})
																.keyup(
																		function(
																				m) {
																			if (m.which == 13) {
																				return true
																			} else {
																				if (typeof c
																						.getElementGuideMessage(g[0].id) !== "undefined") {
																					a.form.methods.initRow
																							.call(
																									d,
																									k,
																									j);
																					a.form.methods.inputOn
																							.call(
																									d,
																									k);
																					var l = c
																							.getElementGuideMessage(g[0].id);
																					a.form.methods.showGuideMessage
																							.call(
																									d,
																									j,
																									l)
																				} else {
																					a.form.methods.initRow
																							.call(
																									d,
																									k,
																									j);
																					a.form.methods.inputOn
																							.call(
																									d,
																									k)
																				}
																			}
																			if (g
																					.val()) {
																				h
																						.show()
																			} else {
																				h
																						.hide()
																			}
																		});
														if (h) {
															h
																	.mousedown(function(
																			l) {
																		g
																				.val("");
																		g
																				.trigger("focus");
																		a.form.methods.initRow
																				.call(
																						d,
																						k,
																						j);
																		a.form.methods.inputOn
																				.call(
																						d,
																						k);
																		l
																				.preventDefault()
																	})
														}
													})
										})
							},
							initWebRadioRow : function(b) {
								var d = this;
								a("input[type=radio]", b).change(
										function() {
											a.form.methods.showRadioRow.call(d,
													a(this).val())
										});
								var c = a("input[type=radio]:checked", b).val();
								if (typeof c !== "undefined"
										&& a.trim(c) !== "") {
									a.form.methods.showRadioRow.call(this, c)
								}
							},
							showError : function(c, e) {
								var b = a("#" + c);
								var g = this.options.getElementForShowError(b);
								var d = this.options.getElementLabel(b);
								var f = this.options.getElementErrorNotice(b);
								a.form.methods.inputWrong.call(this, g);
								a.form.methods.showWrongMessage
										.call(this, f, e);
								if (typeof b.val() !== "undefined"
										&& a.trim(b.val()) !== "") {
									a.form.methods.hidePlaceHolder.call(this,
											b, d)
								}
							},
							showInfo : function(c, d) {
								var b = a("#" + c);
								var e = this.options.getElementErrorNotice(b);
								a.form.methods.showInfoMessage.call(this, e, d)
							},
							showRadioRow : function(b) {
								a.form.methods.showRadioRow.call(this, b)
							},
							showLayer : function(b, e) {
								var d = this.options.getElementDimmedLayer();
								var f = this.options.getElementAllLayer();
								var c = a("#" + b);
								if (typeof e !== "undefined"
										&& a.trim(e) !== "") {
									a(".tit_layer", c).html(e)
								}
								d.show();
								f.hide();
								c.show();
								a(".btn_ok, .btn_send").focus();
								a(window).scrollTop(0)
							},
							hideLayer : function(b) {
								var d = this.options.getElementDimmedLayer();
								var c = a("#" + b);
								c.hide();
								d.hide()
							},
							hideAllLayer : function() {
								var b = this.options.getElementDimmedLayer();
								var c = this.options.getElementAllLayer();
								c.hide();
								b.hide()
							},
							showPassword : function(g, f) {
								var b = a(g);
								var c = a(f);
								var d = a("input[type=text]", c);
								var e = this.options.getElementLabel(d);
								if (typeof d.val() !== "undefined"
										&& a.trim(d.val()) !== "") {
									a.form.methods.hidePlaceHolder.call(this,
											d, e)
								} else {
									a.form.methods.showPlaceHolder.call(this,
											d, e)
								}
								b.hide();
								c.show()
							},
							hidePassword : function(g, f) {
								var e = a(f);
								var c = a(g);
								var b = a("input[type=password]", c);
								var d = this.options.getElementLabel(b);
								if (typeof b.val() !== "undefined"
										&& a.trim(b.val()) !== "") {
									a.form.methods.hidePlaceHolder.call(this,
											b, d)
								} else {
									a.form.methods.showPlaceHolder.call(this,
											b, d)
								}
								e.hide();
								c.show()
							},
							bindPasswordEvent : function(c) {
								var b = a("#" + c);
								var d = this.options.getElementViewPassword(b);
								b.keyup(function(e) {
									var f = a(this).val();
									d.val(f)
								});
								d.keyup(function(e) {
									var f = a(this).val();
									b.val(f)
								})
							},
							bindingRadioChangeEvent : function(b) {
								a("[type=radio]")
										.keydown(
												function(f) {
													if (f.which == 37
															|| f.which == 38) {
														var e = a('input:radio[name="'
																+ b
																+ '"]:checked');
														e
																.next()
																.children(
																		"span")
																.first()
																.first()
																.removeClass(
																		"ico_focused");
														var c = a(
																'input:radio[name="'
																		+ b
																		+ '"]')
																.index(e);
														var d = c - 1;
														if (d >= 0) {
															a(
																	"input:radio[name="
																			+ b
																			+ "]:eq("
																			+ d
																			+ ")")
																	.prop(
																			"checked",
																			true);
															a(
																	"input:radio[name="
																			+ b
																			+ "]:eq("
																			+ d
																			+ ")")
																	.change()
														}
														f.preventDefault()
													} else {
														if (f.which == 39
																|| f.which == 40) {
															var e = a('input:radio[name="'
																	+ b
																	+ '"]:checked');
															e
																	.next()
																	.children(
																			"span")
																	.first()
																	.first()
																	.removeClass(
																			"ico_focused");
															var c = a(
																	'input:radio[name="'
																			+ b
																			+ '"]')
																	.index(e);
															var d = c + 1;
															a(
																	"input:radio[name="
																			+ b
																			+ "]:eq("
																			+ d
																			+ ")")
																	.prop(
																			"checked",
																			true);
															a(
																	"input:radio[name="
																			+ b
																			+ "]:eq("
																			+ d
																			+ ")")
																	.change();
															f.preventDefault()
														}
													}
												})
							},
							bindCheckBoxEvent : function() {
								var b = a("input[type='checkbox']");
								b.change(function() {
									var d = a("span, div").has(a(this));
									var c = a(this).is(":checked");
									if (c) {
										d.addClass("check_on")
									} else {
										d.removeClass("check_on")
									}
								})
							},
							checkCheckbox : function(b) {
								var c = a(b);
								var d = a("span, div").has(c);
								c.attr("checked", true);
								d.addClass("check_on")
							},
							isStrongPassword : function(f) {
								var d = 0;
								var b = 0;
								var e = 0;
								var g = 0;
								if (f.length > 8) {
									for (var c = 0; c < f.length; c++) {
										if (/[A-Z]/.test(f.substring(c, c + 1))) {
											d = 1
										} else {
											if (/[a-z]/.test(f.substring(c,
													c + 1))) {
												b = 1
											} else {
												if (/\d/.test(f.substring(c,
														c + 1))) {
													e = 1
												} else {
													g = 1
												}
											}
										}
										if ((d + b + e + g) == 3) {
											return true
										}
									}
								}
								return false
							}
						}
					})
}(jQuery));