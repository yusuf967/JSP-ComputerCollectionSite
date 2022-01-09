<%
session.setAttribute("userid", null);
session.invalidate();
response.sendRedirect("giris.jsp");
%>
