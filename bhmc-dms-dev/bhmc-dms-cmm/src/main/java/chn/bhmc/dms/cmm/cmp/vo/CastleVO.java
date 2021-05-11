package chn.bhmc.dms.cmm.cmp.vo;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * 성정보정보 VO
 * </pre>
 *
 * @ClassName   : CastleVO.java
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

public class CastleVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -1167769304403676751L;

    /**
     * 성정보코드
     */
    @NotBlank
    @Length(max=10)
    private String cstlCd;

    /**
     * 성정보명
     */
    @NotBlank
    @Length(max=128)
    private String cstlNm;

    /**
     * @return the cstlCd
     */
    public String getCstlCd() {
        return cstlCd;
    }

    /**
     * @param cstlCd the cstlCd to set
     */
    public void setCstlCd(String cstlCd) {
        this.cstlCd = cstlCd;
    }

    /**
     * @return the cstlNm
     */
    public String getCstlNm() {
        return cstlNm;
    }

    /**
     * @param cstlNm the cstlNm to set
     */
    public void setCstlNm(String cstlNm) {
        this.cstlNm = cstlNm;
    }
}
