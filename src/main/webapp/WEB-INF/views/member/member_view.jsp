<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Spring Boot</title>
	<link href="css/common.css" rel="stylesheet">
	<link href="css/layout.css" rel="stylesheet" >	
	<script type="text/javascript">
		function goDelete(){
			if(confirm("삭제")){
				mem.method = "post";
				mem.action = "MemberDelete";
				mem.submit();
			}
		}
	</script>
</head>
<body>
<form name="mem">
<input type="hidden" name="t_id" value="${dto.getId()}">
	<div class="container">
		<div class="leftmargin">
			<img src="images/jsl_logo.png"><h1>JSL 이재열 회원관리</h1>
		</div>		
		<div class="write_wrap">
			<div class="board_list">
				<table class="board_table">
					<colgroup>
						<col width="12%">
						<col width="*">
					</colgroup>
					<tbody>
						<tr>
							<th>ID</th>
							<td class="th_left">
								${dto.getId()}
							</td>
						</tr>
						<tr>
							<th>성명</th>
							<td class="th_left">
								${dto.getName()}
							</td>
						</tr>
						<tr>
							<th>지역</th>
							<td class="th_left">
								${dto.getArea()}
							</td>
						</tr>
						<tr>
							<th>나이</th>
							<td class="th_left">
								${dto.getAge()}
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="btn_wrap">
				<input type="button" onClick="location.href='MemberList'" value="목록" class="btn_list">
				<input type="button" onClick="" value="수정" class="btn_list">
				<input type="button" onClick="goDelete()" value="삭제" class="btn_list">
			</div>
		</div>
	</div>
	</form>
</body>
</html>



















