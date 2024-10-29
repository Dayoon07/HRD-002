<%@page import="dao.TestDao"%>
<%@page import="vo.MemberVo"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	int custno = Integer.parseInt(request.getParameter("custno"));
	
	TestDao dao = new TestDao();
	int n = dao.memberDelete(custno);
	
	// 화면 이동
	if (n > 0) {
%>
<script>
	alert("삭제 성공");
	location.href = "/view/memberList.jsp";
</script>
<%
	} else {
%>
<script>
	alert("삭제 실패");
	history.back();
</script>
<%
	}
%>