package chn.bhmc.dms.sal.orm.vo;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : OrderChartVO
 * @Description : 오더 자원표VO
 * @author Kim JinSuk
 * @since 2017. 12. 15.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 12. 15.   Kim JinSuk               최초 생성
 * </pre>
 */

public class OrderChartVO extends BaseVO{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 3950089705586025331L;

    /**
    * 차종코드
    **/
   private  String        carlineCd;

   /**
    * OCN코드
    **/
   private  String        ocnCd;

   /**
    * OCN명칭
    **/
   private  String        ocnDesc;

   /**
    * 외색코드
    **/
   private  String        extColorCd;

   /**
    * 외색명칭
    **/
   private  String        extColorDesc;

   /**
    * 내색코드
    **/
   private  String        intColorCd;

   /**
    * 내색명칭
    **/
   private  String        intColorDesc;

   /**
    * 오더유형
    **/
   private  String        ordTp;

   /**
    * PRICE
    **/
   private  Double        msrp;

   /**
    * Avaliable Resource
    **/
   private  int           qty;

   /**
    * Units(EA)
    **/
   private  String        unit;

   /**
    * emission standard
    **/
   private  String        emissnStnd;

   /**
    * Check Resource Or Not(Y/N)
    **/
   private  String        useYn;

    /**
     * @return the carlineCd
     */
    public String getCarlineCd() {
        return carlineCd;
    }

    /**
     * @param carlineCd the carlineCd to set
     */
    public void setCarlineCd(String carlineCd) {
        this.carlineCd = carlineCd;
    }

    /**
     * @return the ocnCd
     */
    public String getOcnCd() {
        return ocnCd;
    }

    /**
     * @param ocnCd the ocnCd to set
     */
    public void setOcnCd(String ocnCd) {
        this.ocnCd = ocnCd;
    }

    /**
     * @return the ocnDesc
     */
    public String getOcnDesc() {
        return ocnDesc;
    }

    /**
     * @param ocnDesc the ocnDesc to set
     */
    public void setOcnDesc(String ocnDesc) {
        this.ocnDesc = ocnDesc;
    }

    /**
     * @return the extColorCd
     */
    public String getExtColorCd() {
        return extColorCd;
    }

    /**
     * @param extColorCd the extColorCd to set
     */
    public void setExtColorCd(String extColorCd) {
        this.extColorCd = extColorCd;
    }

    /**
     * @return the extColorDesc
     */
    public String getExtColorDesc() {
        return extColorDesc;
    }

    /**
     * @param extColorDesc the extColorDesc to set
     */
    public void setExtColorDesc(String extColorDesc) {
        this.extColorDesc = extColorDesc;
    }

    /**
     * @return the intColorCd
     */
    public String getIntColorCd() {
        return intColorCd;
    }

    /**
     * @param intColorCd the intColorCd to set
     */
    public void setIntColorCd(String intColorCd) {
        this.intColorCd = intColorCd;
    }

    /**
     * @return the intColorDesc
     */
    public String getIntColorDesc() {
        return intColorDesc;
    }

    /**
     * @param intColorDesc the intColorDesc to set
     */
    public void setIntColorDesc(String intColorDesc) {
        this.intColorDesc = intColorDesc;
    }

    /**
     * @return the ordTp
     */
    public String getOrdTp() {
        return ordTp;
    }

    /**
     * @param ordTp the ordTp to set
     */
    public void setOrdTp(String ordTp) {
        this.ordTp = ordTp;
    }

    /**
     * @return the msrp
     */
    public Double getMsrp() {
        return msrp;
    }

    /**
     * @param msrp the msrp to set
     */
    public void setMsrp(Double msrp) {
        this.msrp = msrp;
    }

    /**
     * @return the qty
     */
    public int getQty() {
        return qty;
    }

    /**
     * @param qty the qty to set
     */
    public void setQty(int qty) {
        this.qty = qty;
    }

    /**
     * @return the unit
     */
    public String getUnit() {
        return unit;
    }

    /**
     * @param unit the unit to set
     */
    public void setUnit(String unit) {
        this.unit = unit;
    }

    /**
     * @return the emissnStnd
     */
    public String getEmissnStnd() {
        return emissnStnd;
    }

    /**
     * @param emissnStnd the emissnStnd to set
     */
    public void setEmissnStnd(String emissnStnd) {
        this.emissnStnd = emissnStnd;
    }

    /**
     * @return the useYn
     */
    public String getUseYn() {
        return useYn;
    }

    /**
     * @param useYn the useYn to set
     */
    public void setUseYn(String useYn) {
        this.useYn = useYn;
    }

    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }

}