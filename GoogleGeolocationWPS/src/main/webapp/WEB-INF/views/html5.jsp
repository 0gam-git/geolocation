<%@ page session="false" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>"></c:set>
<html>
<head>
<meta charset="utf-8">
<title>HTML5 Geolocation API</title>

<script src="${contextPath}/js/common/jquery-1.10.2.js"></script>
<script src="${contextPath}/js/map.js"></script>

<script type="text/javascript"
	src="https://maps.google.com/maps/api/js?key=AIzaSyBL2BXy9dE5NdOTkfYBwENB4Z7Lx6E5GHw"></script>
</head>
<body>
	<h1>HTML5 Geolocation API</h1>

	<p id="latitude">${latitude}</p>
	<p id="longitude">${longitude}</p>
	<div id="google_map" style="width: 100%; height: 100%;"></div>


</body>
<script type="text/javascript">
	$(document).ready(function() {

		if (navigator.geolocation) {
			//위치 정보를 얻기
			navigator.geolocation.getCurrentPosition(function(pos) {
				var latitude = pos.coords.latitude;
				var longitude = pos.coords.longitude;

				$('#latitude').html("위도 : " + latitude);
				$('#longitude').html("경도 : " + longitude);

				var myLatlng = {
					lat : latitude,
					lng : longitude
				};

				Map.prototype.initializeGoogleMap(myLatlng);
			});
		} else {
			alert("이 브라우저에서는 Geolocation이 지원되지 않습니다.")
		}

	});
</script>
</html>
