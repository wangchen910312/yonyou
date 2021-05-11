package chn.bhmc.dms.ser.svi.vo;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * <pre>
 * PDI점검항목 조회 SearchVO
 * </pre>
 *
 * @ClassName   : PDIChkAtcSearchVO.java
 * @Description : PDI점검항목 조회 SearchVO.
 * @author Yin Xueyuan
 * @since 2016. 1. 27.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 27.     Yin Xueyuan     최초 생성
 * </pre>
 */

public class PDIChkAtcSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 6947437255468486983L;

    /**
     * 조회조건 - 딜러코드
     */
    private String  sDlrCd;

    /**
     * 조회조건 - PDI유형코드
     */
    private String sCarTpCd;

    /**
     * 조회조건 - PDI점검항목코드
     */
    private String sCarChkAtcCd;

    /**
     * 조회조건 - PDI점검항목유형명
     */
    private String sCarChkAtcTpNm;

    /**
     * 조회조건 - PDI점검항목명
     */
    private String sCarChkAtcLocalNm;

    /**
     * 조회조건 - PDI점검항목영문명
     */
    private String sCarChkAtcEnNm;

    /**
     * 조회조건 - 차량점검코드
     */
    private String sCarChkCd;

    public String getsDlrCd() {
        return sDlrCd;
    }

    public void setsDlrCd(String sDlrCd) {
        this.sDlrCd = sDlrCd;
    }

    public String getsCarTpCd() {
        return sCarTpCd;
    }

    public void setsCarTpCd(String sCarTpCd) {
        this.sCarTpCd = sCarTpCd;
    }

    public String getsCarChkAtcCd() {
        return sCarChkAtcCd;
    }

    public void setsCarChkAtcCd(String sCarChkAtcCd) {
        this.sCarChkAtcCd = sCarChkAtcCd;
    }

    public String getsCarChkAtcTpNm() {
        return sCarChkAtcTpNm;
    }

    public void setsCarChkAtcTpNm(String sCarChkAtcTpNm) {
        this.sCarChkAtcTpNm = sCarChkAtcTpNm;
    }

    public String getsCarChkAtcEnNm() {
        return sCarChkAtcEnNm;
    }

    public void setsCarChkAtcEnNm(String sCarChkAtcEnNm) {
        this.sCarChkAtcEnNm = sCarChkAtcEnNm;
    }

    public String getsCarChkAtcLocalNm() {
        return sCarChkAtcLocalNm;
    }

    public void setsCarChkAtcLocalNm(String sCarChkAtcLocalNm) {
        this.sCarChkAtcLocalNm = sCarChkAtcLocalNm;
    }

    /**
     * @return the sCarChkCd
     */
    public String getsCarChkCd() {
        return sCarChkCd;
    }

    /**
     * @param sCarChkCd the sCarChkCd to set
     */
    public void setsCarChkCd(String sCarChkCd) {
        this.sCarChkCd = sCarChkCd;
    }

}
