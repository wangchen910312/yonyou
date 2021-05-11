package chn.bhmc.dms.sal.fin.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;


/**
 * @ClassName   : PayInfoDetailVO
 * @Description : 수납detail 관리 VO
 * @author Kang Seok Han
 * @since 2017.01.09.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author           description
 *  ===========    =============    ===========================
 *  2017.01.09.    Kim Jin Suk           최초 생성
 * </pre>
 */
@ValidDescriptor({
     @ValidField(field="dlrCd"         , mesgKey="sal.lbl.dlrCd")
    ,@ValidField(field="finDocNo"      , mesgKey="sal.lbl.finDocNo")
    ,@ValidField(field="seq"           , mesgKey="sal.lbl.seq")
   })
public class PayInfoDetailVO extends BaseVO{
    /**
     * Statements
     * (long)serialVersionUID 
     */
    private static final long serialVersionUID = -1458213928994059696L;
    
    /**
     * 업무 계약번호
     **/
    private  String    jobContractNo;
    
    /**
     * 딜러코드       
     **/
    private  String     dlrCd;     
     
    /**
     * 수납문서번호     
     **/
    private  String     finDocNo;  
     
    /**
     * 순번         
     **/
    private  int        seq;       
    
    /**
     * 순번
     **/
    private  int        rseq;

    /**
     * 환불여부
     **/
    private  String     canYn;
    
    /**
     * 입출금여부      
     **/
    //COL_TP
    private  String     colTp;     
    
    /**
     * 입출금여부명
     **/
    private  String     colTpNm;

    /**
     * 수납일자       
     **/
    //RCT_DT
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date       rctDt;     
     
    /**
     * 영수증발행여부
     */
    private  String     recpYn;
    
    /**
     * 영수증발행여부명
     **/
    private  String     recpYnNm;

    /**
     * 영수증번호
     */
    private  String     recpSeq;
    
    /**
     * 영수증발행일
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date     recpDt;
    
    /**
     * 수납방식       
     **/
    //RCT_TP
    private  String     rctTp;     
     
    /**
     * 수납방식명
     **/
    private  String     rctTpNm;
    
    /**
     * 은행코드
     **/
    //BANK_TP
    private  String     bankTp;
    
    /**
     * 은행정보명       
     **/
    //BANK_TP
    private  String     bankTpNm;
     
    /**
     * 입금자        
     **/
    //CUST_NM
    private  String     custNm;    
     
    /**
     * 정산금액(입/출금액)
     **/
    //PAY_AMT
    private  Double     payAmt;    
     
    /**
     * 할인금액       
     **/
    //DC_AMT
    private  Double     dcAmt;     
     
    /**
     * 정산인        
     **/
    private  String     payEmpNo;
    private  String     payEmpNm;
    
    /**
     * 환불번호       
     **/
    //CANCLE_SEQ
    private  int        cancleSeq; 
     
    /**
     * 비고         
     **/
    //REMARK
    private  String     remark;

    /**
     * 정산유형
     **/
    private  String     payTp;
    
    /**
     * 정산유형명
     **/
    private  String     payTpNm;
    
    /**
     * 포인트요율
     **/
    private  double     pointRule;
    /**
     * 포인트금액
     **/
    private  double     pointVal;
    /**
     * 쿠폰발행번호
     */
    private  double     publiNo;
    
    /**
     * 맴버십 번호
     **/
    private  String     membershipNo;
    /**
     * 멤버십카드번호
     **/
    private  String     membershipCardNo;
    /**
     * 최대사용가능 포인트
     **/
    private  double     membershipPointUseMaxPoint;
    
    /**
     *  업무유형
     */
    private String      jobTp; 
    
    // Header Re Update Data
    private  String paymentTp;      // 지불상태
    private  String compYn;         // 정산여부
    private  double proAmt;         // 처리금액(에누리) null
    
    //聚合支付pos下单id
    private String tradeId;
    
    //20191111优惠金额、实收金额 by wushibin
    private double discountAmt;
    
    private double receivedAmt;
    
    //20200304 添加聚合支付类型退款是是否使用现金进行退款  by wushibin
    private String isUserCash;
    

	public String getIsUserCash() {
		return isUserCash;
	}

	public void setIsUserCash(String isUserCash) {
		this.isUserCash = isUserCash;
	}

	public double getDiscountAmt() {
		return discountAmt;
	}

	public void setDiscountAmt(double discountAmt) {
		this.discountAmt = discountAmt;
	}

	public double getReceivedAmt() {
		return receivedAmt;
	}

