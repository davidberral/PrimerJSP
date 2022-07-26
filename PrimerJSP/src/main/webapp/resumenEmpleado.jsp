<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<jsp:include page="plantillas/cabecera.jsp"></jsp:include>

<% if (request.getParameter("experiencia")==null )
	response.sendRedirect("altaEmpleado.jsp");
%>

<h2>Resumen del empleado</h2>
<ul>
	<li>Nombre: <%=request.getParameter("nombre") %></li>
	<li>Apellidos: <%=request.getParameter("apellidos") %></li>
	<li>Cód Provincia: <%=request.getParameter("provincia") %></li>
	<li>Conocimientos: 
		<% 
			String[] conocimientos = request.getParameterValues("conocimientos[]");
		
			if (conocimientos == null || conocimientos.length==0) { %>
				No se han registrado conocimientos </li>
			<% } else {%>
				<ul>
				<% 
				for (String c : conocimientos) {
					out.println("<li>"+c+"</li>");
				}
				%>
			</ul>
			</li>
			<% }%>
	<li>Fecha nacimiento: <%=request.getParameter("fechanac") %></li>
	<li>Experiencia (años): <%=request.getParameter("experiencia") %></li>
</ul>

<jsp:include page="plantillas/pie.jsp"></jsp:include>
