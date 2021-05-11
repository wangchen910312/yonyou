package chn.bhmc.dms.sal.fin.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : PayInfoVO
 * @Description : 수납관리 VO
 * @author Kim Jin Suk
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

   })
public class PayInfoVO extends BaseVO{

    /**
     * Statements
     * (long)serialVersionUID
     **/
    private static final long serialVersionUID = -6264687821823221935L;

     /**
     * 딜러코드
     **/
    private  String         dlrCd;

    /**
     * 수납문서번호
     **/
    private  String         finDocNo;

    /**
     * 관련업무
     **/
    //JOB_TP
    private  String         jobTp;
    private  String         jobTpNm;

    private  String         contractStatCd;
    private  String         goodsStatCd;
    private  String         incStatCd;
    private  String         beforeStatCd;

    /**
     * 관련업무계약번호
     **/
    //JOB_CONTRACT_NO
    private  String         jobContractNo;

    /**
     * VIN번호
     **/
    //VIN_NO
    private  String         vinNo;

    /**
     * 정산유형
     **/
    //ACCOUNTS_TP
    private  String         accountsTp;

    /**
     * 정산여부(완성여부)
     **/
    private  String         compYn;
    private  String         compYnNm;

    /**
     * 정산완료일
     **/
    //COMP_DT
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date           compDt;

    /**
     * 최종 수납일자
     **/
    //RCT_DT
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date           rctDt;

    /**
     * 고객유형
     **/
    private  String         custTp;

    /**
     * 고객번호
     **/
    //CUST_NO
    private  String         custNo;

    /**
     * 고객이름
     **/
    //CUST_NM
    private  String         custNm;
    private  String         payCustNm;

    /**
     * 판매인번호
     **/
    //MANAGE_EMP_NO
    private  String         manageEmpNo;

    /**
     * 지불상태
     **/
    //PAYMENT_TP
    private  String         paymentTp;
    private  String         paymentTpNm;

    /**
     * 발생금액
     **/
    //REAL_PAY_AMT
    private  Double         realPayAmt;

    /**
     * 최종정산금액
     **/
    //TOT_PAY_AMT
    private  Double         totPayAmt;

    /**
     * 할인금액
     **/
    //TOT_DC_AMT
    private  Double         totDcAmt;

    /**
     * 처리금액(에누리)
     **/
    //PRO_AMT
    private  Double         proAmt;

    /**
     * 미수금액
     **/
    //RECV_AMT
    private  Double         recvAmt;

    /**
     * 초과금액
     **/
    //OVER_AMT
    private  Double         overAmt;

    /**
     * 판매인
     **/
    private  String         saleEmpNo;
    private  String         saleEmpNm;

    /**
     * 영수증 필요여부
     **/
    //RECP_YN
    private  String         recpYn;
    private  String         recpYnNm;

    /**
     * 영수증 출력일자
     **/
    //RECP_DT
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date           recpDt;

    /**
     * 업무상태코드
     **/
    private  String         jobStatCd;

    /**
     * 업무상태
     **/
    private  String         jobStatNm;

    /**
     * 멤버십 번호
     **/
    private  String         membershipNo;

    /**
     * 영수증번호
     **/
    private  String         receiptNo;

    /**
     * 영수증일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date           receiptIssDt;

    /**
     * (계약)실제차량금액
     **/
    private  double         realCarAmt;

    /**
     * (계약)용품금액
     **/
    private  double         goodsAmt;

    /**
     * (계약)보험료
     **/
    private  double         incAmt;

    /**
     * (계약)금융
     **/
    private  double         fincAmt;

    /**
     * (계약)중고차치환
     **/
    private  double         sbstAmt;

    /**
     * (계약)할인가격
     **/
    private  double         dcAmt;

    /**
     * (계약)포인트금액
     **/
    private  double         pointAmt;

    /**
     * (계약)대행료
     **/
    private  double         aapAmt;

    /**
     * (계약)예판가
     **/
    private  double         reservContAmt;

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
     * @return the jobTpNm
     */
    public String getJobTpNm() {
        return jobTpNm;
    }

    /**
     * @param jobTpNm the jobTpNm to set
     */
    public void setJobTpNm(String jobTpNm) {
        this.jobTpNm = jobTpNm;
    }

    /**
     * @return the contractStatCd
     */
    public String getContractStatCd() {
        return contractStatCd;
    }

