package chn.bhmc.dms.cmm.ath.vo;

import javax.validation.constraints.Min;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.NotEmpty;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ViewInfoVO.java
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
public class ViewInfoVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 2924692645434750515L;

    /**
     * 시스템코드
     * 'D':딜러
     * 'I':임포터
     */
    @NotEmpty
    @Pattern(regexp="[D|I]")
    private String sysCd;

    /**
     * 화면ID
     */
    private String viewId;

    /**
     * 화면명
     */
    @NotEmpty
    private String viewNm;

    /**
     * 화면정보상세
     */
    private String viewInfoCont;

    /**
     * 화면URL
     */
    private String viewUrl;

    /**
     * 화면유형
     */
    @NotEmpty
    @Pattern(regexp="0[1-2]")
    private String viewTp;

    /**
     * 메세지코드
     */
    private String mesgKey;

    /**
     * 정렬순서
     */
    @Min(1)
    private String sortOrder;

    /**
     * 표시여부
     */
    @NotEmpty
    @Pattern(regexp="[Y|N]")
    private String displayYn;

    /**
     * T코드
     */
    private String tCd;

    /**
     * 아이콘명
     */
    private String iconNm;

    /**
     * 상위 화면 ID
     */
    @NotEmpty
    private String parentViewId;

    /**
     * 모바일 구분
     */
    @NotEmpty
    @Pattern(regexp="[W|M]")
    private String webMobileDstinCd;

    /**
     * 사용여부
     */
    private String useYn;

    /**
     * 사용자권한 부여 여부
     */
    private String userMenuYn;

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
     * @return the viewInfoCont
     */
    public String getViewInfoCont() {
        return viewInfoCont;
    }

    /**
     * @param viewInfoCont the viewInfoCont to set
     */
    public void setViewInfoCont(String viewInfoCont) {
        this.viewInfoCont = viewInfoCont;
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
     * @return the sortOrder
     */
    public String getSortOrder() {
        return sortOrder;
    }

    /**
     * @param sortOrder the sortOrder to set
     */
    public void setSortOrder(String sortOrder) {
        this.sortOrder = sortOrder;
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
     * @return the useYn
     */
    public String getUseYn() {
        return useYn;
    }

    /**
     * @param useYn the useYn to set
     */
    public void setUseYn(String useYn) {
        this.useYn = useYn;
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

}
