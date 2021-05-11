package chn.bhmc.dms.cmm.nms.vo;

import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.NotBlank;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : NotificationTargetVO.java
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

public class NotificationTargetVO extends BaseVO {


    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -6102958479014479024L;

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
     * 참조유형
     * R : 역할
     * T : 직무
     * D : 부서
     * U : 사용자
     */
    @NotBlank
    @Pattern(regexp="[R|T|D|U]")
    private String refTp;

    /**
     * 참조아이디
     * 역할 ID 또는 사용자 ID
     */
    @NotBlank
    private String refId;

    /**
     * 참조명
     * 역할명 또는 사용자명
     */
    private String refNm;

    /**
     * 메세지템플릿 유형 목록 ','를 구분자로 사용한다.
     */
    private String mesgTmplTpList;

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
     * @return the refTp
     */
    public String getRefTp() {
        return refTp;
    }

    /**
     * @param refTp the refTp to set
     */
    public void setRefTp(String refTp) {
        this.refTp = refTp;
    }

    /**
     * @return the refId
     */
    public String getRefId() {
        return refId;
    }

    /**
     * @param refId the refId to set
     */
    public void setRefId(String refId) {
        this.refId = refId;
    }

    /**
     * @return the refNm
     */
    public String getRefNm() {
        return refNm;
    }

    /**
     * @param refNm the refNm to set
     */
    public void setRefNm(String refNm) {
        this.refNm = refNm;
    }

    /**
     * @return the mesgTmplTpList
     */
    public String getMesgTmplTpList() {
        return mesgTmplTpList;
    }

    /**
     * @param mesgTmplTpList the mesgTmplTpList to set
     */
    public void setMesgTmplTpList(String mesgTmplTpList) {
        this.mesgTmplTpList = mesgTmplTpList;
    }

}
