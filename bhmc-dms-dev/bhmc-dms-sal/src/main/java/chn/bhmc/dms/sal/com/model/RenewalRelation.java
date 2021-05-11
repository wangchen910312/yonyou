package chn.bhmc.dms.sal.com.model;

public class RenewalRelation {
	
	// type 类型 int 1车主信息;2投保人信息;3被保人信息
	private Integer type;
	
	// name 姓名 String
	private String name;
	
	// phone 电话 String
	private String phone;
	
	// documentNo 证件号 String
	private String documentNo;
	
	// address 地址 String
	private String address;
	
	// documentType 证件类型 String
	private String documentType;
	
	// holderType 保险持有人类型 String
	private String holderType;

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getDocumentNo() {
		return documentNo;
	}

	public void setDocumentNo(String documentNo) {
		this.documentNo = documentNo;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getDocumentType() {
		return documentType;
	}

	public void setDocumentType(String documentType) {
		this.documentType = documentType;
	}

	public String getHolderType() {
		return holderType;
	}

	public void setHolderType(String holderType) {
		this.holderType = holderType;
	}

	@Override
	public String toString() {
		return "RenewalRelation [type=" + type + ", name=" + name + ", phone=" + phone + ", documentNo=" + documentNo
				+ ", address=" + address + ", documentType=" + documentType + ", holderType=" + holderType + "]";
	}
	
	
	
	
}
