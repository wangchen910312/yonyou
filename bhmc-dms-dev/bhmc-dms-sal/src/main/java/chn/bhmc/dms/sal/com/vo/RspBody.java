package chn.bhmc.dms.sal.com.vo;

import java.util.List;

import chn.bhmc.dms.sal.com.model.RenewalBiz;
import chn.bhmc.dms.sal.com.model.RenewalForce;
import chn.bhmc.dms.sal.com.model.RenewalRelation;
import chn.bhmc.dms.sal.com.model.RenewalVehicle;

/**
 * U车商续保查询返回实体
 */
public class RspBody {
	
	private String icName;
	
	private String icCode;
	
	private RenewalForce  forceInfo;
	
	private RenewalBiz bizInfo;
	
	List<RenewalRelation>  relationList;
	
	private RenewalVehicle vehicleInfo;
	
	private String resultCode;

	public String getResultCode() {
		return resultCode;
	}

	public void setResultCode(String resultCode) {
		this.resultCode = resultCode;
	}

	public String getIcName() {
		return icName;
	}

	public void setIcName(String icName) {
		this.icName = icName;
	}

	public String getIcCode() {
		return icCode;
	}

	public void setIcCode(String icCode) {
		this.icCode = icCode;
	}

	public RenewalForce getForceInfo() {
		return forceInfo;
	}

	public void setForceInfo(RenewalForce forceInfo) {
		this.forceInfo = forceInfo;
	}

	public RenewalBiz getBizInfo() {
		return bizInfo;
	}

	public void setBizInfo(RenewalBiz bizInfo) {
		this.bizInfo = bizInfo;
	}

	public List<RenewalRelation> getRelationList() {
		return relationList;
	}

	public void setRelationList(List<RenewalRelation> relationList) {
		this.relationList = relationList;
	}

	public RenewalVehicle getVehicleInfo() {
		return vehicleInfo;
	}

	public void setVehicleInfo(RenewalVehicle vehicleInfo) {
		this.vehicleInfo = vehicleInfo;
	}

	@Override
	public String toString() {
		return "RspBody [icName=" + icName + ", icCode=" + icCode + ", forceInfo=" + forceInfo + ", bizInfo=" + bizInfo
				+ ", relationList=" + relationList + ", vehicleInfo=" + vehicleInfo + "]";
	}
	
	
	
}
