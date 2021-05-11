package chn.bhmc.dms.cmm.ptl.vo;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 * <pre>
 * 포틀릿-직무/사용자 매핑 일괄저장 VO
 * </pre>
 *
 * @ClassName   : PortletMappingSaveVO.java
 * @Description : 포틀릿-직무/사용자 매핑 일괄저장 VO
 * @author
 * @since 2017. 2. 24.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 2. 24.                     최초 생성
 * </pre>
 */
public class PortletMappingSaveVO implements Serializable {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -6338803441030597375L;

    /**
     * 등록자ID
     */
    private String usrId;

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
     * 포틀릿 목록
     */
    private List<String> portlets = new ArrayList<String>();

	public String getUsrId() {
		return usrId;
	}

	public void setUsrId(String usrId) {
		this.usrId = usrId;
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

	public List<String> getPortlets() {
		return portlets;
	}

	public void setPortlets(List<String> portlets) {
		this.portlets = portlets;
	}
}
