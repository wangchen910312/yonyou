package chn.bhmc.dms.sal.com.model;

public class RenewalBizSelection {
	
	// amount 保额 String
	private String amount;
	
	// code 险种代码 String
	private String code;
	
	// premium 保费 String
	private String premium;
	
	// standard 标准保费 String
	private String standard;
	
	// rate 专修厂费率 String
	private String rate;

	public String getAmount() {
		return amount;
	}

	public void setAmount(String amount) {
		this.amount = amount;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getPremium() {
		return premium;
	}

	public void setPremium(String premium) {
		this.premium = premium;
	}

	public String getStandard() {
		return standard;
	}

	public void setStandard(String standard) {
		this.standard = standard;
	}

	public String getRate() {
		return rate;
	}

	public void setRate(String rate) {
		this.rate = rate;
	}

	@Override
	public String toString() {
		return "RenewalBizSelection [amount=" + amount + ", code=" + code + ", premium=" + premium + ", standard="
				+ standard + ", rate=" + rate + "]";
	}
}
