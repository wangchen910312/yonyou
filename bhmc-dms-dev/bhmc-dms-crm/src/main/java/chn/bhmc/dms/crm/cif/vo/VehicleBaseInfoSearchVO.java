package chn.bhmc.dms.crm.cif.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.SearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName : VehicleBaseInfoSearchVO.java
 * @Description :车辆基础画面查询
 * @author Jia Ming
 * @since 2019. 1. 9.
 * @version 1.0
 * @see
 * @Modification Information
 * 
 *               <pre>
 *     since     author             description
 *  ===========    =============    ===========================
 *  2019. 1. 9.     Jia Ming        车辆基础画面查询
 * </pre>
 */

public class VehicleBaseInfoSearchVO extends SearchVO {

	/**
	 * Statements (long)serialVersionUID
	 */
	private static final long serialVersionUID = -4494616822760201888L;

	/**
	 * 车辆识别码
	 */
	private String sVinNo;

	/**
	 * 车种
	 */
	private String sCarlineCd;

	/**
	 * 车牌号码
	 */
	private String sCarRegNo;
	
	/**
	 * 店代码
	 */
	private String sDlrCd;

	/**
	 * CUST_SALE_DT 零售日期 From
	 */
	@JsonDeserialize(using = JsonDateDeserializer.class)
	private Date sCustFromSaveDt;

	/**
	 * CUST_SALE_DT 零售日期 TO
	 */
	@JsonDeserialize(using = JsonDateDeserializer.class)
	private Date sCustToSaveDt;

	/**
	 * 车辆品牌 CAR_BRAND_CD
	 */
	private String sCarBrandCd;

	/**
	 * 累计行驶里程
	 */
	private String sCarRunDistVal;

	/**
	 * 保修结束日期
	 */
	@JsonDeserialize(using = JsonDateDeserializer.class)
	private Date sWrrntFromEndDt;
	@JsonDeserialize(using = JsonDateDeserializer.class)
	private Date sWrrntToEndDt;

	/**
	 * 客户编号
	 */
	private String sCustNo;

	/**
	 * 客户类型
	 */
	private String sCustTp;

	/**
	 * 潜客/保客
	 */
	private String sCustCd;

	/**
	 * 首次维修的结算完成时间 FIRST_CALC_DT
	 */
	@JsonDeserialize(using = JsonDateDeserializer.class)
	private Date sFiirFromCalcDt;
	@JsonDeserialize(using = JsonDateDeserializer.class)
	private Date sFiirToCalcDt;

	/**
	 * 客户名
	 */
	private String sCustNm;

	/**
	 * 移动电话
	 */
	private String sHpNo;

	/**
	 * 证件号码 SSN_CRN_NO
	 */
	private String sSsnCrnNo;

	/**
	 * 最近维修的结算完成时间 LATELY_CALC_DT
	 */
	@JsonDeserialize(using = JsonDateDeserializer.class)
	private Date sLatelyFromCalcDt;
	@JsonDeserialize(using = JsonDateDeserializer.class)
	private Date sLatelyToCalcDt;

	/**
	 * 蓝缤会员（是/否) BLUE_MEMBERSHIP_NO
	 */

	private String sBlueMembershipNo;

	/**
	 * 自店会员（是/否）
	 */
	private String sDlrMbrYn;

	/**
	 * 生日
	 */

	
	private String sBirthFromDt;
	
	private String sBirthToDt;

	/**
	 * 本店首保承认时间
	 */
	@JsonDeserialize(using = JsonDateDeserializer.class)
	private Date sClaimFromConfDt;
	@JsonDeserialize(using = JsonDateDeserializer.class)
	private Date sClaimToConfDt;

	/**
	 * 销售特约店 Sales Special Store
	 */
	private String sSalesSpeStore;

	public String getsVinNo() {
		return sVinNo;
	}

	public void setsVinNo(String sVinNo) {
		this.sVinNo = sVinNo;
	}

	public String getsCarlineCd() {
		return sCarlineCd;
	}

	public void setsCarlineCd(String sCarlineCd) {
		this.sCarlineCd = sCarlineCd;
	}

	public String getsCarRegNo() {
		return sCarRegNo;
	}

	public void setsCarRegNo(String sCarRegNo) {
		this.sCarRegNo = sCarRegNo;
	}

	public Date getsCustFromSaveDt() {
		return sCustFromSaveDt;
	}

	public void setsCustFromSaveDt(Date sCustFromSaveDt) {
		this.sCustFromSaveDt = sCustFromSaveDt;
	}

	public Date getsCustToSaveDt() {
		return sCustToSaveDt;
	}

