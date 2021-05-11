package chn.bhmc.dms.par.pmm.vo;

import org.hibernate.validator.constraints.NotEmpty;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * 품목마스터 VO
 *
 * @ClassName   : ItemMasterVO.java
 * @Description : ItemMasterVO Class
 * @author Ju Won Lee
 * @since 2016. 1. 7.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 7.     Ju Won Lee      최초 생성
 * </pre>
 */

public class AbcClassVO extends BaseVO{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 5911975258080408843L;

    /**
     * 딜러코드
     **/
    @NotEmpty
    private String dlrCd;

    /**
     * ABC코드
     **/
    @NotEmpty
    private  String       abcCd;

    /**
     * 누적판매금액
     **/
    private  Double       acumSaleAmt;

    /**
     * 단가범위금액
     **/
    private  Double       prcRangeAmt;

    /**
     * 사용여부
     **/
    @NotEmpty
    private  String       useYn;

    /**
     * 비고
     **/
    private  String       remark;

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
     * @return the abcCd
     */
    public String getAbcCd() {
        return abcCd;
    }

    /**
     * @param abcCd the abcCd to set
     */
    public void setAbcCd(String abcCd) {
        this.abcCd = abcCd;
    }

    /**
     * @return the acumSaleAmt
     */
    public Double getAcumSaleAmt() {
        return acumSaleAmt;
    }

    /**
     * @param acumSaleAmt the acumSaleAmt to set
     */
    public void setAcumSaleAmt(Double acumSaleAmt) {
        this.acumSaleAmt = acumSaleAmt;
    }

    /**
     * @return the prcRangeAmt
     */
    public Double getPrcRangeAmt() {
        return prcRangeAmt;
    }

    /**
     * @param prcRangeAmt the prcRangeAmt to set
     */
    public void setPrcRangeAmt(Double prcRangeAmt) {
        this.prcRangeAmt = prcRangeAmt;
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
     * @return the remark
     */
    public String getRemark() {
        return remark;
    }

    /**
     * @param remark the remark to set
     */
    public void setRemark(String remark) {
        this.remark = remark;
    }
}
