package chn.bhmc.dms.ser.svi.vo;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * 查询所有车种和车辆用途信息 VO
 * </pre>
 *
 * @ClassName   : FindAllCarlineAndPcDstinVO.java
 * @Description : 查询所有车种和车辆用途信息 VO
 * @author chen shengan
 * @since 2021. 3. 31.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2021. 3. 31.     chen shengan        查询所有车种和车辆用途信息
 * </pre>
 */
public class FindAllCarlineAndPcDstinVO  extends BaseVO {
	
	/**
	 * 经销商代码
	 */
	private String dlrCd;
	
	/**
	 * 商乘用代码
	 */
	private String pcDstinCd;
	
	/**
	 * 商乘用名称
	 */
	private String pcDstinNm;
	
	/**
	 * 车种代码
	 */
	private String carlineCd;
	
	/**
	 * 车种名称
	 */
	private String carlineNm;
	
	/**
	 * 车种英文
	 */
	private String carlineEnNm;
	
	/**
	 * 是否使用
	 */
	private String useYn;
	
	private String userId;

	public String getDlrCd() {
		return dlrCd;
	}

	public void setDlrCd(String dlrCd) {
		this.dlrCd = dlrCd;
	}

	public String getPcDstinCd() {
		return pcDstinCd;
	}

	public void setPcDstinCd(String pcDstinCd) {
		this.pcDstinCd = pcDstinCd;
	}

	public String getPcDstinNm() {
		return pcDstinNm;
	}

	public void setPcDstinNm(String pcDstinNm) {
		this.pcDstinNm = pcDstinNm;
	}

	public String getCarlineCd() {
		return carlineCd;
	}

	public void setCarlineCd(String carlineCd) {
		this.carlineCd = carlineCd;
	}

	public String getCarlineNm() {
		return carlineNm;
	}

	public void setCarlineNm(String carlineNm) {
		this.carlineNm = carlineNm;
	}

	public String getCarlineEnNm() {
		return carlineEnNm;
	}

	public void setCarlineEnNm(String carlineEnNm) {
		this.carlineEnNm = carlineEnNm;
	}

	public String getUseYn() {
		return useYn;
	}

	public void setUseYn(String useYn) {
		this.useYn = useYn;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public FindAllCarlineAndPcDstinVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public FindAllCarlineAndPcDstinVO(String dlrCd, String pcDstinCd, String pcDstinNm, String carlineCd,
			String carlineNm, String carlinrEnNm, String useYn, String userId) {
		super();
		this.dlrCd = dlrCd;
		this.pcDstinCd = pcDstinCd;
		this.pcDstinNm = pcDstinNm;
		this.carlineCd = carlineCd;
		this.carlineNm = carlineNm;
		this.carlineEnNm = carlineEnNm;
		this.useYn = useYn;
		this.userId = userId;
	}

	
}
