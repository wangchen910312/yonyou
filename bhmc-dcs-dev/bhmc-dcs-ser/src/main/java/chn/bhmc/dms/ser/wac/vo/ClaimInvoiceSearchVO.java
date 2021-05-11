package chn.bhmc.dms.ser.wac.vo;


import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.SearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;
/**
 * 
 *<p>Title:结算单实体类</p>
 * @author wangc
 * @param 
 * @return
 */
public class ClaimInvoiceSearchVO extends SearchVO {
    /**
	 * 
	 */
	private static final long serialVersionUID = 2704923873693366670L;
	/**
	 * 经销商id
	 */
	private String sdlrCd;
	/**
	 * 经销商名字
	 */
	private String sdlrNm;
	/**
	 * 索赔结算单信息
	 */
	private String sinvcNo;
	/**
     * 开票状态 01：未开票  02：已开票 03：已退票
     */
    private String sreceiptTp;

    /**
     * 快递公司
     */
    private String sexpsCmpNm;

    /**
     * 快递状态   01：未邮寄 02：已邮寄 03：车厂接收  04：退票接收  05：未接收
     */
    private String strsfTp;

    /**
     * 快递单号
     */
    private String strsfNo;

    /**
     * 快递备注
     */
    private String sremark;

    /**
     * 寄件人
     */
    private String ssenderNm;

    /**
     * 收件人
     */
    private String srecipNm;

    /**
     * 寄件人联系电话
     */
    private String ssenderTelno;

    /**
     * 收件人联系电话
     */
    private String srecipTelno;

    /**
     * 寄件人地址
     */
    private String ssenderAddr;

    /**
     * 收件人地址
     */
    private String srecipAddr;

    /**
     * 汇(收)款状态  01：未汇款 02：已汇款 03：已收款
     */
    private String spaymTp;

    /**
     * 汇款日期
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date spaymDt;

    /**
     * 收款日期
     */
    private Date srcvCpltDt;

    /**
     * 退票次数
     */
    private int sfailCnt;

    /**
     * 退票备注
     */
    private String sfailMsg;

    /**
     * null
     */
    private String sfailRemark;

    /**
     * 录入日期
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sregDt;

    /**
     * 录入人
     */
    private String sregUsrId;

    /**
     * 修改日期
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date supdtDt;

    /**
     * 修改人
     */
    private String supdtUsrId;
    
    
    /**
     * 结算报表年月日开始时间
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sinvcsFromDt;
    
    /**
     * 结算报表年月日结束时间
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sinvcsToDt;

	public String getSdlrCd() {
		return sdlrCd;
	}

	public void setSdlrCd(String sdlrCd) {
		this.sdlrCd = sdlrCd;
	}

	public String getSinvcNo() {
		return sinvcNo;
	}

	public void setSinvcNo(String sinvcNo) {
		this.sinvcNo = sinvcNo;
	}

	public String getSreceiptTp() {
		return sreceiptTp;
	}

	public void setSreceiptTp(String sreceiptTp) {
		this.sreceiptTp = sreceiptTp;
	}

	public String getSexpsCmpNm() {
		return sexpsCmpNm;
	}

	public void setSexpsCmpNm(String sexpsCmpNm) {
		this.sexpsCmpNm = sexpsCmpNm;
	}

	public String getStrsfTp() {
		return strsfTp;
	}

	public void setStrsfTp(String strsfTp) {
		this.strsfTp = strsfTp;
	}

	public String getStrsfNo() {
		return strsfNo;
	}

	public void setStrsfNo(String strsfNo) {
		this.strsfNo = strsfNo;
	}

	public String getSremark() {
		return sremark;
	}

	public void setSremark(String sremark) {
		this.sremark = sremark;
	}

	public String getSsenderNm() {
		return ssenderNm;
	}

	public void setSsenderNm(String ssenderNm) {
		this.ssenderNm = ssenderNm;
	}

	public String getSrecipNm() {
		return srecipNm;
	}

	public void setSrecipNm(String srecipNm) {
		this.srecipNm = srecipNm;
	}

	public String getSsenderTelno() {
		return ssenderTelno;
	}

	public void setSsenderTelno(String ssenderTelno) {
		this.ssenderTelno = ssenderTelno;
	}

	public String getSrecipTelno() {
		return srecipTelno;
	}

	public void setSrecipTelno(String srecipTelno) {
		this.srecipTelno = srecipTelno;
	}

	public String getSsenderAddr() {
		return ssenderAddr;
	}

	public void setSsenderAddr(String ssenderAddr) {
		this.ssenderAddr = ssenderAddr;
	}

	public String getSrecipAddr() {
		return srecipAddr;
	}

	public void setSrecipAddr(String srecipAddr) {
		this.srecipAddr = srecipAddr;
	}

	public String getSpaymTp() {
		return spaymTp;
	}

	public void setSpaymTp(String spaymTp) {
		this.spaymTp = spaymTp;
	}

	public Date getSpaymDt() {
		return spaymDt;
	}

	public void setSpaymDt(Date spaymDt) {
		this.spaymDt = spaymDt;
	}

	public Date getSrcvCpltDt() {
		return srcvCpltDt;
	}

	public void setSrcvCpltDt(Date srcvCpltDt) {
		this.srcvCpltDt = srcvCpltDt;
	}

	public int getSfailCnt() {
		return sfailCnt;
	}

	public void setSfailCnt(int sfailCnt) {
		this.sfailCnt = sfailCnt;
	}

	public String getSfailMsg() {
		return sfailMsg;
	}

	public void setSfailMsg(String sfailMsg) {
		this.sfailMsg = sfailMsg;
	}

	public String getSfailRemark() {
		return sfailRemark;
	}

	public void setSfailRemark(String sfailRemark) {
		this.sfailRemark = sfailRemark;
	}

	public Date getSregDt() {
		return sregDt;
	}

	public void setSregDt(Date sregDt) {
		this.sregDt = sregDt;
	}

	public String getSregUsrId() {
		return sregUsrId;
	}

	public void setSregUsrId(String sregUsrId) {
		this.sregUsrId = sregUsrId;
	}

	public Date getSupdtDt() {
		return supdtDt;
	}

	public void setSupdtDt(Date supdtDt) {
		this.supdtDt = supdtDt;
	}

	public String getSupdtUsrId() {
		return supdtUsrId;
	}

	public void setSupdtUsrId(String supdtUsrId) {
		this.supdtUsrId = supdtUsrId;
	}

	public Date getSinvcsFromDt() {
		return sinvcsFromDt;
	}

	public void setSinvcsFromDt(Date sinvcsFromDt) {
		this.sinvcsFromDt = sinvcsFromDt;
	}

	public Date getSinvcsToDt() {
		return sinvcsToDt;
	}

	public void setSinvcsToDt(Date sinvcsToDt) {
		this.sinvcsToDt = sinvcsToDt;
	}

	public String getSdlrNm() {
		return sdlrNm;
	}

	public void setSdlrNm(String sdlrNm) {
		this.sdlrNm = sdlrNm;
	}
    
}