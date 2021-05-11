package chn.bhmc.dms.dply.spec.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.SearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : DeployHistorySearchVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Cheol Man Oh
 * @since 2016. 5. 17.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 17.     Cheol Man Oh     최초 생성
 * </pre>
 */

public class DeployHistorySearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -5847030124309500187L;

    /**
     * SPEC코드
     */
    private String sSpecCd;

    /**
     *
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sStartDt;

    /**
     *
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sEndDt;


    /**
    *
    */
   private String sDeployTpCd;

    /**
     *
     */
    private String sScheduleTpCd;

    /**
    *
    */
    private String sDeployVerNo;

    /**
    *
    */
    private String sDeployGrpId;

    /**
    *
    */
    private String sDlrCd;

    /**
    *
    */
    private String sDeployReqSeq;



    /**
     * @param sSpecCd the sSpecCd to set
     */
    public void setsSpecCd(String sSpecCd) {
        this.sSpecCd = sSpecCd;
    }

    /**
     * @return the sSpecCd
     */
    public String getsSpecCd() {
        return sSpecCd;
    }

    /**
     * @param sStartDt the sStartDt to set
     */
    public void setsStartDt(Date sStartDt) {
        this.sStartDt = sStartDt;
    }

    /**
     * @return the sStartDt
     */
    public Date getsStartDt() {
        return sStartDt;
    }

    /**
     * @param sEndDt the sEndDt to set
     */
    public void setsEndDt(Date sEndDt) {
        this.sEndDt = sEndDt;
    }

    /**
     * @return the sEndDt
     */
    public Date getsEndDt() {
        return sEndDt;
    }

    /**
     * @param sScheduleTpCd the sScheduleTpCd to set
     */
    public void setsScheduleTpCd(String sScheduleTpCd) {
        this.sScheduleTpCd = sScheduleTpCd;
    }

    /**
     * @return the sScheduleTpCd
     */
    public String getsScheduleTpCd() {
        return sScheduleTpCd;
    }

    /**
     * @param sDeployVerNo the sDeployVerNo to set
     */
    public void setsDeployVerNo(String sDeployVerNo) {
        this.sDeployVerNo = sDeployVerNo;
    }

    /**
     * @return the sDeployVerNo
     */
    public String getsDeployVerNo() {
        return sDeployVerNo;
    }

    /**
     * @param sDeployGrpId the sDeployGrpId to set
     */
    public void setsDeployGrpId(String sDeployGrpId) {
        this.sDeployGrpId = sDeployGrpId;
    }

    /**
     * @return the sDeployGrpId
     */
    public String getsDeployGrpId() {
        return sDeployGrpId;
    }

    /**
     * @param sDlrCd the sDlrCd to set
     */
    public void setsDlrCd(String sDlrCd) {
        this.sDlrCd = sDlrCd;
    }

    /**
     * @return the sDlrCd
     */
    public String getsDlrCd() {
        return sDlrCd;
    }

    /**
     * @param sDeployReqSeq the sDeployReqSeq to set
     */
    public void setsDeployReqSeq(String sDeployReqSeq) {
        this.sDeployReqSeq = sDeployReqSeq;
    }

    /**
     * @return the sDeployReqSeq
     */
    public String getsDeployReqSeq() {
        return sDeployReqSeq;
    }

    /**
     * @param sDeployTpCd the sDeployTpCd to set
     */
    public void setsDeployTpCd(String sDeployTpCd) {
        this.sDeployTpCd = sDeployTpCd;
    }

    /**
     * @return the sDeployTpCd
     */
    public String getsDeployTpCd() {
        return sDeployTpCd;
    }


}
