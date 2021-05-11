package chn.bhmc.dms.cmm.ath.vo;

import org.hibernate.validator.constraints.NotBlank;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : UserVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 2. 19.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 19.     Kang Seok Han     최초 생성
 * </pre>
 */

public class UserExtVO extends BaseVO{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 5092574097056514356L;

    /**
     * 사용자ID
     */
    @NotBlank
    private String usrId;

    /**
     * 클레임 신청 권한 여부
     */
    private String claimReqPermYn;

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
     * @return the claimReqPermYn
     */
    public String getClaimReqPermYn() {
        return claimReqPermYn;
    }

    /**
     * @param claimReqPermYn the claimReqPermYn to set
     */
    public void setClaimReqPermYn(String claimReqPermYn) {
        this.claimReqPermYn = claimReqPermYn;
    }

}
