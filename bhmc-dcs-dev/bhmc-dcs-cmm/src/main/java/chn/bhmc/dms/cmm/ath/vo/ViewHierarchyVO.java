package chn.bhmc.dms.cmm.ath.vo;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ViewHierarchyVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 1. 18.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 18.     Kang Seok Han     최초 생성
 * </pre>
 */
public class ViewHierarchyVO extends BaseVO implements Comparable<ViewHierarchyVO> {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 5694283588263044893L;

    /**
     * 시스템코드
     */
    private String sysCd;

    /**
     * 상위화면 ID
     */
    private String parentViewId;

    /**
     * 상위화면명
     */
    private String parentViewNm;

    /**
     * 상위화면 URL
     */
    private String parentViewUrl;

    /**
     * 상위화면 메세지키
     */
    private String parentMesgKey;

    /**
     * 상위화면 정렬순서
     */
    private int parentSortOrder;

    /**
     * 하위화면 ID
     */
    private String childViewId;

    /**
     * 하위화면명
     */
    private String childViewNm;

    /**
     * 하위화면 URL
     */
    private String childViewUrl;

    /**
     * 하위화면 유형
     */
    private String childViewTp;

    /**
     * 하위화면 메세지키
     */
    private String childMesgKey;

    /**
     * 하위화면 정렬순서
     */
    private int childSortOrder;

    /**
     * 하위화면 퍼미션
     */
    private String childViewPermissions;

    /**
     * 레벨
     */
    private int level;

    /**
     * 사용자 메뉴권한 부여여부
     */
    private String userMenuYn;

    public ViewHierarchyVO(){}

    public ViewHierarchyVO(String parentViewId, String parentViewNm, String childViewId, String childViewNm){
        this.parentViewId = parentViewId;
        this.parentViewNm = parentViewNm;
        this.childViewId = childViewId;
        this.childViewNm= childViewNm;
    }

    /**
     * @return the sysCd
     */
    public String getSysCd() {
        return sysCd;
    }

    /**
     * @param sysCd the sysCd to set
     */
    public void setSysCd(String sysCd) {
        this.sysCd = sysCd;
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
     * @return the parentViewNm
     */
    public String getParentViewNm() {
        return parentViewNm;
    }

    /**
     * @param parentViewNm the parentViewNm to set
     */
    public void setParentViewNm(String parentViewNm) {
        this.parentViewNm = parentViewNm;
    }

    /**
     * @return the parentViewUrl
     */
    public String getParentViewUrl() {
        return parentViewUrl;
    }

    /**
     * @param parentViewUrl the parentViewUrl to set
     */
    public void setParentViewUrl(String parentViewUrl) {
        this.parentViewUrl = parentViewUrl;
    }

    /**
     * @return the parentMesgKey
     */
    public String getParentMesgKey() {
        return parentMesgKey;
    }

    /**
     * @param parentMesgKey the parentMesgKey to set
     */
    public void setParentMesgKey(String parentMesgKey) {
        this.parentMesgKey = parentMesgKey;
    }

    /**
     * @return the parentSortOrder
     */
    public int getParentSortOrder() {
        return parentSortOrder;
    }

    /**
     * @param parentSortOrder the parentSortOrder to set
     */
    public void setParentSortOrder(int parentSortOrder) {
        this.parentSortOrder = parentSortOrder;
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
     * @return the childViewNm
     */
    public String getChildViewNm() {
        return childViewNm;
    }

    /**
     * @param childViewNm the childViewNm to set
     */
    public void setChildViewNm(String childViewNm) {
        this.childViewNm = childViewNm;
    }



    /**
     * @return the childViewTp
     */
    public String getChildViewTp() {
        return childViewTp;
    }

    /**
     * @param childViewTp the childViewTp to set
     */
    public void setChildViewTp(String childViewTp) {
        this.childViewTp = childViewTp;
    }

    /**
     * @return the childViewUrl
     */
    public String getChildViewUrl() {
        return childViewUrl;
    }

    /**
     * @param childViewUrl the childViewUrl to set
     */
    public void setChildViewUrl(String childViewUrl) {
        this.childViewUrl = childViewUrl;
    }

    /**
     * @return the childMesgKey
     */
    public String getChildMesgKey() {
        return childMesgKey;
    }

    /**
     * @param childMesgKey the childMesgKey to set
     */
    public void setChildMesgKey(String childMesgKey) {
        this.childMesgKey = childMesgKey;
    }

    /**
     * @return the childSortOrder
     */
    public int getChildSortOrder() {
        return childSortOrder;
    }

    /**
     * @param childSortOrder the childSortOrder to set
     */
    public void setChildSortOrder(int childSortOrder) {
        this.childSortOrder = childSortOrder;
    }

    /**
     * @return the childViewPermissions
     */
    public String getChildViewPermissions() {
        return childViewPermissions;
    }

    /**
     * @param childViewPermissions the childViewPermissions to set
     */
    public void setChildViewPermissions(String childViewPermissions) {
        this.childViewPermissions = childViewPermissions;
    }

    /**
     * @return the level
     */
    public int getLevel() {
        return level;
    }

    /**
     * @param level the level to set
     */
    public void setLevel(int level) {
        this.level = level;
    }

    /**
     * @return the userMenuYn
     */
    public String getUserMenuYn() {
        return userMenuYn;
    }

    /**
     * @param userMenuYn the userMenuYn to set
     */
    public void setUserMenuYn(String userMenuYn) {
        this.userMenuYn = userMenuYn;
    }

    /*
     * @see java.lang.Comparable#compareTo(java.lang.Object)
     */
    @Override
    public int compareTo(ViewHierarchyVO o) {
        return this.childSortOrder - o.childSortOrder;
    }
}
