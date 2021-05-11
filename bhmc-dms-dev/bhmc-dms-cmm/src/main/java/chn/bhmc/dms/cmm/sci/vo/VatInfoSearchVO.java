package chn.bhmc.dms.cmm.sci.vo;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * 세율 조회 SearchVO
 *
 * @ClassName   : VatInfoSearchVO.java
 * @Description : VatInfoSearchVO Class
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

public class VatInfoSearchVO extends SearchVO {


	/**
	 *
	 */
	private static final long serialVersionUID = 1707229461890670218L;

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
