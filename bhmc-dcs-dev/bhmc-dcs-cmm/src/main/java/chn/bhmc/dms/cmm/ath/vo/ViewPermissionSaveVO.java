package chn.bhmc.dms.cmm.ath.vo;

import java.util.List;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ViewPermissionSaveVO.java
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
@ValidDescriptor({
    @ValidField(field="sysCd", mesgKey="global.lbl.sysCd")
    ,@ValidField(field="viewId", mesgKey="global.lbl.viewId")
    ,@ValidField(field="refTp", mesgKey="global.lbl.refTp")
    ,@ValidField(field="refId", mesgKey="global.lbl.refId")
    ,@ValidField(field="webMobileDstinCd", mesgKey="global.lbl.webMobileDstinCd")
})
public class ViewPermissionSaveVO extends BaseVO {
    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -7244609562188259909L;

    /**
     * 화면ID
     */
    private String viewId;

    /**
     * 시스템구분
     */
    private String sysCd;

    /**
     * 참조유형
     */
    private String refTp;

    /**
     * 참조ID
     */
    private String refId;

    /**
     * 웹/모바일구분
     */
    private String webMobileDstinCd;

    /**
     * 조회권한-퍼미션명 목록
     */
    private List<String> searchPermissions;

    /**
     * 버튼권한-화면아이디 목록
     */
    private List<String> buttonPermissions;

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
     * @return the refTp
     */
    public String getRefTp() {
        return refTp;
    }

    /**
     * @param refTp the refTp to set
     */
    public void setRefTp(String refTp) {
        this.refTp = refTp;
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
     * @return the searchPermissions
     */
    public List<String> getSearchPermissions() {
        return searchPermissions;
    }

    /**
     * @param searchPermissions the searchPermissions to set
     */
    public void setSearchPermissions(List<String> searchPermissions) {
        this.searchPermissions = searchPermissions;
    }

    /**
     * @return the buttonPermissions
     */
    public List<String> getButtonPermissions() {
        return buttonPermissions;
    }

    /**
     * @param buttonPermissions the buttonPermissions to set
     */
    public void setButtonPermissions(List<String> buttonPermissions) {
        this.buttonPermissions = buttonPermissions;
    }
}
