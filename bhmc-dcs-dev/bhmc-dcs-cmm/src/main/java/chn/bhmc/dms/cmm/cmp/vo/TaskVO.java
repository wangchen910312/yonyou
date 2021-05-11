package chn.bhmc.dms.cmm.cmp.vo;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * 직무정보 VO
 * </pre>
 *
 * @ClassName   : TaskVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 1. 29.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 29.     Kang Seok Han     최초 생성
 * </pre>
 */

public class TaskVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -5874985072890326051L;

    /**
     * 회사구분
     * '10':DCS(본사직무)
     * '20':DMS(딜러직무)
     */
    @NotBlank
    @Length(max=10)
    private String cmpTp;

    /**
     * 회사구분명
     */
    private String cmpTpNm;

    /**
     * 직무코드
     */
    @NotBlank
    @Length(max=10)
    private String tskCd;

    /**
     * 직무명
     */
    @NotBlank
    @Length(max=128)
    private String tskNm;

    /**
     * 부서코드
     */
    private String deptCd;

    /**
     * 부서명
     */
    private String deptNm;

    /**
     * @return the cmpTp
     */
    public String getCmpTp() {
        return cmpTp;
    }

    /**
     * @param cmpTp the cmpTp to set
     */
    public void setCmpTp(String cmpTp) {
        this.cmpTp = cmpTp;
    }

    /**
     * @return the cmpTpNm
     */
    public String getCmpTpNm() {
        return cmpTpNm;
    }

    /**
     * @param cmpTpNm the cmpTpNm to set
     */
    public void setCmpTpNm(String cmpTpNm) {
        this.cmpTpNm = cmpTpNm;
    }

    /**
     * @return the tskCd
     */
    public String getTskCd() {
        return tskCd;
    }

    /**
     * @param tskCd the tskCd to set
     */
    public void setTskCd(String tskCd) {
        this.tskCd = tskCd;
    }

    /**
     * @return the tskNm
     */
    public String getTskNm() {
        return tskNm;
    }

    /**
     * @param tskNm the tskNm to set
     */
    public void setTskNm(String tskNm) {
        this.tskNm = tskNm;
    }

    /**
     * @return the deptCd
     */
    public String getDeptCd() {
        return deptCd;
    }

    /**
     * @param deptCd the deptCd to set
     */
    public void setDeptCd(String deptCd) {
        this.deptCd = deptCd;
    }

    /**
     * @return the deptNm
     */
    public String getDeptNm() {
        return deptNm;
    }

    /**
     * @param deptNm the deptNm to set
     */
    public void setDeptNm(String deptNm) {
        this.deptNm = deptNm;
    }

}
