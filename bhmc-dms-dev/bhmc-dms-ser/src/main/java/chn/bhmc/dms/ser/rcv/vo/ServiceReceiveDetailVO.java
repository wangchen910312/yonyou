package chn.bhmc.dms.ser.rcv.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ServiceReceiveDetailVO.java
 * @Description : 수납디테일 VO
 * @author KyungMok Kim
 * @since 2016. 3. 19.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 19.    KyungMok Kim     최초 생성
 * </pre>
 */

public class ServiceReceiveDetailVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -7325462090670403418L;

    /**
    * 딜러코드
    **/
    private String dlrCd;

    /**
    * 정산문서번호
    **/
    private String rcvDocNo;

    /**
     * RO 유형
     */
    private String roTp;

    /**
     * RO NO
     */
    private String roDocNo;

    private String calcDocNo;

    /**
     * 라인번호
     **/
    private int lineNo;

    /**
    * 정산하위문서번호
    **/
    private String rcvSubDocNo;

    /**
    * 지불유형
    **/
    private String paymTp;

    /**
    * 지불자명
    **/
    private String paymUsrNm;

    /**
    * 지불기간
    **/
    private String paymPrid;

    /**
    * 지불방법
    **/
    private String paymMthCd;

    /**
    * 지불금액
    **/
    private Double paymAmt;

    private String paymRemark;

    /**
    * 수납금액
    **/
    private Double rcvAmt;

    /**
    * 수납완성일자
    **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date rcvCpltDt;

    /**
    * 미수금액
    **/
    private Double npayAmt;

    /**
    * 미수확인일자
    **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date npayChkDt;

    /**
    * 영수증번호
    **/
    private String rcptNo;

    /**
    * 영수증일자
    **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date rcptDt;

    /**
    * 수납비고
    **/
    private String rcvRemark;

    /**
     * 수납상태코드
     **/
    private String rcvStatCd;

    /**
     * 수납이력 상태명
     **/
    private String rcvHistStatNm;

    /**
    * 수납취소여부
    **/
    private String rcvCancYn;

    /**
    * 수납취소일자
    **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date rcvCancDt;

    /**
    * 수납취소ID
    **/
    private String rcvCancId;

    /**
    * 환불금액
    **/
    private Double refdAmt;

    /**
    * 환불일자
    **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date refdDt;

    /**
    * 환불담당자명
    **/
    private String refdPrsnNm;

    /**
    * 환불비고
    **/
    private String refdRemark;

    /**
     * 결재자코드
     **/
    private String paymCd;

    /**
     * 부품금액
     **/
    private Double parAmt;

    /**
     * 공임금액
     **/
    private Double lbrAmt;

    /**
     * 기타금액
     **/
    private Double etcAmt;

    /**
     * 영수증유형
     **/
    private String rcptTp;

    /**
     * 절사금액
     **/
    private Double wonUnitCutAmt;

    /**
     * 제로절사금액
     **/
    private Double demicPointCutAmt;

    /**
     * 할인권한코드
     **/
    private String dcPermCd;

    /**
     * 할인율
     **/
    private Double dcRate;

    /**
     * 할인금액
     **/
    private Double dcAmt;

    /**
     * 예치금액
     **/
    private Double balAmt;

    /**
     * 선수금액
     **/
    private Double preAmt;

    /**
     * 지불자코드
     **/
    private String paymUsrId;

    /**
     * 할인권한명
     **/
    private String dcPermNm;


    /**
     * 정산금액
     **/
    private double calcAmt;

    /**
     * 쿠폰번호
     **/
    private String cupnNo;

    /**
     * 쿠폰가격
     **/
    private Double cupnAmt;

    /**
     * 등록자명
     */
    private String regUsrNm;

    /**
     * 수납 환불여부
     */
    private String paymYn;

    private String carOwnerId;

    private String carRegNo;

    private String vinNo;

    /**
     * 수납 대상건수
     */
    private int rcvTotCnt;

    /**
     * 수납완료 건수
     */
    private int paymCnt;

    /**
     * 정산 수납완료 건수
     */
    private int calcPaymCnt;

    /**
     * 부품수납상태코드(04:수납완료, 05:수납취소)
     */
    private String ordStatCd;

    /**
     * 정비부품구분코드
     */
    private String serParDstinCd;

    /**
     * 합계금액(수납금액 - 환불금액)
     */
    private double realTotAmt;
    
    //聚合支付id
    private String tradeId;
    
    
    private String gotoUrl;
    
    
    private String payYn;
    
    //20191113 by wushibin 优惠金额、实收金额
    private double discountAmt;
    
    private double receivedAmt;
    
    //20200305 by wushibin 聚合支付类型的退款是否选择现金退款方式的标识字段
    
    private String isUseCash;
   
    
	public String getIsUseCash() {
		return isUseCash;
	}

	public void setIsUseCash(String isUseCash) {
		this.isUseCash = isUseCash;
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

	public String getPayYn() {
		return payYn;
	}

	public void setPayYn(String payYn) {
		this.payYn = payYn;
	}
    
    public String getGotoUrl() {
		return gotoUrl;
	}

	public void setGotoUrl(String gotoUrl) {
		this.gotoUrl = gotoUrl;
	}

	public String getTradeId() {
		return tradeId;
	}

	public void setTradeId(String tradeId) {
		this.tradeId = tradeId;
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
     * @return the rcvDocNo
     */
    public String getRcvDocNo() {
        return rcvDocNo;
    }

    /**
     * @param rcvDocNo the rcvDocNo to set
     */
    public void setRcvDocNo(String rcvDocNo) {
        this.rcvDocNo = rcvDocNo;
    }


    /**
     * @return the roTp
     */
    public String getRoTp() {
        return roTp;
    }

    /**
     * @param roTp the roTp to set
     */
    public void setRoTp(String roTp) {
        this.roTp = roTp;
    }

    /**
     * @return the roDocNo
     */
    public String getRoDocNo() {
        return roDocNo;
    }

    /**
     * @param roDocNo the roDocNo to set
     */
    public void setRoDocNo(String roDocNo) {
        this.roDocNo = roDocNo;
    }

    /**
     * @return the paymUsrId
     */
    public String getPaymUsrId() {
        return paymUsrId;
    }

    /**
     * @param paymUsrId the paymUsrId to set
     */
    public void setPaymUsrId(String paymUsrId) {
        this.paymUsrId = paymUsrId;
    }

    /**
     * @return the rcvSubDocNo
     */
    public String getRcvSubDocNo() {
        return rcvSubDocNo;
    }

    /**
     * @param rcvSubDocNo the rcvSubDocNo to set
     */
    public void setRcvSubDocNo(String rcvSubDocNo) {
        this.rcvSubDocNo = rcvSubDocNo;
    }

    /**
     * @return the paymTp
     */
    public String getPaymTp() {
        return paymTp;
    }

    /**
     * @param paymTp the paymTp to set
     */
    public void setPaymTp(String paymTp) {
        this.paymTp = paymTp;
    }

    /**
     * @return the paymUsrNm
     */
    public String getPaymUsrNm() {
        return paymUsrNm;
    }

    /**
     * @param paymUsrNm the paymUsrNm to set
     */
    public void setPaymUsrNm(String paymUsrNm) {
        this.paymUsrNm = paymUsrNm;
    }

    /**
     * @return the paymPrid
     */
    public String getPaymPrid() {
        return paymPrid;
    }

    /**
     * @param paymPrid the paymPrid to set
     */
    public void setPaymPrid(String paymPrid) {
        this.paymPrid = paymPrid;
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
     * @return the paymRemark
     */
    public String getPaymRemark() {
        return paymRemark;
    }

    /**
     * @param paymRemark the paymRemark to set
     */
    public void setPaymRemark(String paymRemark) {
        this.paymRemark = paymRemark;
    }

    /**
     * @return the rcvAmt
     */
    public Double getRcvAmt() {
        return rcvAmt;
    }

    /**
     * @param rcvAmt the rcvAmt to set
     */
    public void setRcvAmt(Double rcvAmt) {
        this.rcvAmt = rcvAmt;
    }

    /**
     * @return the rcvCpltDt
     */
    public Date getRcvCpltDt() {
        return rcvCpltDt;
    }

    /**
     * @param rcvCpltDt the rcvCpltDt to set
     */
    public void setRcvCpltDt(Date rcvCpltDt) {
        this.rcvCpltDt = rcvCpltDt;
    }

    /**
     * @return the npayAmt
     */
    public Double getNpayAmt() {
        return npayAmt;
    }

    /**
     * @param npayAmt the npayAmt to set
     */
    public void setNpayAmt(Double npayAmt) {
        this.npayAmt = npayAmt;
    }

    /**
     * @return the npayChkDt
     */
    public Date getNpayChkDt() {
        return npayChkDt;
    }

    /**
     * @param npayChkDt the npayChkDt to set
     */
    public void setNpayChkDt(Date npayChkDt) {
        this.npayChkDt = npayChkDt;
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
     * @return the rcvRemark
     */
    public String getRcvRemark() {
        return rcvRemark;
    }

    /**
     * @param rcvRemark the rcvRemark to set
     */
    public void setRcvRemark(String rcvRemark) {
        this.rcvRemark = rcvRemark;
    }

    /**
     * @return the rcvStatCd
     */
    public String getRcvStatCd() {
        return rcvStatCd;
    }

    /**
     * @param rcvStatCd the rcvStatCd to set
     */
    public void setRcvStatCd(String rcvStatCd) {
        this.rcvStatCd = rcvStatCd;
    }

    public String getRcvHistStatNm() {
        return rcvHistStatNm;
    }

    public void setRcvHistStatNm(String rcvHistStatNm) {
        this.rcvHistStatNm = rcvHistStatNm;
    }

    /**
     * @return the rcvCancYn
     */
    public String getRcvCancYn() {
        return rcvCancYn;
    }

    /**
     * @param rcvCancYn the rcvCancYn to set
     */
    public void setRcvCancYn(String rcvCancYn) {
        this.rcvCancYn = rcvCancYn;
    }

    /**
     * @return the rcvCancDt
     */
    public Date getRcvCancDt() {
        return rcvCancDt;
    }

    /**
     * @param rcvCancDt the rcvCancDt to set
     */
    public void setRcvCancDt(Date rcvCancDt) {
        this.rcvCancDt = rcvCancDt;
    }

    /**
     * @return the rcvCancId
     */
    public String getRcvCancId() {
        return rcvCancId;
    }

    /**
     * @param rcvCancId the rcvCancId to set
     */
    public void setRcvCancId(String rcvCancId) {
        this.rcvCancId = rcvCancId;
    }

    /**
     * @return the refdAmt
     */
    public Double getRefdAmt() {
        return refdAmt;
    }

    /**
     * @param refdAmt the refdAmt to set
     */
    public void setRefdAmt(Double refdAmt) {
        this.refdAmt = refdAmt;
    }

    /**
     * @return the refdDt
     */
    public Date getRefdDt() {
        return refdDt;
    }

    /**
     * @param refdDt the refdDt to set
     */
    public void setRefdDt(Date refdDt) {
        this.refdDt = refdDt;
    }

    /**
     * @return the refdPrsnNm
     */
    public String getRefdPrsnNm() {
        return refdPrsnNm;
    }

    /**
     * @param refdPrsnNm the refdPrsnNm to set
     */
    public void setRefdPrsnNm(String refdPrsnNm) {
        this.refdPrsnNm = refdPrsnNm;
    }

    /**
     * @return the refdRemark
     */
    public String getRefdRemark() {
        return refdRemark;
    }

    /**
     * @param refdRemark the refdRemark to set
     */
    public void setRefdRemark(String refdRemark) {
        this.refdRemark = refdRemark;
    }

    /**
     * @return the paymCd
     */
    public String getPaymCd() {
        return paymCd;
    }

    /**
     * @param paymCd the paymCd to set
     */
    public void setPaymCd(String paymCd) {
        this.paymCd = paymCd;
    }

    /**
     * @return the parAmt
     */
    public Double getParAmt() {
        return parAmt;
    }

    /**
     * @param parAmt the parAmt to set
     */
    public void setParAmt(Double parAmt) {
        this.parAmt = parAmt;
    }

    /**
     * @return the lbrAmt
     */
    public Double getLbrAmt() {
        return lbrAmt;
    }

    /**
     * @param lbrAmt the lbrAmt to set
     */
    public void setLbrAmt(Double lbrAmt) {
        this.lbrAmt = lbrAmt;
    }

    /**
     * @return the etcAmt
     */
    public Double getEtcAmt() {
        return etcAmt;
    }

    /**
     * @param etcAmt the etcAmt to set
     */
    public void setEtcAmt(Double etcAmt) {
        this.etcAmt = etcAmt;
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
     * @return the wonUnitCutAmt
     */
    public Double getWonUnitCutAmt() {
        return wonUnitCutAmt;
    }

    /**
     * @param wonUnitCutAmt the wonUnitCutAmt to set
     */
    public void setWonUnitCutAmt(Double wonUnitCutAmt) {
        this.wonUnitCutAmt = wonUnitCutAmt;
    }

    /**
     * @return the demicPointCutAmt
     */
    public Double getDemicPointCutAmt() {
        return demicPointCutAmt;
    }

    /**
     * @param demicPointCutAmt the demicPointCutAmt to set
     */
    public void setDemicPointCutAmt(Double demicPointCutAmt) {
        this.demicPointCutAmt = demicPointCutAmt;
    }

    /**
     * @return the dcPermCd
     */
    public String getDcPermCd() {
        return dcPermCd;
    }

    /**
     * @param dcPermCd the dcPermCd to set
     */
    public void setDcPermCd(String dcPermCd) {
        this.dcPermCd = dcPermCd;
    }

    /**
     * @return the dcRate
     */
    public Double getDcRate() {
        return dcRate;
    }

    /**
     * @param dcRate the dcRate to set
     */
    public void setDcRate(Double dcRate) {
        this.dcRate = dcRate;
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
     * @return the balAmt
     */
    public Double getBalAmt() {
        return balAmt;
    }

    /**
     * @param balAmt the balAmt to set
     */
    public void setBalAmt(Double balAmt) {
        this.balAmt = balAmt;
    }

    /**
     * @return the preAmt
     */
    public Double getPreAmt() {
        return preAmt;
    }

    /**
     * @param preAmt the preAmt to set
     */
    public void setPreAmt(Double preAmt) {
        this.preAmt = preAmt;
    }

    /**
     * @return the paymUsrId
     */
    public String getPaymUsrCd() {
        return paymUsrId;
    }

    /**
     * @param paymUsrId the paymUsrId to set
     */
    public void setPaymUsrCd(String paymUsrId) {
        this.paymUsrId = paymUsrId;
    }

    /**
     * @return the dcPermNm
     */
    public String getDcPermNm() {
        return dcPermNm;
    }

    /**
     * @param dcPermNm the dcPermNm to set
     */
    public void setDcPermNm(String dcPermNm) {
        this.dcPermNm = dcPermNm;
    }

    /**
     * @return the calcAmt
     */
    public double getCalcAmt() {
        return calcAmt;
    }

    /**
     * @param calcAmt the calcAmt to set
     */
    public void setCalcAmt(double calcAmt) {
        this.calcAmt = calcAmt;
    }

    /**
     * @return the cupnNo
     */
    public String getCupnNo() {
        return cupnNo;
    }

    /**
     * @param cupnNo the cupnNo to set
     */
    public void setCupnNo(String cupnNo) {
        this.cupnNo = cupnNo;
    }

    /**
     * @return the cupnAmt
     */
    public Double getCupnAmt() {
        return cupnAmt;
    }

    /**
     * @param cupnAmt the cupnAmt to set
     */
    public void setCupnAmt(Double cupnAmt) {
        this.cupnAmt = cupnAmt;
    }

    /**
     * @return the lineNo
     */
    public int getLineNo() {
        return lineNo;
    }

    /**
     * @param lineNo the lineNo to set
     */
    public void setLineNo(int lineNo) {
        this.lineNo = lineNo;
    }

    public String getRegUsrNm() {
        return regUsrNm;
    }

    public void setRegUsrNm(String regUsrNm) {
        this.regUsrNm = regUsrNm;
    }

    public String getPaymYn() {
        return paymYn;
    }

    public void setPaymYn(String paymYn) {
        this.paymYn = paymYn;
    }

    /**
     * @return the calcDocNo
     */
    public String getCalcDocNo() {
        return calcDocNo;
    }

    /**
     * @param calcDocNo the calcDocNo to set
     */
    public void setCalcDocNo(String calcDocNo) {
        this.calcDocNo = calcDocNo;
    }

    public String getCarOwnerId() {
        return carOwnerId;
    }

    public void setCarOwnerId(String carOwnerId) {
        this.carOwnerId = carOwnerId;
    }

    public String getCarRegNo() {
        return carRegNo;
    }

    public void setCarRegNo(String carRegNo) {
        this.carRegNo = carRegNo;
    }

    public String getVinNo() {
        return vinNo;
    }

    public void setVinNo(String vinNo) {
        this.vinNo = vinNo;
    }

    public int getRcvTotCnt() {
        return rcvTotCnt;
    }

    public void setRcvTotCnt(int rcvTotCnt) {
        this.rcvTotCnt = rcvTotCnt;
    }

    public int getPaymCnt() {
        return paymCnt;
    }

    public void setPaymCnt(int paymCnt) {
        this.paymCnt = paymCnt;
    }

    /**
     * @return the ordStatCd
     */
    public String getOrdStatCd() {
        return ordStatCd;
    }

    /**
     * @param ordStatCd the ordStatCd to set
     */
    public void setOrdStatCd(String ordStatCd) {
        this.ordStatCd = ordStatCd;
    }

    /**
     * @return the serParDstinCd
     */
    public String getSerParDstinCd() {
        return serParDstinCd;
    }

    /**
     * @param serParDstinCd the serParDstinCd to set
     */
    public void setSerParDstinCd(String serParDstinCd) {
        this.serParDstinCd = serParDstinCd;
    }

    public int getCalcPaymCnt() {
        return calcPaymCnt;
    }

    public void setCalcPaymCnt(int calcPaymCnt) {
        this.calcPaymCnt = calcPaymCnt;
    }

    /**
     * @return the realTotAmt
     */
    public double getRealTotAmt() {
        return realTotAmt;
    }

    /**
     * @param realTotAmt the realTotAmt to set
     */
    public void setRealTotAmt(double realTotAmt) {
        this.realTotAmt = realTotAmt;
    }

}