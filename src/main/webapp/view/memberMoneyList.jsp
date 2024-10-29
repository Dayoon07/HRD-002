<%@page import="dao.TestDao"%>
<%@page import="vo.MoneyVo"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	TestDao dao = new TestDao();
	ArrayList<MoneyVo> list = dao.moneyList();
%>
<jsp:include page="/master/header.jsp" />

	<section>
		<h2>회원매출조회</h2>
		
		<table border="1" style="border-collapse: collapse;">
			<tr>
				<td>회원번호</td>
				<td>회원성명</td>
				<td>고객등급</td>
				<td>매출</td>
			</tr>
			<%
				if (list != null) {
					for (MoneyVo vo : list) {
			%>
			<tr>
				<td><%= vo.getCustno() %></td>
				<td><%= vo.getCustname() %></td>
				<td><%= vo.getGrade() %></td>
				<td><%= vo.getPrice() %></td>
			</tr>
			<%
					}
				} else {
					out.println("<h3 style='text-align:center;'>테이블에 저장된 매출 정보가 없습니다.</h3>");
				}
			%>
		</table>
	</section>

<jsp:include page="/master/footer.jsp" />