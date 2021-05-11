package chn.bhmc.dms.cmm.sci.vo;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : VatInfoSearchVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Mid Eum Park
 * @since 2018. 4. 26.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2018. 4. 26.     Mid Eum Park     최초 생성
 * </pre>
 */

public class VatInfoSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -849470081169240457L;

    private String sVatId;
    private String sVatIdNm;
    private String sVatTypeCd;
    private Double sVatApplyRate;

    private String sVatApplyDt;
    private String sVatEndDt;
    private String sVatUseYn;
    /**
     * @return the sVatId
     */
    public String getsVatId() {
        return sVatId;
    }
    /**
     * @param sVatId the sVatId to set
     */
    public void setsVatId(String sVatId) {
        this.sVatId = sVatId;
    }
    /**
     * @return the sVatIdNm
     */
    public String getsVatIdNm() {
        return sVatIdNm;
    }
    /**
     * @param sVatIdNm the sVatIdNm to set
     */
    public void setsVatIdNm(String sVatIdNm) {
        this.sVatIdNm = sVatIdNm;
    }
    /**
     * @return the sVatTypeCd
     */
    public String getsVatTypeCd() {
        return sVatTypeCd;
    }
    /**
     * @param sVatTypeCd the sVatTypeCd to set
     */
    public void setsVatTypeCd(String sVatTypeCd) {
        this.sVatTypeCd = sVatTypeCd;
    }
    /**
     * @return the sVatApplyRate
     */
    public Double getsVatApplyRate() {
        return sVatApplyRate;
    }
    /**
     * @param sVatApplyRate the sVatApplyRate to set
     */
    public void setsVatApplyRate(Double sVatApplyRate) {
        this.sVatApplyRate = sVatApplyRate;
    }
    /**
     * @return the sVatApplyDt
     */
    public String getsVatApplyDt() {
        return sVatApplyDt;
    }
    /**
     * @param sVatApplyDt the sVatApplyDt to set
     */
    public void setsVatApplyDt(String sVatApplyDt) {
        this.sVatApplyDt = sVatApplyDt;
    }
    /**
     * @return the sVatEndDt
     */
    public String getsVatEndDt() {
        return sVatEndDt;
    }
    /**
     * @param sVatEndDt the sVatEndDt to set
     */
    public void setsVatEndDt(String sVatEndDt) {
        this.sVatEndDt = sVatEndDt;
    }
    /**
     * @return the sVatUseYn
     */
    public String getsVatUseYn() {
        return sVatUseYn;
    }
    /**
     * @param sVatUseYn the sVatUseYn to set
     */
    public void setsVatUseYn(String sVatUseYn) {
        this.sVatUseYn = sVatUseYn;
    }

}
