package chn.bhmc.dms.cmm.nms.vo;

import org.hibernate.validator.constraints.NotBlank;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : NotificationExcludeTargetVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 6. 21.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 6. 21.     Kang Seok Han     최초 생성
 * </pre>
 */

public class NotificationExcludeTargetVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 914081262520057007L;

    /**
     * 알림정책 그룹ID
     */
    @NotBlank
    private String alrtPolicyGrpId;

    /**
     * 알림정책 그룹명
     */
    private String alrtPolicyGrpNm;

    /**
     * 알림정책 ID
     */
    @NotBlank
    private String alrtPolicyId;

    /**
     * 알림정책명
     */
    private String alrtPolicyNm;

    /**
     * 사용자ID
     */
    @NotBlank
    private String usrId;

    /**
     * 사용자명
     */
    private String usrNm;

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

    /**
     * @return the alrtPolicyId
     */
    public String getAlrtPolicyId() {
        return alrtPolicyId;
    }

    /**
     * @param alrtPolicyId the alrtPolicyId to set
     */
    public void setAlrtPolicyId(String alrtPolicyId) {
        this.alrtPolicyId = alrtPolicyId;
    }

    /**
     * @return the alrtPolicyNm
     */
    public String getAlrtPolicyNm() {
        return alrtPolicyNm;
    }

    /**
     * @param alrtPolicyNm the alrtPolicyNm to set
     */
    public void setAlrtPolicyNm(String alrtPolicyNm) {
        this.alrtPolicyNm = alrtPolicyNm;
    }

    /**
     * @return the usrId
     */
    public String getUsrId() {
        return usrId;
    }

    /**
     * @param usrId the usrId to set
     */
    public void setUsrId(String usrId) {
        this.usrId = usrId;
    }

    /**
     * @return the usrNm
     */
    public String getUsrNm() {
        return usrNm;
    }

    /**
     * @param usrNm the usrNm to set
     */
    public void setUsrNm(String usrNm) {
        this.usrNm = usrNm;
    }

}
