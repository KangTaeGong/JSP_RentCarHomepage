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
<%
	// 카테고리 분류값을 받아옴
	int category = Integer.parseInt(request.getParameter("category"));
	
	String temp="";
	if(category==1) temp="소형";
	else if(category==2) temp="중형";
	else if(category==3) temp="대형";
%>
<table width="1000">
	<tr height="70">
		<td align="center" colspan="3">
		<font size="5"> <%=temp %> 차량 </font></td>
	</tr>
<%

	RentcarDAO rdao = new RentcarDAO();
	Vector<CarListBean> v = rdao.getCategoryCar(category);
	// td를 3개씩 보여주고 다시 tr을 실행할 수 있도록 하는 변수 선언
	int j = 0;
	for(int i = 0; i < v.size(); i++){
		// 벡터에 저장되어 있는 빈 클래스를 추출
		CarListBean bean = v.get(i);
		if(j%3==0){
%>
			<tr height="220">
		<%} %>
		<td width="333" align="center">
		<a href="RentcarMain.jsp?center=CarReserveInfo.jsp?no=<%=bean.getNo()%>">
		<img alt="" src="img/<%=bean.getImg()%>" width="300" height="200">
		</a>
		<p><font size="3" color="gray"><b>차량명 : <%=bean.getName() %></b></font></p></td>
		
	<%
		j++; // j값을 증가하여 하나의 행에 총 3개의 차량정보를 보여주기위해 증가
	} %>

</table>
</body>
</html>