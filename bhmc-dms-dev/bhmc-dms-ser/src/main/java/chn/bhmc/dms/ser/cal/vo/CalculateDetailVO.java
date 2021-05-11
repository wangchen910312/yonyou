package chn.bhmc.dms.ser.cal.vo;

import java.util.Date;

import org.hibernate.validator.constraints.NotEmpty;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CalculateDetailVO.java
 * @Description : 정산디테일 VO
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

public class CalculateDetailVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -7325462090670403418L;

    /**
    * 딜러코드
    **/
    private String dlrCd;

    private String roDocNo;

    /**
    * 정산문서번호
    **/
    private String calcDocNo;

    /**
    * 정산하위문서번호
    **/
    private String calcSubDocNo;

    /**
    * 지불유형
    **/
    @NotEmpty
    private String paymTp;

    /**
    * 지불자명
    **/
    @NotEmpty
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

    /**
    * 사전점검번호
    **/
    private Double npayAmt;

    private String paymRemark;

    /**
    * 정산문서번호
    **/
    private String rcvDocNo;

    /**
    * 정산하위문서번호
    **/
    private String rcvSubDocNo;

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
     * 정산금액
     **/
    private Double calcAmt;

    /**
     * 지불자코드
     **/
    private String paymUsrId;

    /**
     * 할인권한명
     **/
    private String dcPermNm;

    /**
     * 쿠폰번호
     **/
    private String cupnNo;

    /**
     * 쿠폰명칭
     **/
    private String cupnNm;

    /**
     * 캠페인명칭
     **/
    private String atvtTp;

    /**
     * 쿠폰가격
     **/
    private Double cupnAmt;

    /**
     * 쿠폰조정금액가격
     **/
    private Double cupnChangeAmt;

    /**
     * 쿠폰시작일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date cupnStartDt;

    /**
     * 쿠폰종료일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date cupnEndDt;

    /**
     * 쿠폰용도
     **/
    private String cupnUsage;

    /**
     * 쿠폰비고
     **/
    private String cupnRemark;
    
    
    /**
     * pos下单返回二维码url
     **/
    private String gotoUrl;
    
    /**
     * 订单id(聚合支付)
     **/
  	private String tradeId;
  	
  	private String payYn;
  	
  	
  	
  	/**
  	 * 卡券名称
  	 */
  	private String lanBinCardNo;
  	/**
  	 * 卡券类型
  	 */
  	private String lanBinCardType;
  	/**
  	 * 使用须知
  	 */
  	private String lanBinUseNotice;
  	/**
  	 * 卡券名称
  	 */
  	private String lanBinCardName;
  	/**
  	 * 卡券面额
  	 */
  	private Double lanBinCardAmount;
  	/**
  	 * 结算金额&索赔金额
  	 */
  	private Double lanBinCouponClaim;
  	/**
  	 * 调整金额
  	 */
  	private Double lanBinCouponAdju;
  	/**
  	 * 调整项
  	 */
  	private String cardAdjust;
  	/**
  	 * 有效日期
  	 */
  	@JsonDeserialize(using=JsonDateDeserializer.class)
  	private Date lanBinCardEffeDt;
  	
  	
  	
  	
  	
    public String getLanBinCardNo() {
		return lanBinCardNo;
	}

	public void setLanBinCardNo(String lanBinCardNo) {
		this.lanBinCardNo = lanBinCardNo;
	}

	public String getLanBinCardType() {
		return lanBinCardType;
	}

	public void setLanBinCardType(String lanBinCardType) {
		this.lanBinCardType = lanBinCardType;
	}

	public String getLanBinUseNotice() {
		return lanBinUseNotice;
	}

	public void setLanBinUseNotice(String lanBinUseNotice) {
		this.lanBinUseNotice = lanBinUseNotice;
	}

	public String getLanBinCardName() {
		return lanBinCardName;
	}

	public void setLanBinCardName(String lanBinCardName) {
		this.lanBinCardName = lanBinCardName;
	}

	public Double getLanBinCardAmount() {
		return lanBinCardAmount;
	}

	public void setLanBinCardAmount(Double lanBinCardAmount) {
		this.lanBinCardAmount = lanBinCardAmount;
	}

	public Double getLanBinCouponClaim() {
		return lanBinCouponClaim;
	}

	public void setLanBinCouponClaim(Double lanBinCouponClaim) {
		this.lanBinCouponClaim = lanBinCouponClaim;
	}

	public Double getLanBinCouponAdju() {
		return lanBinCouponAdju;
	}

	public void setLanBinCouponAdju(Double lanBinCouponAdju) {
		this.lanBinCouponAdju = lanBinCouponAdju;
	}

	public String getCardAdjust() {
		return cardAdjust;
	}

	public void setCardAdjust(String cardAdjust) {
		this.cardAdjust = cardAdjust;
	}

	public Date getLanBinCardEffeDt() {
		return lanBinCardEffeDt;
	}

	public void setLanBinCardEffeDt(Date lanBinCardEffeDt) {
		this.lanBinCardEffeDt = lanBinCardEffeDt;
	}

	public String getPayYn() {
		return payYn;
	}

	public void setPayYn(String payYn) {
		this.payYn = payYn;
	}

	public String getTradeId() {
		return tradeId;
	}

	public void setTradeId(String tradeId) {
		this.tradeId = tradeId;
	}

	public String getGotoUrl() {
		return gotoUrl;
	}

	public void setGotoUrl(String gotoUrl) {
		this.gotoUrl = gotoUrl;
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

    /**
     * @return the calcSubDocNo
     */
    public String getCalcSubDocNo() {
        return calcSubDocNo;
    }

    /**
     * @param calcSubDocNo the calcSubDocNo to set
     */
    public void setCalcSubDocNo(String calcSubDocNo) {
        this.calcSubDocNo = calcSubDocNo;
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
     * @return the calcAmt
     */
    public Double getCalcAmt() {
        return calcAmt;
    }

    /**
     * @param calcAmt the calcAmt to set
     */
    public void setCalcAmt(Double calcAmt) {
        this.calcAmt = calcAmt;
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
     * @return the cupnNm
     */
    public String getCupnNm() {
        return cupnNm;
    }

    /**
     * @param cupnNm the cupnNm to set
     */
    public void setCupnNm(String cupnNm) {
        this.cupnNm = cupnNm;
    }

    /**
     * @return the activityTp
     */
    public String getAtvtTp() {
        return atvtTp;
    }

    /**
     * @param activityTp the activityTp to set
     */
    public void setAtvtTp(String atvtTp) {
        this.atvtTp = atvtTp;
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
     * @return the cupnChangeAmt
     */
    public Double getCupnChangeAmt() {
        return cupnChangeAmt;
    }

    /**
     * @param cupnChangeAmt the cupnChangeAmt to set
     */
    public void setCupnChangeAmt(Double cupnChangeAmt) {
        this.cupnChangeAmt = cupnChangeAmt;
    }

    /**
     * @return the cupnStartDt
     */
    public Date getCupnStartDt() {
        return cupnStartDt;
    }

    /**
     * @param cupnStartDt the cupnStartDt to set
     */
    public void setCupnStartDt(Date cupnStartDt) {
        this.cupnStartDt = cupnStartDt;
    }

    /**
     * @return the cupnEndDt
     */
    public Date getCupnEndDt() {
        return cupnEndDt;
    }

    /**
     * @param cupnEndDt the cupnEndDt to set
     */
    public void setCupnEndDt(Date cupnEndDt) {
        this.cupnEndDt = cupnEndDt;
    }

    /**
     * @return the cupnUsage
     */
    public String getCupnUsage() {
        return cupnUsage;
    }

    /**
     * @param cupnUsage the cupnUsage to set
     */
    public void setCupnUsage(String cupnUsage) {
        this.cupnUsage = cupnUsage;
    }

    /**
     * @return the cupnRemark
     */
    public String getCupnRemark() {
        return cupnRemark;
    }

    /**
     * @param cupnRemark the cupnRemark to set
     */
    public void setCupnRemark(String cupnRemark) {
        this.cupnRemark = cupnRemark;
    }

}