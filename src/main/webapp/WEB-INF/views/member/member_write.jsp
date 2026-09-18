<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Spring Boot</title>
	<link href="css/common.css" rel="stylesheet">
	<link href="css/layout.css" rel="stylesheet" >
	<script type="text/javascript" src="js/common.js"></script>
	<script type="text/javascript" src="js/jquery-1.8.1.min.js"></script>
	<script type="text/javascript">
		function checkId(){
			if(checkEmpty(mem.t_id,"ID 입력후 중복검사 하시오!")) return;
			
			var id = mem.t_id.value;
			
			$.ajax({
				type :"POST",
				url : "MemberCheckId",
				data: "t_id="+id,
				dataType : "text",
				error : function(){
					alert('통신실패!!!!!');
				},
				success : function(data){
// 					alert("=="+data+"==");
					var result = $.trim(data);
					mem.t_id_check.value = result;
				}
			});		
			
		}	
	
		function goSave(){
			if(checkEmpty(mem.t_id,"ID 입력!")) return;
			if(checkEmpty(mem.t_name,"성명 입력!")) return;
			
			mem.method = "post";
			mem.action = "MemberSave";
			mem.submit();

		}
	</script>
</head>
<body>
	<div class="container">
		
		<div class="leftmargin">
			<img src="images/jsl_logo.png"><h1>JSL 이재열 회원관리</h1>
		</div>		
		<div class="write_wrap">
			<form name="mem">
			<input type="hidden" name="t_gubun">
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
								<input name="t_id"  class="input_100px" type="text">
								<input type="button" onclick="checkId()" value="ID중복검사">
								<input type="text" name="t_id_check" disabled style="border:none">
							</td>
						</tr>
						<tr>
							<th>성명</th>
							<td class="th_left">
								<input name="t_name"  class="input_100px" type="text">
							</td>
						</tr>
						<tr>
							<th>지역</th>
							<td class="th_left">
								<select name="t_area" class="input_100px">
									<option value="">=선택=</option>
									<option value="서울">서울</option>
									<option value="대전">대전</option>
									<option value="대구">대구</option>
									<option value="부산">부산</option>
								</select>
							</td>
						</tr>
						<tr>
							<th>나이</th>
							<td class="th_left">
								<input name="t_age"  class="input_100px" type="text">
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			</form>
			<div class="btn_wrap">
				<input type="button" value="등록" onclick="goSave()" class="btn_ok">&nbsp;&nbsp;
				<input type="button" value="목록" onclick="location.href='MemberList'" class="btn_list">
			</div>
		</div>
	</div>
</body>
</html>



















