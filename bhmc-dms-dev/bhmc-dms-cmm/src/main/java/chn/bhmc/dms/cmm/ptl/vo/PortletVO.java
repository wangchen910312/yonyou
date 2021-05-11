package chn.bhmc.dms.cmm.ptl.vo;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * 포틀릿 VO 클래스
 * </pre>
 *
 * @ClassName   : PortletVO.java
 * @Description : 포틀릿VO 클래스
 * @author Kang Seok Han
 * @since 2016. 4. 9.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 9.     Kang Seok Han     최초 생성
 * </pre>
 */

public class PortletVO extends BaseVO {


    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -5056221846033380014L;

    /**
     * 포틀릿 ID
     */
    private String portletId;

    /**
     * 포틀릿명
     */
    private String portletNm;

    /**
     * 포틀릿 URL
     */
    private String portletUrl;

    /**
     * 화면 ID
     */
    private String viewId;

    /**
     * 화면명
     */
    private String viewNm;

    /**
     * 새로고침 여부
     */
    private String reloadYn;

    /**
     * 메세지키
     */
    private String mesgKey;

    /**
     * 출력여부
     */
    private String displayYn;

    /**
     * @return the portletId
     */
    public String getPortletId() {
        return portletId;
    }

    /**
     * @param portletId the portletId to set
     */
    public void setPortletId(String portletId) {
        this.portletId = portletId;
    }

    /**
     * @return the portletNm
     */
    public String getPortletNm() {
        return portletNm;
    }

    /**
     * @param portletNm the portletNm to set
     */
    public void setPortletNm(String portletNm) {
        this.portletNm = portletNm;
    }

    /**
     * @return the portletUrl
     */
    public String getPortletUrl() {
        return portletUrl;
    }

    /**
     * @param portletUrl the portletUrl to set
     */
    public void setPortletUrl(String portletUrl) {
        this.portletUrl = portletUrl;
    }

    /**
     * @return the viewId
     */
    public String getViewId() {
        return viewId;
    }

    /**
     * @param viewId the viewId to set
     */
    public void setViewId(String viewId) {
        this.viewId = viewId;
    }

    /**
     * @return the viewNm
     */
    public String getViewNm() {
        return viewNm;
    }

    /**
     * @param viewNm the viewNm to set
     */
    public void setViewNm(String viewNm) {
        this.viewNm = viewNm;
    }

    /**
     * @return the reloadYn
     */
    public String getReloadYn() {
        return reloadYn;
    }

    /**
     * @param reloadYn the reloadYn to set
     */
    public void setReloadYn(String reloadYn) {
        this.reloadYn = reloadYn;
    }

    /**
     * @return the mesgKey
     */
    public String getMesgKey() {
        return mesgKey;
    }

    /**
     * @param mesgKey the mesgKey to set
     */
    public void setMesgKey(String mesgKey) {
        this.mesgKey = mesgKey;
    }

    /**
     * @return the displayYn
     */
    public String getDisplayYn() {
        return displayYn;
    }

    /**
     * @param displayYn the displayYn to set
     */
    public void setDisplayYn(String displayYn) {
        this.displayYn = displayYn;
    }
}
