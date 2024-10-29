<%@ page import="vo.MemberVo"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dao.TestDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	TestDao dao = new TestDao();
	ArrayList<MemberVo> list = dao.memberList();
%>
<jsp:include page="/master/header.jsp" />

	<section>
		<h2>회원목록조회/수정</h2>
		
		<table border="1" style="border-collapse: collapse;">
			<tr>
				<td>회원번호</td>
				<td>회원성명</td>
				<td>회원전화</td>
				<td>회원주소</td>
				<td>가입일자</td>
				<td>고객등급</td>
				<td>거주지역</td>
				<td>삭제여부</td>
			</tr>
			<%
				if (list != null) {
					for (MemberVo vo : list) {
			%>
			<tr>
				<td><a href="/view/memberUpdate.jsp?custno=<%= vo.getCustno() %>"><%= vo.getCustno() %></a></td>
				<td><%= vo.getCustname() %></td>
				<td><%= vo.getPhone() %></td>
				<td><%= vo.getAddress() %></td>
				<td><%= vo.getJoindate() %></td>
				<td><%= vo.getGrade() %></td>
				<td><%= vo.getCity() %></td>
				<td><a href="/view/memberDelete.jsp?custno=<%= vo.getCustno() %>">삭제</a></td>
			</tr>
			<%
					}
				} else out.println("테이블에 저장된 정보가 없음");
			%>
		</table>
	</section>

<jsp:include page="/master/footer.jsp" />