package chn.bhmc.dms.cmm.nms.vo;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : NotificationTargetSearchVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 5. 25.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 25.     Kang Seok Han     최초 생성
 * </pre>
 */

public class NotificationExcludeTargetSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -3231290375046097851L;

    /**
     * 딜러코드
     */
    private String sDlrCd;

    /**
     * 알림정책 그룹ID
     */
    private String sAlrtPolicyGrpId;

    /**
     * 알림정책 ID
     */
    private String sAlrtPolicyId;

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
     * @return the sAlrtPolicyGrpId
     */
    public String getsAlrtPolicyGrpId() {
        return sAlrtPolicyGrpId;
    }

    /**
     * @param sAlrtPolicyGrpId the sAlrtPolicyGrpId to set
     */
    public void setsAlrtPolicyGrpId(String sAlrtPolicyGrpId) {
        this.sAlrtPolicyGrpId = sAlrtPolicyGrpId;
    }

    /**
     * @return the sAlrtPolicyId
     */
    public String getsAlrtPolicyId() {
        return sAlrtPolicyId;
    }

    /**
     * @param sAlrtPolicyId the sAlrtPolicyId to set
     */
    public void setsAlrtPolicyId(String sAlrtPolicyId) {
        this.sAlrtPolicyId = sAlrtPolicyId;
    }

}
