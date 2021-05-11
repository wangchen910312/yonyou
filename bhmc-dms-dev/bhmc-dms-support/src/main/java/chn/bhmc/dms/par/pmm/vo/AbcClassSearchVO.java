package chn.bhmc.dms.par.pmm.vo;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * 품목마스터 조회 SearchVO
 *
 * @ClassName   : ItemMasterSearchVO.java
 * @Description : ItemMasterSearchVO Class
 * @author Ju Won Lee
 * @since 2016. 1. 7.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 7.     Ju Won Lee     최초 생성
 * </pre>
 */

public class AbcClassSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -8829479898634961746L;

    /**
     * 딜러코드
     **/
    private String sDlrCd;

    /**
     * ABC코드
     **/
    private String sAbcCd;

    /**
     * 누적판매금액
     **/
    private Double sAcumSaleAmt;

    /**
     * 단가범위금액
     **/
    private Double sPrcRangeAmt;

    /**
     * 사용여부
     **/
    private String sUseYn;

    /**
     * 비고
     **/
    private String sRemark;

    /**
     * @return the sDlrCd
     */
    public String getsDlrCd() {
        return sDlrCd;
    }

    /**
     * @param sDlrCd the sDlrCd to set
     */
    public void setsDlrCd(String sDlrCd) {
        this.sDlrCd = sDlrCd;
    }

    /**
     * @return the sAbcCd
     */
    public String getsAbcCd() {
        return sAbcCd;
    }

    /**
     * @param sAbcCd the sAbcCd to set
     */
    public void setsAbcCd(String sAbcCd) {
        this.sAbcCd = sAbcCd;
    }

    /**
     * @return the sAcumSaleAmt
     */
    public Double getsAcumSaleAmt() {
        return sAcumSaleAmt;
    }

    /**
     * @param sAcumSaleAmt the sAcumSaleAmt to set
     */
    public void setsAcumSaleAmt(Double sAcumSaleAmt) {
        this.sAcumSaleAmt = sAcumSaleAmt;
    }

    /**
     * @return the sPrcRangeAmt
     */
    public Double getsPrcRangeAmt() {
        return sPrcRangeAmt;
    }

    /**
     * @param sPrcRangeAmt the sPrcRangeAmt to set
     */
    public void setsPrcRangeAmt(Double sPrcRangeAmt) {
        this.sPrcRangeAmt = sPrcRangeAmt;
    }

    /**
     * @return the sUseYn
     */
    public String getsUseYn() {
        return sUseYn;
    }

    /**
     * @param sUseYn the sUseYn to set
     */
    public void setsUseYn(String sUseYn) {
        this.sUseYn = sUseYn;
    }

    /**
     * @return the sRemark
     */
    public String getsRemark() {
        return sRemark;
    }

    /**
     * @param sRemark the sRemark to set
     */
    public void setsRemark(String sRemark) {
        this.sRemark = sRemark;
    }
}
