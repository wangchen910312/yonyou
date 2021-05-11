package chn.bhmc.dms.par.pmm.vo;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * 로케이션 구조 정의 검색 VO
 *
 * @ClassName   : BinLocationDefineSearchVO.java
 * @Description : BinLocationDefineSearchVO Class
 * @author In Bo Shim
 * @since 2016. 1. 8.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 8.     In Bo Shim      최초 생성
 * </pre>
 */

public class BinLocationDefineSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 1466337031754727312L;

    /**
     * 딜러코드
     **/
    private String sDlrCd;

    /**
     * 센터코드
     **/
    private String sPltCd;

    /**
     * 레벨ID
     **/
    private int sLvlId;

    /**
     * 레벨텍스트
     **/
    private String sLvlTxt;

    /**
     * 길이수
     **/
    private int sLgthCnt;

    /**
     * 코드유형
     **/
    private String sCdTp;

    /**
     * 최종레벨여부
     **/
    private String sLastLvlYn;

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
     * @return the sPltCd
     */
    public String getsPltCd() {
        return sPltCd;
    }

    /**
     * @param sPltCd the sPltCd to set
     */
    public void setsPltCd(String sPltCd) {
        this.sPltCd = sPltCd;
    }

    /**
     * @return the sLvlId
     */
    public int getsLvlId() {
        return sLvlId;
    }

    /**
     * @param sLvlId the sLvlId to set
     */
    public void setsLvlId(int sLvlId) {
        this.sLvlId = sLvlId;
    }

    /**
     * @return the sLvlTxt
     */
    public String getsLvlTxt() {
        return sLvlTxt;
    }

    /**
     * @param sLvlTxt the sLvlTxt to set
     */
    public void setsLvlTxt(String sLvlTxt) {
        this.sLvlTxt = sLvlTxt;
    }

    /**
     * @return the sLgthCnt
     */
    public int getsLgthCnt() {
        return sLgthCnt;
    }

    /**
     * @param sLgthCnt the sLgthCnt to set
     */
    public void setsLgthCnt(int sLgthCnt) {
        this.sLgthCnt = sLgthCnt;
    }

    /**
     * @return the sCdTp
     */
    public String getsCdTp() {
        return sCdTp;
    }

    /**
     * @param sCdTp the sCdTp to set
     */
    public void setsCdTp(String sCdTp) {
        this.sCdTp = sCdTp;
    }

    /**
     * @return the sLastLvlYn
     */
    public String getsLastLvlYn() {
        return sLastLvlYn;
    }

    /**
     * @param sLastLvlYn the sLastLvlYn to set
     */
    public void setsLastLvlYn(String sLastLvlYn) {
        this.sLastLvlYn = sLastLvlYn;
    }
}
