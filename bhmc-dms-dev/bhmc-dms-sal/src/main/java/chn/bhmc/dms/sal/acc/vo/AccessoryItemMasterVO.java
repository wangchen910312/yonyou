package chn.bhmc.dms.sal.acc.vo;

import chn.bhmc.dms.par.pmm.vo.ItemMasterVO;

/**
 * <pre>
 *
 * </pre>
 *
 * @ClassName   : AccessoryItemMasterVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2017. 2. 4.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 2. 4.     Kang Seok Han     최초 생성
 * </pre>
 */

public class AccessoryItemMasterVO extends ItemMasterVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 6549895860150947943L;

    private String strgeCd;

    private String strgeNm;


    /**
     * 매입가격은 ItemMasterVO salePrcAmt 필드를 사용한다.
     */

    /**
     * 세금공제소매가격
     */
    private double taxDdctRetlPrc;

    /**
     * 세금공제도매가격
     */
    private double taxDdctWhslPrc;

    /**
     * 소매추가세금율
     */
    private double retlAddTaxRate;

    /**
     * 도매추가세금율
     */
    private double whslAddTaxRate;

    /**
     * @return the taxDdctRetlPrc
     */
    public double getTaxDdctRetlPrc() {
        return taxDdctRetlPrc;
    }

    /**
     * @param taxDdctRetlPrc the taxDdctRetlPrc to set
     */
    public void setTaxDdctRetlPrc(double taxDdctRetlPrc) {
        this.taxDdctRetlPrc = taxDdctRetlPrc;
    }

    /**
     * @return the taxDdctWhslPrc
     */
    public double getTaxDdctWhslPrc() {
        return taxDdctWhslPrc;
    }

    /**
     * @param taxDdctWhslPrc the taxDdctWhslPrc to set
     */
    public void setTaxDdctWhslPrc(double taxDdctWhslPrc) {
        this.taxDdctWhslPrc = taxDdctWhslPrc;
    }

    /**
     * @return the retlAddTaxRate
     */
    public double getRetlAddTaxRate() {
        return retlAddTaxRate;
    }

    /**
     * @param retlAddTaxRate the retlAddTaxRate to set
     */
    public void setRetlAddTaxRate(double retlAddTaxRate) {
        this.retlAddTaxRate = retlAddTaxRate;
    }

    /**
     * @return the whslAddTaxRate
     */
    public double getWhslAddTaxRate() {
        return whslAddTaxRate;
    }

    /**
     * @param whslAddTaxRate the whslAddTaxRate to set
     */
    public void setWhslAddTaxRate(double whslAddTaxRate) {
        this.whslAddTaxRate = whslAddTaxRate;
    }



    /**
     * @return the strgeCd
     */
    public String getStrgeCd() {
        return strgeCd;
    }

    /**
     * @param strgeCd the strgeCd to set
     */
    public void setStrgeCd(String strgeCd) {
        this.strgeCd = strgeCd;
    }

    /**
     * @return the strgeNm
     */
    public String getStrgeNm() {
        return strgeNm;
    }

    /**
     * @param strgeNm the strgeNm to set
     */
    public void setStrgeNm(String strgeNm) {
        this.strgeNm = strgeNm;
    }

    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }
}
