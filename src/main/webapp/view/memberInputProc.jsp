<%@page import="dao.TestDao"%>
<%@page import="vo.MemberVo"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 파라미터 가져오기
	request.setCharacterEncoding("UTF-8");
	int custno = Integer.parseInt(request.getParameter("custno"));
	String custname = request.getParameter("custname");
	String phone = request.getParameter("phone");
	String address = request.getParameter("address");
	Date joindate = Date.valueOf(request.getParameter("joindate"));
	String grade = request.getParameter("grade");
	String city = request.getParameter("city");
	
	// vo 객체에 데이터를 저장 및 바인딩
	MemberVo vo = new MemberVo();
	vo.setCustno(custno);
	vo.setCustname(custname);
	vo.setPhone(phone);
	vo.setAddress(address);
	vo.setJoindate(joindate);
	vo.setGrade(grade);
	vo.setCity(city);
	
	TestDao dao = new TestDao();
	int n = dao.memberInput(vo);
	
	// 화면 이동
	if (n > 0) {
		response.sendRedirect("/view/memberList.jsp");
	} else {
%>
<script>
	alert("입력 실패");
	history.back();
</script>
<%
	}
%>