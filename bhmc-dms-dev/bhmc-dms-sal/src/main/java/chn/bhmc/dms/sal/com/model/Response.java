package chn.bhmc.dms.sal.com.model;

public class Response {
	
	private String retCode;
	
	private String retDesc;
	
	private String timestamp;
	
	private String rspBody;

	public String getRetCode() {
		return retCode;
	}

	public void setRetCode(String retCode) {
		this.retCode = retCode;
	}

	public String getRetDesc() {
		return retDesc;
	}

	public void setRetDesc(String retDesc) {
		this.retDesc = retDesc;
	}

	public String getTimestamp() {
		return timestamp;
	}

	public void setTimestamp(String timestamp) {
		this.timestamp = timestamp;
	}

	public String getRspBody() {
		return rspBody;
	}

	public void setRspBody(String rspBody) {
		this.rspBody = rspBody;
	}

	@Override
	public String toString() {
		return "Response [retCode=" + retCode + ", retDesc=" + retDesc + ", timestamp=" + timestamp + ", rspBody="
				+ rspBody + "]";
	}
	
	

}
