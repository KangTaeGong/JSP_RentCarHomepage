<%@page import="db.CarListBean"%>
<%@page import="db.RentcarDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
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
	request.setCharacterEncoding("EUC-KR");
%>
<jsp:useBean id="rbean" class="db.CarReserveBean">
	<jsp:setProperty name="rbean" property="*"/>
</jsp:useBean>

<%
	String id = (String)session.getAttribute("id");

	if(id==null){
%>
	<script>
		alert("�α��� �� ������ ���� �մϴ�.");
		location.href="RentcarMain.jsp?center=MemberLogin.jsp"
	</script>
<%
	}
	
	// ��¥ ��
	Date d1 = new Date();
	Date d2 = new Date();
	// ��¥�� �������ִ� Ŭ���� ����
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
	d1 = sdf.parse(rbean.getRday());
	d2 = sdf.parse(sdf.format(d2));
	// ��¥ �� �޼ҵ带 ���
	int compare = d1.compareTo(d2);
	// �����Ϸ��� ��¥���� ���� ��¥�� �� ũ�ٸ� -1
	// �����Ϸ��� ��¥�� ���� ��¥�� ���ٸ� 0
	// �����Ϸ��� ��¥�� �� ũ�ٸ� 1
	if(compare < 0){	// ���ú��� ���� ��¥ ���ý�
	%>
		<script>
			alert("���� ��¥���� ���� ��¥�� ������ �� �����ϴ�.");
			history.go(-1);
		</script>
	<%
	}
	
	// ��������� �ƹ��� ������ ���ٸ� ������ ���� �� ��� ������ �����ֱ�
	// ���̵� ���� ��Ŭ������ ���⿡
	String id1 = (String)session.getAttribute("id");
	rbean.setId(id1);
	
	// ������ ���̽��� ��Ŭ������ ����
	RentcarDAO rdao = new RentcarDAO();
	rdao.setReserveCar(rbean); 
	
	// ���� ���� �˾ƿ���
	CarListBean cbean = rdao.getOneCar(rbean.getNo());
	// ���� �� �ݾ�
	int totalcar = cbean.getPrice()*rbean.getQty()*rbean.getDday();
	// �ɼ� �ݾ�
	int usein = 0;
	if(rbean.getUsein()==1)usein=10000;
	int usewifi = 0;
	if(rbean.getUsewifi()==1)usewifi=10000;
	int useseat = 0;
	if(rbean.getUseseat()==1)useseat=10000;
	
	int totaloption = rbean.getQty()*rbean.getDday()*(usein+usewifi+useseat);
%>
<table width="1000">
	<tr height="70">
		<td align="center">
		<font size="5"> ���� ���� �Ϸ� </font></td>
	</tr>
	<tr>
		<td align="center">
		<img alt="" src="img/<%=cbean.getImg()%>" width="470">
		</td>
	</tr>
	<tr height="50">
		<td align="center">
		<font size="5" color="red"> ���� ���� �ݾ� <%=totalcar %> �� </font></td>
	</tr>
	<tr height="50">
		<td align="center">
		<font size="5" color="red"> ���� �ɼ� �ݾ� <%=totaloption %> �� </font></td>
	</tr>
	<tr height="50">
		<td align="center">
		<font size="5" color="red"> �� ���� �ݾ� <%=totalcar+totaloption %> �� </font></td>
	</tr>
</table>
</body>
</html>