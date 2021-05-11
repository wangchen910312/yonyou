package chn.bhmc.dms.mob.api.crm.vo;

import java.util.Date;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotBlank;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;
import chn.bhmc.dms.core.validator.groups.Draft;
import chn.bhmc.dms.core.validator.groups.Modify;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;

/**
 * 시승 예약 VO
 *
 * @ClassName : TestDriveResvVO.java
 * @Description : TestDriveResvVO Class
 * @author in moon lee
 * @since 2016. 1. 4.
 * @version 1.0
 * @see
 * @Modification Information
 * 
 *               <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 4.     in moon lee     최초 생성
 *               </pre>
 */

@ValidDescriptor({

		// 20160426 시승정보 - 메시지 등록 완료
		@ValidField(field = "dlrCd", mesgKey = "global.lbl.dlrCd"),
		@ValidField(field = "pltCd", mesgKey = "global.lbl.pltCd"),
		@ValidField(field = "tdrvSeq", mesgKey = "crm.lbl.tdrvSeq"),
		@ValidField(field = "callNo", mesgKey = "crm.lbl.callNo"),
		@ValidField(field = "leadNo", mesgKey = "global.lbl.leadNo"),
		@ValidField(field = "saleOpptNo", mesgKey = "global.lbl.saleOpptSeq"),
		@ValidField(field = "tdrvContractDocNo", mesgKey = "crm.lbl.tdrvContractDocNo"),
		@ValidField(field = "scId", mesgKey = "crm.lbl.scId"),
		@ValidField(field = "custNo", mesgKey = "global.lbl.custNo"),
		@ValidField(field = "hpNo", mesgKey = "global.lbl.hpNo"),
		@ValidField(field = "resvDt", mesgKey = "global.lbl.resvDt"),
		@ValidField(field = "tdrvHmCd", mesgKey = "crm.lbl.tdrvHmCd"),
		@ValidField(field = "tdrvVinNo", mesgKey = "crm.lbl.tdrvVinNo"),
		@ValidField(field = "tdrvPathCd", mesgKey = "crm.lbl.tdrvPathCd"),
		@ValidField(field = "tdrvTpCd", mesgKey = "crm.lbl.tdrvTpCd"),
		@ValidField(field = "tdrvStatCd", mesgKey = "crm.lbl.tdrvStatCd"),
		@ValidField(field = "tdrvClineCd", mesgKey = "crm.lbl.tdrvClineCd"),
		@ValidField(field = "remark", mesgKey = "global.lbl.remark"),
		@ValidField(field = "custStsfCd", mesgKey = "crm.lbl.custStsfCd"),
		@ValidField(field = "saleFcstCd", mesgKey = "crm.lbl.saleFcstCd"),
		@ValidField(field = "befRunDistVal", mesgKey = "crm.lbl.befRunDistVal"),
		@ValidField(field = "aftRunDistVal", mesgKey = "crm.lbl.aftRunDistVal"),
		@ValidField(field = "befRfuelQty", mesgKey = "crm.lbl.befRfuelQty"),
		@ValidField(field = "aftRfuelQty", mesgKey = "crm.lbl.aftRfuelQty"),
		@ValidField(field = "intPblmYn", mesgKey = "crm.lbl.intPblmYn"),
		@ValidField(field = "extPblmYn", mesgKey = "crm.lbl.extPblmYn"),
		@ValidField(field = "regUsrId", mesgKey = "global.lbl.regUsrId"),
		@ValidField(field = "regDt", mesgKey = "global.lbl.regDt"),
		@ValidField(field = "updtUsrId", mesgKey = "global.lbl.updtUsrId"),
		@ValidField(field = "updtDt", mesgKey = "global.lbl.updtDt") })

public class CrmTestDriveResvVO extends BaseVO {

	/**
	 * Statements (long)serialVersionUID
	 */
	private static final long serialVersionUID = 4475886711785328490L;

	/**
	 * 딜러코드
	 **/
	private String dlrCd;

	/**
	 * 센터코드
	 **/
	private String pltCd;

	/**
	 * 주요인증문서유형
	 **/
	// MATH_DOC_TP
	private String mathDocTp;

