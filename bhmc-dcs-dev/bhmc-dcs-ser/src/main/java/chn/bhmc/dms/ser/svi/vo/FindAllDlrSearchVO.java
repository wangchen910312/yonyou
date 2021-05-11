package chn.bhmc.dms.ser.svi.vo;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * <pre>
 * 查询所有经销商 VO
 * </pre>
 *
 * @ClassName   : FindAllDlrSearchVO.java
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
public class FindAllDlrSearchVO extends SearchVO {

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
	 * 办事处代码
	 */
	private String offCd;
	
	private String sLangCd;

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

	public String getOffCd() {
		return offCd;
	}

	public void setOffCd(String offCd) {
		this.offCd = offCd;
	}

	public String getsLangCd() {
		return sLangCd;
	}

	public void setsLangCd(String sLangCd) {
		this.sLangCd = sLangCd;
	}

	public FindAllDlrSearchVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public FindAllDlrSearchVO(String dlrCd, String dlrNm, String diviCd, String offCd, String sLangCd) {
		super();
		this.dlrCd = dlrCd;
		this.dlrNm = dlrNm;
		this.diviCd = diviCd;
		this.offCd = offCd;
		this.sLangCd = sLangCd;
	}

	
}
