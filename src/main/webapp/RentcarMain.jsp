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
	// 처음 실행시에는 center 값이 넘어오지 않기에
	if(center == null){
		center="Center.jsp";	// 디폴트 center값을 부여
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