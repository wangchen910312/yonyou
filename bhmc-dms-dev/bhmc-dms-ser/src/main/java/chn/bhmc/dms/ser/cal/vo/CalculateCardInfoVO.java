package chn.bhmc.dms.ser.cal.vo;

import chn.bhmc.dms.core.datatype.BaseVO;

import com.fasterxml.jackson.annotation.JsonProperty;




public class CalculateCardInfoVO extends BaseVO{
	
	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@JsonProperty("code")
	private String code;//成功标识 0 代表成功 -1失败

	@JsonProperty("msg")
	private String msg;  //错误信息
	
	@JsonProperty("card_id")
	private String cardId;  //卡券号
	
	@JsonProperty("card_name")
	private String cardName;  //卡券名称
	
	@JsonProperty("card_type")
	private String cardType;  //卡券类型
	
	@JsonProperty("card_denomination")
	private String cardDenomination;  //卡券面额
	
	
	@JsonProperty("expiration_date")
	private String expirationDate;  //有效期
	
	@JsonProperty("instructions")
	private String instructions;  //使用说明
	
	@JsonProperty("settlement_amount")
	private String settlementAmount;  //结算金额

	
	
	@Override
	public String toString() {
		return super.toString();
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public String getCardId() {
		return cardId;
	}

	public void setCardId(String cardId) {
		this.cardId = cardId;
	}

	public String getCardName() {
		return cardName;
	}

	public void setCardName(String cardName) {
		this.cardName = cardName;
	}

	

	public String getExpirationDate() {
		return expirationDate;
	}

	public void setExpirationDate(String expirationDate) {
		this.expirationDate = expirationDate;
	}

	public String getInstructions() {
		return instructions;
	}

	public void setInstructions(String instructions) {
		this.instructions = instructions;
	}

	public String getCardType() {
		return cardType;
	}

	public void setCardType(String cardType) {
		this.cardType = cardType;
	}

	public String getCardDenomination() {
		return cardDenomination;
	}

	public void setCardDenomination(String cardDenomination) {
		this.cardDenomination = cardDenomination;
	}

	public String getSettlementAmount() {
		return settlementAmount;
	}

	public void setSettlementAmount(String settlementAmount) {
		this.settlementAmount = settlementAmount;
	}

	

	
	
	

	
	
	
}
