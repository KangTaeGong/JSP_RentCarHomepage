<%@page import="db.RentcarDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<body>
<%
	request.setCharacterEncoding("EUC-KR");

	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	// ȸ�� ���̵�� �н����尡 ��ġ�ϴ��� ��
	RentcarDAO rdao = new RentcarDAO();
	
	// �ش� ȸ���� �ִ��� ���θ� ���ڷ� ǥ��
	int result = rdao.getMember(id, pass);
	
	if(result==0){
	%>
		<script>
			alert("ȸ�� ���̵� �Ǵ� �н����尡 Ʋ���ϴ�.");
			history.go(-1);
		</script>
	<%
	}else{
		// �α��� ó���� �Ǿ��ٸ�
		session.setAttribute("id", id);
		response.sendRedirect("RentcarMain.jsp");
	}
%>
</body>
</html>