<%@page import="db.CarListBean"%>
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
<!-- 데이터 베이스에 연결하여 최신순 자동차 3대만 뿌려주는 데이터를 가져옴 -->
<%
	RentcarDAO rdao = new RentcarDAO();
	// 벡터를 이용하여 자동차를 저장
	Vector<CarListBean> v = rdao.getSelectCar();
%>
<table width="1000">
	<tr height="70">
		<td align="center" colspan="3">
		<font size="5">추천 자동차</font></td>
	</tr>
	
	<tr height="240">
<%
	for(int i = 0; i < v.size(); i++){
		CarListBean bean = v.get(i);
%>
		<td width="333" align="center">
		<a href="RentcarMain.jsp?center=CarReserveInfo.jsp?no=<%=bean.getNo()%>">
		<img alt="" src="img/<%=bean.getImg()%>" width="300" height="200"> </a>
		<p><font size="3" color="gray"><b>차량명 : <%=bean.getName() %></b></font></p>
		</td>
<% 	} %>
</table>
	<p align="center" style="padding:20px"><font size="4"><b>-차량 검색하기-</b></font><br><br></p>
	<form action="RentcarMain.jsp?center=CarCategoryList.jsp" method="post" align="center" style="padding:0 0 50px 0">
		<font size="3" color="gray"><b>차량 검색하기</b></font>&nbsp;&nbsp;
		<select name="category">
			<option value="1">소형</option>
			<option value="2">중형</option>
			<option value="3">대형</option>
		</select>&nbsp;&nbsp;
		<input type="submit" value="검색">&nbsp;&nbsp;
	</form>
	<button onclick="location.href='RentcarMain.jsp?center=CarAllList.jsp'">전체 검색</button>
</body>
</html>