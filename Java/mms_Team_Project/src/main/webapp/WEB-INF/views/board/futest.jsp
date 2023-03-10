<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="/resources/css/style.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
<script src="/resources/js/templateform.js"></script>


<style type="text/css">
	.del{
		cursor: pointer;
	}

</style>


</head>
<body>
	<form action="/board/futest" method="post" enctype="multipart/form-data">
		id : <input name="id" id="id"><br>
		첨부파일: 
		<input type="file" name="file" id="img1"><br>
		<input id="submit" type="submit" value="전송">
	</form>
	
	<div id="uploadedList">

	
	</div>
	
	<script type="text/javascript">
	
	
		
	
		$(document).ready(function() {
			let formData = new FormData();
			
			$("#uploadedList").on("click", ".del", function() {
				let filename = $(this).attr("data-filename");
				formData.delete(filename);
				
				
				$(this).parent().remove();
				
			});
			
			
			$("#submit").click(function(event) {
				event.preventDefault();
				let id = $("#id").val();
				
				formData.append("id", id);
				
				$.ajax({
					url : "/board/fuajaxtest",
					type : "post",
					processData : false,
					contentType : false,
					data : formData,
					dataType : "text",
					success : function(result) {
						alert(result);
					}
				});
			});
			
			
			$("#img1").change(function(event) {
				let reader = new FileReader();
				
				let fArr = event.target.files;
				let file = fArr[0];
				
				reader.readAsDataURL(file);
				
				reader.onload= function(event) {
					let tag = futest2(event.target.result, file["name"]);
					$("#uploadedList").append(tag);
				}
				
				formData.append(file["name"], file);
			});
		});
		
		
		
	
	
	
	</script>


</body>
</html>