package chn.bhmc.dms.cmm.sci.vo;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : VatInfoVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Juwon Lee
 * @since 2018. 4. 26.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2018. 4. 26.     Juwon Lee     최초 생성
 * </pre>
 */

public class VatInfoVO{


    private static final long serialVersionUID = -1216456140753286246L;

    private String vatId;
    private String vatIdNm;
    private String vatTypeCd;
    private Double vatApplyRate;

    private String vatApplyDt;
    private String vatEndDt;
    private String vatUseYn;
    /**
     * @return the vatId
     */
    public String getVatId() {
        return vatId;
    }
    /**
     * @param vatId the vatId to set
     */
    public void setVatId(String vatId) {
        this.vatId = vatId;
    }
    /**
     * @return the vatIdNm
     */
    public String getVatIdNm() {
        return vatIdNm;
    }
    /**
     * @param vatIdNm the vatIdNm to set
     */
    public void setVatIdNm(String vatIdNm) {
        this.vatIdNm = vatIdNm;
    }
    /**
     * @return the vatTypeCd
     */
    public String getVatTypeCd() {
        return vatTypeCd;
    }
    /**
     * @param vatTypeCd the vatTypeCd to set
     */
    public void setVatTypeCd(String vatTypeCd) {
        this.vatTypeCd = vatTypeCd;
    }
    /**
     * @return the vatApplyRate
     */
    public Double getVatApplyRate() {
        return vatApplyRate;
    }
    /**
     * @param vatApplyRate the vatApplyRate to set
     */
    public void setVatApplyRate(Double vatApplyRate) {
        this.vatApplyRate = vatApplyRate;
    }
    /**
     * @return the vatApplyDt
     */
    public String getVatApplyDt() {
        return vatApplyDt;
    }
    /**
     * @param vatApplyDt the vatApplyDt to set
     */
    public void setVatApplyDt(String vatApplyDt) {
        this.vatApplyDt = vatApplyDt;
    }
    /**
     * @return the vatEndDt
     */
    public String getVatEndDt() {
        return vatEndDt;
    }
    /**
     * @param vatEndDt the vatEndDt to set
     */
    public void setVatEndDt(String vatEndDt) {
        this.vatEndDt = vatEndDt;
    }
    /**
     * @return the vatUseYn
     */
    public String getVatUseYn() {
        return vatUseYn;
    }
    /**
     * @param vatUseYn the vatUseYn to set
     */
    public void setVatUseYn(String vatUseYn) {
        this.vatUseYn = vatUseYn;
    }

}