	public void setsCustToSaveDt(Date sCustToSaveDt) {
		this.sCustToSaveDt = sCustToSaveDt;
	}

	public String getsCarBrandCd() {
		return sCarBrandCd;
	}

	public void setsCarBrandCd(String sCarBrandCd) {
		this.sCarBrandCd = sCarBrandCd;
	}

	public String getsCarRunDistVal() {
		return sCarRunDistVal;
	}

	public void setsCarRunDistVal(String sCarRunDistVal) {
		this.sCarRunDistVal = sCarRunDistVal;
	}

	public Date getsWrrntFromEndDt() {
		return sWrrntFromEndDt;
	}

	public void setsWrrntFromEndDt(Date sWrrntFromEndDt) {
		this.sWrrntFromEndDt = sWrrntFromEndDt;
	}

	public Date getsWrrntToEndDt() {
		return sWrrntToEndDt;
	}

	public void setsWrrntToEndDt(Date sWrrntToEndDt) {
		this.sWrrntToEndDt = sWrrntToEndDt;
	}

	public String getsCustNo() {
		return sCustNo;
	}

	public void setsCustNo(String sCustNo) {
		this.sCustNo = sCustNo;
	}

	public String getsCustTp() {
		return sCustTp;
	}

	public void setsCustTp(String sCustTp) {
		this.sCustTp = sCustTp;
	}

	public String getsCustCd() {
		return sCustCd;
	}

	public void setsCustCd(String sCustCd) {
		this.sCustCd = sCustCd;
	}

	public Date getsFiirFromCalcDt() {
		return sFiirFromCalcDt;
	}

	public void setsFiirFromCalcDt(Date sFiirFromCalcDt) {
		this.sFiirFromCalcDt = sFiirFromCalcDt;
	}

	public Date getsFiirToCalcDt() {
		return sFiirToCalcDt;
	}

	public void setsFiirToCalcDt(Date sFiirToCalcDt) {
		this.sFiirToCalcDt = sFiirToCalcDt;
	}

	public String getsCustNm() {
		return sCustNm;
	}

	public void setsCustNm(String sCustNm) {
		this.sCustNm = sCustNm;
	}

	public String getsHpNo() {
		return sHpNo;
	}

	public void setsHpNo(String sHpNo) {
		this.sHpNo = sHpNo;
	}

	public String getsSsnCrnNo() {
		return sSsnCrnNo;
	}

	public void setsSsnCrnNo(String sSsnCrnNo) {
		this.sSsnCrnNo = sSsnCrnNo;
	}

	public Date getsLatelyFromCalcDt() {
		return sLatelyFromCalcDt;
	}

	public void setsLatelyFromCalcDt(Date sLatelyFromCalcDt) {
		this.sLatelyFromCalcDt = sLatelyFromCalcDt;
	}

	public Date getsLatelyToCalcDt() {
		return sLatelyToCalcDt;
	}

	public void setsLatelyToCalcDt(Date sLatelyToCalcDt) {
		this.sLatelyToCalcDt = sLatelyToCalcDt;
	}

	public String getsBlueMembershipNo() {
		return sBlueMembershipNo;
	}

	public void setsBlueMembershipNo(String sBlueMembershipNo) {
		this.sBlueMembershipNo = sBlueMembershipNo;
	}

	public String getsDlrMbrYn() {
		return sDlrMbrYn;
	}

	public void setsDlrMbrYn(String sDlrMbrYn) {
		this.sDlrMbrYn = sDlrMbrYn;
	}

	public String getsBirthFromDt() {
		return sBirthFromDt;
	}

	public void setsBirthFromDt(String sBirthFromDt) {
		this.sBirthFromDt = sBirthFromDt;
	}

	public String getsBirthToDt() {
		return sBirthToDt;
	}

	public void setsBirthToDt(String sBirthToDt) {
		this.sBirthToDt = sBirthToDt;
	}

	public Date getsClaimFromConfDt() {
		return sClaimFromConfDt;
	}

	public void setsClaimFromConfDt(Date sClaimFromConfDt) {
		this.sClaimFromConfDt = sClaimFromConfDt;
	}

	public Date getsClaimToConfDt() {
		return sClaimToConfDt;
	}

	public void setsClaimToConfDt(Date sClaimToConfDt) {
		this.sClaimToConfDt = sClaimToConfDt;
	}

	public String getsSalesSpeStore() {
		return sSalesSpeStore;
	}

	public void setsSalesSpeStore(String sSalesSpeStore) {
		this.sSalesSpeStore = sSalesSpeStore;
	}

	public String getsDlrCd() {
		return sDlrCd;
	}

	public void setsDlrCd(String sDlrCd) {
		this.sDlrCd = sDlrCd;
	}
    
}
