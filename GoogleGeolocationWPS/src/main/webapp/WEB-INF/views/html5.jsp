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
	<a href="${contextPath}/html5/detail">detail</a>
	<a href="${contextPath}/html5/watch">watch</a>

	<h1>HTML5 Geolocation API</h1>

	<p id="latitude">${latitude}</p>
	<p id="longitude">${longitude}</p>
	<div id="google_map" style="width: 100%; height: 100%;"></div>

	<ul>
		<li class='select2-selection__choice " + name + "'>

			<table>
				<tr>
					<td><img src='dist/img/user2-160x160.jpg' class='img-circle'
						alt='User Image'
						style='width: 50px; height: 50px; margin-left: 5px; margin-bottom: 3px'>

					</td>
				</tr>
				<tr>
					<td>name</td>
				</tr>
			</table>

		</li>
	</ul>


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
