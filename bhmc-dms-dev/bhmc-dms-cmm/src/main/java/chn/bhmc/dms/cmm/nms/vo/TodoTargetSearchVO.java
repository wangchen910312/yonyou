package chn.bhmc.dms.cmm.nms.vo;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : TodoTargetSearchVO.java
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

public class TodoTargetSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 6094887288567637713L;

    /**
     * 딜러코드
     */
    private String sDlrCd;

    /**
     * To-do 정책ID
     */
    private String sTodoPolicyId;

    /**
     * 참조유형
     * R : 역할
     * U : 사용자
     */
    private String sRefTp;

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
     * @return the sTodoPolicyId
     */
    public String getsTodoPolicyId() {
        return sTodoPolicyId;
    }

    /**
     * @param sTodoPolicyId the sTodoPolicyId to set
     */
    public void setsTodoPolicyId(String sTodoPolicyId) {
        this.sTodoPolicyId = sTodoPolicyId;
    }

    /**
     * @return the sRefTp
     */
    public String getsRefTp() {
        return sRefTp;
    }

    /**
     * @param sRefTp the sRefTp to set
     */
    public void setsRefTp(String sRefTp) {
        this.sRefTp = sRefTp;
    }
}
