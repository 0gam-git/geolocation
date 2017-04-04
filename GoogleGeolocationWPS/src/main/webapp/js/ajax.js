function callServer() {

	$.ajax({
		url : "/sample/call",
		processData : false,
		type : 'POST',
		contentType : "text/html; charset=utf-8",
		beforeSend : function() {
			$("#spinner").show();
			$("#call_button").hide();
		},
		success : function(response) {
			if (response == "onTimeout") {
				$("#msg").append("onTimeout \n");
				$("#msg").show();
			} else {
				$("#msg").append(response + "\n");
				$("#msg").show();
			}
		},

		error : function(request, status, error) {
			$("#spinner").fadeOut('slow')
		},
		complete : callServer

	});
}

function callServerByGroup(key) {

	if ("" == key || null == key || undefined == key) {
		key = "default";
	}

	$.ajax({
		url : "/sample/call/group/" + key,
		processData : false,
		type : 'POST',
		contentType : "text/html; charset=utf-8",
		beforeSend : function() {
			$("#groupSpinner").show();
			$("#call_group_button").hide();
		},
		success : function(response) {

			var model = JSON.stringify(response);

			$("#msg").append(model + "\n");
			$("#msg").show();

		},

		error : function(request, status, error) {
			$("#groupSpinner").fadeOut('slow')
		},
		complete : function(data) {
			callServerByGroup(key);
		}

	});
}

function sendMessage(message) {

	$.ajax({
		url : "/sample/push/" + message,
		processData : false,
		contentType : "text/html; charset=utf-8",
		type : 'POST',

		success : function(response) {

		},

		error : function(request, status, error) {

		},

	});
}

function sendMessageByGroup(key, topic) {

	if ("" == key || null == key || undefined == key) {
		key = "default";
	}

	$.ajax({
		url : "/sample/push/group/" + key + "/topic/" + topic,
		processData : false,
		contentType : "text/html; charset=utf-8",
		type : 'POST',

		success : function(response) {

		},

		error : function(request, status, error) {

		},

	});
}
