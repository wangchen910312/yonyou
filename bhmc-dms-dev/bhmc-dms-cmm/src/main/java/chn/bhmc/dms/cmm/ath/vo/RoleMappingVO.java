package chn.bhmc.dms.cmm.ath.vo;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * 역할-사용자매핑 VO
 * </pre>
 *
 * @ClassName   : RoleMappingVO.java
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

public class RoleMappingVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 6672696247647864965L;

    /**
     * 시스템코드
     * 'D':딜러
     * 'I':임포터
     */
    private String sysCd;

    /**
     * 역할 ID
     */
    private String roleId;

    /**
     * 역할명
     */
    private String roleNm;

    /**
     * 역할상세
     */
    private String roleDetlCont;

    /**
     * 참조구분
     * 'U':사용자
     */
    private String refTp;

    /**
     * 참조ID
     * 사용자ID
     */
    private String refId;

    /**
     * 참조명
     * 사용자명
     */
    private String refNm;

    /**
     * 사용여부
     */
    private String useYn;

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
     * @return the roleId
     */
    public String getRoleId() {
        return roleId;
    }

    /**
     * @param roleId the roleId to set
     */
    public void setRoleId(String roleId) {
        this.roleId = roleId;
    }

    /**
     * @return the roleNm
     */
    public String getRoleNm() {
        return roleNm;
    }

    /**
     * @param roleNm the roleNm to set
     */
    public void setRoleNm(String roleNm) {
        this.roleNm = roleNm;
    }

    /**
     * @return the roleDetlCont
     */
    public String getRoleDetlCont() {
        return roleDetlCont;
    }

    /**
     * @param roleDetlCont the roleDetlCont to set
     */
    public void setRoleDetlCont(String roleDetlCont) {
        this.roleDetlCont = roleDetlCont;
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
}
