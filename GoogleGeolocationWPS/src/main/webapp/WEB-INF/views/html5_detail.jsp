<%@ page session="false" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>"></c:set>
<html>
<head>
<meta charset="utf-8">
<title>HTML5 Geolocation API - detail</title>

<script src="${contextPath}/js/common/jquery-1.10.2.js"></script>
<script src="${contextPath}/js/map.js"></script>
<script src="${contextPath}/js/whereami.js"></script>

<script type="text/javascript"
	src="https://maps.google.com/maps/api/js?key=AIzaSyBL2BXy9dE5NdOTkfYBwENB4Z7Lx6E5GHw"></script>
</head>

<body>
	<a href="${contextPath}/html5/detail">detail</a>
	<a href="${contextPath}/html5/watch">watch</a>

	<h1>HTML5 Geolocation API - detail</h1>

	<h4 id="myLocationInfo"></h4>
	<br />

	<div id="google_map" style="width: 100%; height: 100%;"></div>


</body>
<script type="text/javascript">
	$(document).ready(function() {

		var elt = document.getElementById("myLocationInfo");

		whereami(elt);

	});
</script>
</html>
