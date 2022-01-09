
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="backend.sepet"%>
<%@page import="backend.Database_Connect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
String id=request.getParameter("id");
Database_Connect db=new Database_Connect();
db.sepetSil(id);

List<sepet> sepetList=(List<sepet>)request.getSession().getAttribute("sep-List");
for(int i=0;i<sepetList.size();i++){
    out.print(sepetList.get(i).getUrun_id());
    if(sepetList.get(i).getUrun_id()==Integer.parseInt(id)){
        sepetList.remove(i);
    }
}
response.sendRedirect("sepet.jsp");
%>