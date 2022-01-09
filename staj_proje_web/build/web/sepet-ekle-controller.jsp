<%@page import="java.util.ArrayList"%>
<%@page import="backend.Database_Connect"%>
<%@page import="java.util.List"%>
<%@page import="backend.sepet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    request.setCharacterEncoding("UTF-8");
    Database_Connect db = new Database_Connect();

    request.getSession().setAttribute("sep-List", db.sepete_goster());
    String urun_id = request.getParameter("urun_id");

    List<sepet> kontrol=new ArrayList<>();
    List<sepet> sep = (List<sepet>) request.getSession().getAttribute("sep-List");
    
    if (sep.size() == 0) {
        db.sepete_getir(urun_id);
        session.setAttribute("sep-List", sep);
        response.sendRedirect("index.jsp");
    } else {
        kontrol=sep;
        boolean varMi=false;
        
        for(sepet c:sep){
            if(c.getUrun_id()==Integer.parseInt(urun_id)){
                int quantity=c.getUrun_adet();
                quantity++;
                db.guncelle_adet(quantity, urun_id);
                varMi=true;
            }
        }
        if(!varMi){
            db.sepete_getir(urun_id);
            response.sendRedirect("index.jsp");
        }else{
           response.sendRedirect("index.jsp");
        }
    }
%>
