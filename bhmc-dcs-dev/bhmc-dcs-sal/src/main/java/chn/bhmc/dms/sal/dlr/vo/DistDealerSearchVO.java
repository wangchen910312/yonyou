package chn.bhmc.dms.sal.dlr.vo;

import chn.bhmc.dms.core.datatype.SearchVO;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : DistDealerSearchVO
 * @Description : 클래스 설명을 기술합니다.
 * @author Kim yewon
 * @since 2016. 5. 25.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016.  5. 25.    Kim yewon              최초 생성
 * </pre>
 */

public class DistDealerSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 2924692645434750515L;
    private String sUsrId;                  //관리딜러코드
    private String sUsrNm;                  
    private String sDeptCd; 

    private String sDiviCd;
    private String sOffCd;
    private String sDlrCd;
    
    /**
     * @return the sUsrId
     */
    public String getsUsrId() {
        return sUsrId;
    }
    /**
     * @param sUsrId the sUsrId to set
     */
    public void setsUsrId(String sUsrId) {
        this.sUsrId = sUsrId;
    }
    /**
     * @return the sUsrNm
     */
    public String getsUsrNm() {
        return sUsrNm;
    }
    /**
     * @param sUsrNm the sUsrNm to set
     */
    public void setsUsrNm(String sUsrNm) {
        this.sUsrNm = sUsrNm;
    }
    /**
     * @return the sDeptCd
     */
    public String getsDeptCd() {
        return sDeptCd;
    }
    /**
     * @param sDeptCd the sDeptCd to set
     */
    public void setsDeptCd(String sDeptCd) {
        this.sDeptCd = sDeptCd;
    }
    /**
     * @return the sDiviCd
     */
    public String getsDiviCd() {
        return sDiviCd;
    }
    /**
     * @param sDiviCd the sDiviCd to set
     */
    public void setsDiviCd(String sDiviCd) {
        this.sDiviCd = sDiviCd;
    }
    /**
     * @return the sOffCd
     */
    public String getsOffCd() {
        return sOffCd;
    }
    /**
     * @param sOffCd the sOffCd to set
     */
    public void setsOffCd(String sOffCd) {
        this.sOffCd = sOffCd;
    }
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
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }
    
}