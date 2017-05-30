var GlobalValidationInfo = {
	currEventType : null
};
(function(a) {
	a
			.extend(
					a.fn,
					{
						initValidation : function(c) {
							if (a.nodeName(this[0], "input")) {
								var b = a(this);
								b.data("nullable", c.nullable);
								b.data("rules", c.rules);
								b.data("messages", c.messages);
								b.data("errorListener", c.errorListener);
								b.data("resetListener", c.resetListener);
								b.data("successListener", c.successListener);
								b.data("inputListener", c.inputListener);
								d(b, c.validationEvent);
								f(b, c.resetEvent);
								e(b, c.inputEvent);
								g(b, c.resultCaching)
							} else {
								a.each(c, function(h, q) {
									var p = a("[name=" + h + "]");
									p.data("nullable", q.nullable);
									p.data("rules", q.rules);
									p.data("messages", q.messages);
									var o = q.errorListener;
									if (o === undefined) {
										p
												.data("errorListener",
														c.errorListener)
									} else {
										p.data("errorListener", o)
									}
									var l = q.resetListener;
									if (l === undefined) {
										p
												.data("resetListener",
														c.resetListener)
									} else {
										p.data("resetListener", l)
									}
									var j = q.successListener;
									if (j === undefined) {
										p.data("successListener",
												c.successListener)
									} else {
										p.data("successListener", j)
									}
									var n = q.inputListener;
									if (n === undefined) {
										p
												.data("inputListener",
														c.inputListener)
									} else {
										p.data("inputListener", n)
									}
									var m = q.validationEvent;
									if (m === undefined) {
										d(p, c.validationEvent)
									} else {
										d(p, m)
									}
									var i = q.resetEvent;
									if (i === undefined) {
										f(p, c.resetEvent)
									} else {
										f(p, i)
									}
									var k = q.inputEvent;
									if (k === undefined) {
										e(p, c.inputEvent)
									} else {
										e(p, k)
									}
									g(p, q.resultCaching)
								})
							}
							function g(h, i) {
								if (i === undefined) {
									h.data("resultCaching", true)
								} else {
									h.data("resultCaching", i)
								}
							}
							function d(h, k) {
								if (k !== undefined) {
									var i;
									var j = k.split(" ");
									for (i in j) {
										(function(l) {
											h[l]
													.call(
															h,
															function() {
																GlobalValidationInfo.currEventType = l;
																h.valid()
															})
										})(j[i])
									}
								}
							}
							function f(h, k) {
								if (k !== undefined) {
									var i;
									var j = k.split(" ");
									for (i in j) {
										(function(l) {
											h[l]
													.call(
															h,
															function() {
																GlobalValidationInfo.currEventType = l;
																h.resetStatus()
															})
										})(j[i])
									}
								}
							}
							function e(h, k) {
								if (k !== undefined) {
									var i;
									var j = k.split(" ");
									for (i in j) {
										(function(l) {
											h[l]
													.call(
															h,
															function() {
																GlobalValidationInfo.currEventType = l;
																h.typed()
															})
										})(j[i])
									}
								}
							}
						},
						valid : function() {
							a(this).resetStatus();
							var b = true;
							a.each(a(this), function() {
								if (a.nodeName(this, "input")) {
									var c = a(this);
									if (c.data("resultCaching") == true
											&& c.__samePrevValue(c)) {
										var d = c.data("errorList");
										var e = c.data("successList");
										c.__changeValidationUI(d, e);
										if (b) {
											b = !(d.length > 0)
										}
										return
									}
									var g = [];
									var f = [];
									c.__fillValidationResult(g, f);
									c.__changeValidationUI(g, f);
									c.data("errorList", g);
									c.data("successList", f);
									if (b) {
										b = !(g.length > 0)
									}
								} else {
									b = a("input", a(this)).valid()
								}
							});
							return b
						},
						__samePrevValue : function(b) {
							var d = b.data("prevVal");
							var c = b.val();
							if (d == c) {
								return true
							} else {
								b.data("prevVal", c);
								return false
							}
						},
						__changeValidationUI : function(c, b) {
							this.__dispatchUiEvent(c, "errorListener");
							this.__dispatchUiEvent(b, "successListener")
						},
						__dispatchUiEvent : function(g, b) {
							for ( var e in g) {
								var f = g[e];
								var d = f.input;
								var c = d.data(b);
								if (c !== undefined) {
									c(d, f.result)
								}
							}
						},
						__fillValidationResult : function(c, b) {
							a
									.each(
											a(this),
											function() {
												if (a.nodeName(this, "input")) {
													var e = a(this);
													e.data("valid", true);
													var i = e.data("nullable");
													if (i !== undefined
															&& i === true
															&& e.val() == "") {
														var f = e
																.data("resetListener");
														if (f !== undefined) {
															f(e)
														}
														return
													}
													var h = e.data("rules");
													if (h !== undefined) {
														var g = e
																.data("messages");
														var d = {};
														a
																.each(
																		h,
																		function(
																				q,
																				o) {
																			if (o != false) {
																				var n;
																				try {
																					if (o == true) {
																						n = e.methods[q]
																								(
																										e
																												.val(),
																										e[0])
																					} else {
																						n = e.methods[q]
																								(
																										e
																												.val(),
																										e[0],
																										o)
																					}
																				} catch (l) {
																					if (l.message
																							.indexOf("input.methods[rule] is not a function") !== -1) {
																						throw "rule name '"
																								+ q
																								+ "' is not registered. check for using registered rule"
																					} else {
																						throw l
																					}
																				}
																				if (n === undefined
																						|| n === true) {
																					return true
																				} else {
																					if (n === false) {
																						var m;
																						if (g === undefined
																								|| g[q] === undefined) {
																							m = a.fn.messages[q];
																							var p = a.fn.messages[e
																									.attr("name")];
																							if (p !== undefined) {
																								var k = p[q];
																								if (k !== undefined) {
																									m = k
																								}
																							}
																						} else {
																							m = g[q]
																						}
																						c
																								.push({
																									input : e,
																									result : {
																										message : m
																									}
																								});
																						e
																								.data(
																										"valid",
																										false);
																						return false
																					} else {
																						if (n.result == "success") {
																							d[q] = n
																						} else {
																							var j = {};
																							j[q] = n.extra;
																							c
																									.push({
																										input : e,
																										result : {
																											message : n.message,
																											extra : j
																										}
																									});
																							e
																									.data(
																											"valid",
																											false);
																							return false
																						}
																					}
																				}
																			}
																		});
														if (e.data("valid")) {
															b.push({
																input : e,
																result : d
															})
														}
													}
												} else {
													a("input", a(this))
															.__fillValidationResult(
																	c, b)
												}
											})
						},
						__showError : function(b) {
							var c = a(this).data("errorListener");
							if (c !== undefined) {
								c(a(this), {
									message : b
								})
							}
						},
						showElementError : function(b, c) {
							a("[id=" + b + "]").__showError(c)
						},
						showElementError : function(b, c) {
							a("[name=" + b + "]").__showError(c)
						},
						showElementError : function(b, c) {
							a("[tel=" + b + "]").__showError(c)
						},
						showElementError : function(b, c) {
							a("[nickname=" + b + "]").__showError(c)
						},
						showElementSuccess : function(b) {
							var c = a("[name=" + b + "]").data(
									"successListener");
							if (c !== undefined) {
								c(a(this))
							}
						},
						resetStatus : function() {
							a.each(a(this), function() {
								if (a.nodeName(this, "input")) {
									var b = a(this).data("resetListener");
									if (b !== undefined) {
										b(a(this))
									}
								} else {
									a("input", a(this)).resetStatus()
								}
							})
						},
						typed : function() {
							a.each(a(this), function() {
								if (a.nodeName(this, "input")) {
									var b = a(this).data("inputListener");
									if (b !== undefined) {
										b(a(this))
									}
								} else {
									a("input", a(this)).typed()
								}
							})
						},
						isValid : function() {
							var b = true;
							a.each(a(this), function() {
								if (a.nodeName(this, "input")) {
									var d = a(this);
									var f = [];
									var e = [];
									d.__fillValidationResult(f, e);
									var c = f.length;
									if (b) {
										b = !(c > 0)
									}
								} else {
									b = a("input", a(this)).isValid()
								}
							});
							return b
						}
					})
}(jQuery));