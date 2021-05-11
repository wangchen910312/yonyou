package chn.bhmc.dms.sal.lom.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.SearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;


/**
 * 
 * @ClassName: NewEnergyVSApplicationSearchVO 
 * @Description: TODO
 * @author: huyuansen
 * @date: 2019年4月3日 下午1:44:49
 */

public class NewEnergyVSApplicationSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 2924692645434750515L;

    private String sDlrCd; 
    private String custNm;   // 车主姓名
    private String hpNo;     //车主联系电话
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date applStartDt;  //申请开始日期
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date applEndDt;  //申请结束日期
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date invoStartDt;   //开票开始日期
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date invoEndDt;   //开票结束日期
    private String carPurHumType;  //购车人类型
    private String statusNo; //状态
    private String sApplicationNo; //申请编号
    private String custTp; //客户类型
    private String sLangCd;//语言类型
    private String vinNo;//车架号
    
    private String applStart;  //申请开始日期
    private String applEnd;  //申请结束日期
    private String invoStart;   //开票开始日期
    private String invoEnd;   //开票结束日期
    private String dlrNm;		//经销商名称
    private String dlrCd;		//经销商代码
	
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date applDt;   //开票结束日期
    
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date auditDt;   //开票结束日期
	//chenming 2019-9-17 增加申请记录查询 start
    private String appliRecode;		//申请记录
    //R20032400090 张伟丽反馈：DCS新能源补贴审核画面，1、查询条件中增加 事业部 、办事处  2、列表中在车架号后面增加  订单类型  贾明 2020-3-30 START
    private String sDiviCd;             // 事业部
    private String sOffCd;              // 办事处
    //R20032400090 张伟丽反馈：DCS新能源补贴审核画面，1、查询条件中增加 事业部 、办事处  2、列表中在车架号后面增加  订单类型  贾明 2020-3-30 END

  //CSR 111新能源申请流程增加八大领域功能选择项 贾明 2020-6-19 EIGHT_FIELDS 八大领域 WH_EIGHT_FIELDS 是否是 八大领域
    private String sEightFields;   //八大领域
    private String sWhEightFields; //是否是 八大领域 Y 是 ，N 否
    
    public String getAppliRecode() {
		return appliRecode;
	}
	public void setAppliRecode(String appliRecode) {
		this.appliRecode = appliRecode;
	} 
	//chenming 2019-9-17 增加申请记录查询 end
	
    
	
	public Date getApplDt() {
		return applDt;
	}
	public void setApplDt(Date applDt) {
		this.applDt = applDt;
	}
	public Date getAuditDt() {
		return auditDt;
	}
	public void setAuditDt(Date auditDt) {
		this.auditDt = auditDt;
	}
	public String getDlrNm() {
		return dlrNm;
	}
	public void setDlrNm(String dlrNm) {
		this.dlrNm = dlrNm;
	}
	public String getDlrCd() {
		return dlrCd;
	}
	public void setDlrCd(String dlrCd) {
		this.dlrCd = dlrCd;
	}
	public String getApplStart() {
		return applStart;
	}
	public void setApplStart(String applStart) {
		this.applStart = applStart;
	}
	public String getApplEnd() {
		return applEnd;
	}
	public void setApplEnd(String applEnd) {
		this.applEnd = applEnd;
	}
	public String getInvoStart() {
		return invoStart;
	}
	public void setInvoStart(String invoStart) {
		this.invoStart = invoStart;
	}
	public String getInvoEnd() {
		return invoEnd;
	}
	public void setInvoEnd(String invoEnd) {
		this.invoEnd = invoEnd;
	}
	public String getVinNo() {
		return vinNo;
	}
	public void setVinNo(String vinNo) {
		this.vinNo = vinNo;
	}
	public String getsLangCd() {
		return sLangCd;
	}
	public void setsLangCd(String sLangCd) {
		this.sLangCd = sLangCd;
	}
	public String getCustTp() {
		return custTp;
	}
	public void setCustTp(String custTp) {
		this.custTp = custTp;
	}
	public Date getApplStartDt() {
		return applStartDt;
	}
	public void setApplStartDt(Date applStartDt) {
		this.applStartDt = applStartDt;
	}
	public Date getApplEndDt() {
		return applEndDt;
	}
	public void setApplEndDt(Date applEndDt) {
		this.applEndDt = applEndDt;
	}
	public Date getInvoStartDt() {
		return invoStartDt;
	}
	public void setInvoStartDt(Date invoStartDt) {
		this.invoStartDt = invoStartDt;
	}
	public Date getInvoEndDt() {
		return invoEndDt;
	}
	public void setInvoEndDt(Date invoEndDt) {
		this.invoEndDt = invoEndDt;
	}
	public String getsApplicationNo() {
		return sApplicationNo;
	}
	public void setsApplicationNo(String sApplicationNo) {
		this.sApplicationNo = sApplicationNo;
	}
	public String getsDlrCd() {
		return sDlrCd;
	}
	public void setsDlrCd(String sDlrCd) {
		this.sDlrCd = sDlrCd;
	}
	public String getCustNm() {
		return custNm;
	}
	public void setCustNm(String custNm) {
		this.custNm = custNm;
	}
	
	public String getHpNo() {
		return hpNo;
	}
	public void setHpNo(String hpNo) {
		this.hpNo = hpNo;
	}
	public String getCarPurHumType() {
		return carPurHumType;
	}
	public void setCarPurHumType(String carPurHumType) {
		this.carPurHumType = carPurHumType;
	}
	public String getStatusNo() {
		return statusNo;
	}
	public void setStatusNo(String statusNo) {
		this.statusNo = statusNo;
	}
	public String getsDiviCd() {
		return sDiviCd;
	}
	public void setsDiviCd(String sDiviCd) {
		this.sDiviCd = sDiviCd;
	}
	public String getsOffCd() {
		return sOffCd;
	}
	public void setsOffCd(String sOffCd) {
		this.sOffCd = sOffCd;
	}
	public String getsEightFields() {
		return sEightFields;
	}
	public void setsEightFields(String sEightFields) {
		this.sEightFields = sEightFields;
	}
	public String getsWhEightFields() {
		return sWhEightFields;
	}
	public void setsWhEightFields(String sWhEightFields) {
		this.sWhEightFields = sWhEightFields;
	}
	
    
}
