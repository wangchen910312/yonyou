package chn.bhmc.dms.ser.svi.vo;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : InsuranceMangageSearchVO.java
 * @Description : 보험관리 Seach VO
 * @author Ki Hyun Kwon
 * @since 2016. 1. 27.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 27.     Ki Hyun Kwon     최초 생성
 * </pre>
 */

public class InsuranceManageSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 7334203383026301645L;

    private String sDlrCd;     //딜러코드
    private String sIncCmpNm ; //보험사명
    private String sIncUsrNm;  //보험사용자명
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
     * @return the sIncCmpNm
     */
    public String getsIncCmpNm() {
        return sIncCmpNm;
    }
    /**
     * @param sIncCmpNm the sIncCmpNm to set
     */
    public void setsIncCmpNm(String sIncCmpNm) {
        this.sIncCmpNm = sIncCmpNm;
    }
    /**
     * @return the sIncUsrNm
     */
    public String getsIncUsrNm() {
        return sIncUsrNm;
    }
    /**
     * @param sIncUsrNm the sIncUsrNm to set
     */
    public void setsIncUsrNm(String sIncUsrNm) {
        this.sIncUsrNm = sIncUsrNm;
    }






}
