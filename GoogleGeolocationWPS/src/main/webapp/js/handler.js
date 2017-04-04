$(document).ready(function() {
	
	$("#call_button").click(function(e) {
		callServer();
	});

	$("#trigger_button").click(function(e) {
		sendMessage("modacom~~");
	});

	$("#call_group_button").click(function(e) {
		var groupKey = $("#groupKey").val();

		callServerByGroup(groupKey);
	});

	$("#push_group_button").click(function(e) {
		var groupKey = $("#groupKey").val();
		var topic = "default";

		sendMessageByGroup(groupKey, topic);
	});

});