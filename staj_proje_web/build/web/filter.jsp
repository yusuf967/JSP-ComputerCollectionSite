
<%@page import="java.util.List"%>
<%@page language="java"  contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="backend.Database_Connect"%>
<%@page import="backend.urunler" %>
<%@page import="backend.siteler" %>
<%@page import="backend.sepet" %>
<%@page import ="java.sql.*" %>
<%@page import="java.io.*" %>
<%@page errorPage="hata.jsp" %> 

<!doctype html>
<html lang="en">

  <%
  request.setCharacterEncoding("UTF-8");
  Database_Connect db = new Database_Connect();

  int sayfa = 0;
  if (request.getParameter("sayfa") != null) {
      sayfa = Integer.parseInt(request.getParameter("sayfa"));
  } else {
      sayfa = 0;
  }

  List<sepet>sepList = db.sepete_goster();
  int toplam = 0;
  for (int i = 0; i < sepList.size(); i++) {
          toplam = toplam +sepList.get(i).getUrun_fiyat()*sepList.get(i).getUrun_adet();
      }

  String urun_cins = request.getParameter("uruncins");
  String min_fiyat = request.getParameter("min");
  String max_fiyat = request.getParameter("max");


  List<urunler> filterList = db.fiyat_filtreleme(urun_cins, min_fiyat, max_fiyat, sayfa);
 

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
    <title><%out.println(urun_cins);%></title>
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
               <input class="w-100 h-100 form-ara-input-text" type="text" name="??r??n_ad" placeholder="??r??n,kategori veya marka ara">
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
                                <span class="w-100 text-dark"><%=sepList.size()%> ??r??n - <%=toplam%> TL</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-12 col-md-1 col-lg-2 pt-2 pb-1" style="text-align: right;">                                                        
                        <button class="btn btn-dark"><a href="cikis.jsp" class="text-white" style="text-decoration: none;">??IKI??</a></button>             
                    </div>
                  </div>
                </div>
                <!-- FOOTER B??T????-->
               
                <!--NAVBAR KATEGOR??-->
                <nav class="navbar navbar-expand-lg navbar-light bg-body">
                  <div class="container-fluid">
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                     <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarNav">
                      <ul class="navbar-nav">
                        <li class="nav-item">
                          <a class="nav-link active text-success" aria-current="page" href="category.jsp?urun_cins=Ekran Kart">Ekran Kartlar??</a>
                        </li>
                        <li class="nav-item">
                          <a class="nav-link active text-dark" href="category.jsp?urun_cins=????lemci">????lemciler</a>
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
                          <a class="nav-link active text-primary" href="category.jsp?urun_cins=G???? Kayna????">G???? Kaynaklar??</a>
                        </li>
                        <li class="nav-item">
                          <a class="nav-link active text-danger" href="category.jsp?urun_cins=Monit??r">Monit??rler</a>
                        </li>
                        <li class="nav-item">
                          <a class="nav-link active text-success" href="category.jsp?urun_cins=Klavye">Klavyeler</a>
                        </li>
                        <li class="nav-item">
                          <a class="nav-link active text-dark" href="category.jsp?urun_cins=Mouse">Mouselar</a>
                        </li>
                        <li class="nav-item">
                          <a class="nav-link active text-danger" href="category.jsp?urun_cins=So??utma Sistemleri">So??utma Sistemleri</a>
                        </li>
                          <li class="nav-item">
                          <a class="nav-link active text-primary" href="sepet.jsp">Bilgisayar Toplama</a>
                        </li>
                      </ul>
                    </div>
                  </div>
                </nav>
                <!--NAVBAR KATEGOR?? B??T????-->

                <!--??r??n Katalo??u Ba??l??k-->
                <div class="container-fluid pt-2 bg-light">
                  <div class="row">
                    <div class="col">
                     <span class="text-danger h3"><%out.println(urun_cins);%></span>
                    </div>
                  </div>
                </div>
                <!--??r??n Katalo??u Ba??l??k Biti??-->

                <!--??R??N KARTLARI-->
                <div class="container-fluid pt-2 pb-4 bg-body">
                  <div class="row">
                    <div class="col-sm-12 col-md-6 col-lg-3">
                    <div class="card" style="width: 18rem;">
                      <form action="filter.jsp?uruncins=<%out.println(urun_cins);%>" method="POST">
                          <ul>
                              <p class="text-primary">F??YAT ARALI??I</p>
                              <li class="form-text-li"><input class="form-text" type="text" name="min" placeholder="En Az" required ></li>
                              <li class="form-text-li"><input class="form-text"type="text" name="max" placeholder="En Fazla" required ></li>
                              <li class="form-text-li"><input class="form-text" type="submit" value="G??NDER"></li>
                          </ul>
                          
                          
                          
                      </form>
                      <div class="card-body" style="height: 250px;">
                        <ul>
                            <li class="fiyat-links"><a href="filter.jsp?uruncins=<%out.println(urun_cins);%>&min=0&max=1000" class="btn btn-primary">0-1000 TL</a></li>
                            <li class="fiyat-links"><a href="filter.jsp?uruncins=<%out.println(urun_cins);%>&min=1000&max=2500" class="btn btn-primary">1000-2500 TL</a></li>
                            <li class="fiyat-links"><a href="filter.jsp?uruncins=<%out.println(urun_cins);%>&min=2500&max=10000" class="btn btn-primary">2500-10000 TL</a></li>
                            <li class="fiyat-links"><a href="filter.jsp?uruncins=<%out.println(urun_cins);%>&min=10000&max=100000" class="btn btn-primary">10000 TL ??zerinde</a></li>
                        </ul>
                      </div>
                    </div>
                  </div>

                  <%for (int i = 0; i < filterList.size(); i++) {%> 
                    <div class="col-sm-12 col-md-6 col-lg-3">
                      <div class="card" style="width: 18rem;">
                       <a href="single-product.jsp?urun_id=<%out.println(filterList.get(i).getUrun_id());%>">
                         <img class="card-img-top" src="<%out.println(filterList.get(i).getUrun_resim());%>" style="width: 270px; height: 180px; object-fit: contain;box-shadow: inset;" alt="">
                        </a>
                        <div class="card-body" style="height: 250px;">
                          <h5 class="card-title"><%out.println(filterList.get(i).getUrun_fiyat());%></h5>
                          <p class="card-text"><%out.println(filterList.get(i).getUrun_ad());%></p>
                          <a href="sepet-ekle-controller.jsp?urun_id=<%out.println(filterList.get(i).getUrun_id());%>" class="btn btn-primary">Sepete Ekle</a>
                          <a href="<%out.println(filterList.get(i).getUrun_link());%>" class="btn btn-primary">??r??n Linki</a>
                        </div>
                      </div>
                    </div>
                    <%}%>
                <!--??R??N KARTLARI B??T????-->
                <!--PAG??NAT??ON BA??LANGI??-->
                <nav aria-label="Page navigation example">
                  <ul class="pagination justify-content-end">
                    <li class="page-item">
                      <a class="page-link" href="filter.jsp?sayfa=<%=sayfa - 1%>&uruncins=<%=request.getParameter("uruncins")%>&min=<%=request.getParameter("min")%>&max=<%=request.getParameter("max")%>">??NCEK?? SAYFA</a>
                    </li>
                    <li class="page-item">
                      <a class="page-link" href="filter.jsp?sayfa=<%=sayfa + 1%>&uruncins=<%=request.getParameter("uruncins")%>&min=<%=request.getParameter("min")%>&max=<%=request.getParameter("max")%>">SONRAK?? SAYFA</a>
                    </li>
                  </ul>
                </nav>
                <!--PAG??NAT??ON B??T????-->
                <!--??r??n Bulundu??u Siteler Ba??l??k-->
                <div class="container-fluid pt-5 bg-light">
                  <div class="row">
                    <div class="col">
                     <span class="text-danger h3">??R??NLER??M??Z??N BULUNDU??U S??TELER</span>
                    </div>
                  </div>
                </div>
                <!--??r??n Bulundu??u Siteler Ba??l??k Biti??-->

                <!--??r??nlerimizin Bulundu??u Siteler-->
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
                <!--??r??nlerimizin Bulundu??u Siteler-->

                <!--FOOTER BA??LANGI??-->
                 <div class="container-fluid bg-light pt-4">
                   <div class="row">
                    <div class="col">
                       <div class="row">
                        <div class="col-6">
                          <h3 class="text-dark">B??ZE ULA??IN</h3>
                          <ul>
                            <li class="text-dark"><a style="text-decoration:none;" href="https://narveri.com/">https://narveri.com/</a></li>
                            <li class="text-dark">info@narveri.com</li>
                            <li class="text-dark">Elaz???? Merkez ??ayda????ra Mahallesi Hac?? ??mer Bilgino??lu Caddesi F??rat Teknokent</li>
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
                          <p class="text-dark"><ins>Uyar??:</ins>??r??n fiyatlar?? anl??k olarak g??ncellenmektedir.</p>
                          <p class="text-dark" style="text-align: center;">?? 2021</p>  
                        </div>
                      </div>
                   </div>
                   
                   
                  </div>
                </div>
                <!--FOOTER B??T????-->
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