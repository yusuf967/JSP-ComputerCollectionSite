<%@page import="java.util.ArrayList"%>
<%@page import="backend.Database_Connect"%>
<%@page import="java.util.List"%>
<%@page import="backend.sepet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");

    Database_Connect db = new Database_Connect();

    request.getSession().setAttribute("sep-List", db.sepete_goster());
    List<sepet> sep = (List<sepet>) request.getSession().getAttribute("sep-List");
    int sayacEK = 0;
    int sayacIslemci = 0;
    int sayacRam = 0;
    int sayacAna = 0;
    int sayacHD = 0;
    int sayacKasa = 0;

    if (sep.size() == 0) {
        response.sendRedirect("sepet.jsp?action=ekle");
    } else {
        for (int i = 0; i < sep.size(); i++) {
            if (sep.get(i).getUrun_cins().equals("Ekran Kart")) {
                sayacEK++;
            } else if (sep.get(i).getUrun_cins().equals("İşlemci")) {
                sayacIslemci++;
            } else if (sep.get(i).getUrun_cins().equals("Ram")) {
                sayacRam++;
            } else if (sep.get(i).getUrun_cins().equals("Anakart")) {
                sayacAna++;
            } else if (sep.get(i).getUrun_cins().equals("Harddisk")) {
                sayacHD++;
            } else if (sep.get(i).getUrun_cins().equals("Kasa")) {
                sayacKasa++;
            } else {
                response.sendRedirect("sepet.jsp?action=ekle");
            }
        }

        if (sayacEK < 1) {
            response.sendRedirect("sepet.jsp?action=EK");
        } else if (sayacIslemci < 1) {
            response.sendRedirect("sepet.jsp?action=i");
        } else if (sayacRam < 1) {
            response.sendRedirect("sepet.jsp?action=RAM");
        } else if (sayacAna < 1) {
            response.sendRedirect("sepet.jsp?action=AK");
        } else if (sayacHD < 1) {
            response.sendRedirect("sepet.jsp?action=HD");
        } else if (sayacKasa < 1) {
            response.sendRedirect("sepet.jsp?action=Kasa");
        } else {
            response.sendRedirect("sepet.jsp?action=basarili");
        }
    }


%>