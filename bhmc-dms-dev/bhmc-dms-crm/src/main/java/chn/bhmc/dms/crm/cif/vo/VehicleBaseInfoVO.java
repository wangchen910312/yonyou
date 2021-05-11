package chn.bhmc.dms.crm.cif.vo;

import java.util.Date;
import org.hibernate.validator.constraints.NotEmpty;
import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import chn.bhmc.dms.core.datatype.BaseVO;
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

public class VehicleBaseInfoVO extends BaseVO {

	
	private static final long serialVersionUID = 4769949171703506165L;

	

	/**
	 * 店代码
	 */
	@NotEmpty
	private String dlrCd;

	/**
	 * 客户编号
	 **/
	private String custNo;

	/**
	 * 客户名
	 **/
	private String custNm;

	/**
	 * 性别
	 **/
	private String sexCd;
	private String sexCdNm;

	/**
	 * 客户类型
	 **/
	private String custTp;
	private String custTpNm;

	/**
	 * 客户生日
	 **/
	private String birthDt;

	/**
	 * 客户年龄
	 */
	private String ageDtl;

	/**
	 * 蓝缤会员
	 */
	private String blueMembershipNo;
	private String blueMembershipNm;

	/**
	 * 自店会员
	 */
	private String dlrMbrYn;
	private String dlrMbrNm;

	/**
	 * 潜客/保客
	 **/
	private String custCd;
	private String custCdNm;

	/**
	 * 移动电话
	 **/
	private String hpNo;

	/**
	 * 证件类型
	 **/
	private String mathDocTp;
	private String mathDocTpNm;

	/**
	 * 证件号码
	 **/
	private String ssnCrnNo;

	/**
	 * 省/直辖市
	 **/
	private String sungCd;
	private String sungNm;

	/**
	 * 市 城市
	 **/
	private String cityCd;
	private String cityNm;

	/**
	 * 地区
	 **/
	private String distCd;
	private String distNm;

	/**
	 * 详细地址
	 */
	private String addrDetlCont;

	/**
	 * 车辆识别码
	 */
	private String vinNo;

	/**
	 * 车种名称
	 */
	private String carlineCd;
	private String carlineNm;
	private String carlineNmNc;

	/**
	 * 车款名称
	 */
	private String modelCd;
	private String modelNm;
	private String modelCdNm;

	/**
	 * OCN 代码
	 */
	private String ocnCd;
	private String ocnNm;
	private String ocnCdNm;

	/**
	 * 发动机号码
	 */
	private String enginSerialNo;

	/**
	 * 发动机型号代码
	 */
	private String enginModelCd;

	/**
	 * 车牌号
	 */
	private String carRegNo;

	/**
	 * 车辆品牌
	 */
	private String carBrandCd;
	private String carBrandNm;

	/**
	 * 累计行驶里程
	 */
	private Double carRunDistVal;

	/**
	 * 零售日期
	 */
	@JsonDeserialize(using = JsonDateDeserializer.class)
	private Date custSaleDt;

	/**
	 * 保修开始日期
	 */
	@JsonDeserialize(using = JsonDateDeserializer.class)
	private Date grteStartDt;

	/**
	 * 保修结束日期
	 */
	@JsonDeserialize(using = JsonDateDeserializer.class)
	private Date wrrntEndDt;

	/**
	 * 保修结束日期
	 */
	@JsonDeserialize(using = JsonDateDeserializer.class)
	private Date grteEndDt;

	/**
	 * 本店首保承认时间
	 */
	@JsonDeserialize(using = JsonDateDeserializer.class)
	private Date claimConfirmDt;

	/**
	 * 平均日行驶里程
	 */

	private Double aveDaiMile = 0.0;
	private int  aveMile = 0;

	/**
	 * 首次维修委托号码
	 */
	private String firstRoDocNo;

	/**
	 * 首次维修的结算完成时间
	 */
	@JsonDeserialize(using = JsonDateDeserializer.class)
	private Date firstCalcDt;

	/**
	 * 最近维修委托号码 LATELY_RO_DOC_NO lately
	 */
	private String latelyRoDocNo;

	/**
	 * 最近维修的结算完成时间
	 */
	@JsonDeserialize(using = JsonDateDeserializer.class)
	private Date latelyCalcDt;
	
    /**
     * 销售特约店
     */
	private String salesSpeStore;
	
	public String getDlrCd() {
		return dlrCd;
	}

	public void setDlrCd(String dlrCd) {
		this.dlrCd = dlrCd;
	}

