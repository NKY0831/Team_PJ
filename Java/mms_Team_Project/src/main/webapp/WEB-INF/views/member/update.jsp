<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>회원 정보 수정 화면</title>

<link rel="stylesheet" type="text/css" href="/resources/css/style.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
	crossorigin="anonymous"></script>
</head>
<body>

<div class="container-fluid">
	<jsp:include page="../part_header.jsp"/>
</div>
	<div class="container">
		<div class="jumbotron">
			<h1 class="display-4 text-center">회원 정보 수정 화면</h1>
		</div>

		<form action="/member/update" method="post">
			<div class="form-group row">
				<label for="id" class="col-sm-2 col-form-label text-right">아이디</label>
				<div class="col-sm-10">
					<input class="form-control" id="id" name="id" value="${dto.id}" readonly>
				</div>
			</div>

			<div class="form-group row">
				<label for="name" class="col-sm-2 col-form-label text-right">이름</label>
				<div class="col-sm-10">
					<input class="form-control" id="name" name="name" required value="${dto.name}">
				</div>
			</div>

			<div class="form-group row">
				<label for="pw1" class="col-sm-2 col-form-label text-right">비밀번호</label>
				<div class="col-sm-10">
					<input type="password" class="form-control" id="pw1" name="pw" required>
				</div>
			</div>


			<div class="form-group row">
				<label for="birth" class="col-sm-2 col-form-label text-right">생년월일</label>
				<div class="col-sm-10">
					<input class="form-control" id="birth" name="birth" type="date" required value="${dto.birth}">
				</div>
			</div>

			<div class="form-group row">
				<label for="email" class="col-sm-2 col-form-label text-right">이메일</label>
				<div class="col-sm-10">
					<input class="form-control" id="email" name="email" type="email" required value="${dto.email}">
				</div>
			</div>


			<div class="form-group row">
				<label for="address" class="col-sm-2 col-form-label text-right">주소</label>
				<div class="col-sm-10">
					<input class="form-control" id="address" name="address" required value="${dto.address}">
				</div>
			</div>
		
			<div class="form-group row">
    			<div class="col-sm-12 menus text-right">
      				<button type="submit" class="btn btn-warning">수정</button> &nbsp;
      				<button onclick="history.back()" class="btn btn-warning">뒤로가기</button>
    			</div>
  			</div>
		
		</form>
	</div>
	
	<script type="text/javascript">
		$(document).ready(function() {
			$("button[type='submit']").click(function(event) {
				event.preventDefault();
				
				let pw1 = $("#pw1").val();
				
				
				if(pw1 == ""){
					$("#pw1").focus();
					return false;
				}
				
				
				$("form").submit();
				
			});
			
			
			
		});
	</script>
	
	
	
	
	
	
	
	
</body>
</html>