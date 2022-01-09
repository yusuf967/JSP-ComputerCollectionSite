
<%@page import="javafx.scene.control.Alert"%>
<%@page import="java.util.List"%>
<%@page language="java"  contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="backend.Database_Connect"%>
<%@page import="backend.kayit_Ol"%>
<%@page errorPage="hata.jsp" %> 
<%@page import ="java.sql.*" %>
<%@page import="java.io.*" %>

<!DOCTYPE html>

<%!

        public boolean kontrolEmail(String kull_email) {
            int at;
            int nokta;

            boolean at_var = true;
            boolean nokta_var = true;
            boolean emailgirildi = true;

            if (kull_email.length() == 0) {
                emailgirildi = false;
            }

            at = kull_email.indexOf("@", 1);

            if (at == -1) {
                at_var = false;
            }

            nokta = kull_email.indexOf(".", 1);

            if (nokta == -1) {
                nokta_var = false;
            }

            if (emailgirildi & at_var & nokta_var) {
                return true;
            } else {
                return false;
            }
        }
    %>
<%
    request.setCharacterEncoding("UTF-8");

    String uye_ad = request.getParameter("username");
    String uye_soyad = request.getParameter("lastname");
    String uye_mail = request.getParameter("mail");
    String uye_sifre = request.getParameter("password");
    
    if(kontrolEmail(uye_mail)){
        try{
       Class.forName("com.mysql.jdbc.Driver");
      Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/staj_proje?zeroDateTimeBehavior=convertToNull", "root", "");           
    
      String selectquery =("insert into kayıtol(üye_ad,üye_soyad,üye_mail,üye_şifre) VALUES (?,?,?,?)");

            //statement.executeUpdate(selectquery);
            PreparedStatement gir = (PreparedStatement) connection.prepareStatement(selectquery);
            gir.setString(1, uye_ad);
            gir.setString(2, uye_soyad);
            gir.setString(3, uye_mail);
            gir.setString(4, uye_sifre);

            int i=gir.executeUpdate();
            if(i>0){
              response.sendRedirect("hosgeldiniz.jsp");  
            }else{
                response.sendRedirect("kayitol.jsp");
            }
            
   }catch(Exception e){
       e.printStackTrace();
   }
    }else{
        response.sendRedirect("kayitol.jsp?hata=-1");
    }
   
    
%>
