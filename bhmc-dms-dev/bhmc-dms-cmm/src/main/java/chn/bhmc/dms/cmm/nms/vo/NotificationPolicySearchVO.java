package chn.bhmc.dms.cmm.nms.vo;

import java.util.Date;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : NotificationPolicySearchVO.java
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

public class NotificationPolicySearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -6245317910280527486L;

    /**
     * 알림정책 그룹 ID
     */
    private String sAlrtPolicyGrpId;

    /**
     * 알림정책그룹명
     */
    private String sAlrtPolicyGrpNm;
    
    /**
     * 알림정책그룹 사용여부
     */
    private String sUseYn;

    /**
     * 알림정책 ID
     */
    private String sAlrtPolicyId;

    /**
     * 알림정책명
     */
    private String sAlrtPolicyNm;

    /**
     * 알림정책 기준일자
     */
    private Date sBaseDt;

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
     * @return the sAlrtPolicyGrpNm
     */
    public String getsAlrtPolicyGrpNm() {
        return sAlrtPolicyGrpNm;
    }

    /**
     * @param sAlrtPolicyGrpNm the sAlrtPolicyGrpNm to set
     */
    public void setsAlrtPolicyGrpNm(String sAlrtPolicyGrpNm) {
        this.sAlrtPolicyGrpNm = sAlrtPolicyGrpNm;
    }

    /**
	 * @return the sUseYn
	 */
	public String getsUseYn() {
		return sUseYn;
	}

	/**
	 * @param sUseYn the sUseYn to set
	 */
	public void setsUseYn(String sUseYn) {
		this.sUseYn = sUseYn;
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

    /**
     * @return the sAlrtPolicyNm
     */
    public String getsAlrtPolicyNm() {
        return sAlrtPolicyNm;
    }

    /**
     * @param sAlrtPolicyNm the sAlrtPolicyNm to set
     */
    public void setsAlrtPolicyNm(String sAlrtPolicyNm) {
        this.sAlrtPolicyNm = sAlrtPolicyNm;
    }

    /**
     * @return the sBaseDt
     */
    public Date getsBaseDt() {
        return sBaseDt;
    }

    /**
     * @param sBaseDt the sBaseDt to set
     */
    public void setsBaseDt(Date sBaseDt) {
        this.sBaseDt = sBaseDt;
    }


}
