<%-- 
    Document   : omer
    Created on : 03.Kas.2021, 09:24:46
    Author     : dogan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="style.css">
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
                                <span class="w-100 text-dark">0 ürün - 0 TL</span>
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
                      <img class="card-img-top" src="images/back.png" style="width: 270px; height: 180px; object-fit: contain;box-shadow: inset;" alt="">
                      <div class="card-body" style="height: 250px;">
                        <h5 class="card-title">9.299 TL</h5>
                        <p class="card-text">MSI Geforce Rtx 3060 Gamıng X 12gb Gddr6 Ekran Kartı RTX 3060 GAMING X</p>
                        <a href="#" class="btn btn-primary">Sepete Ekle</a>
                        <a href="#" class="btn btn-primary">Ürün Linki</a>
                      </div>
                    </div>
                  </div>

                  <div class="col-sm-12 col-md-6 col-lg-3">
                    <div class="card" style="width: 18rem;">
                      <img class="card-img-top" src="images/banner.png" style="width: 270px; height: 180px; object-fit: contain; box-shadow:inset;" alt="">
                      <div class="card-body" style="height: 250px;">
                        <h5 class="card-title">9.299 TL</h5>
                        <p class="card-text">MSI Geforce Rtx 3060 Gamıng X 12gb Gddr6 Ekran Kartı RTX 3060 GAMING X</p>
                        <a href="#" class="btn btn-primary">Sepete Ekle</a>
                        <a href="#" class="btn btn-primary">Ürün Linki</a>
                      </div>
                    </div>
                  </div>

                  <div class="col-sm-12 col-md-6 col-lg-3">
                    <div class="card" style="width: 18rem;">
                      <img class="card-img-top" src="images/banner.png" style="width: 270px; height: 180px; object-fit: contain;box-shadow: inset;" alt="">
                      <div class="card-body" style="height: 250px;">
                        <h5 class="card-title">9.299 TL</h5>
                        <p class="card-text">MSI Geforce Rtx 3060 Gamıng X 12gb Gddr6 Ekran Kartı RTX 3060 GAMING X</p>
                        <a href="#" class="btn btn-primary">Sepete Ekle</a>
                        <a href="#" class="btn btn-primary">Ürün Linki</a>
                      </div>
                    </div>
                  </div>

                  <div class="col-sm-12 col-md-6 col-lg-3">
                    <div class="card" style="width: 18rem;">
                      <img class="card-img-top" src="images/banner.png" style="width: 270px; height: 180px; object-fit: contain; box-shadow: inset;" alt="">
                      <div class="card-body"style="height: 250px;">
                        <h5 class="card-title">9.299 TL</h5>
                        <p class="card-text">MSI Geforce Rtx 3060 Gamıng X 12gb Gddr6 Ekran Kartı RTX 3060 GAMING X</p>
                        <a href="#" class="btn btn-primary">Sepete Ekle</a>
                        <a href="#" class="btn btn-primary">Ürün Linki</a>
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

                <!--Ürünlerimizin Bulunduğu Siteler-->

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
