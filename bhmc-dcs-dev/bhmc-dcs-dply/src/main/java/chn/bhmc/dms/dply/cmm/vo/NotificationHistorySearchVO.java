package chn.bhmc.dms.dply.cmm.vo;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : NotificationHistorySearch.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 4. 26.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 26.     Kang Seok Han     최초 생성
 * </pre>
 */

public class NotificationHistorySearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 455226262064476679L;

    /**
     * 이벤트일자
     **/
    private String sEventDt                ;

    /**
     * 공지유형
     **/
    private String sNotiTp                 ;

    /**
     * 이메일명
     **/
    private String sEmailNm                ;

    /**
     * 휴대폰번호
     **/
    private String sHpNo                   ;

    /**
     * 번들명
     **/
    private String sBundleNm               ;

    /**
     * @param sEventDt the sEventDt to set
     */
    public void setsEventDt(String sEventDt) {
        this.sEventDt = sEventDt;
    }

    /**
     * @return the sEventDt
     */
    public String getsEventDt() {
        return sEventDt;
    }

    /**
     * @param sNotiTp the sNotiTp to set
     */
    public void setsNotiTp(String sNotiTp) {
        this.sNotiTp = sNotiTp;
    }

    /**
     * @return the sNotiTp
     */
    public String getsNotiTp() {
        return sNotiTp;
    }

    /**
     * @param sEmailNm the sEmailNm to set
     */
    public void setsEmailNm(String sEmailNm) {
        this.sEmailNm = sEmailNm;
    }

    /**
     * @return the sEmailNm
     */
    public String getsEmailNm() {
        return sEmailNm;
    }

    /**
     * @param sHpNo the sHpNo to set
     */
    public void setsHpNo(String sHpNo) {
        this.sHpNo = sHpNo;
    }

    /**
     * @return the sHpNo
     */
    public String getsHpNo() {
        return sHpNo;
    }

    /**
     * @param sBundleNm the sBundleNm to set
     */
    public void setsBundleNm(String sBundleNm) {
        this.sBundleNm = sBundleNm;
    }

    /**
     * @return the sBundleNm
     */
    public String getsBundleNm() {
        return sBundleNm;
    }


}
