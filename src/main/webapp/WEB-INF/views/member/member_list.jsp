<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html> 
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Spring Boot</title>
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css">	
	<link href="css/common.css" rel="stylesheet">
	<link href="css/layout.css" rel="stylesheet">
<script type="text/javascript">
	function goSearch(){
		mem.method = "post";
		mem.action = "MemberList";
		mem.submit();
	}
</script>
</head>
<body>
	<div class="container">
		<div class="leftmargin">
			<a href="Member"><img src="images/jsl_logo.png"><a href="Member"><h1>JSL 회원관리</h1></a></a>
		</div>		
		<div class="search_wrap">
			<div class="record_group">
				<p>총 회원수 : <span>${list.size()}</span>명</p>
			</div>
			<form name="mem">
				<div class="search_group">
					<select name="t_select" class="select">
						<option value="id" <c:if test="${select eq 'id'}">selected</c:if>>ID</option>
						<option value="name" <c:if test="${select eq 'name'}">selected</c:if>>성명</option>
					</select>
					<input type="text" name="t_search" value="${search}" class="search_word">
					<button class="btn_search" onclick="goSearch()"><i class="fa fa-search"></i><span class="sr-only">검색버튼</span></button>
				</div>
			</form>
		</div>
	</div>
	<div class="board_list">
		<table class="board_table">
			<colgroup>
				<col width="25%">
				<col width="25%">
			</colgroup>
			<thead>
				<tr>
					<th>ID</th>
					<th>성명</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${list}" var="dto">
				<tr>
					<td><a href="MemberView?t_id=${dto.getId()}">${dto.getId()}</a></td>
					<td>${dto.getName()}</td>
				</tr>
			</c:forEach>	
			</tbody>
		</table>
		<div class="paging">
			<a href="MemberWriteForm" class="write">회원등록</a>
		</div>
	</div>
 </body>
</html>







    