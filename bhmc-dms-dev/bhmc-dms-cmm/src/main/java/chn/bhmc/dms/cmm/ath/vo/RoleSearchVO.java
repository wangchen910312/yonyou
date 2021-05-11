package chn.bhmc.dms.cmm.ath.vo;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * <pre>
 * 역할 조회 SearchVO
 * </pre>
 *
 * @ClassName   : RoleSearchVO.java
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

public class RoleSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 6534031744201367732L;

    /**
     * 시스템코드
     * 'D':딜러
     * 'I':임포터
     */
    private String sSysCd;

    /**
     * 역할ID
     */
    private String sRoleId;

    /**
     * 역할명
     */
    private String sRoleNm;

    /**
     * 역할구분
     */
    private String sRoleTp;

    /**
     * 사용여부
     * */
    private String sUseYn;

    /**
     * @return the sSysCd
     */
    public String getsSysCd() {
        return sSysCd;
    }

    /**
     * @param sSysCd the sSysCd to set
     */
    public void setsSysCd(String sSysCd) {
        this.sSysCd = sSysCd;
    }

    /**
     * @return the sRoleId
     */
    public String getsRoleId() {
        return sRoleId;
    }

    /**
     * @param sRoleId the sRoleId to set
     */
    public void setsRoleId(String sRoleId) {
        this.sRoleId = sRoleId;
    }

    /**
     * @return the sRoleNm
     */
    public String getsRoleNm() {
        return sRoleNm;
    }

    /**
     * @param sRoleNm the sRoleNm to set
     */
    public void setsRoleNm(String sRoleNm) {
        this.sRoleNm = sRoleNm;
    }

    /**
     * @return the sRoleTp
     */
    public String getsRoleTp() {
        return sRoleTp;
    }

    /**
     * @param sRoleTp the sRoleTp to set
     */
    public void setsRoleTp(String sRoleTp) {
        this.sRoleTp = sRoleTp;
    }

    /**
     * @return the sUseYn
     */
    public String getsUseYn() {
        return sUseYn;
    }

    /**
     * @param sUseYn the sUseYn to set
     */
    public void setsUseYn(String sUseYn) {
        this.sUseYn = sUseYn;
    }

}
