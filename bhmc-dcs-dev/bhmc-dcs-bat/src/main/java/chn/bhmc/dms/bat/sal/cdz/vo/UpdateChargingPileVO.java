package chn.bhmc.dms.bat.sal.cdz.vo;

import java.io.Serializable;
import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.datatype.SearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ChargingPileVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author kim yewon
 * @since 2019. 4. 4.
 * @version 1.0
 * @see
 * @Modification Information
 */

public class UpdateChargingPileVO extends SearchVO{

   
	/**
	 *
	 */
	private static final long serialVersionUID = 3244037395135397878L;
	
	//字段
    private String ifSeq;                //序列号,主键唯一
    private String installationNo;       //申请单编号
    private String isNeed;               //是否需要充电桩
    private String shopNo;               //店代码
    private String shopName;             //店名称
    
    private String divisionName;         //事业部
    private String officeName;           //办事处
    private String province;             //省
    private String city;                 //市
    private String area;                 //区
    
    private String custName;             //车主姓名
    private String custPhone;            //车主电话
    private String Gender;               //性别
    private String vinNo;                //VIN车架号
    private String carModel;             //车型
    
    private String installProvince;      //安装省
    private String installCity;          //安装市
    private String installArea;          //安装区
    private String address;              //安装详细地址
    private String state;                //单据状态
    private String carState;             //车辆状态
    private String dlrCd;				 //经销商代码
    private String dlrNm;				 //经销商名称
    private Date invoiceDate;            //开票日期
    private Date insertDate;            //创建日期
    private String ifresult;			
    private String iffailmsg;			
    private String createDate;			//创建日期时间戳
    
    private String invoiceDateSta;
    private String invoiceDateEnd;
    private String insertDateSta; 
    private String insertDateEnd; 
    
    private String isNeedStr; 
    private String stateStr;                
    private String carStateStr;             
    private String remark;             
    
    //充电桩平台返回数据
    private String orderNo;    	//订单编号
    private String status;    	//执行状态
    private String statusStr;    	//执行状态
    private Date execDate;    	//执行日期
    
    private String execDateStr; //执行日期字符串
    private String execRemark;  //执行备注 
    private String company;    	//服务商名称
    
    private String name;    	//服务上负责人
    private String mobile;    	//负责人手机号
    private String email;    	//邮箱
    private String limit;             //单次发送条数
    private String ordTp;       //NDMS销售的车辆信息中增加“订单类型”并且把该信息传输到充电桩平台  贾明 2019-7-19
    private String ordTpNm;       //NDMS销售的车辆信息中增加“订单类型中文”并且把该信息传输到充电桩平台  贾明 2019-7-19
    
    
	public String getIfSeq() {
		return ifSeq;
	}
	public void setIfSeq(String ifSeq) {
		this.ifSeq = ifSeq;
	}
	public String getDlrNm() {
		return dlrNm;
	}

	public void setDlrNm(String dlrNm) {
		this.dlrNm = dlrNm;
	}

	public String getStateStr() {
		return stateStr;
	}

	public void setStateStr(String stateStr) {
		this.stateStr = stateStr;
	}

	public String getCarStateStr() {
		return carStateStr;
	}

	public void setCarStateStr(String carStateStr) {
		this.carStateStr = carStateStr;
	}

	public String getIsNeedStr() {
		return isNeedStr;
	}

	public void setIsNeedStr(String isNeedStr) {
		this.isNeedStr = isNeedStr;
	}

	public String getInvoiceDateSta() {
		return invoiceDateSta;
	}

	public void setInvoiceDateSta(String invoiceDateSta) {
		this.invoiceDateSta = invoiceDateSta;
	}

	public String getInvoiceDateEnd() {
		return invoiceDateEnd;
	}

	public void setInvoiceDateEnd(String invoiceDateEnd) {
		this.invoiceDateEnd = invoiceDateEnd;
	}

	public String getInsertDateSta() {
		return insertDateSta;
	}

	public void setInsertDateSta(String insertDateSta) {
		this.insertDateSta = insertDateSta;
	}

	public String getInsertDateEnd() {
		return insertDateEnd;
	}

	public void setInsertDateEnd(String insertDateEnd) {
		this.insertDateEnd = insertDateEnd;
	}

	public String getCarState() {
		return carState;
	}

	public void setCarState(String carState) {
		if("01".equals(carState)){
			this.carStateStr = "已售";
		}else if("02".equals(carState)){
			this.carStateStr = "退库";
		}
		this.carState = carState;
	}

