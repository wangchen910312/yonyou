package chn.bhmc.dms.mob.api.sales.vo;

import chn.bhmc.dms.core.datatype.BaseVO;



/**
 * <pre>
 * 화면권한 VO
 * </pre>
 *
 * @ClassName   : ViewAuthoritiesVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 8. 9.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 8. 9.     Kang Seok Han     최초 생성
 * </pre>
 */

public class ViewMappingVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 4116890398112104097L;

    /**
     * 시스템구분
     */
    private String sysCd;

    /**
     * 화면ID
     */
    private String viewId;

    /**
     * 화면명
     */
    private String viewNm;

    /**
     * 메세지키
     */
    private String mesgKey;

    /**
     * 참조구분
     * 'U':사용자
     * 'T':직무
     * 'D':부서
     */
    private String refTp;

    /**
     * 참조ID
     * 사용자/직무/부서
     */
    private String refId;

    /**
     * 참조명
     * 사용자명/직무명/부서명
     */
    private String refNm;

    /**
     * 마스크
     */
    private int mask;

    /**
     * 퍼미션
     */
    private String permissions;

    /**
     * 사용여부
     */
    private String useYn;

    /**
     * 웹/모바일 구분
     * 'W':웹
     * 'M':모바일
     */
    private String WebMobileDstinCd;
    
    /**
     * 
     */
    private boolean dirty;

    public ViewMappingVO(){}

    public ViewMappingVO(String sysCd, String viewId, String refTp, String refId){
        this.sysCd = sysCd;
        this.viewId = viewId;
        this.refTp = refTp;
        this.refId = refId;
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
     * @return the refNm
     */
    public String getRefNm() {
        return refNm;
    }

    /**
     * @param refNm the refNm to set
     */
    public void setRefNm(String refNm) {
        this.refNm = refNm;
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
     * @return the webMobileDstinCd
     */
    public String getWebMobileDstinCd() {
        return WebMobileDstinCd;
    }

    /**
     * @param webMobileDstinCd the webMobileDstinCd to set
     */
    public void setWebMobileDstinCd(String webMobileDstinCd) {
        WebMobileDstinCd = webMobileDstinCd;
    }
    
    /**
     * @return the dirty
     */
	public boolean isDirty() {
		return dirty;
	}
	
	/**
     * @param dirty the dirty to set
     */
	public void setDirty(boolean dirty) {
		this.dirty = dirty;
	}
    
}
