<%@page import="db.CarViewBean"%>
<%@page import="java.util.Vector"%>
<%@page import="db.RentcarDAO"%>
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
	String id = (String)session.getAttribute("id");

	if(id==null){
%>
	<script>
		alert("로그인을 먼저 해주세요.");
		location.href="RentcarMain.jsp?center=MemberLogin.jsp";
	</script>
<%
	}
	// 예약정보 리턴
	RentcarDAO rdao = new RentcarDAO();
	Vector<CarViewBean> v = rdao.getAllReserve(id);
%>
<table width="1000">
	<tr height="70">
		<td align="center" colspan="11">
		<font size="5"> 차량 예약 화면 </font></td>
	</tr>
</table>	
	<table width="1000" border="1">
	<tr height="40">
		<td width="150" align="center"> 이미지</td>
		<td width="150" align="center"> 이름</td>
		<td width="130" align="center"> 대여일</td>
		<td width="90" align="center"> 대여기간</td>
		<td width="90" align="center"> 금액</td>
		<td width="60" align="center"> 수량</td>
		<td width="60" align="center"> 보험유무</td>
		<td width="60" align="center"> wifi</td>
		<td width="60" align="center"> 베이비시트</td>
		<td width="60" align="center"> 네비게이션</td>
		<td width="90" align="center"> 삭제</td>
	</tr>
<%
	for(int i = 0; i < v.size(); i++){
		CarViewBean bean = v.get(i);
%>
	<tr height="70" bordercolor="gray">
		<td width="150" align="center"> <img alt="" src="img/<%=bean.getImg()%>" width="120" height="70"></td>
		<td width="150" align="center"> <%=bean.getName() %></td>
		<td width="150" align="center"> <%=bean.getRday() %></td>
		<td width="60" align="center"> <%=bean.getDday() %>일</td>
		<td width="100" align="center"> <%=bean.getPrice() %>원</td>
		<td width="60" align="center"> <%=bean.getQty() %></td>
		<td width="60" align="center"> <%=bean.getUsein() %></td>
		<td width="60" align="center"> <%=bean.getUsewifi() %></td>
		<td width="60" align="center"> <%=bean.getUseseat() %></td>
		<td width="60" align="center"> <%=bean.getUsenavi() %></td>
		<td width="90" align="center"><button onclick="location.href='CarReserveDel.jsp?id=<%=id%>&rday=<%=bean.getRday()%>'">삭제</button></td>
	</tr>
	
<% } %>

</table>
</body>
</html>