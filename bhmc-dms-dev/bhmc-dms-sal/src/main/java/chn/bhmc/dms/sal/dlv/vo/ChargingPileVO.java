package chn.bhmc.dms.sal.dlv.vo;

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

public class ChargingPileVO extends SearchVO  implements Serializable {

   
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	//字段
    private String installationNo;       //申请单编号
    private String isNeed;               //是否需要充电桩
    private String shopNo;               //店代码
    private String shopName;             //店名称
    
    private String divisionName;         //事业部
    private String officeName;           //办事处
    private String province;             //省
    private String city;                 //市
    
    private String custName;             //车主姓名
    private String custPhone;            //车主电话
    private String vinNo;                //VIN车架号
    private String carModel;             //车型
    
    private String installProvince;      //安装省
    private String installCity;          //安装市
    private String installArea;          //安装区
    private String address;              //安装详细地址
    private String state;                //单据状态
    private String carState;             //车辆状态
    private String dlrCd;				
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date invoiceDate;            //开票日期
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date insertDate;            //创建日期
    private String ifResult;			
    private String createDate;			//创建日期时间戳
    
    private String invoiceDateSta;
    private String invoiceDateEnd;
    private String insertDateSta; 
    private String insertDateEnd; 
    private String sSrchStartDt; 
    private String sSrchEndDt; 
    
    private String isNeedStr; 
    private String stateStr;                
    private String carStateStr;             
    
    //充电桩平台返回数据
    private String orderNo;    	//订单编号
    private String status;    	//执行状态
    private String statusStr;    	//执行状态
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date execDate;    	//执行日期
    
    private String execDateStr; //执行日期字符串
    private String execRemark;  //执行备注 
    private String company;    	//服务商名称
    
    private String name;    	//服务上负责人
    private String mobile;    	//负责人手机号
    private String email;    	//邮箱
    private String custCd;    	//客户编号
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date custSaleDt;    	//出库日期
    private String custSaleDtStr; //出库日期字符串
    private String ordTp;  //NDMS销售的车辆信息中增加“订单类型”并且把该信息传输到充电桩平台  贾明 2019-7-18
    private String carlineEnNm;					//CRS76 不能申请充电装的订单类型，除了试驾车N7以外，现在又增加了新的订单类型的需求，具体明细见  贾明2020-5-9 适用车型
    private int rnum; //行号
    
    
    
	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
	}

	public String getCustCd() {
		return custCd;
	}

	public void setCustCd(String custCd) {
		this.custCd = custCd;
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

	public String getIfResult() {
		return ifResult;
	}

	public void setIfResult(String ifResult) {
		this.ifResult = ifResult;
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

	//增加出库日期区间查询 update by lyy 2019-07-10 start
	public String getsSrchStartDt() {
		return sSrchStartDt;
	}

	public void setsSrchStartDt(String sSrchStartDt) {
		this.sSrchStartDt = sSrchStartDt;
	}

	public String getsSrchEndDt() {
		return sSrchEndDt;
	}

	public void setsSrchEndDt(String sSrchEndDt) {
		this.sSrchEndDt = sSrchEndDt;
	}
	public Date getCustSaleDt() {
		return custSaleDt;
	}

	public void setCustSaleDt(Date custSaleDt) {
		this.custSaleDt = custSaleDt;
	}

	public String getCustSaleDtStr() {
		return custSaleDtStr;
	}

	public void setCustSaleDtStr(String custSaleDtStr) {
		this.custSaleDtStr = custSaleDtStr;
	}

	//增加出库日期区间查询 update by lyy 2019-07-10 end
	public String getOrdTp() {
		return ordTp;
	}

	public void setOrdTp(String ordTp) {
		this.ordTp = ordTp;
	}
	public String getCarlineEnNm() {
		return carlineEnNm;
	}
	public void setCarlineEnNm(String carlineEnNm) {
		this.carlineEnNm = carlineEnNm;
	}
}
