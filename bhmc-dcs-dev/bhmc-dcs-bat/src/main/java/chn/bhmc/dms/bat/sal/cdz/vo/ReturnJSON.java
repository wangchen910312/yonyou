package chn.bhmc.dms.bat.sal.cdz.vo;

public class ReturnJSON {
	protected String msg="";
	protected int resultCode=200;
	protected String installationNo;

	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public int getResultCode() {
		return resultCode;
	}
	public void setResultCode(int resultCode) {
		this.resultCode = resultCode;
	}
	public String getInstallationNo() {
		return installationNo;
	}
	public void setInstallationNo(String installationNo) {
		this.installationNo = installationNo;
	}

}
