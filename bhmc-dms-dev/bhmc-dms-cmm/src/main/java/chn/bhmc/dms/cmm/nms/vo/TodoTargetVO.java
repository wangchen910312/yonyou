package chn.bhmc.dms.cmm.nms.vo;

import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.NotBlank;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : TodoTargetVO.java
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

public class TodoTargetVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -6102958479014479024L;

    /**
     * 딜러코드
     */
    private String dlrCd;

    /**
     * To-do 정책ID
     */
    @NotBlank
    private String todoPolicyId;

    /**
     * To-do 정책명
     */
    private String todoPolicyNm;

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
     * @return the dlrCd
     */
    public String getDlrCd() {
        return dlrCd;
    }

    /**
     * @param dlrCd the dlrCd to set
     */
    public void setDlrCd(String dlrCd) {
        this.dlrCd = dlrCd;
    }

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
}