	public String getCustNo() {
		return custNo;
	}

	public void setCustNo(String custNo) {
		this.custNo = custNo;
	}

	public String getCustNm() {
		return custNm;
	}

	public void setCustNm(String custNm) {
		this.custNm = custNm;
	}

	public String getSexCd() {
		return sexCd;
	}

	public void setSexCd(String sexCd) {
		this.sexCd = sexCd;
	}

	public String getSexCdNm() {
		return sexCdNm;
	}

	public void setSexCdNm(String sexCdNm) {
		this.sexCdNm = sexCdNm;
	}

	public String getCustTp() {
		return custTp;
	}

	public void setCustTp(String custTp) {
		this.custTp = custTp;
	}

	public String getCustTpNm() {
		return custTpNm;
	}

	public void setCustTpNm(String custTpNm) {
		this.custTpNm = custTpNm;
	}

	public String getBirthDt() {
		return birthDt;
	}

	public void setBirthDt(String birthDt) {
		this.birthDt = birthDt;
	}

	public String getAgeDtl() {
		return ageDtl;
	}

	public void setAgeDtl(String ageDtl) {
		this.ageDtl = ageDtl;
	}

	public String getBlueMembershipNo() {
		return blueMembershipNo;
	}

	public void setBlueMembershipNo(String blueMembershipNo) {
		this.blueMembershipNo = blueMembershipNo;
	}

	public String getDlrMbrYn() {
		return dlrMbrYn;
	}

	public void setDlrMbrYn(String dlrMbrYn) {
		this.dlrMbrYn = dlrMbrYn;
	}

	public String getCustCd() {
		return custCd;
	}

	public void setCustCd(String custCd) {
		this.custCd = custCd;
	}

	public String getCustCdNm() {
		return custCdNm;
	}

	public void setCustCdNm(String custCdNm) {
		this.custCdNm = custCdNm;
	}

	public String getHpNo() {
		return hpNo;
	}

	public void setHpNo(String hpNo) {
		this.hpNo = hpNo;
	}

	public String getMathDocTp() {
		return mathDocTp;
	}

	public void setMathDocTp(String mathDocTp) {
		this.mathDocTp = mathDocTp;
	}

	public String getMathDocTpNm() {
		return mathDocTpNm;
	}

	public void setMathDocTpNm(String mathDocTpNm) {
		this.mathDocTpNm = mathDocTpNm;
	}

	public String getSsnCrnNo() {
		return ssnCrnNo;
	}

	public void setSsnCrnNo(String ssnCrnNo) {
		this.ssnCrnNo = ssnCrnNo;
	}

	public String getSungCd() {
		return sungCd;
	}

	public void setSungCd(String sungCd) {
		this.sungCd = sungCd;
	}

	public String getSungNm() {
		return sungNm;
	}

	public void setSungNm(String sungNm) {
		this.sungNm = sungNm;
	}

	public String getCityCd() {
		return cityCd;
	}

	public void setCityCd(String cityCd) {
		this.cityCd = cityCd;
	}

	public String getCityNm() {
		return cityNm;
	}

	public void setCityNm(String cityNm) {
		this.cityNm = cityNm;
	}

	public String getDistCd() {
		return distCd;
	}

	public void setDistCd(String distCd) {
		this.distCd = distCd;
	}

	public String getDistNm() {
		return distNm;
	}

	public void setDistNm(String distNm) {
		this.distNm = distNm;
	}

	public String getAddrDetlCont() {
		return addrDetlCont;
	}

	public void setAddrDetlCont(String addrDetlCont) {
		this.addrDetlCont = addrDetlCont;
	}

	public String getVinNo() {
		return vinNo;
	}

	public void setVinNo(String vinNo) {
		this.vinNo = vinNo;
	}

	public String getCarlineCd() {
		return carlineCd;
	}

	public void setCarlineCd(String carlineCd) {
		this.carlineCd = carlineCd;
	}

	public String getCarlineNm() {
		return carlineNm;
	}

	public void setCarlineNm(String carlineNm) {
		this.carlineNm = carlineNm;
	}

	public String getModelCd() {
		return modelCd;
	}

	public void setModelCd(String modelCd) {
		this.modelCd = modelCd;
	}

	public String getModelNm() {
		return modelNm;
	}

	public void setModelNm(String modelNm) {
		this.modelNm = modelNm;
	}

	public String getModelCdNm() {
		return modelCdNm;
	}

	public void setModelCdNm(String modelCdNm) {
		this.modelCdNm = modelCdNm;
	}

