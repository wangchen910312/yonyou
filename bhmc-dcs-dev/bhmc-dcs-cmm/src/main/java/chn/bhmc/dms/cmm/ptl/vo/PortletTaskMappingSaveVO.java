package chn.bhmc.dms.cmm.ptl.vo;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 * <pre>
 * 포틀릿-직무 매핑 일괄저장 VO
 * </pre>
 *
 * @ClassName   : PortletSaveVO.java
 * @Description : 포틀릿 일괄저장 VO
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
public class PortletTaskMappingSaveVO implements Serializable {

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
     * 직무코드
     */
    private String tskCd;

    /**
     * 포틀릿 목록
     */
    private List<String> portlets = new ArrayList<String>();

    /**
     * @return the usrId
     */
    public String getUsrId() {
        return usrId;
    }

    /**
     * @param usrId the usrId to set
     */
    public void setUsrId(String usrId) {
        this.usrId = usrId;
    }

    /**
     * @return the tskCd
     */
    public String getTskCd() {
        return tskCd;
    }

    /**
     * @param tskCd the tskCd to set
     */
    public void setTskCd(String tskCd) {
        this.tskCd = tskCd;
    }

    /**
     * @return the portlets
     */
    public List<String> getPortlets() {
        return portlets;
    }

    /**
     * @param portlets the portlets to set
     */
    public void setPortlets(List<String> portlets) {
        this.portlets = portlets;
    }
}
