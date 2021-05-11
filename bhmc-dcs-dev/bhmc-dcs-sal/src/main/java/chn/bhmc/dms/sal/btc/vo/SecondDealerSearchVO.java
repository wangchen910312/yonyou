package chn.bhmc.dms.sal.btc.vo;

import chn.bhmc.dms.core.datatype.SearchVO;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SecondDealerSearchVO
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 1. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 14.    Kim Jin Suk      최초 생성
 * </pre>
 */

public class SecondDealerSearchVO extends SearchVO{
    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 6464036928442564755L;

    /**
     * 2급딜러코드
     **/
    private  String           sLv2DlrCd;

    /**
     * 2급딜러명
     **/
    private  String           sLv2DlrNm;

    /**
     * 딜러그룹 코드
     */
    private String            sDlrGrpCd;

    /**
     * DMS 사용여부
     */
    private String            sDmsUseYn;

    /**
     * @return the sLv2DlrCd
     */
    public String getsLv2DlrCd() {
        return sLv2DlrCd;
    }

    /**
     * @param sLv2DlrCd the sLv2DlrCd to set
     */
    public void setsLv2DlrCd(String sLv2DlrCd) {
        this.sLv2DlrCd = sLv2DlrCd;
    }

    /**
     * @return the sLv2DlrNm
     */
    public String getsLv2DlrNm() {
        return sLv2DlrNm;
    }

    /**
     * @param sLv2DlrNm the sLv2DlrNm to set
     */
    public void setsLv2DlrNm(String sLv2DlrNm) {
        this.sLv2DlrNm = sLv2DlrNm;
    }

    /**
     * @return the sDlrGrpCd
     */
    public String getsDlrGrpCd() {
        return sDlrGrpCd;
    }

    /**
     * @param sDlrGrpCd the sDlrGrpCd to set
     */
    public void setsDlrGrpCd(String sDlrGrpCd) {
        this.sDlrGrpCd = sDlrGrpCd;
    }

    /**
     * @return the sDmsUseYn
     */
    public String getsDmsUseYn() {
        return sDmsUseYn;
    }

    /**
     * @param sDmsUseYn the sDmsUseYn to set
     */
    public void setsDmsUseYn(String sDmsUseYn) {
        this.sDmsUseYn = sDmsUseYn;
    }

    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }
}
