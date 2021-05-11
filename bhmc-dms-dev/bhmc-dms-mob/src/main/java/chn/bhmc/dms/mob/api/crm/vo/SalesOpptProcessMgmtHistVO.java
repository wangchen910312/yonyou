package chn.bhmc.dms.mob.api.crm.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;


/**
 * 판매기회 이력 VO
 *
 * @ClassName   : SalesOpptProcessMgmtHistVO
 * @Description : SalesOpptProcessMgmtHistVO
 * @author kyo jin lee
 * @since 2016.03.07.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016.03.07     kyo jin lee      Created First
 * </pre>
 */


public class SalesOpptProcessMgmtHistVO extends BaseVO {

       /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -7170335912020601589L;

    /**
        * 딜러코드
        **/
       private String dlrCd;

       /**
        * 일련번호
        **/
       private String seq;

       /**
        * 판매기회일련번호
        **/
       //SALE_OPPT_SEQ
       private String saleOpptSeq;

       /**
        * 리드상태내용
        **/
       //LEAD_STAT_CONT
       private String leadStatCont;

       /**
        * 담당자ID
        **/
       //MNG_SC_ID
       private String mngScId;
       private String mngScNm;

       /**
        * 시스템메시지내용
        **/
       //SYS_MESG_CONT
       private String sysMesgCont;

       /**
        * 등록자ID
        **/
       private String regUsrId;
       private String regUsrNm;

       /**
        * 등록일자
        **/
       @JsonDeserialize(using=JsonDateDeserializer.class)
       private Date regDt;

       /**
        * 수정자ID
        **/
       //UPDT_USR_ID
       private String updtUsrId;
       private String updtUsrNm;

       /**
        * 수정일자
        **/
       //UPDT_DT
       @JsonDeserialize(using=JsonDateDeserializer.class)
       private Date updtDt;

       private String befLeadStatCd;
       private String leadStatCd;
       private String befMngScId;

       private String befLeadStatNm;
       private String leadStatNm;
       private String befMngScNm;

       private String failCauCd;
       private String failCauCdNm;
       private String otherBrandCd;
       private String otherBrandCdNm;
       private String failCauReasonCont;

       private String purcSelCarlineCd;
       private String purcSelCarlineCdNm;
       private String purcSelModelCd;
       private String purcSelModelCdNm;

       /**
        * 예상구매일자
        **/
       //EXPC_PURC_DT
       @JsonDeserialize(using=JsonDateDeserializer.class)
       private Date expcPurcDt;

       private int expcDealPrc;
       private String infoTp;
       private String infoTpNm;
       private String holdTp;
       private String holdTpNm;
       private Integer holdDetlTpSeq;
       private String holdDetlTpSeqNm;

       private String intrCarlineCd;
       private String intrCarlineCdNm;
       private String intrModelCd;
       private String intrModelCdNm;

       private String intrColorCd;
       private String intrColorCdNm;

       private String contractNo;

       /**
        * 예약판매번호
        * BEFORE_NO
        */
       private String beforeNo;

       /**
        * 판매기회진행일련번호
        * C_SEQ
        */
       private String cSeq;

       /**
        * 의향차관
        * INTR_FSCP_MODTP_CD
        */
       private String intrFscpModtpCd;

       /**
        * 구매선택차관
        * PURC_FSCP_MODTP_CD
        */
       private String purcFscpModtpCd;

    /**
     * @return the holdDetlTpSeqNm
     */
    public String getHoldDetlTpSeqNm() {
        return holdDetlTpSeqNm;
    }

    /**
     * @param holdDetlTpSeqNm the holdDetlTpSeqNm to set
     */
    public void setHoldDetlTpSeqNm(String holdDetlTpSeqNm) {
        this.holdDetlTpSeqNm = holdDetlTpSeqNm;
    }

    /**
     * @return the purcSelCarlineCd
     */
    public String getPurcSelCarlineCd() {
        return purcSelCarlineCd;
    }

    /**
     * @param purcSelCarlineCd the purcSelCarlineCd to set
     */
    public void setPurcSelCarlineCd(String purcSelCarlineCd) {
        this.purcSelCarlineCd = purcSelCarlineCd;
    }

    /**
     * @return the purcSelCarlineCdNm
     */
    public String getPurcSelCarlineCdNm() {
        return purcSelCarlineCdNm;
    }

