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
	// ī�װ� �з����� �޾ƿ�
	int category = Integer.parseInt(request.getParameter("category"));
	
	String temp="";
	if(category==1) temp="����";
	else if(category==2) temp="����";
	else if(category==3) temp="����";
%>
<table width="1000">
	<tr height="70">
		<td align="center" colspan="3">
		<font size="5"> <%=temp %> ���� </font></td>
	</tr>
<%

	RentcarDAO rdao = new RentcarDAO();
	Vector<CarListBean> v = rdao.getCategoryCar(category);
	// td�� 3���� �����ְ� �ٽ� tr�� ������ �� �ֵ��� �ϴ� ���� ����
	int j = 0;
	for(int i = 0; i < v.size(); i++){
		// ���Ϳ� ����Ǿ� �ִ� �� Ŭ������ ����
		CarListBean bean = v.get(i);
		if(j%3==0){
%>
			<tr height="220">
		<%} %>
		<td width="333" align="center">
		<a href="RentcarMain.jsp?center=CarReserveInfo.jsp?no=<%=bean.getNo()%>">
		<img alt="" src="img/<%=bean.getImg()%>" width="300" height="200">
		</a>
		<p><font size="3" color="gray"><b>������ : <%=bean.getName() %></b></font></p></td>
		
	<%
		j++; // j���� �����Ͽ� �ϳ��� �࿡ �� 3���� ���������� �����ֱ����� ����
	} %>

</table>
</body>
</html>