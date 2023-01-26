<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>로그인 화면</title>

<link rel="stylesheet" type="text/css" href="/resources/css/style.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
<script src="/resources/js/templateform.js"></script>
</head>
<body style="padding-top: 50px;">

	<div class="container text-center">
		<form class="form-signin" action="/member/loginPost" method="POST">
			<img class="mb-4" src="/resources/img/dw.png">
			<input style="width:500px; margin: auto;" name="id" id="id" class="form-control my-4" placeholder="아이디를 입력하세요." required autofocus> 
			<input style="width:500px; margin: auto;" name="pw" type="password" id="pw" class="form-control my-4" placeholder="비밀번호를 입력하세요." required>
			<a type="button" class="btn btn-secondary btn-lg" href="/member/insert">회원가입</a> &nbsp;
			<button class="btn btn-primary btn-lg active" type="submit">로그인</button> &nbsp;
			<a type="button" class="btn btn-secondary btn-lg" href="/board/list/">게시판 이동</a>

		</form>
	</div>


</body>
</html>