package chn.bhmc.dms.ser.svi.vo;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * 区域表 VO
 * </pre>
 *
 * @ClassName   : RegionTableVO.java
 * @Description : 区域表 VO
 * @author chen shengan
 * @since 2021. 3. 31.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2021. 3. 31.     chen shengan     区域表
 * </pre>
 */
public class RegionTableVO extends BaseVO {

	/**
	 * 区域id
	 */
	private String diviCd;
	
	/**
	 * 区域名称
	 */
	private String diviNm;

	public String getDiviCd() {
		return diviCd;
	}

	public void setDiviCd(String diviCd) {
		this.diviCd = diviCd;
	}

	public String getDiviNm() {
		return diviNm;
	}

	public void setDiviNm(String diviNm) {
		this.diviNm = diviNm;
	}

	public RegionTableVO(String diviCd, String diviNm) {
		super();
		this.diviCd = diviCd;
		this.diviNm = diviNm;
	}

	public RegionTableVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