    /**
     * @param purcSelCarlineCdNm the purcSelCarlineCdNm to set
     */
    public void setPurcSelCarlineCdNm(String purcSelCarlineCdNm) {
        this.purcSelCarlineCdNm = purcSelCarlineCdNm;
    }

    /**
     * @return the purcSelModelCd
     */
    public String getPurcSelModelCd() {
        return purcSelModelCd;
    }

    /**
     * @param purcSelModelCd the purcSelModelCd to set
     */
    public void setPurcSelModelCd(String purcSelModelCd) {
        this.purcSelModelCd = purcSelModelCd;
    }

    /**
     * @return the purcSelModelCdNm
     */
    public String getPurcSelModelCdNm() {
        return purcSelModelCdNm;
    }

    /**
     * @param purcSelModelCdNm the purcSelModelCdNm to set
     */
    public void setPurcSelModelCdNm(String purcSelModelCdNm) {
        this.purcSelModelCdNm = purcSelModelCdNm;
    }

    /**
     * @return the expcDealPrc
     */
    public int getExpcDealPrc() {
        return expcDealPrc;
    }

    /**
     * @param expcDealPrc the expcDealPrc to set
     */
    public void setExpcDealPrc(int expcDealPrc) {
        this.expcDealPrc = expcDealPrc;
    }

    /**
     * @return the infoTp
     */
    public String getInfoTp() {
        return infoTp;
    }

    /**
     * @param infoTp the infoTp to set
     */
    public void setInfoTp(String infoTp) {
        this.infoTp = infoTp;
    }

    /**
     * @return the infoTpNm
     */
    public String getInfoTpNm() {
        return infoTpNm;
    }

    /**
     * @param infoTpNm the infoTpNm to set
     */
    public void setInfoTpNm(String infoTpNm) {
        this.infoTpNm = infoTpNm;
    }

    /**
     * @return the holdTp
     */
    public String getHoldTp() {
        return holdTp;
    }

    /**
     * @param holdTp the holdTp to set
     */
    public void setHoldTp(String holdTp) {
        this.holdTp = holdTp;
    }

    /**
     * @return the holdTpNm
     */
    public String getHoldTpNm() {
        return holdTpNm;
    }

    /**
     * @param holdTpNm the holdTpNm to set
     */
    public void setHoldTpNm(String holdTpNm) {
        this.holdTpNm = holdTpNm;
    }

    /**
     * @return the intrCarlineCd
     */
    public String getIntrCarlineCd() {
        return intrCarlineCd;
    }

    /**
     * @param intrCarlineCd the intrCarlineCd to set
     */
    public void setIntrCarlineCd(String intrCarlineCd) {
        this.intrCarlineCd = intrCarlineCd;
    }

    /**
     * @return the intrCarlineCdNm
     */
    public String getIntrCarlineCdNm() {
        return intrCarlineCdNm;
    }

    /**
     * @param intrCarlineCdNm the intrCarlineCdNm to set
     */
    public void setIntrCarlineCdNm(String intrCarlineCdNm) {
        this.intrCarlineCdNm = intrCarlineCdNm;
    }

    /**
     * @return the intrModelCd
     */
    public String getIntrModelCd() {
        return intrModelCd;
    }

    /**
     * @param intrModelCd the intrModelCd to set
     */
    public void setIntrModelCd(String intrModelCd) {
        this.intrModelCd = intrModelCd;
    }

    /**
     * @return the intrModelCdNm
     */
    public String getIntrModelCdNm() {
        return intrModelCdNm;
    }

    /**
     * @param intrModelCdNm the intrModelCdNm to set
     */
    public void setIntrModelCdNm(String intrModelCdNm) {
        this.intrModelCdNm = intrModelCdNm;
    }

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
     * @return the seq
     */
    public String getSeq() {
        return seq;
    }

    /**
     * @param seq the seq to set
     */
    public void setSeq(String seq) {
        this.seq = seq;
    }

    /**
     * @return the saleOpptSeq
     */
    public String getSaleOpptSeq() {
        return saleOpptSeq;
    }

    /**
     * @param saleOpptSeq the saleOpptSeq to set
     */
    public void setSaleOpptSeq(String saleOpptSeq) {
        this.saleOpptSeq = saleOpptSeq;
    }

    /**
     * @return the leadStatCont
     */
    public String getLeadStatCont() {
        return leadStatCont;
    }

    /**
     * @param leadStatCont the leadStatCont to set
     */
    public void setLeadStatCont(String leadStatCont) {
        this.leadStatCont = leadStatCont;
    }

