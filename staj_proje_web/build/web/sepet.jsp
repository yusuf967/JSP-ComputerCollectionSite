<%@page import="java.util.ArrayList"%>
<%@page import="javax.swing.text.Document"%>
<%@page import="java.util.List"%>
<%@page language="java"  contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="backend.Database_Connect"%>
<%@page import="backend.urunler" %>
<%@page import="backend.sepet" %>
<%@page import="backend.siteler" %>
<%@page import ="java.sql.*" %>
<%@page import="java.io.*" %>

<!doctype html>
<html lang="en">

    <%
        request.setCharacterEncoding("UTF-8");

        Database_Connect db = new Database_Connect();
        List<sepet> sepList = new ArrayList<sepet>() {
        };
        int toplam = 0;

        request.getSession().setAttribute("sep-List", db.sepete_goster());

        sepList = (List<sepet>) request.getSession().getAttribute("sep-List");
        for (int i = 0; i < sepList.size(); i++) {
            toplam = toplam + sepList.get(i).getUrun_fiyat() * sepList.get(i).getUrun_adet();
        }

        int timeout = session.getMaxInactiveInterval();
        response.setHeader("Refresh", timeout + "; URL = giris.jsp");

        String action = request.getParameter("action");
        if (action != null) {
            if (action.equals("EK")) {
                out.println("<script>alert('LÜTFEN EKRAN KARTI EKLEYİNİZ!');</script>");
            } else if (action.equals("i")) {
                out.println("<script>alert('LÜTFEN İŞLEMCİ EKLEYİNİZ!');</script>");
            } else if (action.equals("RAM")) {
                out.println("<script>alert('LÜTFEN RAM EKLEYİNİZ!');</script>");
            } else if (action.equals("AK")) {
                out.println("<script>alert('LÜTFEN ANAKART EKLEYİNİZ!');</script>");
            } else if (action.equals("HD")) {
                out.println("<script>alert('LÜTFEN HARDDİSK YADA SSD EKLEYİNİZ!');</script>");
            } else if (action.equals("Kasa")) {
                out.println("<script>alert('LÜTFEN KASA EKLEYİNİZ!');</script>");
            }else if(action.equals("basarili")){
                 out.println("<script>alert('BİLGİSAYARINIZ HAZIR GÜLE GÜLE KULLANIN.');</script>");
            }else if(action.equals("ekle")){
                 out.println("<script>alert('SEPETİNİZDE ÜRÜN YOKTUR.LÜTFEN SEPETE ÜRÜN EKLEYİNİZ.');</script>");
            }
        }

    %>

    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link rel="stylesheet" href="css/style.css">
            <title>SEPETİM</title>
            <link rel="shortcut icon" href="images/Narveri-logo.png">
                </head>
                <body>
                    <!--FOOTER-->
                <div class="container-fluid">
                    <div class="row container-header">
                        <div class="col-sm-12 col-md-2 col-lg-2">
                            <a href="index.jsp"><img src="images/Narveri-logo.png" alt="" class="logo w-50"></a>
                        </div>
                        <div class="col-sm-12 col-md-5 col-lg-5 pt-2 pb-1">
                            <form action="ara.jsp?" method="GET" class="header__search">
                                <div class="row">
                                    <div class="col-9">
                                        <input class="w-100 h-100 form-ara-input-text" type="text" name="ürün_ad" placeholder="Ürün,kategori veya marka ara">
                                    </div>
                                    <div class="col-3">
                                        <input class="w-75" type="submit" value="ARA" onClick="setTimeout(kaldir, 5000)">
                                    </div>
                                </div>
                            </form>
                        </div>

                        <div class="col-sm-12 col-md-4 col-lg-3 pt-2 pb-1">
                            <div class="row">
                                <div class="col-2">
                                    <a class="sepet-resim-link w-100" href="sepet.jsp"><img src="images/cart.png"></img></a>  
                                </div>
                                <div class="col-10" style="text-align: center;">
                                    <span class="w-100 text-dark"><%=sepList.size()%> ürün - <%=toplam%> TL</span>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-12 col-md-1 col-lg-2 pt-2 pb-1" style="text-align: right;">                                                        
                            <button class="btn btn-dark"><a href="cikis.jsp" class="text-white" style="text-decoration: none;">ÇIKIŞ</a></button>             
                        </div>
                    </div>
                </div>
                <!-- FOOTER BİTİŞ-->

                <!--NAVBAR KATEGORİ-->
                <nav class="navbar navbar-expand-lg navbar-light bg-body">
                    <div class="container-fluid">
                        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse" id="navbarNav">
                            <ul class="navbar-nav">
                                <li class="nav-item">
                                    <a class="nav-link active text-success" aria-current="page" href="category.jsp?urun_cins=Ekran Kart">Ekran Kartları</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link active text-dark" href="category.jsp?urun_cins=İşlemci">İşlemciler</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link active text-primary" href="category.jsp?urun_cins=Ram">Ram</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link active text-danger" href="category.jsp?urun_cins=Anakart">Anakartlar</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link active text-success" href="category.jsp?urun_cins=Harddisk">Harddisk</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link active text-dark" href="category.jsp?urun_cins=Kasa">Kasalar</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link active text-primary" href="category.jsp?urun_cins=Güç Kaynağı">Güç Kaynakları</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link active text-danger" href="category.jsp?urun_cins=Monitör">Monitörler</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link active text-success" href="category.jsp?urun_cins=Klavye">Klavyeler</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link active text-dark" href="category.jsp?urun_cins=Mouse">Mouselar</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link active text-danger" href="category.jsp?urun_cins=Soğutma Sistemleri">Soğutma Sistemleri</a>
                                </li>
                                
                            </ul>
                        </div>
                    </div>
                </nav>
                <!--NAVBAR KATEGORİ BİTİŞ-->

                <!-- Bilgisayar Toplama Uyarısı-->
                <div class="container-fluid pt-5 bg-light">
                    <div class="row">
                        <div class="col">
                            <span class="text-danger h4">PC TOPLAMA:Ekran Kartı, İşlemci, Anakart, Bellek, Harddisk/SSD ve Kasa Gibi Bileşenler Zorunludur.</span>
                        </div>
                    </div>
                </div>
                <div class="container-fluid pt-5 bg-white">
                    <div class="row">
                        <div class="col">
                            <a href="pc-toplama-controller.jsp" class="link-blue">BİLGİSAYAR İÇİN TÜM PARÇALAR EKLENDİMİ KONTROL ET</a>
                        </div>
                    </div>
                </div>
                <!-- Bilgisayar Toplama Uyarısı Bitiş-->
                <!--SEPET BAŞLANGIÇ-->
                <div class="container-fluid">
                    <div class="row">
                        <%for (int i = 0; i < sepList.size(); i++) {%>
                        <table class="table">
                            <thead>
                                <tr>
                                    <th scope="col">RESİM</th>
                                    <th scope="col">ÜRÜN AD</th>
                                    <th scope="col">ADET</th>
                                    <th scope="col">ÜRÜN FİYAT</th>
                                    <th scope="col">ÜRÜN ÇIKAR</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <th scope="row"><img src="<%out.println(sepList.get(i).getUrun_resim());%>" class="img-thumbnail" style="width: 270px;height: 180px; object-fit: contain;"></th>
                                <td><%out.println(sepList.get(i).getUrun_ad());%></td>
                                <td>
                                    <a class="sepet-links" href="adet.jsp?id=<%=sepList.get(i).getUrun_id()%>&action=dec">AZALT</a>
                                <input type="text" class="form-control" aria-label="Small" aria-describedby="inputGroup-sizing-sm" value="<%=sepList.get(i).getUrun_adet()%>" readonly>
                                    <a class="sepet-links" href="adet.jsp?id=<%=sepList.get(i).getUrun_id()%>&action=inc">ARTTIR</a>
                                    </td>
                                    <td><%out.println(sepList.get(i).getUrun_fiyat() * sepList.get(i).getUrun_adet());%> TL</td>
                                    <td><a class="sepet-links" href="sil.jsp?id=<%out.println(sepList.get(i).getUrun_id());%>">SİL</a></td>
                                    </tr>
                                    </tbody>
                                    </table>
                                    <%}%>
                                    </div>
                                    </div>
                                    <!--SEPET BİTİŞ-->


                                    <!--Ürün Bulunduğu Siteler Başlık-->
                                    <div class="container-fluid pt-5 bg-light">
                                        <div class="row">
                                            <div class="col">
                                                <span class="text-danger h3">ÜRÜNLERİMİZİN BULUNDUĞU SİTELER</span>
                                            </div>
                                        </div>
                                    </div>
                                    <!--Ürün Bulunduğu Siteler Başlık Bitiş-->

                                    <!--Ürünlerimizin Bulunduğu Siteler-->
                                    <div class="container-fluid">
                                        <div class="row">
                                            <div class="col-sm-12 col-md-4 col-lg-4">
                                                <img src="siteler/hepsiburada-logo-1024.jpeg" class="site-resim p-2" alt="">
                                            </div>
                                            <div class="col-sm-12 col-md-4 col-lg-4">
                                                <img src="siteler/trendyol-logo.jpeg" class="site-resim p-2" alt="">
                                            </div>
                                            <div class="col-sm-12 col-md-4 col-lg-4">
                                                <img src="siteler/vatancomputer.jpeg" class="site-resim p-2" alt="">
                                            </div>
                                        </div>
                                    </div>
                                    <!--Ürünlerimizin Bulunduğu Siteler-->

                                    <!--FOOTER BAŞLANGIÇ-->
                                    <div class="container-fluid bg-light pt-4">
                                        <div class="row">
                                            <div class="col">
                                                <div class="row">
                                                    <div class="col-6">
                                                        <h3 class="text-dark">BİZE ULAŞIN</h3>
                                                        <ul>
                                                            <li class="text-dark"><a style="text-decoration:none;" href="https://narveri.com/">https://narveri.com/</a></li>
                                                            <li class="text-dark">info@narveri.com</li>
                                                            <li class="text-dark">Elazığ Merkez Çaydaçıra Mahallesi Hacı Ömer Bilginoğlu Caddesi Fırat Teknokent</li>
                                                        </ul>
                                                    </div>
                                                    <div class="col-6" style="text-align: right;">
                                                        <img class="footer-site-resim" src="images/Narveri-logo.png" alt="">
                                                    </div>
                                                </div>
                                            </div>


                                        </div>
                                    </div>
                                    <div class="container-fluid text-white pt-4">
                                        <div class="row">
                                            <div class="col">
                                                <div class="row">
                                                    <div class="col-12">
                                                        <p class="text-dark"><ins>Uyarı:</ins>Ürün fiyatlarında anlık olarak güncellenmektedir.</p>
                                                        <p class="text-dark" style="text-align: center;">© 2021</p>  
                                                    </div>
                                                </div>
                                            </div>


                                        </div>
                                    </div>
                                    <!--FOOTER BİTİŞ-->
                                    <!-- Optional JavaScript; choose one of the two! -->

                                    <!-- Option 1: Bootstrap Bundle with Popper -->
                                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

                                    <!-- Option 2: Separate Popper and Bootstrap JS -->
                                    <!--
                                    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
                                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
                                    -->

                                    </body>
                                    </html>