	/**
	 * 주민사업자등록번호
	 **/
	// SSN_CRN_NO
	private String ssnCrnNo;

	/**
	 * 관심차종 이름
	 **/
	private String carlineNm;

	/**
	 * 관심차종
	 **/
	private String carlineCd;

	/**
	 * 관심모델
	 **/
	private String modelCd;

	/**
	 * 시승일련번호
	 **/
	@Min(value = 0)
	private int tdrvSeq;

	/**
	 * 콜일련번호
	 **/
	private String callNo;

	/**
	 * 리드일련번호
	 **/
	private String leadNo;

	/**
	 * 판매기회일련번호
	 **/
	private String saleOpptNo;

	/**
	 * 시승계약문서번호
	 **/
	private String tdrvContractDocNo;

	/**
	 * SCID
	 **/
	@NotBlank(groups = Draft.class)
	private String scId;

	/**
	 * 고객번호
	 **/
	@NotBlank(groups = Draft.class)
	private String custNo;

	/**
	 * 휴대폰번호
	 **/
	@NotBlank(groups = Draft.class)
	private String hpNo;

	/**
	 * 예약일자
	 **/
	@NotNull(groups = Draft.class)
	@JsonDeserialize(using = JsonDateDeserializer.class)
	private Date resvDt;

	/**
	 * 시승시간코드
	 **/
	@NotBlank(groups = Draft.class)
	private String tdrvHmCd;

	/**
	 * 시승차대번호
	 **/
	@NotBlank(groups = Draft.class)
	private String tdrvVinNo;

	/**
	 * 시승출처코드
	 **/
	private String tdrvPathCd;

	/**
	 * 시승유형코드
	 **/
	private String tdrvTpCd;

	/**
	 * 시승상태코드
	 **/
	private String tdrvStatCd;

	/**
	 * 시승노선코드
	 **/
	@NotBlank(groups = Draft.class)
	private String tdrvClineCd;

	/**
	 * 비고
	 **/
	private String remark;

	/**
	 * 고객만족도코드
	 **/
	@NotBlank(groups = Modify.class)
	private String custStsfCd;

	/**
	 * 시승관리 만족도 조사 완성 여부 CRM410
	 **/
	private String custStsfStatCd;

	/**
	 * 판매전망코드
	 **/
	private String saleFcstCd;

	/**
	 * 이전주행거리값
	 **/
	@Min(value = 0, groups = Modify.class)
	private int befRunDistVal;

	/**
	 * 이후주행거리값
	 **/
	@Min(value = 0, groups = Modify.class)
	private int aftRunDistVal;

	/**
	 * 이전주유량
	 **/
	@Min(value = 0, groups = Modify.class)
	private int befRfuelQty;

	/**
	 * 이후주유량
	 **/
	@Min(value = 0, groups = Modify.class)
	private int aftRfuelQty;

	/**
	 * 내장이상여부
	 **/
	private String intPblmYn;

	/**
	 * 외장이상여부
	 **/
	private String extPblmYn;

	/**
	 * 등록자ID
	 **/
	private String regUsrId;

	/**
	 * 등록일자
	 **/
	@JsonDeserialize(using = JsonDateDeserializer.class)
	private Date regDt;

	/**
	 * 수정자ID
	 **/
	private String updtUsrId;

	/**
	 * 수정일자
	 **/
	@JsonDeserialize(using = JsonDateDeserializer.class)
	private Date updtDt;

	/**
	 * 면허증 번호
	 **/
	private String tdrvLicenseNo;

	@JsonDeserialize(using = JsonDateDeserializer.class)
	private Date resvEndDt; // 예약종료시간
	private String scNm; // 담당고문명
	private String custNm; // 고객명
	private String custCd; // 잠재/보유고객
	private String regUsrNm; // 등록자명
	private String modelNm; // 관심모델 이름
	private String carRegId; // 차량번호
	private String carRegNo; // 차량번호

	private String tdrvHmCdNm; // 시승시간코드
	private String custStsfCdNm; // 고객만족도코드
	private String custCdNm; // 고객유형코드
	private String sexCd;

