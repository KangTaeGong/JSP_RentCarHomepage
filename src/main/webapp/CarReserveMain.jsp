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
<!-- ������ ���̽��� �����Ͽ� �ֽż� �ڵ��� 3�븸 �ѷ��ִ� �����͸� ������ -->
<%
	RentcarDAO rdao = new RentcarDAO();
	// ���͸� �̿��Ͽ� �ڵ����� ����
	Vector<CarListBean> v = rdao.getSelectCar();
%>
<table width="1000">
	<tr height="70">
		<td align="center" colspan="3">
		<font size="5">��õ �ڵ���</font></td>
	</tr>
	
	<tr height="240">
<%
	for(int i = 0; i < v.size(); i++){
		CarListBean bean = v.get(i);
%>
		<td width="333" align="center">
		<a href="RentcarMain.jsp?center=CarReserveInfo.jsp?no=<%=bean.getNo()%>">
		<img alt="" src="img/<%=bean.getImg()%>" width="300" height="200"> </a>
		<p><font size="3" color="gray"><b>������ : <%=bean.getName() %></b></font></p>
		</td>
<% 	} %>
</table>
	<p align="center" style="padding:20px"><font size="4"><b>-���� �˻��ϱ�-</b></font><br><br></p>
	<form action="RentcarMain.jsp?center=CarCategoryList.jsp" method="post" align="center" style="padding:0 0 50px 0">
		<font size="3" color="gray"><b>���� �˻��ϱ�</b></font>&nbsp;&nbsp;
		<select name="category">
			<option value="1">����</option>
			<option value="2">����</option>
			<option value="3">����</option>
		</select>&nbsp;&nbsp;
		<input type="submit" value="�˻�">&nbsp;&nbsp;
	</form>
	<button onclick="location.href='RentcarMain.jsp?center=CarAllList.jsp'">��ü �˻�</button>
</body>
</html>