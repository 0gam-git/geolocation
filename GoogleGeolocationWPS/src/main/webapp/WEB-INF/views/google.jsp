<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>"></c:set>
<html>
<head>
<title>Home</title>

<script src="${contextPath}/js/common/jquery-1.10.2.js"></script>
<script src="${contextPath}/js/map.js"></script>

<script type="text/javascript"
	src="https://maps.google.com/maps/api/js?key=AIzaSyBL2BXy9dE5NdOTkfYBwENB4Z7Lx6E5GHw"></script>
</head>
<body>
	<h1>Google Geolocation API</h1>

	<p id="msg">${returnJson}</p>
	<div id="google_map" style="width: 100%; height: 100%;"></div>


	<input type="hidden" id="latitude" value="${latitude}" />
	<input type="hidden" id="longitude" value="${longitude}" />
</body>
<script type="text/javascript">
	$(document).ready(
			function() {
				// google setting
				var latitude = $("#latitude").val();
				var longitude = $("#longitude").val();

				var mapElement = $("#modal_map");
				google.maps.event.addDomListener(window, 'load', Map.prototype
						.initializeGoogleMap(latitude, longitude));

				mapElement.show('slow');

			});
</script>
</html>
