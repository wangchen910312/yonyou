package chn.bhmc.dms.bat.ser.svi.vo;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BatLaborCodeMasterVO.java
 * @Description : 공임코드 마스터  VO
 * @author YIN XUEYUAN
 * @since 2016. 5. 24.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 24.     YIN XUEYUAN     최초 생성
 * </pre>
 */

public class BatLaborCodeMasterVO extends BaseVO{


    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -5191960420352684465L;

    /**
     * 구분코드
     */
    private String dstinCd;

    /**
     * 딜러 코드
     */
    private String dlrCd;

    /**
     * 공임코드
     */
    private String lbrCd;

    /**
     * 영문 작업명
     */
    private String lbrEnNm;

    /**
     * 중문작업명
     */
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


}
