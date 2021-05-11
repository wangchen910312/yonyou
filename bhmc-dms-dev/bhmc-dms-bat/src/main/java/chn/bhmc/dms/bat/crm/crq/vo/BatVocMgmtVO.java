package chn.bhmc.dms.bat.crm.crq.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * 마케팅 캠패인  VO
 *
 * @ClassName   : MarketingCampaignVO.java
 * @Description : MarketingCampaignVO Class
 * @author hyoung jun an
 * @since 2016.03.04.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016.03.04     hyoung jun an    최초 생성
 * </pre>
 */

public class BatVocMgmtVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -1147237320428771906L;

    private String dlrCd;              // 딜러코드
    private String bhmcYn;             // bhmcYn 여부
    private String vocNo;              // VOC번호
    private String vocStatCd;           // <spring:message code="global.lbl.statNm" /><!-- 상태 -->
    private String vocTpCd;         // <spring:message code="global.lbl.type" /></span> <!-- 유형 -->
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date evalAllocDt;    //<spring:message code="global.lbl.evalAllocDt" /><!-- 심사 배정시간 -->
    private int alramHm;    //<spring:message code="global.lbl.evalAllocDt" /><!-- 심사 배정시간 -->
    private String pprocId;
    private String pprocNm;
    
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
     * @return the bhmcYn
     */
    public String getBhmcYn() {
        return bhmcYn;
    }
    /**
     * @param bhmcYn the bhmcYn to set
     */
    public void setBhmcYn(String bhmcYn) {
        this.bhmcYn = bhmcYn;
    }
    /**
     * @return the vocNo
     */
    public String getVocNo() {
        return vocNo;
    }
    /**
     * @param vocNo the vocNo to set
     */
    public void setVocNo(String vocNo) {
        this.vocNo = vocNo;
    }
    /**
     * @return the vocStatCd
     */
    public String getVocStatCd() {
        return vocStatCd;
    }
    /**
     * @param vocStatCd the vocStatCd to set
     */
    public void setVocStatCd(String vocStatCd) {
        this.vocStatCd = vocStatCd;
    }
    /**
     * @return the vocTpCd
     */
    public String getVocTpCd() {
        return vocTpCd;
    }
    /**
     * @param vocTpCd the vocTpCd to set
     */
    public void setVocTpCd(String vocTpCd) {
        this.vocTpCd = vocTpCd;
    }
    /**
     * @return the evalAllocDt
     */
    public Date getEvalAllocDt() {
        return evalAllocDt;
    }
    /**
     * @param evalAllocDt the evalAllocDt to set
     */
    public void setEvalAllocDt(Date evalAllocDt) {
        this.evalAllocDt = evalAllocDt;
    }
    /**
     * @return the alramHm
     */
    public int getAlramHm() {
        return alramHm;
    }
    /**
     * @param alramHm the alramHm to set
     */
    public void setAlramHm(int alramHm) {
        this.alramHm = alramHm;
    }
    /**
     * @return the pprocId
     */
    public String getPprocId() {
        return pprocId;
    }
    /**
     * @param pprocId the pprocId to set
     */
    public void setPprocId(String pprocId) {
        this.pprocId = pprocId;
    }
    /**
     * @return the pprocNm
     */
    public String getPprocNm() {
        return pprocNm;
    }
    /**
     * @param pprocNm the pprocNm to set
     */
    public void setPprocNm(String pprocNm) {
        this.pprocNm = pprocNm;
    }

}