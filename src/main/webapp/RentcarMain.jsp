<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<style>
	*{
		margin:auto;
	}
</style>
<body>
<%
	String center = request.getParameter("center");
	// ó�� ����ÿ��� center ���� �Ѿ���� �ʱ⿡
	if(center == null){
		center="Center.jsp";	// ����Ʈ center���� �ο�
	}
%>
<table width="1000">
	<!-- Top -->
	<tr height="140" align="center">
		<td align="center"> <jsp:include page="Top.jsp"></jsp:include></td>
	</tr>
	<!-- Center -->
	<tr align="center">
		<td align="center"> <jsp:include page="<%=center %>"></jsp:include></td>
	</tr>
	<!-- Bottom -->
	<tr height="100" align="center">
		<td align="center"> <jsp:include page="Bottom.jsp"></jsp:include></td>
	</tr>
</table>
</body>
</html>