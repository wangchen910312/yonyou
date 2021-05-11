package chn.bhmc.dms.par.pmm.vo;

import java.io.Serializable;

public class MvtDocResultVO implements Serializable {

	/**
	 *
	 */
	private static final long serialVersionUID = 3474741125998278532L;

	/**
	 * 수불문서번호
	 */
	private String mdocNo;
	/**
	 * 수불문서년월
	 */
	private String mdocYm;

	/**
	 * 수불문서라인번호
	 */
	private Long mdocLineNo;

	/**
	 * 처리결과 코드 (E:오류, S:성공)
	 */
	private String returnType;

	/**
	 * 처리결과메세지
	 */
	private String returnMessage;

	public String getMdocNo() {
		return mdocNo;
	}

	public void setMdocNo(String mdocNo) {
		this.mdocNo = mdocNo;
	}

	public String getMdocYm() {
		return mdocYm;
	}

	public void setMdocYm(String mdocYm) {
		this.mdocYm = mdocYm;
	}


	public Long getMdocLineNo() {
		return mdocLineNo;
	}

	public void setMdocLineNo(Long mdocLineNo) {
		this.mdocLineNo = mdocLineNo;
	}

	public String getReturnType() {
		return returnType;
	}

	public void setReturnType(String returnType) {
		this.returnType = returnType;
	}

	public String getReturnMessage() {
		return returnMessage;
	}

	public void setReturnMessage(String returnMessage) {
		this.returnMessage = returnMessage;
	}


}
