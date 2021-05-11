package chn.bhmc.dms.cmm.nms.vo;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : TodoPolicySearchVO.java
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

public class TodoPolicySearchVO extends SearchVO {


    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 3688852456213793332L;

    /**
     * To-do 정책ID
     */
    private String sTodoPolicyId;

    /**
     * To-do 정책명
     */
    private String sTodoPolicyNm;

    /**
     * 액션타켓 구분
     * '01' 웹/모바일
     * '02' 웹
     * '03' 모바일
     */
    private String sActionTargetTp;

    /**
     * 자동확인여부
     */
    private String sAutoChkYn;
    
    /**
     * To-do 정책 사용여부
     */
    private String sUseYn;

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
     * @return the sTodoPolicyNm
     */
    public String getsTodoPolicyNm() {
        return sTodoPolicyNm;
    }

    /**
     * @param sTodoPolicyNm the sTodoPolicyNm to set
     */
    public void setsTodoPolicyNm(String sTodoPolicyNm) {
        this.sTodoPolicyNm = sTodoPolicyNm;
    }

    /**
     * @return the sActionTargetTp
     */
    public String getsActionTargetTp() {
        return sActionTargetTp;
    }

    /**
     * @param sActionTargetTp the sActionTargetTp to set
     */
    public void setsActionTargetTp(String sActionTargetTp) {
        this.sActionTargetTp = sActionTargetTp;
    }

    /**
     * @return the sAutoChkYn
     */
    public String getsAutoChkYn() {
        return sAutoChkYn;
    }

    /**
     * @param sAutoChkYn the sAutoChkYn to set
     */
    public void setsAutoChkYn(String sAutoChkYn) {
        this.sAutoChkYn = sAutoChkYn;
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
}
