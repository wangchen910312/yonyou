package chn.bhmc.dms.par.pmm.vo;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * 부품가격 BWMS 부품 VO
 *
 * @ClassName   : PartsPriceBwmsItemVO.java
 * @Description : PartsPriceBwmsItemVO Class
 * @author In Bo Shim
 * @since 2017. 06. 21.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 06. 21.     In Bo Shim      최초 생성
 * </pre>
 */

public class PartsPriceBwmsItemVO extends BaseVO{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 1936165118414225912L;

    /**
     * 딜러코드
     **/
    private String dlrCd = "";

    /**
     * 창고코드
     **/
    private String strgeCd = "";

    /**
     * 부품코드
     **/
    private String itemCd = "";

    /**
     * BWMS 부품코드
     **/
    private String apcpPartNo = "";

    /**
     * MARKUP 유무
     **/
    private String markUpUseYn = "N";

    /**
     * MARKUP 율
     **/
    private int markUp;

    /**
     * MARKUP 적용 보증금액
     **/
    private Double markUpPrc = 0.0;

    /**
     * BMP구매금액(원가)
     **/
    private Double salePrcAmtTax = 0.0;

    /**
     * BMP구매금액(세금포함)
     **/
    private Double salePrcAmt = 0.0;

    /**
     * 보증금액
     **/
    private Double grtePrc = 0.0;

    /**
     * bmp구매금액
     **/
    private Double bmpPurcPrc = 0.0;

    /**
     * 등록자ID
     **/
    private String regUsrId;

    /**
     * 수정자ID
     **/
    private  String updtUsrId;

    /**
     * @return the dlrCd
     */
    public String getDlrCd() {
        return dlrCd;
    }

    /**
     * @param dlrCd the dlrCd to set
     */
    public void setDlrCd(String dlrCd) {
        this.dlrCd = dlrCd;
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
     * @return the itemCd
     */
    public String getItemCd() {
        return itemCd;
    }

    /**
     * @param itemCd the itemCd to set
     */
    public void setItemCd(String itemCd) {
        this.itemCd = itemCd;
    }

    /**
     * @return the apcpPartNo
     */
    public String getApcpPartNo() {
        return apcpPartNo;
    }

    /**
     * @param apcpPartNo the apcpPartNo to set
     */
    public void setApcpPartNo(String apcpPartNo) {
        this.apcpPartNo = apcpPartNo;
    }

    /**
     * @return the markUpUseYn
     */
    public String getMarkUpUseYn() {
        return markUpUseYn;
    }

    /**
     * @param markUpUseYn the markUpUseYn to set
     */
    public void setMarkUpUseYn(String markUpUseYn) {
        this.markUpUseYn = markUpUseYn;
    }

    /**
     * @return the markUp
     */
    public int getMarkUp() {
        return markUp;
    }

    /**
     * @param markUp the markUp to set
     */
    public void setMarkUp(int markUp) {
        this.markUp = markUp;
    }

    /**
     * @return the markUpPrc
     */
    public Double getMarkUpPrc() {
        return markUpPrc;
    }

    /**
     * @param markUpPrc the markUpPrc to set
     */
    public void setMarkUpPrc(Double markUpPrc) {
        this.markUpPrc = markUpPrc;
    }

    /**
     * @return the salePrcAmtTax
     */
    public Double getSalePrcAmtTax() {
        return salePrcAmtTax;
    }

    /**
     * @param salePrcAmtTax the salePrcAmtTax to set
     */
    public void setSalePrcAmtTax(Double salePrcAmtTax) {
        this.salePrcAmtTax = salePrcAmtTax;
    }

    /**
     * @return the salePrcAmt
     */
    public Double getSalePrcAmt() {
        return salePrcAmt;
    }

    /**
     * @param salePrcAmt the salePrcAmt to set
     */
    public void setSalePrcAmt(Double salePrcAmt) {
        this.salePrcAmt = salePrcAmt;
    }

    /**
     * @return the grtePrc
     */
    public Double getGrtePrc() {
        return grtePrc;
    }

    /**
     * @param grtePrc the grtePrc to set
     */
    public void setGrtePrc(Double grtePrc) {
        this.grtePrc = grtePrc;
    }

    /**
     * @return the bmpPurcPrc
     */
    public Double getBmpPurcPrc() {
        return bmpPurcPrc;
    }

    /**
     * @param bmpPurcPrc the bmpPurcPrc to set
     */
    public void setBmpPurcPrc(Double bmpPurcPrc) {
        this.bmpPurcPrc = bmpPurcPrc;
    }

    /**
     * @return the regUsrId
     */
    public String getRegUsrId() {
        return regUsrId;
    }

    /**
     * @param regUsrId the regUsrId to set
     */
    public void setRegUsrId(String regUsrId) {
        this.regUsrId = regUsrId;
    }

    /**
     * @return the updtUsrId
     */
    public String getUpdtUsrId() {
        return updtUsrId;
    }

    /**
     * @param updtUsrId the updtUsrId to set
     */
    public void setUpdtUsrId(String updtUsrId) {
        this.updtUsrId = updtUsrId;
    }

}