    /**
     * @param contractStatCd the contractStatCd to set
     */
    public void setContractStatCd(String contractStatCd) {
        this.contractStatCd = contractStatCd;
    }

    /**
     * @return the goodsStatCd
     */
    public String getGoodsStatCd() {
        return goodsStatCd;
    }

    /**
     * @param goodsStatCd the goodsStatCd to set
     */
    public void setGoodsStatCd(String goodsStatCd) {
        this.goodsStatCd = goodsStatCd;
    }

    /**
     * @return the incStatCd
     */
    public String getIncStatCd() {
        return incStatCd;
    }

    /**
     * @param incStatCd the incStatCd to set
     */
    public void setIncStatCd(String incStatCd) {
        this.incStatCd = incStatCd;
    }

    /**
     * @return the beforeStatCd
     */
    public String getBeforeStatCd() {
        return beforeStatCd;
    }

    /**
     * @param beforeStatCd the beforeStatCd to set
     */
    public void setBeforeStatCd(String beforeStatCd) {
        this.beforeStatCd = beforeStatCd;
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
     * @return the accountsTp
     */
    public String getAccountsTp() {
        return accountsTp;
    }

    /**
     * @param accountsTp the accountsTp to set
     */
    public void setAccountsTp(String accountsTp) {
        this.accountsTp = accountsTp;
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
     * @return the compYnNm
     */
    public String getCompYnNm() {
        return compYnNm;
    }

    /**
     * @param compYnNm the compYnNm to set
     */
    public void setCompYnNm(String compYnNm) {
        this.compYnNm = compYnNm;
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
     * @return the compDt
     */
    public Date getCompDt() {
        return compDt;
    }

    /**
     * @param compDt the compDt to set
     */
    public void setCompDt(Date compDt) {
        this.compDt = compDt;
    }

    /**
     * @return the custTp
     */
    public String getCustTp() {
        return custTp;
    }

    /**
     * @param custTp the custTp to set
     */
    public void setCustTp(String custTp) {
        this.custTp = custTp;
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
     * @return the manageEmpNo
     */
    public String getManageEmpNo() {
        return manageEmpNo;
    }

    /**
     * @param manageEmpNo the manageEmpNo to set
     */
    public void setManageEmpNo(String manageEmpNo) {
        this.manageEmpNo = manageEmpNo;
    }

    /**
     * @return the payCustNm
     */
    public String getPayCustNm() {
        return payCustNm;
    }

    /**
     * @param payCustNm the payCustNm to set
     */
    public void setPayCustNm(String payCustNm) {
        this.payCustNm = payCustNm;
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
     * @return the paymentTpNm
     */
    public String getPaymentTpNm() {
        return paymentTpNm;
    }

    /**
     * @param paymentTpNm the paymentTpNm to set
     */
    public void setPaymentTpNm(String paymentTpNm) {
        this.paymentTpNm = paymentTpNm;
    }

    /**
     * @return the realPayAmt
     */
    public Double getRealPayAmt() {
        return realPayAmt;
    }

    /**
     * @param realPayAmt the realPayAmt to set
     */
    public void setRealPayAmt(Double realPayAmt) {
        this.realPayAmt = realPayAmt;
    }

    /**
     * @return the totPayAmt
     */
    public Double getTotPayAmt() {
        return totPayAmt;
    }

    /**
     * @param totPayAmt the totPayAmt to set
     */
    public void setTotPayAmt(Double totPayAmt) {
        this.totPayAmt = totPayAmt;
    }

    /**
     * @return the totDcAmt
     */
    public Double getTotDcAmt() {
        return totDcAmt;
    }

    /**
     * @param totDcAmt the totDcAmt to set
     */
    public void setTotDcAmt(Double totDcAmt) {
        this.totDcAmt = totDcAmt;
    }

    /**
     * @return the proAmt
     */
    public Double getProAmt() {
        return proAmt;
    }

    /**
     * @param proAmt the proAmt to set
     */
    public void setProAmt(Double proAmt) {
        this.proAmt = proAmt;
    }

    /**
     * @return the recvAmt
     */
    public Double getRecvAmt() {
        return recvAmt;
    }

    /**
     * @param recvAmt the recvAmt to set
     */
    public void setRecvAmt(Double recvAmt) {
        this.recvAmt = recvAmt;
    }

    /**
     * @return the overAmt
     */
    public Double getOverAmt() {
        return overAmt;
    }

    /**
     * @param overAmt the overAmt to set
     */
    public void setOverAmt(Double overAmt) {
        this.overAmt = overAmt;
    }

    /**
     * @return the saleEmpNo
     */
    public String getSaleEmpNo() {
        return saleEmpNo;
    }

    /**
     * @param saleEmpNo the saleEmpNo to set
     */
    public void setSaleEmpNo(String saleEmpNo) {
        this.saleEmpNo = saleEmpNo;
    }

    /**
     * @return the saleEmpNm
     */
    public String getSaleEmpNm() {
        return saleEmpNm;
    }

    /**
     * @param saleEmpNm the saleEmpNm to set
     */
    public void setSaleEmpNm(String saleEmpNm) {
        this.saleEmpNm = saleEmpNm;
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
     * @return the jobStatCd
     */
    public String getJobStatCd() {
        return jobStatCd;
    }

    /**
     * @param jobStatCd the jobStatCd to set
     */
    public void setJobStatCd(String jobStatCd) {
        this.jobStatCd = jobStatCd;
    }

    /**
     * @return the jobStatNm
     */
    public String getJobStatNm() {
        return jobStatNm;
    }

    /**
     * @param jobStatNm the jobStatNm to set
     */
    public void setJobStatNm(String jobStatNm) {
        this.jobStatNm = jobStatNm;
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
     * @return the receiptNo
     */
    public String getReceiptNo() {
        return receiptNo;
    }

    /**
     * @param receiptNo the receiptNo to set
     */
    public void setReceiptNo(String receiptNo) {
        this.receiptNo = receiptNo;
    }

    /**
     * @return the receiptIssDt
     */
    public Date getReceiptIssDt() {
        return receiptIssDt;
    }

    /**
     * @param receiptIssDt the receiptIssDt to set
     */
    public void setReceiptIssDt(Date receiptIssDt) {
        this.receiptIssDt = receiptIssDt;
    }

    /**
     * @return the realCarAmt
     */
    public double getRealCarAmt() {
        return realCarAmt;
    }

    /**
     * @param realCarAmt the realCarAmt to set
     */
    public void setRealCarAmt(double realCarAmt) {
        this.realCarAmt = realCarAmt;
    }

    /**
     * @return the goodsAmt
     */
    public double getGoodsAmt() {
        return goodsAmt;
    }

    /**
     * @param goodsAmt the goodsAmt to set
     */
    public void setGoodsAmt(double goodsAmt) {
        this.goodsAmt = goodsAmt;
    }

    /**
     * @return the incAmt
     */
    public double getIncAmt() {
        return incAmt;
    }

    /**
     * @param incAmt the incAmt to set
     */
    public void setIncAmt(double incAmt) {
        this.incAmt = incAmt;
    }

    /**
     * @return the fincAmt
     */
    public double getFincAmt() {
        return fincAmt;
    }

    /**
     * @param fincAmt the fincAmt to set
     */
    public void setFincAmt(double fincAmt) {
        this.fincAmt = fincAmt;
    }

    /**
     * @return the sbstAmt
     */
    public double getSbstAmt() {
        return sbstAmt;
    }

    /**
     * @param sbstAmt the sbstAmt to set
     */
    public void setSbstAmt(double sbstAmt) {
        this.sbstAmt = sbstAmt;
    }

    /**
     * @return the dcAmt
     */
    public double getDcAmt() {
        return dcAmt;
    }

    /**
     * @param dcAmt the dcAmt to set
     */
    public void setDcAmt(double dcAmt) {
        this.dcAmt = dcAmt;
    }

    /**
     * @return the pointAmt
     */
    public double getPointAmt() {
        return pointAmt;
    }

    /**
     * @param pointAmt the pointAmt to set
     */
    public void setPointAmt(double pointAmt) {
        this.pointAmt = pointAmt;
    }

    /**
     * @return the aapAmt
     */
    public double getAapAmt() {
        return aapAmt;
    }

    /**
     * @param aapAmt the aapAmt to set
     */
    public void setAapAmt(double aapAmt) {
        this.aapAmt = aapAmt;
    }

    /**
     * @return the reservContAmt
     */
    public double getReservContAmt() {
        return reservContAmt;
    }

    /**
     * @param reservContAmt the reservContAmt to set
     */
    public void setReservContAmt(double reservContAmt) {
        this.reservContAmt = reservContAmt;
    }

    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }
}