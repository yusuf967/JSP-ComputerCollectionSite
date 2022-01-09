package backend;

import com.mysql.jdbc.PreparedStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class Database_Connect {

    private Connection connection;
    private Statement statement;

    //veritabanına bağlanma metodumuz.
    public void connection_open() {
        try {
            if (connection == null) {
                Class.forName("com.mysql.jdbc.Driver");
                connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/staj_proje?zeroDateTimeBehavior=convertToNull", "root", "");
                statement = connection.createStatement();
//                System.out.println("Bağlantı Sağlandı");
            } else {
                System.out.println("Bağlantı Zaten Açık");
            }
        } catch (Exception e) {
            System.out.println("Open Connection Error" + e.toString());
        }
    }

    //veritabanı bağlantı kapatma metodumuz.
    public void conneciton_close() {

        try {
            if (statement != null) {
                statement.close();
                statement = null;
            }
            if (connection != null) {
                connection.close();
                connection = null;
            }

        } catch (Exception e) {
            // System.out.println("Exception closeConnection" + e.toString());
        }
    }

    //single_product.jsp için hazırladığım database fonk. Bu fonk parametre olarak yolladığımız id ye göre ürünün veritabındaki özelliklerini return ediyor.
    public urunler urun_ara(String ara_urun_id) {
        urunler urun = new urunler();
        try {
            connection_open();

            String selectquery = "SELECT * FROM `ürünler` WHERE `ürün_id`=" + ara_urun_id + "";
            ResultSet rs = statement.executeQuery(selectquery);
            while (rs.next()) {
                int urun_id = rs.getInt("ürün_id");
                int site_id = rs.getInt("site_id");
                String urun_ad = rs.getString("ürün_ad");
                String urun_cins = rs.getString("ürün_cins");
                int urun_fiyat = rs.getInt("ürün_fiyat");
                String urun_ozellik = rs.getString("ürün_özellik");
                String urun_marka = rs.getString("ürün_marka");
                String urun_resim = rs.getString("ürün_resim");
                String urun_link = rs.getString("ürün_link");
                String urun_skor = rs.getString("ürün_skor");

                urun.setUrun_id(urun_id);
                urun.setSite_id(site_id);
                urun.setUrun_ad(urun_ad);
                urun.setUrun_cins(urun_cins);
                urun.setUrun_fiyat(urun_fiyat);
                urun.setUrun_ozellik(urun_ozellik);
                urun.setUrun_marka(urun_marka);
                urun.setUrun_resim(urun_resim);
                urun.setUrun_link(urun_link);
                urun.setUrun_skor(urun_skor);

            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        conneciton_close();
        return urun;
    }

    //arama motoru için kodladığım database fonk. Bu fonk. bize aradığımız kelimeye göre like komutu ile arama yapıp bize liste dönderiyor.
    public List<urunler> genel_urun_ara(String ara_urun_ad, int sayfa) {
        List<urunler> urunler_genel = new ArrayList<>();

        try {
            int sayac = 1;
            connection_open();

            String selectquery = "SELECT * FROM `ürünler` WHERE `ürün_ad` LIKE '%" + ara_urun_ad + "%' LIMIT " + (sayfa * 12) + "," + (sayfa * 12 + 12) + "";
            ResultSet rs = statement.executeQuery(selectquery);
            while (rs.next()) {
                urunler urun = new urunler();
                int urun_id = rs.getInt("ürün_id");
                int site_id = rs.getInt("site_id");
                String urun_ad = rs.getString("ürün_ad");
                String urun_cins = rs.getString("ürün_cins");
                int urun_fiyat = rs.getInt("ürün_fiyat");
                String urun_ozellik = rs.getString("ürün_özellik");
                String urun_marka = rs.getString("ürün_marka");
                String urun_resim = rs.getString("ürün_resim");
                String urun_link = rs.getString("ürün_link");
                String urun_skor = rs.getString("ürün_skor");

                urun.setUrun_id(urun_id);
                urun.setSite_id(site_id);
                urun.setUrun_ad(urun_ad);
                urun.setUrun_cins(urun_cins);
                urun.setUrun_fiyat(urun_fiyat);
                urun.setUrun_ozellik(urun_ozellik);
                urun.setUrun_marka(urun_marka);
                urun.setUrun_resim(urun_resim);
                urun.setUrun_link(urun_link);
                urun.setUrun_skor(urun_skor);

                urunler_genel.add(urun);
                sayac++;
                if (sayac > 12) {
                    break;
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        conneciton_close();
        return urunler_genel;
    }

    //category.jsp için yazdığım fonk. Bu fonk ürün cinsine göre veritabanından ürünleri list biçiminde bize return ediyor.
    public List<urunler> urun_cins_ara(String ara_urun_cins, int sayfa) {
        List<urunler> urunler_cins = new ArrayList<>();
        try {
            int sayac = 1;
            connection_open();

            String selectquery = "SELECT * FROM `ürünler` WHERE `ürün_cins` LIKE '%" + ara_urun_cins + "%' LIMIT " + sayfa * 11 + "," + (sayfa * 11 + 11) + "";
            ResultSet rs = statement.executeQuery(selectquery);
            while (rs.next()) {
                urunler urun = new urunler();
                int urun_id = rs.getInt("ürün_id");
                int site_id = rs.getInt("site_id");
                String urun_ad = rs.getString("ürün_ad");
                String urun_cins = rs.getString("ürün_cins");
                int urun_fiyat = rs.getInt("ürün_fiyat");
                String urun_ozellik = rs.getString("ürün_özellik");
                String urun_marka = rs.getString("ürün_marka");
                String urun_resim = rs.getString("ürün_resim");
                String urun_link = rs.getString("ürün_link");
                String urun_skor = rs.getString("ürün_skor");

                urun.setUrun_id(urun_id);
                urun.setSite_id(site_id);
                urun.setUrun_ad(urun_ad);
                urun.setUrun_cins(urun_cins);
                urun.setUrun_fiyat(urun_fiyat);
                urun.setUrun_ozellik(urun_ozellik);
                urun.setUrun_marka(urun_marka);
                urun.setUrun_resim(urun_resim);
                urun.setUrun_link(urun_link);
                urun.setUrun_skor(urun_skor);

                urunler_cins.add(urun);
                sayac++;
                if (sayac > 11) {
                    break;
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        conneciton_close();
        return urunler_cins;
    }

    public static int sepet_uye_id;//global olarak tanımladığımız sepet_uye_id değişkenimiz

    //bu fonk. giriş yapmayı düzgün bir biçimde geçen kullanıcın üye id sini bize getiriyor. Bu sayede kullanıcı kendi ürünlerini sadece görecek. 
    public void sepet_id_kontrol(String username, String userpass) {
        try {

            connection_open();

            String selectquery = "SELECT * FROM `kayıtol` WHERE `üye_ad` LIKE '" + username + "' AND `üye_şifre` LIKE '" + userpass + "'";

            ResultSet rs = statement.executeQuery(selectquery);

            while (rs.next()) {

                sepet_uye_id = rs.getInt("üye_id");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        conneciton_close();
    }

    //sepete ekle ye bastığında kullanıcı ürünün özellikleri sepete ekleye fonfsiyonuna parametre olarak gidecek.
    public void sepete_getir(String sepet_urun_id) {

        try {

            connection_open();

            String selectquery = "SELECT * FROM `ürünler` WHERE `ürün_id` =" + sepet_urun_id + "";

            ResultSet rs = statement.executeQuery(selectquery);

            while (rs.next()) {

                int urun_id = rs.getInt("ürün_id");
                int site_id = rs.getInt("site_id");
                String urun_ad = rs.getString("ürün_ad");
                String urun_cins = rs.getString("ürün_cins");
                int urun_fiyat = rs.getInt("ürün_fiyat");
                String urun_ozellik = rs.getString("ürün_özellik");
                String urun_marka = rs.getString("ürün_marka");
                String urun_resim = rs.getString("ürün_resim");
                String urun_link = rs.getString("ürün_link");
                String urun_skor = rs.getString("ürün_skor");
                int urun_adet = 1;
                sepete_ekle(urun_id, urun_ad, urun_resim, urun_fiyat, urun_adet, urun_cins);

            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        conneciton_close();

    }

    //kullanıcı sepete eklemek istediği ürünü bu fonk sayesinde yapıyor.
    public void sepete_ekle(int urun_id, String urun_ad, String urun_resim, int urun_fiyat, int urun_adet, String urun_cins) {
        try {
            connection_open();

            String selectquery = ("insert into sepet(üye_id,ürün_id,ürün_ad,ürün_resim,ürün_fiyat,ürün_adet,ürün_cins) VALUES (?,?,?,?,?,?,?)");

            //statement.executeUpdate(selectquery);
            PreparedStatement gir = (PreparedStatement) connection.prepareStatement(selectquery);

            gir.setInt(1, sepet_uye_id);
            gir.setInt(2, urun_id);
            gir.setString(3, urun_ad);
            gir.setString(4, urun_resim);
            gir.setInt(5, urun_fiyat);
            gir.setInt(6, urun_adet);
            gir.setString(7, urun_cins);

            gir.executeUpdate();
            conneciton_close();
            System.out.println("sepete eklendi.");

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("sepete eklenemedi");
        }
    }

    //Kullanıcı sadece kendi eklediği ürünleri sepetinde görecek .global uye değişkenini sayesinde.
    public List<sepet> sepete_goster() {
        List<sepet> sepet = new ArrayList<>();
        try {

            connection_open();
            String selectquery = "SELECT * FROM `sepet` WHERE `üye_id` = " + sepet_uye_id + "";
            ResultSet rs = statement.executeQuery(selectquery);
            while (rs.next()) {
                sepet sep = new sepet();

                int urun_id = rs.getInt("ürün_id");
                String urun_ad = rs.getString("ürün_ad");
                String urun_resim = rs.getString("ürün_resim");
                int urun_fiyat = rs.getInt("ürün_fiyat");
                int urun_adet = rs.getInt("ürün_adet");
                String urun_cins = rs.getString("ürün_cins");

                sep.setUrun_id(urun_id);
                sep.setUrun_ad(urun_ad);
                sep.setUrun_resim(urun_resim);
                sep.setUrun_fiyat(urun_fiyat);
                sep.setUrun_adet(urun_adet);
                sep.setUrun_cins(urun_cins);
                sepet.add(sep);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        conneciton_close();
        return sepet;
    }

    //category ve filter jsp için oluşturduğum bu fonk. ürün filtreleme yapıyor.
    public List<urunler> fiyat_filtreleme(String cins, String min, String max, int sayfa) {

        List<urunler> urunler_filtre = new ArrayList<>();

        try {
            int sayac = 1;
            connection_open();

            String selectquery = "SELECT * FROM `ürünler` WHERE `ürün_cins` LIKE '%" + cins + "%' AND `ürün_fiyat`>" + min + " AND `ürün_fiyat`<" + max + " ORDER BY `ürün_fiyat` ASC LIMIT " + sayfa * 11 + "," + (sayfa * 11 + 11) + "";
            ResultSet rs = statement.executeQuery(selectquery);
            while (rs.next()) {
                urunler filter_urun = new urunler();
                int urun_id = rs.getInt("ürün_id");
                int site_id = rs.getInt("site_id");
                String urun_ad = rs.getString("ürün_ad");
                String urun_cins = rs.getString("ürün_cins");
                int urun_fiyat = rs.getInt("ürün_fiyat");
                String urun_ozellik = rs.getString("ürün_özellik");
                String urun_marka = rs.getString("ürün_marka");
                String urun_resim = rs.getString("ürün_resim");
                String urun_link = rs.getString("ürün_link");
                String urun_skor = rs.getString("ürün_skor");

                filter_urun.setUrun_id(urun_id);
                filter_urun.setSite_id(site_id);
                filter_urun.setUrun_ad(urun_ad);
                filter_urun.setUrun_cins(urun_cins);
                filter_urun.setUrun_fiyat(urun_fiyat);
                filter_urun.setUrun_ozellik(urun_ozellik);
                filter_urun.setUrun_marka(urun_marka);
                filter_urun.setUrun_resim(urun_resim);
                filter_urun.setUrun_link(urun_link);
                filter_urun.setUrun_skor(urun_skor);

                urunler_filtre.add(filter_urun);
                sayac++;
                if (sayac > 11) {
                    break;
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        conneciton_close();
        return urunler_filtre;
    }

    // kullanıcı sepetten silmek istediği ürünü bu fonk sayesinde siliyorz.
    public void sepetSil(String sepet_id) {
        try {
            connection_open();
            String selectquery = "DELETE FROM sepet WHERE`ürün_id`=?";
            PreparedStatement rs = (PreparedStatement) connection.prepareStatement(selectquery);
            rs.setString(1, sepet_id);
            rs.executeUpdate();
            rs.close();
            conneciton_close();

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    // kullanıcı ürünlerde adet arttırımı yada azaltımı yapınca güncellenen kod 
    public void guncelle_adet(int urun_adet, String urun_id) {
        try {
            connection_open();
            String selectquery = "UPDATE sepet SET ürün_adet=" + urun_adet + " WHERE`ürün_id`=" + urun_id + "";
            PreparedStatement rs = (PreparedStatement) connection.prepareStatement(selectquery);
            rs.executeUpdate();
            rs.close();
            conneciton_close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        Database_Connect con = new Database_Connect();
        con.connection_open();
    }

}
