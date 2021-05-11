package chn.bhmc.dms.crm.cif.vo;

import java.util.Date;

import org.hibernate.validator.constraints.NotEmpty;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 *
 * @ClassName   : CustChargeMstVO.java
 * @Description : 고객 충전 VO
 * @author liu jing
 * @since 2017. 1. 16.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 1. 16.     liu jing               최초 생성
 * </pre>
 */

public class CustChargeHistVO extends BaseVO{


    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 7918775254018645256L;



    /**
     * DLR_CD
     * 딜러 CD
     * (필수) 없으면 사용자 dlrcd 사용
     **/
    private  String     dlrCd;

    /**
     * CUST_NO
     * 고객 번호
     * (필수)
     **/
    private  String     custNo;

    /**
     * SOUR_TP
     * CRM361
     * (필수)
     **/
    private  String     sourTp;

    /**
     * CHR_TP
     *  + 또는 -
     * (필수)
     **/
    private  String     chrTp;

    /**
     * PAYM_MTH_CD
     * 공통코드 SER061 확인
     * (필수)
     *
     **/
    private  String     paymMthCd;

    /**
     * PAYM_AMT
     * 충전 또는 사용 금액
     * (필수)
     **/
    private  Double     paymAmt;

    /**
     * RCPT_TP
     * 영수증 유형
     * (필수 아님)
     **/
    private  String     rcptTp;

    /**
     * RCPT_NO
     * 영수증 번호
     * (필수 아님)
     **/
    private  String     rcptNo;

    /**
     * VIN_NO
     * 있으면 놓음
     * (필수 아님)
     **/
    private  String     vinNo;

    /**
     * CAR_REG_NO
     * 있으면 놓음
     * (필수 아님)
     **/
    private  String     carRegNo;
    /*
     * 사용처
     */
    private String useTp;

    /*
     * 사용번호
     */
    private String useNum;


    private  Double     totUseAmt;
    private Double totChrAmt;  //총 충전 금액
    private  Double     ableAmt; //가용 금액
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date       rcptDt;
    private String chrTpNm;
    private  String     remark;
    private  String     refKeyNo;
    private  String     regUsrId;
    private  String     regUsrNm;
    @NotEmpty
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date       regDt;
    private  String     updtUsrId;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date       updtDt;
    private  String     custNm;
    private  int        chrSeq;
    private  String     refTableNm;

    /**
     * @param custNm the custNm to set
     */
    public void setCustNm(String custNm) {
        this.custNm = custNm;
    }

    /**
     * @return the custNm
     */
    public String getCustNm() {
        return custNm;
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
     * @return the custNo
     */
    public String getCustNo() {
        return custNo;
    }

    /**
     * @param custNo the custNo to set
     */
    public void setCustNo(String custNo) {
        this.custNo = custNo;
    }

    /**
     * @return the chrSeq
     */
    public int getChrSeq() {
        return chrSeq;
    }

    /**
     * @param chrSeq the chrSeq to set
     */
    public void setChrSeq(int chrSeq) {
        this.chrSeq = chrSeq;
    }

    /**
     * @return the sourTp
     */
    public String getSourTp() {
        return sourTp;
    }

    /**
     * @param sourTp the sourTp to set
     */
    public void setSourTp(String sourTp) {
        this.sourTp = sourTp;
    }

    /**
     * @return the chrTp
     */
    public String getChrTp() {
        return chrTp;
    }

    /**
     * @param chrTp the chrTp to set
     */
    public void setChrTp(String chrTp) {
        this.chrTp = chrTp;
    }

    /**
     * @return the paymMthCd
     */
    public String getPaymMthCd() {
        return paymMthCd;
    }

    /**
     * @param paymMthCd the paymMthCd to set
     */
    public void setPaymMthCd(String paymMthCd) {
        this.paymMthCd = paymMthCd;
    }

    /**
     * @return the paymAmt
     */
    public Double getPaymAmt() {
        return paymAmt;
    }

    /**
     * @param paymAmt the paymAmt to set
     */
    public void setPaymAmt(Double paymAmt) {
        this.paymAmt = paymAmt;
    }

    /**
     * @return the rcptTp
     */
    public String getRcptTp() {
        return rcptTp;
    }

    /**
     * @param rcptTp the rcptTp to set
     */
    public void setRcptTp(String rcptTp) {
        this.rcptTp = rcptTp;
    }

    /**
     * @return the rcptNo
     */
    public String getRcptNo() {
        return rcptNo;
    }

    /**
     * @param rcptNo the rcptNo to set
     */
    public void setRcptNo(String rcptNo) {
        this.rcptNo = rcptNo;
    }

    /**
     * @return the rcptDt
     */
    public Date getRcptDt() {
        return rcptDt;
    }

    /**
     * @param rcptDt the rcptDt to set
     */
    public void setRcptDt(Date rcptDt) {
        this.rcptDt = rcptDt;
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
     * @return the carRegNo
     */
    public String getCarRegNo() {
        return carRegNo;
    }

    /**
     * @param carRegNo the carRegNo to set
     */
    public void setCarRegNo(String carRegNo) {
        this.carRegNo = carRegNo;
    }

    /**
     * @return the remark
     */
    public String getRemark() {
        return remark;
    }

    /**
     * @param remark the remark to set
     */
    public void setRemark(String remark) {
        this.remark = remark;
    }

    /**
     * @return the refKeyNo
     */
    public String getRefKeyNo() {
        return refKeyNo;
    }

    /**
     * @param refKeyNo the refKeyNo to set
     */
    public void setRefKeyNo(String refKeyNo) {
        this.refKeyNo = refKeyNo;
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
     * @return the ableAmt
     */
    public Double getAbleAmt() {
        return ableAmt;
    }

    /**
     * @param ableAmt the ableAmt to set
     */
    public void setAbleAmt(Double ableAmt) {
        this.ableAmt = ableAmt;
    }

    /**
     * @return the totChrAmt
     */
    public Double getTotChrAmt() {
        return totChrAmt;
    }

    /**
     * @param totChrAmt the totChrAmt to set
     */
    public void setTotChrAmt(Double totChrAmt) {
        this.totChrAmt = totChrAmt;
    }

    /**
     * @return the totUseAmt
     */
    public Double getTotUseAmt() {
        return totUseAmt;
    }

    /**
     * @param totUseAmt the totUseAmt to set
     */
    public void setTotUseAmt(Double totUseAmt) {
        this.totUseAmt = totUseAmt;
    }

    /**
     * @return the refTableNm
     */
    public String getRefTableNm() {
        return refTableNm;
    }

    /**
     * @param refTableNm the refTableNm to set
     */
    public void setRefTableNm(String refTableNm) {
        this.refTableNm = refTableNm;
    }


    /**
     * @param chrTpNm the chrTpNm to set
     */
    public void setChrTpNm(String chrTpNm) {
        this.chrTpNm = chrTpNm;
    }

    /**
     * @return the chrTpNm
     */
    public String getChrTpNm() {
        return chrTpNm;
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
     * @param useNum the useNum to set
     */
    public void setUseNum(String useNum) {
        this.useNum = useNum;
    }

    /**
     * @return the useNum
     */
    public String getUseNum() {
        return useNum;
    }

    /**
     * @param useTp the useTp to set
     */
    public void setUseTp(String useTp) {
        this.useTp = useTp;
    }

    /**
     * @return the useTp
     */
    public String getUseTp() {
        return useTp;
    }



}
