package chn.bhmc.dms.cmm.sci.vo;

import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * 지역코드 VO
 *
 * @ClassName   : DistCodeVO.java
 * @Description : DistCodeVO Class
 * @author Kang Seok Han
 * @since 2016. 1. 4.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 4.     Kang Seok Han     최초 생성
 * </pre>
 */

public class DistCodeVO extends BaseVO {


    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -7799677621678204529L;

    /**
	 * 지역코드
	 */
	@NotBlank
	@Length(min=2, max=10)
	private String distCd;

	/**
	 * 지역명
	 */
	@NotBlank
	private String distNm;

	/**
	 * 사용여부
	 */
	@NotBlank
	@Pattern(regexp="[Y|N]")
	private String useYn;

	/**
	 * 판매지역여부
	 */
	@NotBlank
    @Pattern(regexp="[Y|N]")
    private String saleDistYn;

	/**
     * 정비지역여부
     */
    @NotBlank
    @Pattern(regexp="[Y|N]")
    private String serDistYn;

    /**
     * 행정지역여부
     */
    @NotBlank
    @Pattern(regexp="[Y|N]")
    private String gobDistYn;

    /**
     * @return the distCd
     */
    public String getDistCd() {
        return distCd;
    }

    /**
     * @param distCd the distCd to set
     */
    public void setDistCd(String distCd) {
        this.distCd = distCd;
    }

    /**
     * @return the distNm
     */
    public String getDistNm() {
        return distNm;
    }

    /**
     * @param distNm the distNm to set
     */
    public void setDistNm(String distNm) {
        this.distNm = distNm;
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
     * @return the saleDistYn
     */
    public String getSaleDistYn() {
        return saleDistYn;
    }

    /**
     * @param saleDistYn the saleDistYn to set
     */
    public void setSaleDistYn(String saleDistYn) {
        this.saleDistYn = saleDistYn;
    }

    /**
     * @return the serDistYn
     */
    public String getSerDistYn() {
        return serDistYn;
    }

    /**
     * @param serDistYn the serDistYn to set
     */
    public void setSerDistYn(String serDistYn) {
        this.serDistYn = serDistYn;
    }

    /**
     * @return the gobDistYn
     */
    public String getGobDistYn() {
        return gobDistYn;
    }

    /**
     * @param gobDistYn the gobDistYn to set
     */
    public void setGobDistYn(String gobDistYn) {
        this.gobDistYn = gobDistYn;
    }

}
