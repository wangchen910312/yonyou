package chn.bhmc.dms.cmm.nms.vo;

import java.io.Serializable;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : NotificationTargetUserVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 8. 22.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 8. 22.     Kang Seok Han     최초 생성
 * </pre>
 */

public class NotificationTargetUserVO implements Serializable {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 7757187403325762026L;

    private String alrtPolicyGrpId;
    private String alrtPolicyId;
    private String mesgTmplTpList;
    private String usrId;
    private String usrNm;
    private String hpNo;
    private String email;
    private String mesgTmplTp;
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
    /**
     * @return the hpNo
     */
    public String getHpNo() {
        return hpNo;
    }
    /**
     * @param hpNo the hpNo to set
     */
    public void setHpNo(String hpNo) {
        this.hpNo = hpNo;
    }
    /**
     * @return the email
     */
    public String getEmail() {
        return email;
    }
    /**
     * @param email the email to set
     */
    public void setEmail(String email) {
        this.email = email;
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

}
