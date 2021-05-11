package chn.bhmc.dms.cmm.nms.vo;

import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.NotEmpty;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : TodoPolicyVO.java
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

public class TodoPolicyVO extends BaseVO {


    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -4284932447793291312L;

    /**
     * To-do 정책ID
     */
    private String todoPolicyId;

    /**
     * To-do 정책명
     */
    @NotEmpty
    private String todoPolicyNm;

    /**
     * 자동확인 여부
     */
    @NotEmpty
    @Pattern(regexp="[Y|N]")
    private String autoChkYn;

    /**
     * 액션타켓 구분
     * '01' 웹/모바일
     * '02' 웹
     * '03' 모바일
     */
    @NotEmpty
    @Pattern(regexp="0[1-2]")
    private String actionTargetTp;

    /**
     * 액션URL 웹
     */
    private String actionUrlWeb;

    /**
     * 액션URL 모바일
     */
    private String actionUrlMob;

    /**
     * To-do 정책 비고
     */
    private String todoPolicyDetl;
    
    /**
     * To-do 정책 사용여부
     */
    @NotEmpty
    @Pattern(regexp="[Y|N]")
    private String useYn;

    /**
     * @return the todoPolicyId
     */
    public String getTodoPolicyId() {
        return todoPolicyId;
    }

    /**
     * @param todoPolicyId the todoPolicyId to set
     */
    public void setTodoPolicyId(String todoPolicyId) {
        this.todoPolicyId = todoPolicyId;
    }

    /**
     * @return the todoPolicyNm
     */
    public String getTodoPolicyNm() {
        return todoPolicyNm;
    }

    /**
     * @param todoPolicyNm the todoPolicyNm to set
     */
    public void setTodoPolicyNm(String todoPolicyNm) {
        this.todoPolicyNm = todoPolicyNm;
    }

    /**
     * @return the autoChkYn
     */
    public String getAutoChkYn() {
        return autoChkYn;
    }

    /**
     * @param autoChkYn the autoChkYn to set
     */
    public void setAutoChkYn(String autoChkYn) {
        this.autoChkYn = autoChkYn;
    }

    /**
     * @return the actionTargetTp
     */
    public String getActionTargetTp() {
        return actionTargetTp;
    }

    /**
     * @param actionTargetTp the actionTargetTp to set
     */
    public void setActionTargetTp(String actionTargetTp) {
        this.actionTargetTp = actionTargetTp;
    }

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
     * @return the todoPolicyDetl
     */
    public String getTodoPolicyDetl() {
        return todoPolicyDetl;
    }

    /**
     * @param todoPolicyDetl the todoPolicyDetl to set
     */
    public void setTodoPolicyDetl(String todoPolicyDetl) {
        this.todoPolicyDetl = todoPolicyDetl;
    }

	/**
	 * @return the useYn
	 */
	public String getUseYn() {
		return useYn;
	}

	/**
	 * @param useYn the useYn to set
	 */
	public void setUseYn(String useYn) {
		this.useYn = useYn;
	}
}
