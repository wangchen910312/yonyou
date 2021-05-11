package chn.bhmc.dms.ser.svi.vo;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * 办事处表 VO
 * </pre>
 *
 * @ClassName   : OfficeTableVO.java
 * @Description : 办事处表 VO
 * @author chen shengan
 * @since 2021. 3. 31.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2021. 3. 31.     chen shengan     办事处表
 * </pre>
 */
public class OfficeTableVO extends BaseVO  {
	
	/**
	 * 区域id
	 */
	private String diviCd;
	
	/**
	 * 办事处id
	 */
	private String offCd;
	
	/**
	 * 办事处名称
	 */
	private String offNm;

	public String getDiviCd() {
		return diviCd;
	}

	public void setDiviCd(String diviCd) {
		this.diviCd = diviCd;
	}

	public String getOffCd() {
		return offCd;
	}

	public void setOffCd(String offCd) {
		this.offCd = offCd;
	}

	public String getOffNm() {
		return offNm;
	}

	public void setOffNm(String offNm) {
		this.offNm = offNm;
	}

	public OfficeTableVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public OfficeTableVO(String diviCd, String offCd, String offNm) {
		super();
		this.diviCd = diviCd;
		this.offCd = offCd;
		this.offNm = offNm;
	}
	

}
