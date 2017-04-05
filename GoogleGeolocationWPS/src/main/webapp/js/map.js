var Map = function() {
};

var map;
var markers = [];
var oldMarker;

Map.prototype.initializeGoogleMap = function(myLatlng) {
	if ($("#google_map").length) {

		var mapOptions = {
			zoom : 20,
			center : myLatlng,
			scrollwheel : false,
			mapTypeControl : false,
		};

		map = new google.maps.Map(document.getElementById('google_map'),
				mapOptions);

		Map.prototype.addMarker(myLatlng);
	}
};

Map.prototype.addMarker = function(myLatlng) {
	if (oldMarker != null) {
		oldMarker.setAnimation(null);
		
		if (markers.length > 2) {
			markers.shift();
		}
	}

	var marker = new google.maps.Marker({
		position : myLatlng,
		map : map,
		animation : google.maps.Animation.BOUNCE
	});

	oldMarker = marker;

	markers.push(marker);
};

Map.prototype.clearMarkers = function() {
	for (var i = 0; i < markers.length; i++) {
		markers[i].setMap(null);
	}
	markers = [];
}