    /**
     * @return the mngScId
     */
    public String getMngScId() {
        return mngScId;
    }

    /**
     * @param mngScId the mngScId to set
     */
    public void setMngScId(String mngScId) {
        this.mngScId = mngScId;
    }

    /**
     * @return the sysMesgCont
     */
    public String getSysMesgCont() {
        return sysMesgCont;
    }

    /**
     * @param sysMesgCont the sysMesgCont to set
     */
    public void setSysMesgCont(String sysMesgCont) {
        this.sysMesgCont = sysMesgCont;
    }

    /**
     * @return the regUsrId
     */
    public String getRegUsrId() {
        return regUsrId;
    }

    /**
     * @param regUsrId the regUsrId to set
     */
    public void setRegUsrId(String regUsrId) {
        this.regUsrId = regUsrId;
    }

    /**
     * @return the regDt
     */
    public Date getRegDt() {
        return regDt;
    }

    /**
     * @param regDt the regDt to set
     */
    public void setRegDt(Date regDt) {
        this.regDt = regDt;
    }

    /**
     * @return the updtUsrId
     */
    public String getUpdtUsrId() {
        return updtUsrId;
    }

    /**
     * @param updtUsrId the updtUsrId to set
     */
    public void setUpdtUsrId(String updtUsrId) {
        this.updtUsrId = updtUsrId;
    }

    /**
     * @return the updtDt
     */
    public Date getUpdtDt() {
        return updtDt;
    }

    /**
     * @param updtDt the updtDt to set
     */
    public void setUpdtDt(Date updtDt) {
        this.updtDt = updtDt;
    }

    /**
     * @return the mngScNm
     */
    public String getMngScNm() {
        return mngScNm;
    }

    /**
     * @param mngScNm the mngScNm to set
     */
    public void setMngScNm(String mngScNm) {
        this.mngScNm = mngScNm;
    }

    /**
     * @return the regUsrNm
     */
    public String getRegUsrNm() {
        return regUsrNm;
    }

    /**
     * @param regUsrNm the regUsrNm to set
     */
    public void setRegUsrNm(String regUsrNm) {
        this.regUsrNm = regUsrNm;
    }

    /**
     * @return the updtUsrNm
     */
    public String getUpdtUsrNm() {
        return updtUsrNm;
    }

    /**
     * @param updtUsrNm the updtUsrNm to set
     */
    public void setUpdtUsrNm(String updtUsrNm) {
        this.updtUsrNm = updtUsrNm;
    }

    /**
     * @return the befLeadStatCd
     */
    public String getBefLeadStatCd() {
        return befLeadStatCd;
    }

    /**
     * @param befLeadStatCd the befLeadStatCd to set
     */
    public void setBefLeadStatCd(String befLeadStatCd) {
        this.befLeadStatCd = befLeadStatCd;
    }

    /**
     * @return the leadStatCd
     */
    public String getLeadStatCd() {
        return leadStatCd;
    }

    /**
     * @param leadStatCd the leadStatCd to set
     */
    public void setLeadStatCd(String leadStatCd) {
        this.leadStatCd = leadStatCd;
    }

    /**
     * @return the befMngScId
     */
    public String getBefMngScId() {
        return befMngScId;
    }

    /**
     * @param befMngScId the befMngScId to set
     */
    public void setBefMngScId(String befMngScId) {
        this.befMngScId = befMngScId;
    }

    /**
     * @return the befLeadStatNm
     */
    public String getBefLeadStatNm() {
        return befLeadStatNm;
    }

    /**
     * @param befLeadStatNm the befLeadStatNm to set
     */
    public void setBefLeadStatNm(String befLeadStatNm) {
        this.befLeadStatNm = befLeadStatNm;
    }

    /**
     * @return the leadStatNm
     */
    public String getLeadStatNm() {
        return leadStatNm;
    }

    /**
     * @param leadStatNm the leadStatNm to set
     */
    public void setLeadStatNm(String leadStatNm) {
        this.leadStatNm = leadStatNm;
    }

    /**
     * @return the befMngScNm
     */
    public String getBefMngScNm() {
        return befMngScNm;
    }

    /**
     * @param befMngScNm the befMngScNm to set
     */
    public void setBefMngScNm(String befMngScNm) {
        this.befMngScNm = befMngScNm;
    }

