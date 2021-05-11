package chn.bhmc.dms.cmm.ath.vo;

import org.hibernate.validator.constraints.NotBlank;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : RoleVO.java
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
public class RoleVO extends BaseVO {

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
    @NotBlank
    private String sysCd;

    /**
     * 역할ID
     */
    @NotBlank
    private String roleId;

    /**
     * 역할명
     */
    @NotBlank
    private String roleNm;

    /**
     * 역할설명
     */
    private String roleDetlCont;

    /**
     * 역할구분
     */
    private String roleTp;

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
     * @return the roleTp
     */
    public String getRoleTp() {
        return roleTp;
    }

    /**
     * @param roleTp the roleTp to set
     */
    public void setRoleTp(String roleTp) {
        this.roleTp = roleTp;
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
