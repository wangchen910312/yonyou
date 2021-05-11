package chn.bhmc.dms.cmm.ath.vo;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : RoleHirarchyVO.java
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

public class RoleHirarchyVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -1402956431760945482L;

    /**
     * 시스템코드
     * 'D':딜러
     * 'I':임포터
     */
    private String sysCd;

    /**
     * 상위 역할 ID
     */
    private String parentRoleId;

    /**
     * 하위 역할 ID
     */
    private String childRoleId;

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
     * @return the parentRoleId
     */
    public String getParentRoleId() {
        return parentRoleId;
    }

    /**
     * @param parentRoleId the parentRoleId to set
     */
    public void setParentRoleId(String parentRoleId) {
        this.parentRoleId = parentRoleId;
    }

    /**
     * @return the childRoleId
     */
    public String getChildRoleId() {
        return childRoleId;
    }

    /**
     * @param childRoleId the childRoleId to set
     */
    public void setChildRoleId(String childRoleId) {
        this.childRoleId = childRoleId;
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
