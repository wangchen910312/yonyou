package chn.bhmc.dms.dply.spec.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : DeployReportMasterVO.java
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

public class DeployReportMasterVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -7852859986654351947L;

    private String deployReqSeq             ;

    private String deployReqTpCd            ;

    private String specCd                   ;

    private String deployVerNo              ;

    private String deployGrpId              ;

    private String dlrCd                    ;

    private int    deploySeq                ;

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date   deployReqEndDt           ;

    private String deployResTmoutYn         ;

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date   deployResTmoutProcDt     ;

    private String deployResReceiveYn       ;

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date   deployResReceiveDt       ;

    private String deployRsltCd             ;

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date   deployResSendReceiveDt   ;

    private String dbFlashbackYn            ;

    private String flashbackDt              ;

    private String deployRsltDisp           ;

    /**
     * @param deployReqSeq the deployReqSeq to set
     */
    public void setDeployReqSeq(String deployReqSeq) {
        this.deployReqSeq = deployReqSeq;
    }

    /**
     * @return the deployReqSeq
     */
    public String getDeployReqSeq() {
        return deployReqSeq;
    }

    /**
     * @param deployReqTpCd the deployReqTpCd to set
     */
    public void setDeployReqTpCd(String deployReqTpCd) {
        this.deployReqTpCd = deployReqTpCd;
    }

    /**
     * @return the deployReqTpCd
     */
    public String getDeployReqTpCd() {
        return deployReqTpCd;
    }

    /**
     * @param specCd the specCd to set
     */
    public void setSpecCd(String specCd) {
        this.specCd = specCd;
    }

    /**
     * @return the specCd
     */
    public String getSpecCd() {
        return specCd;
    }

    /**
     * @param deployVerNo the deployVerNo to set
     */
    public void setDeployVerNo(String deployVerNo) {
        this.deployVerNo = deployVerNo;
    }

    /**
     * @return the deployVerNo
     */
    public String getDeployVerNo() {
        return deployVerNo;
    }

    /**
     * @param deployGrpId the deployGrpId to set
     */
    public void setDeployGrpId(String deployGrpId) {
        this.deployGrpId = deployGrpId;
    }

    /**
     * @return the deployGrpId
     */
    public String getDeployGrpId() {
        return deployGrpId;
    }

    /**
     * @param dlrCd the dlrCd to set
     */
    public void setDlrCd(String dlrCd) {
        this.dlrCd = dlrCd;
    }

    /**
     * @return the dlrCd
     */
    public String getDlrCd() {
        return dlrCd;
    }

    /**
     * @param deploySeq the deploySeq to set
     */
    public void setDeploySeq(int deploySeq) {
        this.deploySeq = deploySeq;
    }

    /**
     * @return the deploySeq
     */
    public int getDeploySeq() {
        return deploySeq;
    }

    /**
     * @param deployReqEndDt the deployReqEndDt to set
     */
    public void setDeployReqEndDt(Date deployReqEndDt) {
        this.deployReqEndDt = deployReqEndDt;
    }

    /**
     * @return the deployReqEndDt
     */
    public Date getDeployReqEndDt() {
        return deployReqEndDt;
    }

    /**
     * @param deployResTmoutYn the deployResTmoutYn to set
     */
    public void setDeployResTmoutYn(String deployResTmoutYn) {
        this.deployResTmoutYn = deployResTmoutYn;
    }

    /**
     * @return the deployResTmoutYn
     */
    public String getDeployResTmoutYn() {
        return deployResTmoutYn;
    }

    /**
     * @param deployResTmoutProcDt the deployResTmoutProcDt to set
     */
    public void setDeployResTmoutProcDt(Date deployResTmoutProcDt) {
        this.deployResTmoutProcDt = deployResTmoutProcDt;
    }

    /**
     * @return the deployResTmoutProcDt
     */
    public Date getDeployResTmoutProcDt() {
        return deployResTmoutProcDt;
    }

    /**
     * @param deployResReceiveYn the deployResReceiveYn to set
     */
    public void setDeployResReceiveYn(String deployResReceiveYn) {
        this.deployResReceiveYn = deployResReceiveYn;
    }

    /**
     * @return the deployResReceiveYn
     */
    public String getDeployResReceiveYn() {
        return deployResReceiveYn;
    }

    /**
     * @param deployResReceiveDt the deployResReceiveDt to set
     */
    public void setDeployResReceiveDt(Date deployResReceiveDt) {
        this.deployResReceiveDt = deployResReceiveDt;
    }

    /**
     * @return the deployResReceiveDt
     */
    public Date getDeployResReceiveDt() {
        return deployResReceiveDt;
    }

    /**
     * @param deployRsltCd the deployRsltCd to set
     */
    public void setDeployRsltCd(String deployRsltCd) {
        this.deployRsltCd = deployRsltCd;
    }

    /**
     * @return the deployRsltCd
     */
    public String getDeployRsltCd() {
        return deployRsltCd;
    }

    /**
     * @param deployResSendReceiveDt the deployResSendReceiveDt to set
     */
    public void setDeployResSendReceiveDt(Date deployResSendReceiveDt) {
        this.deployResSendReceiveDt = deployResSendReceiveDt;
    }

    /**
     * @return the deployResSendReceiveDt
     */
    public Date getDeployResSendReceiveDt() {
        return deployResSendReceiveDt;
    }

    /**
     * @param dbFlashbackYn the dbFlashbackYn to set
     */
    public void setDbFlashbackYn(String dbFlashbackYn) {
        this.dbFlashbackYn = dbFlashbackYn;
    }

    /**
     * @return the dbFlashbackYn
     */
    public String getDbFlashbackYn() {
        return dbFlashbackYn;
    }

    /**
     * @param flashbackDt the flashbackDt to set
     */
    public void setFlashbackDt(String flashbackDt) {
        this.flashbackDt = flashbackDt;
    }

    /**
     * @return the flashbackDt
     */
    public String getFlashbackDt() {
        return flashbackDt;
    }

    /**
     * @param deployRsltDisp the deployRsltDisp to set
     */
    public void setDeployRsltDisp(String deployRsltDisp) {
        this.deployRsltDisp = deployRsltDisp;
    }

    /**
     * @return the deployRsltDisp
     */
    public String getDeployRsltDisp() {
        return deployRsltDisp;
    }

}