	public Date getInsertDate() {
		return insertDate;
	}

	public void setInsertDate(Date insertDate) {
		this.insertDate = insertDate;
	}

	public String getInstallationNo() {
		return installationNo;
	}

	public void setInstallationNo(String installationNo) {
		this.installationNo = installationNo;
	}

	public String getIsNeed() {
		return isNeed;
	}

	public void setIsNeed(String isNeed) {
		if("01".equals(isNeed)){
			this.isNeedStr = "安装";
		}else{
			this.isNeedStr = "不安装";
		}
		this.isNeed = isNeed;
	}

	public String getShopNo() {
		return shopNo;
	}

	public void setShopNo(String shopNo) {
		this.shopNo = shopNo;
	}

	public String getShopName() {
		return shopName;
	}

	public void setShopName(String shopName) {
		this.shopName = shopName;
	}

	public String getDivisionName() {
		return divisionName;
	}

	public void setDivisionName(String divisionName) {
		this.divisionName = divisionName;
	}

	public String getOfficeName() {
		return officeName;
	}

	public void setOfficeName(String officeName) {
		this.officeName = officeName;
	}

	public String getProvince() {
		return province;
	}

	public void setProvince(String province) {
		this.province = province;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public String getCustName() {
		return custName;
	}

	public void setCustName(String custName) {
		this.custName = custName;
	}

	public String getCustPhone() {
		return custPhone;
	}

	public void setCustPhone(String custPhone) {
		this.custPhone = custPhone;
	}

	public String getGender() {
		return Gender;
	}

	public void setGender(String gender) {
		Gender = gender;
	}

	public String getVinNo() {
		return vinNo;
	}

	public void setVinNo(String vinNo) {
		this.vinNo = vinNo;
	}

	public String getCarModel() {
		return carModel;
	}

	public void setCarModel(String carModel) {
		this.carModel = carModel;
	}

	public String getInstallProvince() {
		return installProvince;
	}

	public void setInstallProvince(String installProvince) {
		this.installProvince = installProvince;
	}

	public String getInstallCity() {
		return installCity;
	}

	public void setInstallCity(String installCity) {
		this.installCity = installCity;
	}

	public String getInstallArea() {
		return installArea;
	}

	public void setInstallArea(String installArea) {
		this.installArea = installArea;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		if("01".equals(state)){
			this.stateStr = "新建";
		}else if("02".equals(state)){
			this.stateStr = "已提报";
		}else{
			this.stateStr = "作废";
		}
		this.state = state;
	}

	public Date getInvoiceDate() {
		return invoiceDate;
	}

	public void setInvoiceDate(Date invoiceDate) {
		this.invoiceDate = invoiceDate;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public String getCreateDate() {
		return createDate;
	}

	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}

	public String getIfresult() {
		return ifresult;
	}

	public void setIfresult(String ifresult) {
		this.ifresult = ifresult;
	}

	public String getDlrCd() {
		return dlrCd;
	}

	public void setDlrCd(String dlrCd) {
		this.dlrCd = dlrCd;
	}

	public String getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		if("10".equals(status)){
			this.statusStr = "已接单";
		}
		if("20".equals(status)){
			this.statusStr = "安装已完成";
		}
		if("30".equals(status)){
			this.statusStr = "暂停状态";
		}
		if("40".equals(status)){
			this.statusStr = "超期";
		}
		this.status = status;
	}

	public Date getExecDate() {
		return execDate;
	}

	public void setExecDate(Date execDate) {
		this.execDate = execDate;
	}

	public String getExecDateStr() {
		return execDateStr;
	}

	public void setExecDateStr(String execDateStr) {
		this.execDateStr = execDateStr;
	}

	public String getExecRemark() {
		return execRemark;
	}

	public void setExecRemark(String execRemark) {
		this.execRemark = execRemark;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getStatusStr() {
		return statusStr;
	}

	public void setStatusStr(String statusStr) {
		this.statusStr = statusStr;
	}

	public String getIffailmsg() {
		return iffailmsg;
	}

	public void setIffailmsg(String iffailmsg) {
		this.iffailmsg = iffailmsg;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getLimit() {
		return limit;
	}

	public void setLimit(String limit) {
		this.limit = limit;
	}

	public String getOrdTp() {
		return ordTp;
	}

	public void setOrdTp(String ordTp) {
		this.ordTp = ordTp;
	}

	public String getOrdTpNm() {
		return ordTpNm;
	}

	public void setOrdTpNm(String ordTpNm) {
		this.ordTpNm = ordTpNm;
	}
   
}
