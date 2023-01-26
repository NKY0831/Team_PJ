<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet" type="text/css" href="/resources/css/style.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>


</head>
<body>
<div class="container">

					<div class="modal-body">
						<div class="form-group row text-center" id="mymodal">
							<span id="failmsg" class="col-sm-12"></span>
						</div>


						<div class="form-group row">
							<label for="pw1" class="col-sm-2 col-form-label text-right">기존 비밀번호</label>
							<div class="col-sm-10">
								<input type="password" class="form-control" id="pw" name="pw">
							</div>
						</div>
						
						<div class="form-group row">
							<label for="pw1" class="col-sm-2 col-form-label text-right">신규 비밀번호</label>
							<div class="col-sm-10">
								<input type="password" class="form-control" id="npw" name="npw">
							</div>
						</div>
						
						<div class="form-group row">
							<label for="pw1" class="col-sm-2 col-form-label text-right">신규 비밀번호(확인)</label>
							<div class="col-sm-10">
								<input type="password" class="form-control" id="npw2">
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" onclick="history.back()" class="btn btn-secondary"	data-dismiss="modal">취소</button>
						<button type="button" class="btn btn-warning" id="changepw">비밀번호 변경</button>
					</div>
				</div>


<script type="text/javascript">
	$(document).ready(function() {
		
			
	
		
		$("#changepw").click(function() {
			let pw = $("#pw").val();
			let npw = $("#npw").val();
			let npw2 = $("#npw2").val();
			
			if(pw == "" | npw == "" | npw2 == ""){
				return false;
			}
			
			if(npw != npw2){
				return false;
			}
			
			$.ajax({
				url : '/member/changepw',
				type : "post",
				data : {
					"pw" : pw,
					"npw" : npw,
					"id" : "${dto.id}"
				},
				dataType : "text",
				success : function(result){
					if(result > 0){
						defaultPwInput();
						location.assign("/board/list");
						
					}else{
						$("#failmsg").text(" 비밀번호 변경 실패 ");
						$("#failmsg").css("color", "red");
						$("#failmsg").addClass("addBorder");
					}
					
					
				}
			});
			
			
			
		});
		
		
		
				
		function defaultPwInput() {
			$("#pw").val("");
			$("#npw").val("");
			$("#npw2").val("");
			$("#failmsg").text("");
			$("#failmsg").removeClass("addBorder");
		}
		
		
	});
</script>

</body>
</html>