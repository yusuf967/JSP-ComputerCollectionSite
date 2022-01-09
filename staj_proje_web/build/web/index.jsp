<%@page import="java.util.List"%>
<%@page language="java"  contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="backend.Database_Connect"%>
<%@page import="backend.urunler" %>
<%@page import="backend.siteler" %>
<%@page import="backend.sepet" %>
<%@page import ="java.sql.*" %>
<%@page import="java.io.*" %>


<!doctype html>
<html lang="en">

  <%
  if ((session.getAttribute("username") == null) || (session.getAttribute("userid") == "" || session.getAttribute("userpass") == null) || (session.getAttribute("userpass") == "" )) {
       response.sendRedirect("giris.jsp");
  } else {
%>
<!--Welcome <%//=session.getAttribute("userid")%>-->
<%
  }
%>


<%
  request.setCharacterEncoding("UTF-8");

  Database_Connect db = new Database_Connect();  
  String urun_ad = request.getParameter("ürün_ad");
  
  int sayfa = 0;
  if (request.getParameter("sayfa") != null) {
      sayfa = Integer.parseInt(request.getParameter("sayfa"));
  } else {
      sayfa = 0;
  }
  List<urunler> urunList = db.genel_urun_ara(urun_ad, sayfa);

  List<sepet> sepList = db.sepete_goster();
      int toplam = 0;
      for (int i = 0; i < sepList.size(); i++) {
          toplam = toplam +sepList.get(i).getUrun_fiyat()*sepList.get(i).getUrun_adet();
      }
      
  request.getSession().setAttribute("sep-List",db.sepete_goster());
  List<sepet> sep=(List<sepet>)request.getSession().getAttribute("sep-List");
      
      int timeout = session.getMaxInactiveInterval();
response.setHeader("Refresh", timeout + "; URL = giris.jsp");
%>

  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="css/style.css">
    <title>Narveri Bilgisayar Toplama Sihirbazı</title>
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
                          <li class="nav-item">
                          <a class="nav-link active text-primary" href="sepet.jsp">Bilgisayar Toplama</a>
                        </li>
                      </ul>
                    </div>
                  </div>
                </nav>
                <!--NAVBAR KATEGORİ BİTİŞ-->

                <!--Ürün Kataloğu Başlık-->
                <div class="container-fluid pt-2 bg-light">
                  <div class="row">
                    <div class="col">
                     <span class="text-danger h3">ÜRÜNLER</span>
                    </div>
                  </div>
                </div>
                <!--Ürün Kataloğu Başlık Bitiş-->

                <!--ÜRÜN KARTLARI-->
                  <div class="container-fluid pt-2 pb-4 bg-body">
                  <div class="row">

                    <div class="col-sm-12 col-md-6 col-lg-3">
                      <div class="card" style="width: 18rem;">
                        <a href="single-product.jsp?urun_id=6001">
                          <img class="card-img-top" src="trendyol\54.jpeg" style="width: 270px; height: 180px; object-fit: contain;box-shadow: inset;" alt="">
                        </a>
                        <div class="card-body" style="height: 250px;">
                          <h5 class="card-title">9.299 TL</h5>
                          <p class="card-text">MSI Geforce Rtx 3060 Gamıng X 12gb Gddr6 Ekran Kartı RTX 3060 GAMING X</p>
                          <a href="sepet-ekle-controller.jsp?urun_id=6001" class="btn btn-primary">Sepete Ekle</a>
                          <a href="https://www.trendyol.com/msi/geforce-rtx-3060-gaming-x-12gb-gddr6-ekran-karti-p-89071328?boutiqueId=61&merchantId=183932" target="blank" class="btn btn-primary">Ürün Linki</a>
                        </div>
                      </div>
                    </div>

                  <div class="col-sm-12 col-md-6 col-lg-3">
                    <div class="card" style="width: 18rem;">
                      <a href="single-product.jsp?urun_id=6715">
                        <img class="card-img-top" src="trendyol\768.jpeg" style="width: 270px; height: 180px; object-fit: contain;box-shadow: inset;" alt="">
                      </a>
                      <div class="card-body" style="height: 250px;">
                        <h5 class="card-title">518.42 TL</h5>
                        <p class="card-text">Corsair Cmw8gx4m1z3200c16 Vengeance Rgb Pro 8gb 3200mhz Ddr4 Cl16 Siyah Rgb Ram CMW8GX4M1Z3200C16</p>
                        <a href="sepet-ekle-controller.jsp?urun_id=6715" class="btn btn-primary">Sepete Ekle</a>
                        <a href="https://www.trendyol.com/corsair/cmw8gx4m1z3200c16-vengeance-rgb-pro-8gb-3200mhz-ddr4-cl16-siyah-rgb-ram-p-47107042?boutiqueId=574268&merchantId=105919" target="blank" class="btn btn-primary">Ürün Linki</a>
                      </div>
                    </div>
                  </div>

                  <div class="col-sm-12 col-md-6 col-lg-3">
                    <div class="card" style="width: 18rem;">
                      <a href="single-product.jsp?urun_id=19427">
                        <img class="card-img-top" src="trendyol\13480.jpeg" style="width: 270px; height: 180px; object-fit: contain;box-shadow: inset;" alt="">
                      </a>
                      <div class="card-body"style="height: 250px;">
                        <h5 class="card-title">8.246 TL</h5>
                        <p class="card-text">Samsung 32" Odyssey G7 1 ms 240 Hz 2K QLED HDR600 1000R RGB Oyuncu Monitörü LC32G75TQSMXUF</p>
                        <a href="sepet-ekle-controller.jsp?urun_id=19427" class="btn btn-primary">Sepete Ekle</a>
                        <a href="https://www.trendyol.com/samsung/32-odyssey-g7-1-ms-240-hz-2k-qled-hdr600-1000r-rgb-oyuncu-monitoru-p-45345657?boutiqueId=561498&merchantId=106636" target="blank" class="btn btn-primary">Ürün Linki</a>
                      </div>
                    </div>
                  </div>

                  <div class="col-sm-12 col-md-6 col-lg-3">
                    <div class="card" style="width: 18rem;">
                      <a href="single-product.jsp?urun_id=14402">
                        <img class="card-img-top" src="trendyol\8455.jpeg" style="width: 270px; height: 180px; object-fit: contain;box-shadow: inset;" alt="">
                      </a>
                      <div class="card-body" style="height: 250px;">
                        <h5 class="card-title">1.759 TL</h5>
                        <p class="card-text">Gamepower Warcry A-rgb 9 Fanlı 650w 80+ Bronze Kumandalı Gaming Oyuncu Bilgisayar Kasası WARCRY-9-ARGB-FANLI-650W-80Plus-BRONZE</p>
                        <a href="sepet-ekle-controller.jsp?urun_id=14402" class="btn btn-primary">Sepete Ekle</a>
                        <a href="https://www.trendyol.com/gamepower/warcry-a-rgb-9-fanli-650w-80-bronze-kumandali-gaming-oyuncu-bilgisayar-kasasi-p-54947007?boutiqueId=574268&merchantId=133183" target="blank" class="btn btn-primary">Ürün Linki</a>
                      </div>
                    </div>
                  </div>

                  </div>
                    


                  </div>
                <!--ÜRÜN KARTLARI BİTİŞ-->

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
                          <p class="text-dark"><ins>Uyarı:</ins>Ürün fiyatları anlık olarak güncellenmektedir.</p>
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