	public String getOcnCd() {
		return ocnCd;
	}

	public void setOcnCd(String ocnCd) {
		this.ocnCd = ocnCd;
	}

	public String getOcnNm() {
		return ocnNm;
	}

	public void setOcnNm(String ocnNm) {
		this.ocnNm = ocnNm;
	}

	public String getOcnCdNm() {
		return ocnCdNm;
	}

	public void setOcnCdNm(String ocnCdNm) {
		this.ocnCdNm = ocnCdNm;
	}

	public String getEnginSerialNo() {
		return enginSerialNo;
	}

	public void setEnginSerialNo(String enginSerialNo) {
		this.enginSerialNo = enginSerialNo;
	}

	public String getEnginModelCd() {
		return enginModelCd;
	}

	public void setEnginModelCd(String enginModelCd) {
		this.enginModelCd = enginModelCd;
	}

	public String getCarRegNo() {
		return carRegNo;
	}

	public void setCarRegNo(String carRegNo) {
		this.carRegNo = carRegNo;
	}

	public String getCarBrandCd() {
		return carBrandCd;
	}

	public void setCarBrandCd(String carBrandCd) {
		this.carBrandCd = carBrandCd;
	}

	public Double getCarRunDistVal() {
		return carRunDistVal;
	}

	public void setCarRunDistVal(Double carRunDistVal) {
		this.carRunDistVal = carRunDistVal;
	}

	public Date getCustSaleDt() {
		return custSaleDt;
	}

	public void setCustSaleDt(Date custSaleDt) {
		this.custSaleDt = custSaleDt;
	}

	public Date getGrteStartDt() {
		return grteStartDt;
	}

	public void setGrteStartDt(Date grteStartDt) {
		this.grteStartDt = grteStartDt;
	}

	public Date getWrrntEndDt() {
		return wrrntEndDt;
	}

	public void setWrrntEndDt(Date wrrntEndDt) {
		this.wrrntEndDt = wrrntEndDt;
	}

	public Date getGrteEndDt() {
		return grteEndDt;
	}

	public void setGrteEndDt(Date grteEndDt) {
		this.grteEndDt = grteEndDt;
	}

	public Date getClaimConfirmDt() {
		return claimConfirmDt;
	}

	public void setClaimConfirmDt(Date claimConfirmDt) {
		this.claimConfirmDt = claimConfirmDt;
	}

	public Double getAveDaiMile() {
		return aveDaiMile;
	}

	public void setAveDaiMile(Double aveDaiMile) {
		this.aveDaiMile = aveDaiMile;
	}

	public String getFirstRoDocNo() {
		return firstRoDocNo;
	}

	public void setFirstRoDocNo(String firstRoDocNo) {
		this.firstRoDocNo = firstRoDocNo;
	}

	public Date getFirstCalcDt() {
		return firstCalcDt;
	}

	public void setFirstCalcDt(Date firstCalcDt) {
		this.firstCalcDt = firstCalcDt;
	}

	public String getLatelyRoDocNo() {
		return latelyRoDocNo;
	}

	public void setLatelyRoDocNo(String latelyRoDocNo) {
		this.latelyRoDocNo = latelyRoDocNo;
	}

	public Date getLatelyCalcDt() {
		return latelyCalcDt;
	}

	public void setLatelyCalcDt(Date latelyCalcDt) {
		this.latelyCalcDt = latelyCalcDt;
	}

	public String getSalesSpeStore() {
		return salesSpeStore;
	}

	public void setSalesSpeStore(String salesSpeStore) {
		this.salesSpeStore = salesSpeStore;
	}

	public String getBlueMembershipNm() {
		return blueMembershipNm;
	}

	public void setBlueMembershipNm(String blueMembershipNm) {
		this.blueMembershipNm = blueMembershipNm;
	}

	public String getDlrMbrNm() {
		return dlrMbrNm;
	}

	public void setDlrMbrNm(String dlrMbrNm) {
		this.dlrMbrNm = dlrMbrNm;
	}

	public String getCarlineNmNc() {
		return carlineNmNc;
	}

	public void setCarlineNmNc(String carlineNmNc) {
		this.carlineNmNc = carlineNmNc;
	}

	public String getCarBrandNm() {
		return carBrandNm;
	}

	public void setCarBrandNm(String carBrandNm) {
		this.carBrandNm = carBrandNm;
	}

	public int getAveMile() {
		return aveMile;
	}

	public void setAveMile(int aveMile) {
		this.aveMile = aveMile;
	}

	
}
