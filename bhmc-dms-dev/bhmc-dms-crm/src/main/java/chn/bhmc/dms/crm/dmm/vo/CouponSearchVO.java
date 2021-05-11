package chn.bhmc.dms.crm.dmm.vo;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CouponSearchVO.java
 * @Description : 패키지 쿠폰의 쿠폰 SearchVO
 * @author Kim Hyun Ho
 * @since 2016. 6. 9.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 6. 9.     Kim Hyun Ho     최초 생성
 * </pre>
 */

public class CouponSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -8119548921061369711L;

    /**
    * 딜러코드
    **/
    private  String     sDlrCd;

    /**
    * 패키지일련번호
    **/
    private  int        sPkgSeq;

    /**
    * 쿠폰일련번호
    **/
    private  int        sCupnSeq;

    /**
    * 쿠폰명
    **/
    private  String     sCupnNm;

    /**
    * 쿠폰내용
    **/
    private  String     sCupnCont;

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
     * @return the sPkgSeq
     */
    public int getsPkgSeq() {
        return sPkgSeq;
    }

    /**
     * @param sPkgSeq the sPkgSeq to set
     */
    public void setsPkgSeq(int sPkgSeq) {
        this.sPkgSeq = sPkgSeq;
    }

    /**
     * @return the sCupnSeq
     */
    public int getsCupnSeq() {
        return sCupnSeq;
    }

    /**
     * @param sCupnSeq the sCupnSeq to set
     */
    public void setsCupnSeq(int sCupnSeq) {
        this.sCupnSeq = sCupnSeq;
    }

    /**
     * @return the sCupnNm
     */
    public String getsCupnNm() {
        return sCupnNm;
    }

    /**
     * @param sCupnNm the sCupnNm to set
     */
    public void setsCupnNm(String sCupnNm) {
        this.sCupnNm = sCupnNm;
    }

    /**
     * @return the sCupnCont
     */
    public String getsCupnCont() {
        return sCupnCont;
    }

    /**
     * @param sCupnCont the sCupnCont to set
     */
    public void setsCupnCont(String sCupnCont) {
        this.sCupnCont = sCupnCont;
    }




}
