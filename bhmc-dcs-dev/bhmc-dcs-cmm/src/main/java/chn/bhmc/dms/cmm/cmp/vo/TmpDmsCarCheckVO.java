package chn.bhmc.dms.cmm.cmp.vo;

import java.io.Serializable;

import chn.bhmc.dms.core.datatype.SearchVO;

public class TmpDmsCarCheckVO extends SearchVO implements Serializable{
	
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
	private int dmsTrans;
	private int dmsStock;
	private int dmsRetail;
	private int dmsStrategy;
	private int transDiff;
	private int stock_Diff;
	private int retailDiff;
	private int strategyDiff;
	private int totalDiff;
	private String checkResult;
	private String checkMessage;
	private String updateResult;
	private String updateMessage;
	
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
	public int getDmsTrans() {
		return dmsTrans;
	}
	public void setDmsTrans(int dmsTrans) {
		this.dmsTrans = dmsTrans;
	}
	public int getDmsStock() {
		return dmsStock;
	}
	public void setDmsStock(int dmsStock) {
		this.dmsStock = dmsStock;
	}
	public int getDmsRetail() {
		return dmsRetail;
	}
	public void setDmsRetail(int dmsRetail) {
		this.dmsRetail = dmsRetail;
	}
	public int getDmsStrategy() {
		return dmsStrategy;
	}
	public void setDmsStrategy(int dmsStrategy) {
		this.dmsStrategy = dmsStrategy;
	}
	public int getTransDiff() {
		return transDiff;
	}
	public void setTransDiff(int transDiff) {
		this.transDiff = transDiff;
	}
	public int getStock_Diff() {
		return stock_Diff;
	}
	public void setStock_Diff(int stock_Diff) {
		this.stock_Diff = stock_Diff;
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
	public String getCheckResult() {
		return checkResult;
	}
	public void setCheckResult(String checkResult) {
		this.checkResult = checkResult;
	}
	public String getCheckMessage() {
		return checkMessage;
	}
	public void setCheckMessage(String checkMessage) {
		this.checkMessage = checkMessage;
	}
	public String getUpdateResult() {
		return updateResult;
	}
	public void setUpdateResult(String updateResult) {
		this.updateResult = updateResult;
	}
	public String getUpdateMessage() {
		return updateMessage;
	}
	public void setUpdateMessage(String updateMessage) {
		this.updateMessage = updateMessage;
	}
	
}