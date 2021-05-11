package chn.bhmc.dms.cmm.nms.vo;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : NotificationMessageViewInfoVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 5. 12.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 12.     Kang Seok Han     최초 생성
 * </pre>
 */

public class NotificationMessageViewInfoVO implements Serializable {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -5716668226245634807L;

    private String viewId;
    private String viewNm;
    private String url;
    private Map<String, Object> params = new HashMap<String, Object>();
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
     * @return the url
     */
    public String getUrl() {
        return url;
    }
    /**
     * @param url the url to set
     */
    public void setUrl(String url) {
        this.url = url;
    }
    /**
     * @return the params
     */
    public Map<String, Object> getParams() {
        return params;
    }
    /**
     * @param params the params to set
     */
    public void setParams(Map<String, Object> params) {
        this.params = params;
    }



}
