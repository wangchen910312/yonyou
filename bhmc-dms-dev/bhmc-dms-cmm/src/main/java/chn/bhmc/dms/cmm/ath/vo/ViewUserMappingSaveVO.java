package chn.bhmc.dms.cmm.ath.vo;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.validator.constraints.NotBlank;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : RoleUserMappingSaveVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2017. 2. 15.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 2. 15.     Kang Seok Han     최초 생성
 * </pre>
 */
@ValidDescriptor({
    @ValidField(field="sysCd", mesgKey="global.lbl.sysCd")
    ,@ValidField(field="refTp", mesgKey="global.lbl.refTp")
    ,@ValidField(field="refId", mesgKey="global.lbl.refId")
    ,@ValidField(field="viewTp", mesgKey="global.lbl.viewTp")
    ,@ValidField(field="webMobileDstinCd", mesgKey="global.lbl.webMobileDstinCd")
})
public class ViewUserMappingSaveVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 4795786007139296242L;

    /**
     * 시스템구분
     * 'D':딜러
     * 'I':법인
     */
    @NotBlank
    private String sysCd;

    /**
     * 참조유형
     */
    @NotBlank
    private String refTp;

    /**
     * 참조ID
     */
    @NotBlank
    private String refId;

    /**
     * 화면유형
     * '01':화면
     * '02':버튼
     */
    @NotBlank
    private String viewTp;

    /**
     * 웹/모바일구분
     * 'W':웹
     * 'M':모바일
     */
    @NotBlank
    private String webMobileDstinCd;

    /**
     * 화면-사용자매핑 목록
     */
    private List<ViewMappingVO> viewAuthorities = new ArrayList<ViewMappingVO>();

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
     * @return the viewAuthorities
     */
    public List<ViewMappingVO> getViewAuthorities() {
        return viewAuthorities;
    }

    /**
     * @param viewAuthorities the viewAuthorities to set
     */
    public void setViewAuthorities(List<ViewMappingVO> viewAuthorities) {
        this.viewAuthorities = viewAuthorities;
    }

}
