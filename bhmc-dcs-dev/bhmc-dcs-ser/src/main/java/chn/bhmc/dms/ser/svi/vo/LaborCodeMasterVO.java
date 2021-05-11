package chn.bhmc.dms.ser.svi.vo;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : LaborCodeMasterVO.java
 * @Description : 공임코드 마스터  VO
 * @author Ki Hyun Kwon
 * @since 2016. 2. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 11.     Ki Hyun Kwon     최초 생성
 * </pre>
 */

public class LaborCodeMasterVO extends BaseVO{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -4149348624758447630L;

    /**
     * 구분코드
     */
    @NotEmpty
    private String dstinCd;

    /**
     * 딜러 코드
     */
    private String dlrCd;

    /**
     * 공임코드
     */
    @Length(min=1, max=10)
    private String lbrCd;

    /**
     * 영문 작업명
     */
    @NotEmpty
    private String lbrEnNm;

    /**
     * 중문작업명
     */
    @NotEmpty
    private String lbrChnNm;

    /**
     * 작업수량
     */
    private int lbrQty;

    /**
     * 브랜드 코드
     */
    private String brandCd;

    /**
     * 공임 유형
     */
    private String lbrTp;

    /**
     * 공임 코드 유형
     */
    private String lbrCdTp;

    /**
     * 공임 유형
     */
    private String remark;

    /**
     * @return the dstinCd
     */
    public String getDstinCd() {
        return dstinCd;
    }

    /**
     * @param dstinCd the dstinCd to set
     */
    public void setDstinCd(String dstinCd) {
        this.dstinCd = dstinCd;
    }


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
     * @return the lbrCd
     */
    public String getLbrCd() {
        return lbrCd;
    }

    /**
     * @param lbrCd the lbrCd to set
     */
    public void setLbrCd(String lbrCd) {
        this.lbrCd = lbrCd;
    }

    /**
     * @return the lbrEnNm
     */
    public String getLbrEnNm() {
        return lbrEnNm;
    }

    /**
     * @param lbrEnNm the lbrEnNm to set
     */
    public void setLbrEnNm(String lbrEnNm) {
        this.lbrEnNm = lbrEnNm;
    }

    /**
     * @return the lbrChnNm
     */
    public String getLbrChnNm() {
        return lbrChnNm;
    }

    /**
     * @param lbrChnNm the lbrChnNm to set
     */
    public void setLbrChnNm(String lbrChnNm) {
        this.lbrChnNm = lbrChnNm;
    }

    /**
     * @return the lbrQty
     */
    public int getLbrQty() {
        return lbrQty;
    }

    /**
     * @param lbrQty the lbrQty to set
     */
    public void setLbrQty(int lbrQty) {
        this.lbrQty = lbrQty;
    }

    /**
     * @return the brandCd
     */
    public String getBrandCd() {
        return brandCd;
    }

    /**
     * @param brandCd the brandCd to set
     */
    public void setBrandCd(String brandCd) {
        this.brandCd = brandCd;
    }

    /**
     * @return the lbrTp
     */
    public String getLbrTp() {
        return lbrTp;
    }

    /**
     * @param lbrTp the lbrTp to set
     */
    public void setLbrTp(String lbrTp) {
        this.lbrTp = lbrTp;
    }

    /**
     * @return the lbrCdTp
     */
    public String getLbrCdTp() {
        return lbrCdTp;
    }

    /**
     * @param lbrCdTp the lbrCdTp to set
     */
    public void setLbrCdTp(String lbrCdTp) {
        this.lbrCdTp = lbrCdTp;
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