	/**
	 * @return the dlrCd
	 */
	public String getDlrCd() {
		return dlrCd;
	}

	/**
	 * @param dlrCd
	 *            the dlrCd to set
	 */
	public void setDlrCd(String dlrCd) {
		this.dlrCd = dlrCd;
	}

	/**
	 * @return the pltCd
	 */
	public String getPltCd() {
		return pltCd;
	}

	/**
	 * @param pltCd
	 *            the pltCd to set
	 */
	public void setPltCd(String pltCd) {
		this.pltCd = pltCd;
	}

	/**
	 * @return the tdrvSeq
	 */
	public int getTdrvSeq() {
		return tdrvSeq;
	}

	/**
	 * @param tdrvSeq
	 *            the tdrvSeq to set
	 */
	public void setTdrvSeq(int tdrvSeq) {
		this.tdrvSeq = tdrvSeq;
	}

	/**
	 * @return the callNo
	 */
	public String getCallNo() {
		return callNo;
	}

	/**
	 * @param callNo
	 *            the callNo to set
	 */
	public void setCallNo(String callNo) {
		this.callNo = callNo;
	}

	/**
	 * @return the leadNo
	 */
	public String getLeadNo() {
		return leadNo;
	}

	/**
	 * @param leadNo
	 *            the leadNo to set
	 */
	public void setLeadNo(String leadNo) {
		this.leadNo = leadNo;
	}

	/**
	 * @return the saleOpptNo
	 */
	public String getSaleOpptNo() {
		return saleOpptNo;
	}

	/**
	 * @param saleOpptNo
	 *            the saleOpptNo to set
	 */
	public void setSaleOpptNo(String saleOpptNo) {
		this.saleOpptNo = saleOpptNo;
	}

	/**
	 * @return the tdrvContractDocNo
	 */
	public String getTdrvContractDocNo() {
		return tdrvContractDocNo;
	}

	/**
	 * @param tdrvContractDocNo
	 *            the tdrvContractDocNo to set
	 */
	public void setTdrvContractDocNo(String tdrvContractDocNo) {
		this.tdrvContractDocNo = tdrvContractDocNo;
	}

	/**
	 * @return the scId
	 */
	public String getScId() {
		return scId;
	}

	/**
	 * @param scId
	 *            the scId to set
	 */
	public void setScId(String scId) {
		this.scId = scId;
	}

	/**
	 * @return the custNo
	 */
	public String getCustNo() {
		return custNo;
	}

	/**
	 * @param custNo
	 *            the custNo to set
	 */
	public void setCustNo(String custNo) {
		this.custNo = custNo;
	}

	/**
	 * @return the hpNo
	 */
	public String getHpNo() {
		return hpNo;
	}

	/**
	 * @param hpNo
	 *            the hpNo to set
	 */
	public void setHpNo(String hpNo) {
		this.hpNo = hpNo;
	}

	/**
	 * @return the resvDt
	 */
	public Date getResvDt() {
		return resvDt;
	}

	/**
	 * @param resvDt
	 *            the resvDt to set
	 */
	public void setResvDt(Date resvDt) {
		this.resvDt = resvDt;
	}

	/**
	 * @return the tdrvHmCd
	 */
	public String getTdrvHmCd() {
		return tdrvHmCd;
	}

	/**
	 * @param tdrvHmCd
	 *            the tdrvHmCd to set
	 */
	public void setTdrvHmCd(String tdrvHmCd) {
		this.tdrvHmCd = tdrvHmCd;
	}

	/**
	 * @return the tdrvVinNo
	 */
	public String getTdrvVinNo() {
		return tdrvVinNo;
	}

	/**
	 * @param tdrvVinNo
	 *            the tdrvVinNo to set
	 */
	public void setTdrvVinNo(String tdrvVinNo) {
		this.tdrvVinNo = tdrvVinNo;
	}

	/**
	 * /**
	 * 
	 * @return the tdrvPathCd
	 */
	public String getTdrvPathCd() {
		return tdrvPathCd;
	}

