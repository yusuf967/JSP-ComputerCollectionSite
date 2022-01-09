
<%@page import="java.util.List"%>
<%@page language="java"  contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="backend.Database_Connect"%>
<%@page import="backend.kayit_Ol"%>
<%@page errorPage="hata.jsp" %> 
<%@page import ="java.sql.*" %>
<%@page import="java.io.*" %>

<!DOCTYPE html>

<html lang="en">
    <head>
    <title>Giriş Yap</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--===============================================================================================-->	
    <link rel="icon" type="image/png" href="images/account.png"/>
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
            <!--===============================================================================================-->
            <link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
                <!--===============================================================================================-->	
                <link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
                    <!--===============================================================================================-->
                    <link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
                        <!--===============================================================================================-->
                        <link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
                            <!--===============================================================================================-->	
                            <link rel="stylesheet" type="text/css" href="vendor/daterangepicker/daterangepicker.css">
                                <!--===============================================================================================-->
                                <link rel="stylesheet" type="text/css" href="css/util.css">
                                    <link rel="stylesheet" type="text/css" href="css/main.css">
                                        <!--===============================================================================================-->
                                        </head>
                                        <body>
                                        <div class="limiter">
                                            <div class="container-login100">
                                                <div class="wrap-login100">
                                                    <form action="giriscontroller.jsp" method="POST" class="login100-form validate-form p-l-55 p-r-55 p-t-178">
                                                        <span class="login100-form-title">
                                                            Giriş Yap
                                                        </span>

                                                        <div class="wrap-input100 validate-input m-b-16" data-validate="Please enter username">
                                                            <input class="input100" type="text" name="girisname" placeholder="Ad" required>
                                                                <span class="focus-input100"></span>
                                                        </div>
                                                        <div class="wrap-input100 validate-input m-b-16" data-validate="Please enter username">
                                                            <input class="input100" type="password" name="girispassword" placeholder="Şifre" required>
                                                                <span class="focus-input100"></span>
                                                        </div>

                                                        <br><br>

                                                        <div class="container-login100-form-btn">
                                                            <button type="submit" class="login100-form-btn">
                                                                GİRİŞ
                                                            </button>
                                                        </div>

                                                        <div class="flex-col-c p-t-170 p-b-40">
                                                            <span class="txt1 p-b-9">
                                                                Hesabın Yok mu?
                                                            </span>

                                                            <a href="kayitol.jsp" class="txt3">
                                                                Kayıt Ol
                                                            </a>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>


                                        <!--===============================================================================================-->
                                        <script src="vendor/jquery/jquery-3.2.1.min.js"></script>
                                        <!--===============================================================================================-->
                                        <script src="vendor/animsition/js/animsition.min.js"></script>
                                        <!--===============================================================================================-->
                                        <script src="vendor/bootstrap/js/popper.js"></script>
                                        <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
                                        <!--===============================================================================================-->
                                        <script src="vendor/select2/select2.min.js"></script>
                                        <!--===============================================================================================-->
                                        <script src="vendor/daterangepicker/moment.min.js"></script>
                                        <script src="vendor/daterangepicker/daterangepicker.js"></script>
                                        <!--===============================================================================================-->
                                        <script src="vendor/countdowntime/countdowntime.js"></script>
                                        <!--===============================================================================================-->
                                        <script src="js/main.js"></script>

                                        <script>
                                            var hata = String(<%=request.getParameter("hata")%>);
                                            if (hata === "-1") {
                                              alert("Kullanıcı adı veya şifrenizi doğru giriniz.");
                                            }
                                        </script>

                                        </body>
                                        </html>
