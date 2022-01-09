
<%@page language="java"  contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="backend.Database_Connect"%>
<%@page import="backend.kayit_Ol"%>
<%@page import ="java.sql.*" %>
<%@page import="java.io.*" %>

<%
    String username = request.getParameter("girisname");
    String userpass = request.getParameter("girispassword");

    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/staj_proje?zeroDateTimeBehavior=convertToNull", "root", "");
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("SELECT * FROM `kayıtol` WHERE `üye_ad` = '"+username+"' AND `üye_şifre` = '"+userpass+"'");
    try {
        if (rs.next()) {
            Database_Connect db=new Database_Connect();
            db.sepet_id_kontrol(username, userpass);
            
          
            session.setAttribute("username", username);
            session.setAttribute("userpass", userpass);
            
            response.sendRedirect("index.jsp");
        }else{
            response.sendRedirect("giris.jsp?hata=-1");
        }

    } catch (Exception e) {
        e.printStackTrace();
        response.sendRedirect("giris.jsp?hata=-1");
    }
    
    
%>