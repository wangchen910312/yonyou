package chn.bhmc.dms.cmm.ptl.vo;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : PortletSettingVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 6. 3.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 6. 3.     Kang Seok Han     최초 생성
 * </pre>
 */

public class PortletDeployVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -5165344538546563353L;

    /**
     * 포틀릿 레이아웃 ID
     */
    private String portletLayoutId;

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
     * 열위치
     */
    private int rowLocCnt;

    /**
     * 행위치
     */
    private int columnLocCnt;

    /**
     * 사용자 ID
     */
    private String usrId;

    public PortletDeployVO(){}

    public PortletDeployVO(String portletLayoutId, String portletId, int rowLocCnt, int columnLocCnt, String regUsrId){
        this.portletLayoutId = portletLayoutId;
        this.portletId = portletId;
        this.rowLocCnt = rowLocCnt;
        this.columnLocCnt = columnLocCnt;
        this.setRegUsrId(regUsrId);
    }


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
     * @return the rowLocCnt
     */
    public int getRowLocCnt() {
        return rowLocCnt;
    }

    /**
     * @param rowLocCnt the rowLocCnt to set
     */
    public void setRowLocCnt(int rowLocCnt) {
        this.rowLocCnt = rowLocCnt;
    }

    /**
     * @return the columnLocCnt
     */
    public int getColumnLocCnt() {
        return columnLocCnt;
    }

    /**
     * @param columnLocCnt the columnLocCnt to set
     */
    public void setColumnLocCnt(int columnLocCnt) {
        this.columnLocCnt = columnLocCnt;
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