    /**
     * @return the failCauCd
     */
    public String getFailCauCd() {
        return failCauCd;
    }

    /**
     * @param failCauCd the failCauCd to set
     */
    public void setFailCauCd(String failCauCd) {
        this.failCauCd = failCauCd;
    }

    /**
     * @return the otherBrandCd
     */
    public String getOtherBrandCd() {
        return otherBrandCd;
    }

    /**
     * @param otherBrandCd the otherBrandCd to set
     */
    public void setOtherBrandCd(String otherBrandCd) {
        this.otherBrandCd = otherBrandCd;
    }

    /**
     * @return the failCauReasonCont
     */
    public String getFailCauReasonCont() {
        return failCauReasonCont;
    }

    /**
     * @param failCauReasonCont the failCauReasonCont to set
     */
    public void setFailCauReasonCont(String failCauReasonCont) {
        this.failCauReasonCont = failCauReasonCont;
    }

    /**
     * @return the failCauCdNm
     */
    public String getFailCauCdNm() {
        return failCauCdNm;
    }

    /**
     * @param failCauCdNm the failCauCdNm to set
     */
    public void setFailCauCdNm(String failCauCdNm) {
        this.failCauCdNm = failCauCdNm;
    }

    /**
     * @return the otherBrandCdNm
     */
    public String getOtherBrandCdNm() {
        return otherBrandCdNm;
    }

    /**
     * @param otherBrandCdNm the otherBrandCdNm to set
     */
    public void setOtherBrandCdNm(String otherBrandCdNm) {
        this.otherBrandCdNm = otherBrandCdNm;
    }

    /**
     * @return the holdDetlTpSeq
     */
    public Integer getHoldDetlTpSeq() {
        return holdDetlTpSeq;
    }

    /**
     * @param holdDetlTpSeq the holdDetlTpSeq to set
     */
    public void setHoldDetlTpSeq(Integer holdDetlTpSeq) {
        this.holdDetlTpSeq = holdDetlTpSeq;
    }

    /**
     * @return the expcPurcDt
     */
    public Date getExpcPurcDt() {
        return expcPurcDt;
    }

    /**
     * @param expcPurcDt the expcPurcDt to set
     */
    public void setExpcPurcDt(Date expcPurcDt) {
        this.expcPurcDt = expcPurcDt;
    }

    /**
     * @return the intrColorCd
     */
    public String getIntrColorCd() {
        return intrColorCd;
    }

    /**
     * @param intrColorCd the intrColorCd to set
     */
    public void setIntrColorCd(String intrColorCd) {
        this.intrColorCd = intrColorCd;
    }

    /**
     * @return the intrColorCdNm
     */
    public String getIntrColorCdNm() {
        return intrColorCdNm;
    }

    /**
     * @param intrColorCdNm the intrColorCdNm to set
     */
    public void setIntrColorCdNm(String intrColorCdNm) {
        this.intrColorCdNm = intrColorCdNm;
    }

    /**
     * @return the contractNo
     */
    public String getContractNo() {
        return contractNo;
    }

    /**
     * @param contractNo the contractNo to set
     */
    public void setContractNo(String contractNo) {
        this.contractNo = contractNo;
    }

    /**
     * @return the beforeNo
     */
    public String getBeforeNo() {
        return beforeNo;
    }

    /**
     * @param beforeNo the beforeNo to set
     */
    public void setBeforeNo(String beforeNo) {
        this.beforeNo = beforeNo;
    }

    /**
     * @return the cSeq
     */
    public String getcSeq() {
        return cSeq;
    }

    /**
     * @param cSeq the cSeq to set
     */
    public void setcSeq(String cSeq) {
        this.cSeq = cSeq;
    }

    /**
     * @return the intrFscpModtpCd
     */
    public String getIntrFscpModtpCd() {
        return intrFscpModtpCd;
    }

    /**
     * @param intrFscpModtpCd the intrFscpModtpCd to set
     */
    public void setIntrFscpModtpCd(String intrFscpModtpCd) {
        this.intrFscpModtpCd = intrFscpModtpCd;
    }

    /**
     * @return the purcFscpModtpCd
     */
    public String getPurcFscpModtpCd() {
        return purcFscpModtpCd;
    }

    /**
     * @param purcFscpModtpCd the purcFscpModtpCd to set
     */
    public void setPurcFscpModtpCd(String purcFscpModtpCd) {
        this.purcFscpModtpCd = purcFscpModtpCd;
    }


}