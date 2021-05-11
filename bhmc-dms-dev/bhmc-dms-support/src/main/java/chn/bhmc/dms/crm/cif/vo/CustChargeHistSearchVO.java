package chn.bhmc.dms.crm.cif.vo;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 *
 * @ClassName   : CustChargeHistSearchVO.java
 * @Description : 고객 예치금 충전 이력 VO
 * @author liu jing
 * @since 2017. 1. 16.
 * @version 1.1
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 1. 16.     liu jing               최초 생성
 * </pre>
 */

public class CustChargeHistSearchVO extends SearchVO{


    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -8582850066380829147L;
    /**
     * Statements
     * (long)serialVersionUID
     */


    private String sDlrCd;
    private String sCustNm;                        // 고객명 [내방리스트]
    private String sCustNo;                        // 고객번호 [내방리스트-내방이력]
    private String sHpNo;                          // 연락처 [내방리스트]
    private  int   sChrSeq;
    /**
     * @return the sCustNm
     */
    public String getsCustNm() {
        return sCustNm;
    }

    /**
     * @param sCustNm the sCustNm to set
     */
    public void setsCustNm(String sCustNm) {
        this.sCustNm = sCustNm;
    }

    /**
     * @return the sCustNo
     */
    public String getsCustNo() {
        return sCustNo;
    }

    /**
     * @param sCustNo the sCustNo to set
     */
    public void setsCustNo(String sCustNo) {
        this.sCustNo = sCustNo;
    }

    /**
     * @return the sHpNo
     */
    public String getsHpNo() {
        return sHpNo;
    }

    /**
     * @param sHpNo the sHpNo to set
     */
    public void setsHpNo(String sHpNo) {
        this.sHpNo = sHpNo;
    }

    /**
     * @param sDlrCd the sDlrCd to set
     */
    public void setsDlrCd(String sDlrCd) {
        this.sDlrCd = sDlrCd;
    }

    /**
     * @return the sDlrCd
     */
    public String getsDlrCd() {
        return sDlrCd;
    }

    /**
     * @param sChrSeq the sChrSeq to set
     */
    public void setsChrSeq(int sChrSeq) {
        this.sChrSeq = sChrSeq;
    }

    /**
     * @return the sChrSeq
     */
    public int getsChrSeq() {
        return sChrSeq;
    }
}
