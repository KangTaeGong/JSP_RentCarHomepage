<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<body>

<!-- ������ �̿��� �α��� ó�� -->
<%
	String id = (String)session.getAttribute("id");

	// �α����� �Ǿ� ���� �ʴٸ� 
	if(id==null){
		id="GUEST";
	}
%>


<table width="1000">
	<tr height="70">
		<td colspan="4">
			<a href="RentcarMain.jsp" style="text-decoration:none">
			<img alt="" src="img/RENT.png" height="65" width="200">
			</a>
		</td>
		<td align="center" width="200">
			<%=id %> ��
		<%
			if(id.equals("GUEST")){ %>
				<Button onclick="location.href='RentcarMain.jsp?center=MemberLogin.jsp'"> �α��� </Button>	
		<%	}else{%>
				<button onclick="location.href='RentcarMain.jsp">�α׾ƿ�</button>
		<% } %>
		</td>
	</tr>
	<tr height="50">
		<td align="center" width="200" bgcolor="red">
			<a href="RentcarMain.jsp?center=CarReserveMain.jsp" style="color:white; text-decoration:none"><font size="4">�� �� �� ��</font></a>
		</td>
		<td align="center" width="200" bgcolor="red">
			<a href="RentcarMain.jsp?center=CarReserveView.jsp" style="color:white; text-decoration:none"><font size="4">�� �� Ȯ ��</font></a>
		</td>
		<td align="center" width="200" bgcolor="red">
			<a href="#" style="color:white; text-decoration:none"><font size="4">�� �� �� �� ��</font></a>
		</td>
		<td align="center" width="200" bgcolor="red">
			<a href="#" style="color:white; text-decoration:none"><font size="4">�� �� Ʈ</font></a>
		</td>
		<td align="center" width="200" bgcolor="red">
			<a href="#" style="color:white; text-decoration:none"><font size="4">�� �� �� ��</font></a>
		</td>
	</tr>
</table>
</body>
</html>