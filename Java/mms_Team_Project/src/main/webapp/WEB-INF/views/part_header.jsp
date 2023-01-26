<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<link rel="stylesheet" type="text/css" href="/resources/css/style.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<!-- 나브바 -->
<header style="padding: 5px;">

	<nav class="navbar right-nav navbar-expand-lg navbar-light bg-light">
	
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarTogglerDemo03"
			aria-controls="navbarTogglerDemo03" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		
        <img src="/resources/img/board.png" width="25" height="30">&nbsp;
		<a class="navbar-brand" href="/board/list">게시판</a>

		<div class="collapse navbar-collapse justify-content-end" id="navbarTogglerDemo03">
			<ul class="navbar-nav">
				<c:choose>
					<c:when test="${empty login}">
						<li class="nav-item active"><a class="nav-link"
							href="/member/login">로그인<span class="sr-only">(current)</span></a></li> &nbsp;
						<li class="nav-item active"><a class="nav-link"
							href="/member/insert">회원가입<span class="sr-only">(current)</span></a></li> &nbsp;
					</c:when>
					<c:otherwise>
						<li class="nav-item active">
						<c:if test="${login.id!='admin'}"> <a class="nav-link" style="border: thick;">${login.id}님,환영합니다.</a></c:if></li> &nbsp;
						<c:if test="${login.id=='admin'}"> <a class="nav-link" style="border: thick; color: red;">관리자님,환영합니다.</a> </c:if> &nbsp;
						<li class="nav-item"><a class="nav-link"
							href="/member/read/${login.id}">내 정보 확인<span class="sr-only">(current)</span></a></li> &nbsp;
						<li class="nav-item"><a class="nav-link"
							href="/member/updatepwui/${login.id}">비밀번호 변경</a></li> &nbsp;
						<li class="nav-item"><a class="nav-link"
							href="/member/logout">로그아웃</a></li> &nbsp;
						<c:if test="${login.id == 'admin'}">
							<li class="nav-item"><a class="nav-link" href="/member/list"
								style="color: red;">(관리자) 회원 목록</a></li> &nbsp;
						</c:if>
						<!-- <li class="nav-item"><a class="nav-link disabled">개발중</a> -->
						</li>
					</c:otherwise>
				</c:choose>

			</ul>
		</div>
		<hr class="clearfix">

	</nav>

</header>

