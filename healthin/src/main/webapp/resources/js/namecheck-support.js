var SirenRealNameCheck = function(e) {
	var k = "__realname_check__form__";
	var c = "SIREN_IPIN";
	var l = "SIREN_SMS";
	var m = "SIREN_IPIN_PARENT";
	var h = "SIREN_SMS_PARENT";
	var i = "popupIpinNamecheck";
	var j = "popupSMSNamecheck";
	var b = null;
	var a = null;
	this.openIpin = function() {
		d(c, i)
	};
	this.openSMS = function() {
		d(l, j)
	};
	this.openIpinParent = function() {
		d(m, i)
	};
	this.openSMSParent = function() {
		d(h, j)
	};
	this.openMobileIpin = function(o, n) {
		f(c, o, n)
	};
	this.openMobileIpinParent = function(o, n) {
		f(m, o, n)
	};
	this.openMobileSMS = function(o, n) {
		f(l, o, n)
	};
	this.openMobileSMSParent = function(o, n) {
		f(h, o, n)
	};
	this.getNamecheckPopup = function() {
		return window.__namecheckPopup__
	};
	var g = function() {
		if ($("#" + k) != null || $("#" + k) != undefined) {
			$("#" + k).remove()
		}
		$("body")
				.append(
						"<form id='"
								+ k
								+ "' action='/namecheck/gate.do' method='post'></form>");
		a = $("#" + k)
	};
	var d = function(o, n) {
		if (a == null || a == undefined || a.attr("id") !== k) {
			throw "SirenRealNameCheck initialize falied."
		}
		a.empty();
		a.attr("target", n);
		a.append("<input type='hidden' name='type' value='" + o + "' />");
		a
				.append("<input type='hidden' name='serviceType' value='" + b
						+ "' />");
		window.__namecheckPopup__ = window.open("about:blank", n,
				"width=433, height=540, status=0, resize=1");
		window.__namecheckPopup__.focus();
		a.submit()
	};
	var f = function(o, p, n) {
		if (a == null || a == undefined || a.attr("id") !== k) {
			throw "SirenRealNameCheck initialize falied."
		}
		a.empty();
		a.append("<input type='hidden' name='isMobile' value='true' />");
		a.append("<input type='hidden' name='type' value='" + o + "' />");
		a
				.append("<input type='hidden' name='serviceType' value='" + b
						+ "' />");
		a.append("<input type='hidden' name='actionUri' value='" + p + "' />");
		if (n != undefined && n != null) {
			a.append("<input type='hidden' name='allowSaveMobile' value='" + n
					+ "' />")
		}
		a.submit()
	};
	b = e;
	g()
};