	/**
	 * @param tdrvPathCd
	 *            the tdrvPathCd to set
	 */
	public void setTdrvPathCd(String tdrvPathCd) {
		this.tdrvPathCd = tdrvPathCd;
	}

	/**
	 * @return the tdrvTpCd
	 */
	public String getTdrvTpCd() {
		return tdrvTpCd;
	}

	/**
	 * @param tdrvTpCd
	 *            the tdrvTpCd to set
	 */
	public void setTdrvTpCd(String tdrvTpCd) {
		this.tdrvTpCd = tdrvTpCd;
	}

	/**
	 * @return the tdrvStatCd
	 */
	public String getTdrvStatCd() {
		return tdrvStatCd;
	}

	/**
	 * @param tdrvStatCd
	 *            the tdrvStatCd to set
	 */
	public void setTdrvStatCd(String tdrvStatCd) {
		this.tdrvStatCd = tdrvStatCd;
	}

	/**
	 * @return the tdrvClineCd
	 */
	public String getTdrvClineCd() {
		return tdrvClineCd;
	}

	/**
	 * @param tdrvClineCd
	 *            the tdrvClineCd to set
	 */
	public void setTdrvClineCd(String tdrvClineCd) {
		this.tdrvClineCd = tdrvClineCd;
	}

	/**
	 * @return the remark
	 */
	public String getRemark() {
		return remark;
	}

	/**
	 * @param remark
	 *            the remark to set
	 */
	public void setRemark(String remark) {
		this.remark = remark;
	}

	/**
	 * @return the custStsfCd
	 */
	public String getCustStsfCd() {
		return custStsfCd;
	}

	/**
	 * @param custStsfCd
	 *            the custStsfCd to set
	 */
	public void setCustStsfCd(String custStsfCd) {
		this.custStsfCd = custStsfCd;
	}

	/**
	 * @return the saleFcstCd
	 */
	public String getSaleFcstCd() {
		return saleFcstCd;
	}

	/**
	 * @param saleFcstCd
	 *            the saleFcstCd to set
	 */
	public void setSaleFcstCd(String saleFcstCd) {
		this.saleFcstCd = saleFcstCd;
	}

	/**
	 * @return the befRunDistVal
	 */
	public int getBefRunDistVal() {
		return befRunDistVal;
	}

	/**
	 * @param befRunDistVal
	 *            the befRunDistVal to set
	 */
	public void setBefRunDistVal(int befRunDistVal) {
		this.befRunDistVal = befRunDistVal;
	}

	/**
	 * @return the aftRunDistVal
	 */
	public int getAftRunDistVal() {
		return aftRunDistVal;
	}

	/**
	 * @param aftRunDistVal
	 *            the aftRunDistVal to set
	 */
	public void setAftRunDistVal(int aftRunDistVal) {
		this.aftRunDistVal = aftRunDistVal;
	}

	/**
	 * @return the befRfuelQty
	 */
	public int getBefRfuelQty() {
		return befRfuelQty;
	}

	/**
	 * @param befRfuelQty
	 *            the befRfuelQty to set
	 */
	public void setBefRfuelQty(int befRfuelQty) {
		this.befRfuelQty = befRfuelQty;
	}

	/**
	 * @return the aftRfuelQty
	 */
	public int getAftRfuelQty() {
		return aftRfuelQty;
	}

	/**
	 * @param aftRfuelQty
	 *            the aftRfuelQty to set
	 */
	public void setAftRfuelQty(int aftRfuelQty) {
		this.aftRfuelQty = aftRfuelQty;
	}

	/**
	 * @return the intPblmYn
	 */
	public String getIntPblmYn() {
		return intPblmYn;
	}

	/**
	 * @param intPblmYn
	 *            the intPblmYn to set
	 */
	public void setIntPblmYn(String intPblmYn) {
		this.intPblmYn = intPblmYn;
	}

	/**
	 * @return the extPblmYn
	 */
	public String getExtPblmYn() {
		return extPblmYn;
	}

	/**
	 * @param extPblmYn
	 *            the extPblmYn to set
	 */
	public void setExtPblmYn(String extPblmYn) {
		this.extPblmYn = extPblmYn;
	}

