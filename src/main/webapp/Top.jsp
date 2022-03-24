<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<body>

<!-- 세션을 이용한 로그인 처리 -->
<%
	String id = (String)session.getAttribute("id");

	// 로그인이 되어 있지 않다면 
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
			<%=id %> 님
		<%
			if(id.equals("GUEST")){ %>
				<Button onclick="location.href='RentcarMain.jsp?center=MemberLogin.jsp'"> 로그인 </Button>	
		<%	}else{%>
				<button onclick="location.href='RentcarMain.jsp">로그아웃</button>
		<% } %>
		</td>
	</tr>
	<tr height="50">
		<td align="center" width="200" bgcolor="red">
			<a href="RentcarMain.jsp?center=CarReserveMain.jsp" style="color:white; text-decoration:none"><font size="4">예 약 하 기</font></a>
		</td>
		<td align="center" width="200" bgcolor="red">
			<a href="RentcarMain.jsp?center=CarReserveView.jsp" style="color:white; text-decoration:none"><font size="4">예 약 확 인</font></a>
		</td>
		<td align="center" width="200" bgcolor="red">
			<a href="#" style="color:white; text-decoration:none"><font size="4">자 유 게 시 판</font></a>
		</td>
		<td align="center" width="200" bgcolor="red">
			<a href="#" style="color:white; text-decoration:none"><font size="4">이 벤 트</font></a>
		</td>
		<td align="center" width="200" bgcolor="red">
			<a href="#" style="color:white; text-decoration:none"><font size="4">고 객 센 터</font></a>
		</td>
	</tr>
</table>
</body>
</html>