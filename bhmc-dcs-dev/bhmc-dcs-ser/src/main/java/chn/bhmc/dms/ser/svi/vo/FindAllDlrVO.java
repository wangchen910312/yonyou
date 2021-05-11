package chn.bhmc.dms.ser.svi.vo;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * 查询所有经销商 VO
 * </pre>
 *
 * @ClassName   : FindAllDlrVO.java
 * @Description : 查询所有经销商 VO
 * @author chen shengan
 * @since 2021. 3. 31.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2021. 3. 31.     chen shengan        查询所有经销商
 * </pre>
 */
public class FindAllDlrVO extends BaseVO {
	
	/**
	 * 经销商代码
	 */
	private String dlrCd;
	
	/**
	 * 经销商名称
	 */
	private String dlrNm;
	
	/**
	 * 区域代码
	 */
	private String diviCd;
	
	/**
	 * 区域名称
	 */
	private String diviNm;
	
	/**
	 * 办事处代码
	 */
	private String offCd;
	
	/**
	 * 办事处名称
	 */
	private String offNm;

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

	public FindAllDlrVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public FindAllDlrVO(String dlrCd, String dlrNm, String diviCd, String diviNm, String offCd, String offNm) {
		super();
		this.dlrCd = dlrCd;
		this.dlrNm = dlrNm;
		this.diviCd = diviCd;
		this.diviNm = diviNm;
		this.offCd = offCd;
		this.offNm = offNm;
	}

	
}
