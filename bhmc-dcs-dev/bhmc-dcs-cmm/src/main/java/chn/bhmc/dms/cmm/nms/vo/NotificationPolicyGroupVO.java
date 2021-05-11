package chn.bhmc.dms.cmm.nms.vo;

import org.hibernate.validator.constraints.NotBlank;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : NotificationPolicyVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 5. 23.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 23.     Kang Seok Han     최초 생성
 * </pre>
 */

public class NotificationPolicyGroupVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 9174799334579253374L;

    /**
     * 알림정책 그룹ID
     */
    @NotBlank
    private String alrtPolicyGrpId;

    /**
     * 알림정책 그룹명
     */
    @NotBlank
    private String alrtPolicyGrpNm;
    
    /**
     * 액션URL 웹
     */
    private String actionUrlWeb;
    
    /**
     * 액션URL 모바일
     */
    private String actionUrlMob;

    /**
     * @return the actionUrlWeb
     */
    public String getActionUrlWeb() {
        return actionUrlWeb;
    }

    /**
     * @param actionUrlWeb the actionUrlWeb to set
     */
    public void setActionUrlWeb(String actionUrlWeb) {
        this.actionUrlWeb = actionUrlWeb;
    }

    /**
     * @return the actionUrlMob
     */
    public String getActionUrlMob() {
        return actionUrlMob;
    }

    /**
     * @param actionUrlMob the actionUrlMob to set
     */
    public void setActionUrlMob(String actionUrlMob) {
        this.actionUrlMob = actionUrlMob;
    }

    /**
     * @return the alrtPolicyGrpId
     */
    public String getAlrtPolicyGrpId() {
        return alrtPolicyGrpId;
    }

    /**
     * @param alrtPolicyGrpId the alrtPolicyGrpId to set
     */
    public void setAlrtPolicyGrpId(String alrtPolicyGrpId) {
        this.alrtPolicyGrpId = alrtPolicyGrpId;
    }

    /**
     * @return the alrtPolicyGrpNm
     */
    public String getAlrtPolicyGrpNm() {
        return alrtPolicyGrpNm;
    }

    /**
     * @param alrtPolicyGrpNm the alrtPolicyGrpNm to set
     */
    public void setAlrtPolicyGrpNm(String alrtPolicyGrpNm) {
        this.alrtPolicyGrpNm = alrtPolicyGrpNm;
    }

}
