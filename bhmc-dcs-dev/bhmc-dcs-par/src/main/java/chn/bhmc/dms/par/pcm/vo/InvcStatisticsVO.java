package chn.bhmc.dms.par.pcm.vo;
/**
 * 统计
 * @author liuxueying
 */
public class InvcStatisticsVO {
	private String dlrCd;//经销商编码
	private String dlrNm;//经销商名称
	private String diviNm;//事业部
	private String offNm;//办事处
	private String odrPnoQt;//订购品种数
	private String odrQt;//订购数
	private String boPnoQt;//缺件品种
	private String boQt;//缺件数
	private double avgDay;//平均发货时长(天)
	private String dlrCnt;//经销商数量
	private double boAvgDay;//平均缺货时长(天)
	private double totPurcAmt;//订单总金额
	private String odrNoCnt;//订单数量
	public String getDlrCd() {
		return dlrCd;
	}
	public void setDlrCd(String dlrCd) {
		this.dlrCd = dlrCd;
	}
	public String getDlrNm() {
		return dlrNm;
	}
	public void setDlrNm(String dlrNm) {
		this.dlrNm = dlrNm;
	}
	public String getDiviNm() {
		return diviNm;
	}
	public void setDiviNm(String diviNm) {
		this.diviNm = diviNm;
	}
	public String getOffNm() {
		return offNm;
	}
	public void setOffNm(String offNm) {
		this.offNm = offNm;
	}
	public String getOdrPnoQt() {
		return odrPnoQt;
	}
	public void setOdrPnoQt(String odrPnoQt) {
		this.odrPnoQt = odrPnoQt;
	}
	public String getOdrQt() {
		return odrQt;
	}
	public void setOdrQt(String odrQt) {
		this.odrQt = odrQt;
	}
	public String getBoPnoQt() {
		return boPnoQt;
	}
	public void setBoPnoQt(String boPnoQt) {
		this.boPnoQt = boPnoQt;
	}
	public String getBoQt() {
		return boQt;
	}
	public void setBoQt(String boQt) {
		this.boQt = boQt;
	}
	public double getAvgDay() {
		return avgDay;
	}
	public void setAvgDay(double avgDay) {
		this.avgDay = avgDay;
	}
	public String getDlrCnt() {
		return dlrCnt;
	}
	public void setDlrCnt(String dlrCnt) {
		this.dlrCnt = dlrCnt;
	}
	public double getBoAvgDay() {
		return boAvgDay;
	}
	public void setBoAvgDay(double boAvgDay) {
		this.boAvgDay = boAvgDay;
	}
	public double getTotPurcAmt() {
		return totPurcAmt;
	}
	public void setTotPurcAmt(double totPurcAmt) {
		this.totPurcAmt = totPurcAmt;
	}
	public String getOdrNoCnt() {
		return odrNoCnt;
	}
	public void setOdrNoCnt(String odrNoCnt) {
		this.odrNoCnt = odrNoCnt;
	}
	
}
