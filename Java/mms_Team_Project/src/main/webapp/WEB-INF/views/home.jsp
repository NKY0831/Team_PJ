<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
	
<link rel="stylesheet" type="text/css" href="webapp/css/style.css">
</head>
<body>
<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>

<jsp:forward page="/board/list"/>
</body>
</html>