	/**
	 * @return the regUsrId
	 */
	public String getRegUsrId() {
		return regUsrId;
	}

	/**
	 * @param regUsrId
	 *            the regUsrId to set
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
	 * @param regDt
	 *            the regDt to set
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
	 * @param updtUsrId
	 *            the updtUsrId to set
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
	 * @param updtDt
	 *            the updtDt to set
	 */
	public void setUpdtDt(Date updtDt) {
		this.updtDt = updtDt;
	}

	/**
	 * @return the resvEndDt
	 */
	public Date getResvEndDt() {
		return resvEndDt;
	}

	/**
	 * @param resvEndDt
	 *            the resvEndDt to set
	 */
	public void setResvEndDt(Date resvEndDt) {
		this.resvEndDt = resvEndDt;
	}

	/**
	 * @return the scNm
	 */
	public String getScNm() {
		return scNm;
	}

	/**
	 * @param scNm
	 *            the scNm to set
	 */
	public void setScNm(String scNm) {
		this.scNm = scNm;
	}

	/**
	 * @return the custNm
	 */
	public String getCustNm() {
		return custNm;
	}

	/**
	 * @param custNm
	 *            the custNm to set
	 */
	public void setCustNm(String custNm) {
		this.custNm = custNm;
	}

	/**
	 * @return the regUsrNm
	 */
	public String getRegUsrNm() {
		return regUsrNm;
	}

	/**
	 * @param regUsrNm
	 *            the regUsrNm to set
	 */
	public void setRegUsrNm(String regUsrNm) {
		this.regUsrNm = regUsrNm;
	}

	/**
	 * @return the modelNm
	 */
	public String getModelNm() {
		return modelNm;
	}

	/**
	 * @param modelNm
	 *            the modelNm to set
	 */
	public void setModelNm(String modelNm) {
		this.modelNm = modelNm;
	}

	/**
	 * @return the carRegId
	 */
	public String getCarRegId() {
		return carRegId;
	}

	/**
	 * @param carRegId
	 *            the carRegId to set
	 */
	public void setCarRegId(String carRegId) {
		this.carRegId = carRegId;
	}

	/**
	 * @return the custCd
	 */
	public String getCustCd() {
		return custCd;
	}

	/**
	 * @param custCd
	 *            the custCd to set
	 */
	public void setCustCd(String custCd) {
		this.custCd = custCd;
	}

	/**
	 * @return the tdrvHmCdNm
	 */
	public String getTdrvHmCdNm() {
		return tdrvHmCdNm;
	}

	/**
	 * @param tdrvHmCdNm
	 *            the tdrvHmCdNm to set
	 */
	public void setTdrvHmCdNm(String tdrvHmCdNm) {
		this.tdrvHmCdNm = tdrvHmCdNm;
	}

	/**
	 * @return the custStsfCdNm
	 */
	public String getCustStsfCdNm() {
		return custStsfCdNm;
	}

	/**
	 * @param custStsfCdNm
	 *            the custStsfCdNm to set
	 */
	public void setCustStsfCdNm(String custStsfCdNm) {
		this.custStsfCdNm = custStsfCdNm;
	}

	/**
	 * @return the custCdNm
	 */
	public String getCustCdNm() {
		return custCdNm;
	}

	/**
	 * @param custCdNm
	 *            the custCdNm to set
	 */
	public void setCustCdNm(String custCdNm) {
		this.custCdNm = custCdNm;
	}

	/**
     * @ return the sexCd
     */
    public String getSexCd() {
        return sexCd;
    }
    /**
     * @param sexCd the sexCd to set
     */
    public void setSexCd(String sexCd) {
        this.sexCd = sexCd;
    }

