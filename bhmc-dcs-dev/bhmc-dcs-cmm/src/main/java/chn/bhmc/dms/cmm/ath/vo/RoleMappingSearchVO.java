package chn.bhmc.dms.cmm.ath.vo;

import java.util.List;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * <pre>
 * 역할-사용자 매핑 조회 SearchVO
 * </pre>
 *
 * @ClassName   : RoleMappingSearchVO.java
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

public class RoleMappingSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -5000555120244464951L;

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
     * 참조유형
     */
    private String sRefTp;

    /**
     * 참조ID
     */
    private String sRefId;

    /**
     * 사용여부
     */
    private String sUseYn;

    /**
     * 조회에서 제외할 역할 ID 목록
     */
    private List<String> sExcludeRoles;

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
     * @return the sRefTp
     */
    public String getsRefTp() {
        return sRefTp;
    }

    /**
     * @param sRefTp the sRefTp to set
     */
    public void setsRefTp(String sRefTp) {
        this.sRefTp = sRefTp;
    }

    /**
     * @return the sRefId
     */
    public String getsRefId() {
        return sRefId;
    }

    /**
     * @param sRefId the sRefId to set
     */
    public void setsRefId(String sRefId) {
        this.sRefId = sRefId;
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

    /**
     * @return the sExcludeRoles
     */
    public List<String> getsExcludeRoles() {
        return sExcludeRoles;
    }

    /**
     * @param sExcludeRoles the sExcludeRoles to set
     */
    public void setsExcludeRoles(List<String> sExcludeRoles) {
        this.sExcludeRoles = sExcludeRoles;
    }
}
