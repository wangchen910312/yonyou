package chn.bhmc.dms.cmm.nms.vo;

import java.util.Date;

import org.hibernate.validator.constraints.NotBlank;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : NotificationPolicyVO.java
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

public class NotificationPolicyVO extends NotificationPolicyGroupVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 6026713860977269322L;

    /**
     * 알림정책 ID
     */
    private String alrtPolicyId;

    /**
     * 알림정책명
     */
    @NotBlank
    private String alrtPolicyNm;

    /**
     * 유효시작일
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date validStartDt;

    /**
     * 유효종료일
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date validEndDt;

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
     * @return the validStartDt
     */
    public Date getValidStartDt() {
        return validStartDt;
    }
    /**
     * @param validStartDt the validStartDt to set
     */
    public void setValidStartDt(Date validStartDt) {
        this.validStartDt = validStartDt;
    }
    /**
     * @return the validEndDt
     */
    public Date getValidEndDt() {
        return validEndDt;
    }
    /**
     * @param validEndDt the validEndDt to set
     */
    public void setValidEndDt(Date validEndDt) {
        this.validEndDt = validEndDt;
    }

}
