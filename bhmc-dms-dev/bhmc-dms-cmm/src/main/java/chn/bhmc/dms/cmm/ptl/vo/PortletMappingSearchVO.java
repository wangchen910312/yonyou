package chn.bhmc.dms.cmm.ptl.vo;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : PortletMappingSearchVO.java
 * @Description : 포틀릿-직무/사용자 매핑 SearchVO
 * @author Kang Seok Han
 * @since 2017. 3. 9.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 3. 9.    Kang Seok Han    최초 생성
 * </pre>
 */

public class PortletMappingSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -6876041175776410923L;

    /**
     * 포틀릿 ID
     */
    private String sPortletId;

    /**
     * 포틀릿명
     */
    private String sPortletNm;

    /**
     * 출력여부
     */
    private String sDisplayYn;

    /**
     * 참조유형
     * 'T':직무
     * 'U':사용자
     */
    private String sRefTp;
    
    /**
     * 참조ID
     */
    private String sRefId;

	public String getsPortletId() {
		return sPortletId;
	}

	public void setsPortletId(String sPortletId) {
		this.sPortletId = sPortletId;
	}

	public String getsPortletNm() {
		return sPortletNm;
	}

	public void setsPortletNm(String sPortletNm) {
		this.sPortletNm = sPortletNm;
	}

	public String getsDisplayYn() {
		return sDisplayYn;
	}

	public void setsDisplayYn(String sDisplayYn) {
		this.sDisplayYn = sDisplayYn;
	}

	public String getsRefTp() {
		return sRefTp;
	}

	public void setsRefTp(String sRefTp) {
		this.sRefTp = sRefTp;
	}

	public String getsRefId() {
		return sRefId;
	}

	public void setsRefId(String sRefId) {
		this.sRefId = sRefId;
	}
}
