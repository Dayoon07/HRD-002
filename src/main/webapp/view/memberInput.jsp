<%@page import="dao.TestDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	TestDao dao = new TestDao();
	int n = dao.getMaxCustNo();
%>
<jsp:include page="/master/header.jsp" />

	<section>
		<h2>회원 등록</h2>
		<form action="memberInputProc.jsp" method="post" autocomplete="off">
			<table border="1" style="border-collapse: collapse;">
				<tr>
					<td>회원번호 (자동발생)</td>
					<td><input type="number" value="<%= n %>" name="custno" id="custno" required="required" readonly="readonly"></td>
				</tr>
				<tr>
					<td>회원성명</td>
					<td><input type="text" name="custname" id="custname" required="required"></td>
				</tr>
				<tr>
					<td>회원전화</td>
					<td><input type="text" name="phone" id="phone" required="required"></td>
				</tr>
				<tr>
					<td>회원주소</td>
					<td><input type="text" name="address" id="address" required="required"></td>
				</tr>
				<tr>
					<td>가입일자</td>
					<td><input type="date" name="joindate" id="joindate" required="required"></td>
				</tr>
				<tr>
					<td>고객등급</td>
					<td>
						<select name="grade" id="grade">
							<option value="">등급선택</option>
							<option value="A">VIP</option>
							<option value="B">일반</option>
							<option value="C">직원</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>도시코드</td>
					<td><input type="text" name="city" id="city" required="required"></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="가입하기" onclick="checkFrom()" id="submited">					
					</td>
				</tr>
			</table>
		</form>
	</section>
	
	<script>
		document.addEventListener("DOMContentLoaded", function() {
		    "use strict";
		    
		    const custname = document.querySelector("#custname") || [];
		    const phone = document.querySelector("#phone") || [];
		    const address = document.querySelector("#address") || [];
		    const joindate = document.querySelector("#joindate") || [];
		    const grade = document.querySelector("#grade") || [];
		    
		    document.addEventListener("submit", (e) => {
		        if (custname.value == "") {
		        	e.prevenDefault();
		        	alert("값 좀 넣어");
		        }
		        if (phone.value == "") {
		        	e.prevenDefault();
		        	alert("값 좀 넣어");
		        }
		        if (address.value == "") {
		        	e.prevenDefault();
		        	alert("값 좀 넣어");
		        }
		        if (joindate.value == "") {
		        	e.prevenDefault();
		        	alert("값 좀 넣어");
		        }
		        if (grade.value == "") {
		        	e.prevenDefault();
		        	alert("값 좀 넣어");
		        }
		    });
		});
	</script>

<jsp:include page="/master/footer.jsp" />