	public void setReceivedAmt(double receivedAmt) {
		this.receivedAmt = receivedAmt;
	}

	public String getTradeId() {
		return tradeId;
	}

	public void setTradeId(String tradeId) {
		this.tradeId = tradeId;
	}

	/**
     * @return the jobContractNo
     */
    public String getJobContractNo() {
        return jobContractNo;
    }

    /**
     * @param jobContractNo the jobContractNo to set
     */
    public void setJobContractNo(String jobContractNo) {
        this.jobContractNo = jobContractNo;
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
     * @return the finDocNo
     */
    public String getFinDocNo() {
        return finDocNo;
    }

    /**
     * @param finDocNo the finDocNo to set
     */
    public void setFinDocNo(String finDocNo) {
        this.finDocNo = finDocNo;
    }

    /**
     * @return the seq
     */
    public int getSeq() {
        return seq;
    }

    /**
     * @param seq the seq to set
     */
    public void setSeq(int seq) {
        this.seq = seq;
    }

    /**
     * @return the rseq
     */
    public int getRseq() {
        return rseq;
    }

    /**
     * @param rseq the rseq to set
     */
    public void setRseq(int rseq) {
        this.rseq = rseq;
    }

    /**
     * @return the canYn
     */
    public String getCanYn() {
        return canYn;
    }

    /**
     * @param canYn the canYn to set
     */
    public void setCanYn(String canYn) {
        this.canYn = canYn;
    }

    /**
     * @return the colTp
     */
    public String getColTp() {
        return colTp;
    }

    /**
     * @param colTp the colTp to set
     */
    public void setColTp(String colTp) {
        this.colTp = colTp;
    }

    /**
     * @return the colTpNm
     */
    public String getColTpNm() {
        return colTpNm;
    }

    /**
     * @param colTpNm the colTpNm to set
     */
    public void setColTpNm(String colTpNm) {
        this.colTpNm = colTpNm;
    }

    /**
     * @return the rctDt
     */
    public Date getRctDt() {
        return rctDt;
    }

    /**
     * @param rctDt the rctDt to set
     */
    public void setRctDt(Date rctDt) {
        this.rctDt = rctDt;
    }

    /**
     * @return the recpYn
     */
    public String getRecpYn() {
        return recpYn;
    }

    /**
     * @param recpYn the recpYn to set
     */
    public void setRecpYn(String recpYn) {
        this.recpYn = recpYn;
    }

    /**
     * @return the recpYnNm
     */
    public String getRecpYnNm() {
        return recpYnNm;
    }

    /**
     * @param recpYnNm the recpYnNm to set
     */
    public void setRecpYnNm(String recpYnNm) {
        this.recpYnNm = recpYnNm;
    }

    /**
     * @return the recpSeq
     */
    public String getRecpSeq() {
        return recpSeq;
    }

    /**
     * @param recpSeq the recpSeq to set
     */
    public void setRecpSeq(String recpSeq) {
        this.recpSeq = recpSeq;
    }

    /**
     * @return the recpDt
     */
    public Date getRecpDt() {
        return recpDt;
    }

    /**
     * @param recpDt the recpDt to set
     */
    public void setRecpDt(Date recpDt) {
        this.recpDt = recpDt;
    }

    /**
     * @return the rctTp
     */
    public String getRctTp() {
        return rctTp;
    }

    /**
     * @param rctTp the rctTp to set
     */
    public void setRctTp(String rctTp) {
        this.rctTp = rctTp;
    }

    /**
     * @return the rctTpNm
     */
    public String getRctTpNm() {
        return rctTpNm;
    }

    /**
     * @param rctTpNm the rctTpNm to set
     */
    public void setRctTpNm(String rctTpNm) {
        this.rctTpNm = rctTpNm;
    }

    /**
     * @return the bankTp
     */
    public String getBankTp() {
        return bankTp;
    }

    /**
     * @param bankTp the bankTp to set
     */
    public void setBankTp(String bankTp) {
        this.bankTp = bankTp;
    }
    
    /**
     * @return the bankTpNm
     */
    public String getBankTpNm() {
        return bankTpNm;
    }

    /**
     * @param bankTpNm the bankTpNm to set
     */
    public void setBankTpNm(String bankTpNm) {
        this.bankTpNm = bankTpNm;
    }

    /**
     * @return the custNm
     */
    public String getCustNm() {
        return custNm;
    }

    /**
     * @param custNm the custNm to set
     */
    public void setCustNm(String custNm) {
        this.custNm = custNm;
    }

    /**
     * @return the payAmt
     */
    public Double getPayAmt() {
        return payAmt;
    }

    /**
     * @param payAmt the payAmt to set
     */
    public void setPayAmt(Double payAmt) {
        this.payAmt = payAmt;
    }

    /**
     * @return the dcAmt
     */
    public Double getDcAmt() {
        return dcAmt;
    }

    /**
     * @param dcAmt the dcAmt to set
     */
    public void setDcAmt(Double dcAmt) {
        this.dcAmt = dcAmt;
    }

    /**
     * @return the payEmpNo
     */
    public String getPayEmpNo() {
        return payEmpNo;
    }

    /**
     * @param payEmpNo the payEmpNo to set
     */
    public void setPayEmpNo(String payEmpNo) {
        this.payEmpNo = payEmpNo;
    }

    /**
     * @return the payEmpNm
     */
    public String getPayEmpNm() {
        return payEmpNm;
    }

    /**
     * @param payEmpNm the payEmpNm to set
     */
    public void setPayEmpNm(String payEmpNm) {
        this.payEmpNm = payEmpNm;
    }

    /**
     * @return the cancleSeq
     */
    public int getCancleSeq() {
        return cancleSeq;
    }

    /**
     * @param cancleSeq the cancleSeq to set
     */
    public void setCancleSeq(int cancleSeq) {
        this.cancleSeq = cancleSeq;
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
     * @return the payTp
     */
    public String getPayTp() {
        return payTp;
    }

    /**
     * @param payTp the payTp to set
     */
    public void setPayTp(String payTp) {
        this.payTp = payTp;
    }

    /**
     * @return the payTpNm
     */
    public String getPayTpNm() {
        return payTpNm;
    }

    /**
     * @param payTpNm the payTpNm to set
     */
    public void setPayTpNm(String payTpNm) {
        this.payTpNm = payTpNm;
    }
    
    /**
     * @return the pointRule
     */
    public double getPointRule() {
        return pointRule;
    }

    /**
     * @param pointRule the pointRule to set
     */
    public void setPointRule(double pointRule) {
        this.pointRule = pointRule;
    }

    /**
     * @return the pointVal
     */
    public double getPointVal() {
        return pointVal;
    }

    /**
     * @param pointVal the pointVal to set
     */
    public void setPointVal(double pointVal) {
        this.pointVal = pointVal;
    }

    /**
     * @return the publiNo
     */
    public double getPubliNo() {
        return publiNo;
    }

    /**
     * @param publiNo the publiNo to set
     */
    public void setPubliNo(double publiNo) {
        this.publiNo = publiNo;
    }

    /**
     * @return the membershipNo
     */
    public String getMembershipNo() {
        return membershipNo;
    }

    /**
     * @param membershipNo the membershipNo to set
     */
    public void setMembershipNo(String membershipNo) {
        this.membershipNo = membershipNo;
    }

    /**
     * @return the membershipCardNo
     */
    public String getMembershipCardNo() {
        return membershipCardNo;
    }

    /**
     * @param membershipCardNo the membershipCardNo to set
     */
    public void setMembershipCardNo(String membershipCardNo) {
        this.membershipCardNo = membershipCardNo;
    }

    /**
     * @return the membershipPointUseMaxPoint
     */
    public double getMembershipPointUseMaxPoint() {
        return membershipPointUseMaxPoint;
    }

    /**
     * @param membershipPointUseMaxPoint the membershipPointUseMaxPoint to set
     */
    public void setMembershipPointUseMaxPoint(double membershipPointUseMaxPoint) {
        this.membershipPointUseMaxPoint = membershipPointUseMaxPoint;
    }
    
    /**
     * @return the jobTp
     */
    public String getJobTp() {
        return jobTp;
    }

    /**
     * @param jobTp the jobTp to set
     */
    public void setJobTp(String jobTp) {
        this.jobTp = jobTp;
    }

    /**
     * @return the paymentTp
     */
    public String getPaymentTp() {
        return paymentTp;
    }

    /**
     * @param paymentTp the paymentTp to set
     */
    public void setPaymentTp(String paymentTp) {
        this.paymentTp = paymentTp;
    }

    /**
     * @return the compYn
     */
    public String getCompYn() {
        return compYn;
    }

    /**
     * @param compYn the compYn to set
     */
    public void setCompYn(String compYn) {
        this.compYn = compYn;
    }
    
    /**
     * @return the proAmt
     */
    public double getProAmt() {
        return proAmt;
    }

    /**
     * @param proAmt the proAmt to set
     */
    public void setProAmt(double proAmt) {
        this.proAmt = proAmt;
    }

    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }
}