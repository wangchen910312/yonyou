package chn.bhmc.dms.bat.crm.cso.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;


/**
 * 판매기회프로세스  VO
 *
 * @ClassName   : BatIfSalesOpptProcessMgmtVO
 * @Description : BatIfSalesOpptProcessMgmtVO
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


public class BatSalesOpptProcessMgmtHistVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 5696655513367872824L;

    /**
        * 딜러코드
        **/
       private  String        dlrCd;

       /**
        * 일련번호
        **/
       private  String        seq;

       /**
        * 판매기회일련번호
        **/
       //SALE_OPPT_SEQ
       private  String        saleOpptSeq;

       /**
        * 리드상태내용
        **/
       //LEAD_STAT_CONT
       private  String        leadStatCont;

       /**
        * 담당자ID
        **/
       //MNG_SC_ID
       private  String        mngScId;
       private  String        mngScNm;

       /**
        * 시스템메시지내용
        **/
       //SYS_MESG_CONT
       private  String        sysMesgCont;

       /**
        * 등록자ID
        **/
       private  String        regUsrId;
       private  String        regUsrNm;

       /**
        * 등록일자
        **/
       @JsonDeserialize(using=JsonDateDeserializer.class)
       private  Date          regDt;

       /**
        * 수정자ID
        **/
       //UPDT_USR_ID
       private  String        updtUsrId;
       private  String        updtUsrNm;

       /**
        * 수정일자
        **/
       //UPDT_DT
       @JsonDeserialize(using=JsonDateDeserializer.class)
       private  Date          updtDt;

       private String befLeadStatCd;
       private String leadStatCd;
       private String befMngScId;

       private String befLeadStatNm;
       private String leadStatNm;
       private String befMngScNm;

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

}