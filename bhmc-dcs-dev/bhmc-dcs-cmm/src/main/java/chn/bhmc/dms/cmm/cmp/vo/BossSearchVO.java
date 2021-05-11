package chn.bhmc.dms.cmm.cmp.vo;

import chn.bhmc.dms.core.datatype.SearchVO;

public class BossSearchVO extends SearchVO{


	/**
	 * 
	 */
	private static final long serialVersionUID = -8555365130837402563L;

	/**
	 * 部门编号
	 */
	private String deptCd;
	
	/**
	 * 职位代码
	 */
	private String tskCd;
	
	/**
	 * 部门名称
	 */
	private String deptNm;
	
	/**
	 * 职位名称
	 */
	private String tskNm;

	public String getDeptCd() {
		return deptCd;
	}

	public void setDeptCd(String deptCd) {
		this.deptCd = deptCd;
	}

	public String getTskCd() {
		return tskCd;
	}

	public void setTskCd(String tskCd) {
		this.tskCd = tskCd;
	}

	public String getDeptNm() {
		return deptNm;
	}

	public void setDeptNm(String deptNm) {
		this.deptNm = deptNm;
	}

	public String getTskNm() {
		return tskNm;
	}

	public void setTskNm(String tskNm) {
		this.tskNm = tskNm;
	}
	
	
	
}
