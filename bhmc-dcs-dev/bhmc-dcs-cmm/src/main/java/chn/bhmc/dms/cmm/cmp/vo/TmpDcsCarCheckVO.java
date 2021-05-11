package chn.bhmc.dms.cmm.cmp.vo;

import java.io.Serializable;

import chn.bhmc.dms.core.datatype.SearchVO;

public class TmpDcsCarCheckVO extends SearchVO implements Serializable{
	
	private static final long serialVersionUID = 1L;
	private String checkMonth;
	private String dlrCd;
	private String dmsIpNm;
	private String dmsUseYn;
	private String aliveYn;
	private int erpTrans;
	private int erpStock;
	private int erpRetail;
	private int erpStrategy;
	private int dcsTrans;
	private int dcsStock;
	private int dcsRetail;
	private int dcsStrategy;
	private int transDiff;
	private int stockDiff;
	private int retailDiff;
	private int strategyDiff;
	private int totalDiff;
	public String getCheckMonth() {
		return checkMonth;
	}
	public void setCheckMonth(String checkMonth) {
		this.checkMonth = checkMonth;
	}
	public String getDlrCd() {
		return dlrCd;
	}
	public void setDlrCd(String dlrCd) {
		this.dlrCd = dlrCd;
	}
	public String getDmsIpNm() {
		return dmsIpNm;
	}
	public void setDmsIpNm(String dmsIpNm) {
		this.dmsIpNm = dmsIpNm;
	}
	public String getDmsUseYn() {
		return dmsUseYn;
	}
	public void setDmsUseYn(String dmsUseYn) {
		this.dmsUseYn = dmsUseYn;
	}
	public String getAliveYn() {
		return aliveYn;
	}
	public void setAliveYn(String aliveYn) {
		this.aliveYn = aliveYn;
	}
	public int getErpTrans() {
		return erpTrans;
	}
	public void setErpTrans(int erpTrans) {
		this.erpTrans = erpTrans;
	}
	public int getErpStock() {
		return erpStock;
	}
	public void setErpStock(int erpStock) {
		this.erpStock = erpStock;
	}
	public int getErpRetail() {
		return erpRetail;
	}
	public void setErpRetail(int erpRetail) {
		this.erpRetail = erpRetail;
	}
	public int getErpStrategy() {
		return erpStrategy;
	}
	public void setErpStrategy(int erpStrategy) {
		this.erpStrategy = erpStrategy;
	}
	public int getDcsTrans() {
		return dcsTrans;
	}
	public void setDcsTrans(int dcsTrans) {
		this.dcsTrans = dcsTrans;
	}
	public int getDcsStock() {
		return dcsStock;
	}
	public void setDcsStock(int dcsStock) {
		this.dcsStock = dcsStock;
	}
	public int getDcsRetail() {
		return dcsRetail;
	}
	public void setDcsRetail(int dcsRetail) {
		this.dcsRetail = dcsRetail;
	}
	public int getDcsStrategy() {
		return dcsStrategy;
	}
	public void setDcsStrategy(int dcsStrategy) {
		this.dcsStrategy = dcsStrategy;
	}
	public int getTransDiff() {
		return transDiff;
	}
	public void setTransDiff(int transDiff) {
		this.transDiff = transDiff;
	}
	public int getStockDiff() {
		return stockDiff;
	}
	public void setStockDiff(int stockDiff) {
		this.stockDiff = stockDiff;
	}
	public int getRetailDiff() {
		return retailDiff;
	}
	public void setRetailDiff(int retailDiff) {
		this.retailDiff = retailDiff;
	}
	public int getStrategyDiff() {
		return strategyDiff;
	}
	public void setStrategyDiff(int strategyDiff) {
		this.strategyDiff = strategyDiff;
	}
	public int getTotalDiff() {
		return totalDiff;
	}
	public void setTotalDiff(int totalDiff) {
		this.totalDiff = totalDiff;
	}
	
	
}