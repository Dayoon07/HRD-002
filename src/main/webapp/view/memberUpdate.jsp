<%@page import="vo.MemberVo"%>
<%@page import="dao.TestDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	int custno = Integer.parseInt(request.getParameter("custno"));
	TestDao dao = new TestDao();
	MemberVo vo = dao.getMember(custno);
%>
<jsp:include page="/master/header.jsp" />

	<section>
		<h2>홈쇼핑 회원 수정</h2>
		<form action="memberUpdateProc.jsp" method="post" autocomplete="off">
			<table border="1" style="border-collapse: collapse;">
				<tr>
					<td>회원번호 (자동발생)</td>
					<td><input type="number" value="<%= vo.getCustno() %>" name="custno" id="custno" readonly="readonly"></td>
				</tr>
				<tr>
					<td>회원성명</td>
					<td><input type="text" value="<%= vo.getCustname() %>" name="custname" id="custname"></td>
				</tr>
				<tr>
					<td>회원전화</td>
					<td><input type="text" value="<%= vo.getPhone() %>" name="phone" id="phone"></td>
				</tr>
				<tr>
					<td>회원주소</td>
					<td><input type="text" value="<%= vo.getAddress() %>" name="address" id="address"></td>
				</tr>
				<tr>
					<td>가입일자</td>
					<td><input type="date" value="<%= vo.getJoindate() %>" name="joindate" id="joindate"></td>
				</tr>
				<tr>
					<td>고객등급</td>
					<td>
						<select name="grade" id="grade">
							<option value="0">등급선택</option>
							<option value="A" <%= "A".equals(vo.getGrade()) ? "selected" : "" %>>VIP</option>
							<option value="B" <%= "B".equals(vo.getGrade()) ? "selected" : "" %>>일반</option>
							<option value="C" <%= "C".equals(vo.getGrade()) ? "selected" : "" %>>직원</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>도시코드</td>
					<td><input type="text" value="<%= vo.getCity() %>" name="city" id="city"></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="수정" onclick="checkFrom()" id="submited">
						<input type="reset" value="다시조회">		
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