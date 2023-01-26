<%@page import="org.springframework.http.MediaType"%>
<%@page import="kr.co.common.utils.UploadFileUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>${empty pt.criteria? '회원 목록 화면' : '회원 검색 목록 화면'}</title>

<link rel="stylesheet" type="text/css" href="/resources/css/style.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/
npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">

</head>
<c:if test= "${login.id == 'admin'}">
<body>
<div class="container-fluid">
   <jsp:include page="../part_header.jsp"/>
</div>

   <div class="container">
      <div class="jumbotron text-center">
      	<h1  class="display-4">${empty pt.criteria? '회원 목록 화면' : '회원 검색 목록 화면'}</h1>
 	  </div>


<table class="table table-ligth">
   <thead>
      <tr class="table-head">
         <th scope="col" class="text-center">ID</th>
         <!-- <th scope="col" class="text-center">PW</th> -->
         <th scope="col" class="text-center">이름</th>
         <th scope="col" class="text-center">생년월일</th>
         <th scope="col" class="text-center">주소</th>
         <th scope="col" class="text-center">email</th>
         <th scope="col" class="text-center">멤버 등급</th>
      </tr>
   </thead>
   <tbody>
   
   <c:forEach items="${list}" var="dto">   
      <tr>
         <td class= "text-center"><a href="/member/read/${dto.id}">${dto.id}</a></td>
         <!-- <td class= "text-center">${dto.pw}</td> -->
         <td class= "text-center">${dto.name}</td>
         <td class= "text-center">${dto.birth}</td>
         <td class= "text-center">${dto.address}</td>
         <td class= "text-center">${dto.email}</td>
         <td class= "text-center">${dto.grade}</td>
   </c:forEach>
   
   </tbody>
   </table>

		<jsp:include page="part_paging.jsp" />

		<jsp:include page="part_search.jsp" />


		<div class="form-group row">
             <div class="col-sm-12 menus text-right">
             <button onclick="history.back()" class="btn btn-warning">   돌아가기</button>
             </div>
       </div>
   
   </div>
      
<script type="text/javascript">
   $(document).ready(function() {
      $("form").on("click", "#search_submit", function(event) {
         event.preventDefault();
         let criteria = $("select[name='criteria']").val();
         let keyword = $("input[name='keyword']").val();
         
         
         let uri = "/member/list/"+criteria+"/"+keyword;
         
         $("form").attr("action", uri);
         $("form").attr("method", "post");
         if(keyword == ""){
            alert("검색어를 입력하세요")
            return false;
         }
         $("form").submit();
      });
   });
   
   
</script>

</body>
</c:if>
<c:if test= "${login.id != 'admin'}"><br style="color: red;"> 접근권한이 없습니다. <br>
<div class="jumbotron display-1 text-center">
<button style="font-size: xx-large;" onclick="history.back()" class="btn btn-warning">돌아가기</button>
</div>
</c:if>

</html>