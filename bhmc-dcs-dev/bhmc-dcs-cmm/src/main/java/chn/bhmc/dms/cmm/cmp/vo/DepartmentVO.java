package chn.bhmc.dms.cmm.cmp.vo;

import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * 부서정보 VO
 * </pre>
 *
 * @ClassName   : DepartmentVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 11. 28.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 11. 28.     Kang Seok Han     최초 생성
 * </pre>
 */

public class DepartmentVO extends BaseVO {


    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 7561185231343531900L;

    /**
     * 회사구분
     * 10:딜러
     * 20:법인
     */
    @NotBlank
    @Length(max=10)
    private String cmpTp;

    /**
     * 부서코드
     */
    @NotBlank
    @Length(max=10)
    private String deptCd;

    /**
     * 부서명
     */
    @NotBlank
    @Length(max=128)
    private String deptNm;

    /**
     * 사용여부
     */
    @NotBlank
    @Pattern(regexp="[Y|N]")
    private String useYn;

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
