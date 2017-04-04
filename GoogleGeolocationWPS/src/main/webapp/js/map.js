var Map = function() {
};

Map.prototype.initializeGoogleMap = function(latitude, longtitude) {
	if ($("#google_map").length) {

		var mapOptions = {
			zoom : 16,
			center : new google.maps.LatLng(latitude, longtitude),
			scrollwheel : true,
			mapTypeControl : false,
		};

		var map = new google.maps.Map(document.getElementById('google_map'),
				mapOptions);

		var marker = new google.maps.Marker({
			map : map,
			position : map.getCenter(),
		});

		google.maps.event.addDomListener(window, "resize", function() {

			var center = map.getCenter();
			google.maps.event.trigger(map, "resize");
			map.setCenter(center);
		});

	}
};

Map.prototype.movingPathMap = function() {
	var latitude1 = $("#latitude1").val();
	var latitude2 = $("#latitude2").val();
	var latitude3 = $("#latitude3").val();
	var latitude4 = $("#latitude4").val();
	var latitude5 = $("#latitude5").val();

	var longitude1 = $("#longitude1").val();
	var longitude2 = $("#longitude2").val();
	var longitude3 = $("#longitude3").val();
	var longitude4 = $("#longitude4").val();
	var longitude5 = $("#longitude5").val();

	var date1 = $("#date1").val();
	var date2 = $("#date2").val();
	var date3 = $("#date3").val();
	var date4 = $("#date4").val();
	var date5 = $("#date5").val();

	var locations = [ [ date5, latitude5, longitude5, 5 ],
			[ date4, latitude4, longitude4, 4 ],
			[ date3, latitude3, longitude3, 3 ],
			[ date2, latitude2, longitude2, 2 ],
			[ date1, latitude1, longitude1, 1 ] ];

	var map = new google.maps.Map(document.getElementById('google_map'), {
		zoom : 18,
		center : new google.maps.LatLng(latitude1, longitude1),
		mapTypeId : google.maps.MapTypeId.ROADMAP
	});

	var infowindow = new google.maps.InfoWindow();
	var marker, i;
	var poly = new Array();

	for (i = 0; i < locations.length; i++) {
		var pos = new google.maps.LatLng(locations[i][1], locations[i][2])
		poly.push(pos);

		marker = new google.maps.Marker(
				{
					position : new google.maps.LatLng(locations[i][1],
							locations[i][2]),
					map : map

				});

		google.maps.event.addListener(marker, 'click', (function(marker, i) {
			return function() {
				infowindow.setContent(locations[i][0]);
				infowindow.open(map, marker);
			}

		})(marker, i));
	}

	Map.prototype.initPolyline(map, poly);
};

Map.prototype.initPolyline = function(map, poly) {

	var lineSymbol = {
		path : google.maps.SymbolPath.CIRCLE,
		scale : 8,
		strokeColor : '#393'
	};

	var flightPath = new google.maps.Polyline({
		path : poly,
		icons : [ {
			icon : lineSymbol,
			offset : '100%'
		} ],
		map : map
	});

	animateCircle(flightPath);

	function animateCircle(line) {
		var count = 0;
		window.setInterval(function() {
			count = (count + 1) % 200;

			var icons = line.get('icons');
			icons[0].offset = (count / 2) + '%';
			line.set('icons', icons);
		}, 50);
	}
}

// ---- chart -----

Map.prototype.settingServerId = function() {
	for (var int = 1; int < 3; int++) {
		var id = $("#server" + int).val();

		drawChart(id);
	}
}

function drawChart(serverId) {

	$.ajax({
		url : "/admin/home/" + serverId + "/system/resource",
		type : 'POST',
		contentType : 'application/json',
		dataType : 'json',
		processData : false,
		contentType : false,

		success : function(json) {
			if (json.length < 1) {
				$(".chartFlag").hide();
				return false;
			}

			var currentDate = json[0].regiDate;

			var data = new google.visualization.DataTable();
			data.addColumn('string', 'Date');
			data.addColumn('number', 'Memory');
			data.addColumn('number', 'Peak Memory');
			data.addColumn('number', 'Cpu');
			data.addColumn('number', 'Peak Cpu');

			for (var i = 0; i < json.length; i++) {
				data
						.addRow([ json[i].regiDate, json[i].memoryUsage,
								json[i].memoryPeak, json[i].cpuUsage,
								json[i].cpuPeak, ]);
			}

			var options = {
				title : serverId + " ( " + currentDate.substring(0, 11) + ")",
				is3D : true,

				animation : {
					startup : true,
					duration : 4000
				},
				backgroundColor : 'white',
				chartArea : {
					// '#4F3E3A' , 4F3E3A, white, black, #212F3D, 293134
					backgroundColor : 'white'
				},

				/*
				 * series : { 0 : { color : 'red' }, 1 : { color : 'blue' }, 2 : {
				 * color : 'green' }, 3 : { color : 'yellow' } },
				 */

				hAxis : {
					textStyle : {
						color : 'black'
					}
				},
				vAxis : {
					maxValue : 10
				},
				legendTextStyle : {
					color : 'black'
				},
				titleTextStyle : {
					color : 'black'
				},

			};

			// LineChart, AreaChart, ScatterChart
			var chart = new google.visualization.AreaChart(document
					.getElementById(serverId + '_div'));

			chart.draw(data, options);

		},
		error : function(request, status, error) {
		}
	});

}
