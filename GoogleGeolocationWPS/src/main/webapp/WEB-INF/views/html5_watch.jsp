<%@ page session="false" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>"></c:set>
<html>
<head>
<meta charset="utf-8">
<title>HTML5 Geolocation API - watch</title>

<script src="${contextPath}/js/common/jquery-1.10.2.js"></script>
<script src="${contextPath}/js/map.js"></script>

<script type="text/javascript"
	src="https://maps.google.com/maps/api/js?key=AIzaSyBL2BXy9dE5NdOTkfYBwENB4Z7Lx6E5GHw"></script>
</head>
<body>
	<h1>HTML5 Geolocation API - watch</h1>
	<ul>
		<li>위도 : <span id="latitude"></span></li>
		<li>경도 : <span id="longitude"></span></li>
	</ul>
	<input id="btnStop" type="button" value="Detect drives done" />
	<br />

	<div id="google_map" style="width: 840px; height: 620px;"></div>


</body>
<script type="text/javascript">
	$(document).ready(
			function() {

				if (navigator.geolocation) {

					var id = navigator.geolocation.watchPosition(function(pos) {
						var latitude = pos.coords.latitude;
						var longitude = pos.coords.longitude;

						$('#latitude').html(latitude);
						$('#longitude').html(longitude);

						var mapElement = $("#modal_map");
						google.maps.event.addDomListener(window, 'load',
								Map.prototype.initializeGoogleMap(latitude,
										longitude));

						mapElement.show('slow');
					});

					// 버튼 클릭으로 감시를 중지
					$('#btnStop').click(function() {
						navigator.geolocation.clearWatch(id);
					});
				} else {
					alert("이 브라우저에서는 Geolocation이 지원되지 않습니다.")
				}

			});
</script>
</html>
