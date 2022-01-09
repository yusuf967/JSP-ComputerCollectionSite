
package backend;

public class sepet {
    private int sepet_id;
    private int uye_id;
    private int urun_id;
    private String urun_ad;
    private String urun_resim;
    private int urun_fiyat;
    private int urun_adet;
     private String urun_cins;

    

    /**
     * @return the sepet_id
     */
    public int getSepet_id() {
        return sepet_id;
    }

    /**
     * @param sepet_id the sepet_id to set
     */
    public void setSepet_id(int sepet_id) {
        this.sepet_id = sepet_id;
    }

    /**
     * @return the uye_id
     */
    public int getUye_id() {
        return uye_id;
    }

    /**
     * @param uye_id the uye_id to set
     */
    public void setUye_id(int uye_id) {
        this.uye_id = uye_id;
    }

    /**
     * @return the urun_id
     */
    public int getUrun_id() {
        return urun_id;
    }

    /**
     * @param urun_id the urun_id to set
     */
    public void setUrun_id(int urun_id) {
        this.urun_id = urun_id;
    }

    /**
     * @return the urun_ad
     */
    public String getUrun_ad() {
        return urun_ad;
    }

    /**
     * @param urun_ad the urun_ad to set
     */
    public void setUrun_ad(String urun_ad) {
        this.urun_ad = urun_ad;
    }

    /**
     * @return the urun_resim
     */
    public String getUrun_resim() {
        return urun_resim;
    }

    /**
     * @param urun_resim the urun_resim to set
     */
    public void setUrun_resim(String urun_resim) {
        this.urun_resim = urun_resim;
    }

    /**
     * @return the urun_fiyat
     */
    public int getUrun_fiyat() {
        return urun_fiyat;
    }

    /**
     * @param urun_fiyat the urun_fiyat to set
     */
    public void setUrun_fiyat(int urun_fiyat) {
        this.urun_fiyat = urun_fiyat;
    }

    /**
     * @return the urun_adet
     */
    public int getUrun_adet() {
        return urun_adet;
    }

    /**
     * @param urun_adet the urun_adet to set
     */
    public void setUrun_adet(int urun_adet) {
        this.urun_adet = urun_adet;
    }
    
    public String getUrun_cins() {
        return urun_cins;
    }

    public void setUrun_cins(String urun_cins) {
        this.urun_cins = urun_cins;
    }

}
