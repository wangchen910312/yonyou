package chn.bhmc.dms.dply.cmm.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : DeployGroupDealerForDashboardVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Cheol Man Oh
 * @since 2016. 6. 17.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 6. 17.     Cheol Man Oh     최초 생성
 * </pre>
 */

public class DeployGroupDealerForDashboardVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 9170027026969248339L;

    private String dlrCd               ;

    private String dlrNm               ;

    private int    deployProcCnt       ;

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date   lastDeployProcDt    ;

    private String deployReqEndYn      ;

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date   deployResReceiveDt  ;

    private String deployRsltCd        ;

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
     * @param dlrNm the dlrNm to set
     */
    public void setDlrNm(String dlrNm) {
        this.dlrNm = dlrNm;
    }

    /**
     * @return the dlrNm
     */
    public String getDlrNm() {
        return dlrNm;
    }

    /**
     * @param deployProcCnt the deployProcCnt to set
     */
    public void setDeployProcCnt(int deployProcCnt) {
        this.deployProcCnt = deployProcCnt;
    }

    /**
     * @return the deployProcCnt
     */
    public int getDeployProcCnt() {
        return deployProcCnt;
    }

    /**
     * @param lastDeployProcDt the lastDeployProcDt to set
     */
    public void setLastDeployProcDt(Date lastDeployProcDt) {
        this.lastDeployProcDt = lastDeployProcDt;
    }

    /**
     * @return the lastDeployProcDt
     */
    public Date getLastDeployProcDt() {
        return lastDeployProcDt;
    }

    /**
     * @param deployReqEndYn the deployReqEndYn to set
     */
    public void setDeployReqEndYn(String deployReqEndYn) {
        this.deployReqEndYn = deployReqEndYn;
    }

    /**
     * @return the deployReqEndYn
     */
    public String getDeployReqEndYn() {
        return deployReqEndYn;
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

}
