package chn.bhmc.dms.cmm.cmp.vo;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * 사업부정보 VO
 * </pre>
 *
 * @ClassName   : DivisionVO.java
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

public class DivisionVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -5874985072890326052L;

    /**
     * 사업부코드
     */
    @NotBlank
    @Length(max=10)
    private String diviCd;

    /**
     * 사업부명
     */
    @NotBlank
    @Length(max=128)
    private String diviNm;

    /**
     * @return the diviCd
     */
    public String getDiviCd() {
        return diviCd;
    }

    /**
     * @param diviCd the diviCd to set
     */
    public void setDiviCd(String diviCd) {
        this.diviCd = diviCd;
    }

    /**
     * @return the diviNm
     */
    public String getDiviNm() {
        return diviNm;
    }

    /**
     * @param diviNm the diviNm to set
     */
    public void setDiviNm(String diviNm) {
        this.diviNm = diviNm;
    }
}
