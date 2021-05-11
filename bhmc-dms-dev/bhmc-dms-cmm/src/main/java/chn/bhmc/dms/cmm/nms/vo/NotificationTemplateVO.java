package chn.bhmc.dms.cmm.nms.vo;

import org.hibernate.validator.constraints.NotBlank;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : NotificationTemplateVO.java
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

public class NotificationTemplateVO extends BaseVO {


    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 4274751248133347130L;

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
     * 메세지템플릿 그룹 ID
     */
    @NotBlank
    private String mesgTmplGrpId;

    /**
     * 메세지템플릿 그룹명
     */
    private String mesgTmplGrpNm;

    /**
     * 메세지 템플릿 구분
     *  : SMS
     *  : PUSH
     *  : WEB PUSH
     */
    @NotBlank
    private String mesgTmplTp;

    /**
     * 메세지 템플릿명
     */
    private String mesgTmplNm;

    /**
     * 메세지 템플릿 내용
     */
    private String mesgTmplCont;

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
     * @return the mesgTmplGrpId
     */
    public String getMesgTmplGrpId() {
        return mesgTmplGrpId;
    }

    /**
     * @param mesgTmplGrpId the mesgTmplGrpId to set
     */
    public void setMesgTmplGrpId(String mesgTmplGrpId) {
        this.mesgTmplGrpId = mesgTmplGrpId;
    }

    /**
     * @return the mesgTmplGrpNm
     */
    public String getMesgTmplGrpNm() {
        return mesgTmplGrpNm;
    }

    /**
     * @param mesgTmplGrpNm the mesgTmplGrpNm to set
     */
    public void setMesgTmplGrpNm(String mesgTmplGrpNm) {
        this.mesgTmplGrpNm = mesgTmplGrpNm;
    }

    /**
     * @return the mesgTmplTp
     */
    public String getMesgTmplTp() {
        return mesgTmplTp;
    }

    /**
     * @param mesgTmplTp the mesgTmplTp to set
     */
    public void setMesgTmplTp(String mesgTmplTp) {
        this.mesgTmplTp = mesgTmplTp;
    }

    /**
     * @return the mesgTmplNm
     */
    public String getMesgTmplNm() {
        return mesgTmplNm;
    }

    /**
     * @param mesgTmplNm the mesgTmplNm to set
     */
    public void setMesgTmplNm(String mesgTmplNm) {
        this.mesgTmplNm = mesgTmplNm;
    }

    /**
     * @return the mesgTmplCont
     */
    public String getMesgTmplCont() {
        return mesgTmplCont;
    }

    /**
     * @param mesgTmplCont the mesgTmplCont to set
     */
    public void setMesgTmplCont(String mesgTmplCont) {
        this.mesgTmplCont = mesgTmplCont;
    }

}
