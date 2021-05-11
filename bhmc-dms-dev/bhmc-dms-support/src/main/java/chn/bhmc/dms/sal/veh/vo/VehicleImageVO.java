package chn.bhmc.dms.sal.veh.vo;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * 차량이미지 정보 VO
 * </pre>
 *
 * @ClassName   : VehicleImageVO.java
 * @Description : 차량이미지 정보 VO
 * @author Kang Seok Han
 * @since 2017. 4. 13.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 4. 13.   Kang Seok Han    최초 생성
 * </pre>
 */

public class VehicleImageVO extends BaseVO {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1523055015910462635L;
	
	/**
	 * 번호판
	 */
	private String licenseNo;
	
	/**
	 * 브랜드
	 */
	private String brand;
	
	/**
	 * 이미지명
	 */
	private String imgNm;
	
	/**
	 * 이미지파일명
	 */
	private String imgFileNm;
	
	/**
	 * 이미지삭제표시여부
	 */
	private String imgStatus;

	public String getLicenseNo() {
		return licenseNo;
	}

	public void setLicenseNo(String licenseNo) {
		this.licenseNo = licenseNo;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public String getImgNm() {
		return imgNm;
	}

	public void setImgNm(String imgNm) {
		this.imgNm = imgNm;
	}

	public String getImgFileNm() {
		return imgFileNm;
	}

	public void setImgFileNm(String imgFileNm) {
		this.imgFileNm = imgFileNm;
	}

	public String getImgStatus() {
		return imgStatus;
	}

	public void setImgStatus(String imgStatus) {
		this.imgStatus = imgStatus;
	}
}