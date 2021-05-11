package chn.bhmc.dms.cmm.ptl.vo;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * 포틀릿 레이아웃 VO 클래스
 * </pre>
 *
 * @ClassName   : PortletLayoutVO.java
 * @Description : 포틀릿 레이아웃 VO 클래스
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

public class PortletLayoutVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 8675744113430721412L;

    /**
     * 포틀릿 레이아웃 ID
     */
    private String portletLayoutId;

    /**
     * 포틀릿 레이아웃명
     */
    private String portletLayoutNm;

    /**
     * 포틀릿 레이아웃 URL
     */
    private String portletLayoutUrl;

    /**
     * 포틀릿 레이아웃 아이콘명
     */
    private String portletLayoutIconNm;

    /**
     * 디폴트 레이아웃 여부
     */
    private String defaultYn;

    /**
     * 행갯수
     */
    private int columnCnt;

    /**
     * 열갯수
     */
    private int rowCnt;

    /**
     * 사용자 ID
     */
    private String usrId;

    /**
     * @return the portletLayoutId
     */
    public String getPortletLayoutId() {
        return portletLayoutId;
    }

    /**
     * @param portletLayoutId the portletLayoutId to set
     */
    public void setPortletLayoutId(String portletLayoutId) {
        this.portletLayoutId = portletLayoutId;
    }

    /**
     * @return the portletLayoutNm
     */
    public String getPortletLayoutNm() {
        return portletLayoutNm;
    }

    /**
     * @param portletLayoutNm the portletLayoutNm to set
     */
    public void setPortletLayoutNm(String portletLayoutNm) {
        this.portletLayoutNm = portletLayoutNm;
    }

    /**
     * @return the portletLayoutUrl
     */
    public String getPortletLayoutUrl() {
        return portletLayoutUrl;
    }

    /**
     * @param portletLayoutUrl the portletLayoutUrl to set
     */
    public void setPortletLayoutUrl(String portletLayoutUrl) {
        this.portletLayoutUrl = portletLayoutUrl;
    }

    /**
     * @return the portletLayoutIconNm
     */
    public String getPortletLayoutIconNm() {
        return portletLayoutIconNm;
    }

    /**
     * @param portletLayoutIconNm the portletLayoutIconNm to set
     */
    public void setPortletLayoutIconNm(String portletLayoutIconNm) {
        this.portletLayoutIconNm = portletLayoutIconNm;
    }

    /**
     * @return the defaultYn
     */
    public String getDefaultYn() {
        return defaultYn;
    }

    /**
     * @param defaultYn the defaultYn to set
     */
    public void setDefaultYn(String defaultYn) {
        this.defaultYn = defaultYn;
    }

    /**
     * @return the columnCnt
     */
    public int getColumnCnt() {
        return columnCnt;
    }

    /**
     * @param columnCnt the columnCnt to set
     */
    public void setColumnCnt(int columnCnt) {
        this.columnCnt = columnCnt;
    }

    /**
     * @return the rowCnt
     */
    public int getRowCnt() {
        return rowCnt;
    }

    /**
     * @param rowCnt the rowCnt to set
     */
    public void setRowCnt(int rowCnt) {
        this.rowCnt = rowCnt;
    }

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

}
