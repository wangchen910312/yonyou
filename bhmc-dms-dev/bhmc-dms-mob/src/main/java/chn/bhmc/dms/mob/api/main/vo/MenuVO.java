package chn.bhmc.dms.mob.api.main.vo;

import java.io.Serializable;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : MenuVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 9. 26.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 9. 26.     Kang Seok Han     최초 생성
 * </pre>
 */

public class MenuVO implements Serializable {
    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -3767057029027599292L;

    private String parentViewId;
    private String childViewId;
    private String viewNm;
    private String viewTp;
    private String permYn;
    private String viewUrl;
    private int sortOrder;
    private String tCd;
    private String mesgKey;
    private String iconNm;
    private String webMobileDstinCd;
    /**
     * 마스크
     */
    private int mask;

    /**
     * 퍼미션
     */
    private String permissions;

    public MenuVO(){}

    public MenuVO(String parentViewId, String childViewId){
        this.parentViewId = parentViewId;
        this.childViewId = childViewId;
    }

    /**
     * @return the parentViewId
     */
    public String getParentViewId() {
        return parentViewId;
    }
    /**
     * @param parentViewId the parentViewId to set
     */
    public void setParentViewId(String parentViewId) {
        this.parentViewId = parentViewId;
    }
    /**
     * @return the childViewId
     */
    public String getChildViewId() {
        return childViewId;
    }
    /**
     * @param childViewId the childViewId to set
     */
    public void setChildViewId(String childViewId) {
        this.childViewId = childViewId;
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
     * @return the viewTp
     */
    public String getViewTp() {
        return viewTp;
    }

    /**
     * @param viewTp the viewTp to set
     */
    public void setViewTp(String viewTp) {
        this.viewTp = viewTp;
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
     * @return the viewUrl
     */
    public String getViewUrl() {
        return viewUrl;
    }
    /**
     * @param viewUrl the viewUrl to set
     */
    public void setViewUrl(String viewUrl) {
        this.viewUrl = viewUrl;
    }
    /**
     * @return the sortOrder
     */
    public int getSortOrder() {
        return sortOrder;
    }
    /**
     * @param sortOrder the sortOrder to set
     */
    public void setSortOrder(int sortOrder) {
        this.sortOrder = sortOrder;
    }
    /**
     * @return the tCd
     */
    public String gettCd() {
        return tCd;
    }
    /**
     * @param tCd the tCd to set
     */
    public void settCd(String tCd) {
        this.tCd = tCd;
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
     * @return the iconNm
     */
    public String getIconNm() {
        return iconNm;
    }
    /**
     * @param iconNm the iconNm to set
     */
    public void setIconNm(String iconNm) {
        this.iconNm = iconNm;
    }
    /**
     * @return the webMobileDstinCd
     */
    public String getWebMobileDstinCd() {
        return webMobileDstinCd;
    }
    /**
     * @param webMobileDstinCd the webMobileDstinCd to set
     */
    public void setWebMobileDstinCd(String webMobileDstinCd) {
        this.webMobileDstinCd = webMobileDstinCd;
    }

    /**
     * @return the mask
     */
    public int getMask() {
        return mask;
    }

    /**
     * @param mask the mask to set
     */
    public void setMask(int mask) {
        this.mask = mask;
    }

    /**
     * @return the permissions
     */
    public String getPermissions() {
        return permissions;
    }

    /**
     * @param permissions the permissions to set
     */
    public void setPermissions(String permissions) {
        this.permissions = permissions;
    }


}