	/*
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "CrmTestDriveResvVO [dlrCd=" + dlrCd + ", pltCd=" + pltCd + ", tdrvSeq=" + tdrvSeq + ", callNo=" + callNo
				+ ", leadNo=" + leadNo + ", saleOpptNo=" + saleOpptNo + ", tdrvContractDocNo=" + tdrvContractDocNo
				+ ", scId=" + scId + ", custNo=" + custNo + ", hpNo=" + hpNo + ", resvDt=" + resvDt + ", tdrvHmCd="
				+ tdrvHmCd + ", tdrvVinNo=" + tdrvVinNo + ", tdrvPathCd=" + tdrvPathCd + ", tdrvTpCd=" + tdrvTpCd
				+ ", tdrvStatCd=" + tdrvStatCd + ", tdrvClineCd=" + tdrvClineCd + ", remark=" + remark + ", custStsfCd="
				+ custStsfCd + ", saleFcstCd=" + saleFcstCd + ", befRunDistVal=" + befRunDistVal + ", aftRunDistVal="
				+ aftRunDistVal + ", befRfuelQty=" + befRfuelQty + ", aftRfuelQty=" + aftRfuelQty + ", intPblmYn="
				+ intPblmYn + ", extPblmYn=" + extPblmYn + ", regUsrId=" + regUsrId + ", regDt=" + regDt
				+ ", updtUsrId=" + updtUsrId + ", updtDt=" + updtDt + ", resvEndDt=" + resvEndDt + ", scNm=" + scNm
				+ ", custNm=" + custNm + ", custCd=" + custCd + ", regUsrNm=" + regUsrNm + ", modelNm=" + modelNm
				+ ", carRegId=" + carRegId + ", tdrvHmCdNm=" + tdrvHmCdNm + ", custStsfCdNm=" + custStsfCdNm
				+ ", custCdNm=" + custCdNm + ", sexCd=" + sexCd + "]";
	}

	/**
	 * @param carlineNm
	 *            the carlineNm to set
	 */
	public void setCarlineNm(String carlineNm) {
		this.carlineNm = carlineNm;
	}

	/**
	 * @return the carlineNm
	 */
	public String getCarlineNm() {
		return carlineNm;
	}

	/**
	 * @param carlineCd
	 *            the carlineCd to set
	 */
	public void setCarlineCd(String carlineCd) {
		this.carlineCd = carlineCd;
	}

	/**
	 * @return the carlineCd
	 */
	public String getCarlineCd() {
		return carlineCd;
	}

	/**
	 * @param modelCd
	 *            the modelCd to set
	 */
	public void setModelCd(String modelCd) {
		this.modelCd = modelCd;
	}

	/**
	 * @return the modelCd
	 */
	public String getModelCd() {
		return modelCd;
	}

	/**
	 * @param carRegNo
	 *            the carRegNo to set
	 */
	public void setCarRegNo(String carRegNo) {
		this.carRegNo = carRegNo;
	}

	/**
	 * @return the carRegNo
	 */
	public String getCarRegNo() {
		return carRegNo;
	}

	/**
	 * @param mathDocTp
	 *            the mathDocTp to set
	 */
	public void setMathDocTp(String mathDocTp) {
		this.mathDocTp = mathDocTp;
	}

	/**
	 * @return the mathDocTp
	 */
	public String getMathDocTp() {
		return mathDocTp;
	}

	/**
	 * @param ssnCrnNo
	 *            the ssnCrnNo to set
	 */
	public void setSsnCrnNo(String ssnCrnNo) {
		this.ssnCrnNo = ssnCrnNo;
	}

	/**
	 * @return the ssnCrnNo
	 */
	public String getSsnCrnNo() {
		return ssnCrnNo;
	}

	/**
	 * @return the custStsfStatCd
	 */
	public String getCustStsfStatCd() {
		return custStsfStatCd;
	}

	/**
	 * @param custStsfStatCd
	 *            the custStsfStatCd to set
	 */
	public void setCustStsfStatCd(String custStsfStatCd) {
		this.custStsfStatCd = custStsfStatCd;
	}

	/**
	 * @param tdrvLicenseNo
	 *            the tdrvLicenseNo to set
	 */
	public void setTdrvLicenseNo(String tdrvLicenseNo) {
		this.tdrvLicenseNo = tdrvLicenseNo;
	}

	/**
	 * @return the tdrvLicenseNo
	 */
	public String getTdrvLicenseNo() {
		return tdrvLicenseNo;
	}

}