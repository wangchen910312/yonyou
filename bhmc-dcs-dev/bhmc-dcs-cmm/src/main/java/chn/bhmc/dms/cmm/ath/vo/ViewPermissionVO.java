package chn.bhmc.dms.cmm.ath.vo;

import java.io.Serializable;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ViewPermissionVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2017. 2. 16.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 2. 16.     Kang Seok Han     최초 생성
 * </pre>
 */

public class ViewPermissionVO implements Serializable {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 6969743786701676210L;

    /**
     * 퍼미션명
     */
    private String permissionName;

    /**
     * 퍼미션 출력명
     */
    private String permissionDisplayName;

    /**
     * 권한유무
     */
    private String permYn;

    /**
     * 참조ID
     */
    private String refId;

    /**
     * 화면ID
     */
    private String viewId;

    /**
     * @return the permissionName
     */
    public String getPermissionName() {
        return permissionName;
    }

    /**
     * @param permissionName the permissionName to set
     */
    public void setPermissionName(String permissionName) {
        this.permissionName = permissionName;
    }

    /**
     * @return the permissionDisplayName
     */
    public String getPermissionDisplayName() {
        return permissionDisplayName;
    }

    /**
     * @param permissionDisplayName the permissionDisplayName to set
     */
    public void setPermissionDisplayName(String permissionDisplayName) {
        this.permissionDisplayName = permissionDisplayName;
    }

    /**
     * @return the permYn
     */
    public String getPermYn() {
        return permYn;
    }

    /**
     * @param permYn the permYn to set
     */
    public void setPermYn(String permYn) {
        this.permYn = permYn;
    }

    /**
     * @return the refId
     */
    public String getRefId() {
        return refId;
    }

    /**
     * @param refId the refId to set
     */
    public void setRefId(String refId) {
        this.refId = refId;
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
}
