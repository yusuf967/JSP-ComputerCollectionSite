<%@page import="java.util.List"%>
<%@page import="backend.sepet"%>
<%@page import="backend.Database_Connect"%>
<%
    Database_Connect db = new Database_Connect();
    String action = request.getParameter("action");
    String urun_id = request.getParameter("id");
    
    request.getSession().setAttribute("sep-List",db.sepete_goster());
    List<sepet> sepList = (List<sepet>) request.getSession().getAttribute("sep-List");

    if (action != null && Integer.parseInt(urun_id) >= 1) {

        if (action.equals("inc")) {
            for (sepet c : sepList) {
                if (c.getUrun_id() == Integer.parseInt(urun_id)) {
                    int quantity = c.getUrun_adet();
                    quantity++;
                    db.guncelle_adet(quantity, urun_id);
                    response.sendRedirect("sepet.jsp");
                }
            }
        }
        if (action.equals("dec")) {
             for (sepet c : sepList) {
                if (c.getUrun_id() == Integer.parseInt(urun_id) && c.getUrun_adet()>1) {
                    int quantity = c.getUrun_adet();
                    quantity--;
                    db.guncelle_adet(quantity, urun_id);
                    response.sendRedirect("sepet.jsp");
                    break;
                }else{
                    response.sendRedirect("sepet.jsp"); 
                }
            }
            
        }

    } else {
        out.println("yokk");
    }


%>