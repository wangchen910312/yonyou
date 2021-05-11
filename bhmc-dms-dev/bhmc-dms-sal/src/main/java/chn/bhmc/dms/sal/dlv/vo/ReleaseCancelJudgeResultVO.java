package chn.bhmc.dms.sal.dlv.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.SearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ReleaseCancelJudgeResultVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author kim yewon
 * @since 2016. 8. 12.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 8. 12.     Kim yewon             최초 생성
 *
 * </pre>
 */

public class ReleaseCancelJudgeResultVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -1206330084772359299L;

    private String dlrCd;                                     //딜러코드

    //집단판매헤더
    private String evalStatusCd;                              //심사상태

    private String monthlyFlag;                               //당월/이월 구분

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date startEvalDt;                                 //심사 시작일자

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date endEvalDt;                                   //심사 종료일자

    private String vinNo;                                     //VIN NO

    private String contractCustNo;                            //고객명

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
     * @return the evalStatusCd
     */
    public String getEvalStatusCd() {
        return evalStatusCd;
    }

    /**
     * @param evalStatusCd the evalStatusCd to set
     */
    public void setEvalStatusCd(String evalStatusCd) {
        this.evalStatusCd = evalStatusCd;
    }

    /**
     * @return the monthlyFlag
     */
    public String getMonthlyFlag() {
        return monthlyFlag;
    }

    /**
     * @param monthlyFlag the monthlyFlag to set
     */
    public void setMonthlyFlag(String monthlyFlag) {
        this.monthlyFlag = monthlyFlag;
    }

    /**
     * @return the startEvalDt
     */
    public Date getStartEvalDt() {
        return startEvalDt;
    }

    /**
     * @param startEvalDt the startEvalDt to set
     */
    public void setStartEvalDt(Date startEvalDt) {
        this.startEvalDt = startEvalDt;
    }

    /**
     * @return the endEvalDt
     */
    public Date getEndEvalDt() {
        return endEvalDt;
    }

    /**
     * @param endEvalDt the endEvalDt to set
     */
    public void setEndEvalDt(Date endEvalDt) {
        this.endEvalDt = endEvalDt;
    }

    /**
     * @return the vinNo
     */
    public String getVinNo() {
        return vinNo;
    }

    /**
     * @param vinNo the vinNo to set
     */
    public void setVinNo(String vinNo) {
        this.vinNo = vinNo;
    }

    /**
     * @return the contractCustNo
     */
    public String getContractCustNo() {
        return contractCustNo;
    }

    /**
     * @param contractCustNo the contractCustNo to set
     */
    public void setContractCustNo(String contractCustNo) {
        this.contractCustNo = contractCustNo;
    }
}
