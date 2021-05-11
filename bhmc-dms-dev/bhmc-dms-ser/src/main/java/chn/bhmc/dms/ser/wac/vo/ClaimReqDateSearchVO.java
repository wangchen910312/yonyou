package chn.bhmc.dms.ser.wac.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.SearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ClaimReqDateSearchVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon Ki Hyun
 * @since 2016. 5. 17.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 17.     Kwon Ki Hyun     최초 생성
 * </pre>
 */

public class ClaimReqDateSearchVO extends SearchVO{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -8306107651941330434L;

    /**
     * 딜러코드
     */
    private String sDlrCd;

    /**
     * 클레임 청구 시작일자
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sClaimReqFromDt;

    /**
     * 클레임 청구 종료일자
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sClaimReqToDt;

    /**
     * 클레임 승인 시작일자
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sClaimConfirmFromDt;

    /**
     * 클레임 승인 종료일자
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sClaimConfirmToDt;

    /**
     * 클레임 청구일자
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sClaimReqDt;





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
     * @return the sClaimReqFromDt
     */
    public Date getsClaimReqFromDt() {
        return sClaimReqFromDt;
    }

    /**
     * @param sClaimReqFromDt the sClaimReqFromDt to set
     */
    public void setsClaimReqFromDt(Date sClaimReqFromDt) {
        this.sClaimReqFromDt = sClaimReqFromDt;
    }

    /**
     * @return the sClaimReqToDt
     */
    public Date getsClaimReqToDt() {
        return sClaimReqToDt;
    }

    /**
     * @param sClaimReqToDt the sClaimReqToDt to set
     */
    public void setsClaimReqToDt(Date sClaimReqToDt) {
        this.sClaimReqToDt = sClaimReqToDt;
    }

    /**
     * @return the sClaimReqDt
     */
    public Date getsClaimReqDt() {
        return sClaimReqDt;
    }

    /**
     * @param sClaimReqDt the sClaimReqDt to set
     */
    public void setsClaimReqDt(Date sClaimReqDt) {
        this.sClaimReqDt = sClaimReqDt;
    }

    /**
     * @return the sClaimConfirmFromDt
     */
    public Date getsClaimConfirmFromDt() {
        return sClaimConfirmFromDt;
    }

    /**
     * @param sClaimConfirmFromDt the sClaimConfirmFromDt to set
     */
    public void setsClaimConfirmFromDt(Date sClaimConfirmFromDt) {
        this.sClaimConfirmFromDt = sClaimConfirmFromDt;
    }

    /**
     * @return the sClaimConfirmToDt
     */
    public Date getsClaimConfirmToDt() {
        return sClaimConfirmToDt;
    }

    /**
     * @param sClaimConfirmToDt the sClaimConfirmToDt to set
     */
    public void setsClaimConfirmToDt(Date sClaimConfirmToDt) {
        this.sClaimConfirmToDt = sClaimConfirmToDt;
    }
}