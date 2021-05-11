package chn.bhmc.dms.cmm.ptl.vo;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : PortletMappingVO.java
 * @Description : 포틀릿-직무 매핑 VO
 * @author Choi Kyung Yong
 * @since 2017. 2. 23.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 2. 23.   Choi Kyung Yong  최초 생성
 *  2017. 3. 08.   Han Kang Seok    필드 주석 추가
 * </pre>
 */

public class PortletMappingVO  extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 8626569159741014404L;

    /**
     * 포틀릿 ID
     */
    private String portletId;

    /**
     * 포틀릿명
     */
    private String portletNm;
    
    /**
     * 참조유형
     * 'T':직무
     * 'U':사용자
     */
    private String refTp;

    /**
     * 참조ID
     */
    private String refId;

    /**
     * 참조명
     */
    private String refNm;

    public PortletMappingVO(){}

    public PortletMappingVO(String portletId, String refTp, String refId, String usrId){
        super();

        this.portletId = portletId;
        this.refTp = refTp;
        this.refId = refId;
        super.setRegUsrId(usrId);
        super.setUpdtUsrId(usrId);
    }

	public String getPortletId() {
		return portletId;
	}

	public void setPortletId(String portletId) {
		this.portletId = portletId;
	}

	public String getPortletNm() {
		return portletNm;
	}

	public void setPortletNm(String portletNm) {
		this.portletNm = portletNm;
	}

	public String getRefTp() {
		return refTp;
	}

	public void setRefTp(String refTp) {
		this.refTp = refTp;
	}

	public String getRefId() {
		return refId;
	}

	public void setRefId(String refId) {
		this.refId = refId;
	}

	public String getRefNm() {
		return refNm;
	}

	public void setRefNm(String refNm) {
		this.refNm = refNm;
	}
}
