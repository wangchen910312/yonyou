package chn.bhmc.dms.cmm.cmp.vo;

import org.hibernate.validator.constraints.NotEmpty;
import org.springmodules.validation.bean.conf.loader.annotation.handler.RegExp;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * 판매고문 직무상세 정보 VO
 * </pre>
 *
 * @ClassName   : SalesMgrDetlVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2017. 7. 27.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 7. 27.     Kang Seok Han     최초 생성
 * </pre>
 */
public class SalesMgrDetlVO extends BaseVO {

    /**
	 * 
	 */
	private static final long serialVersionUID = -6241742354827888715L;

	@NotEmpty
    private String saleMgrDetlCd;

    @NotEmpty
    private String saleMgrDetlNm;

    @NotEmpty
    @RegExp("[Y|N]")
    private String useYn;

	/**
	 * @return the saleMgrDetlCd
	 */
	public String getSaleMgrDetlCd() {
		return saleMgrDetlCd;
	}

	/**
	 * @param saleMgrDetlCd the saleMgrDetlCd to set
	 */
	public void setSaleMgrDetlCd(String saleMgrDetlCd) {
		this.saleMgrDetlCd = saleMgrDetlCd;
	}

	/**
	 * @return the saleMgrDetlNm
	 */
	public String getSaleMgrDetlNm() {
		return saleMgrDetlNm;
	}

	/**
	 * @param saleMgrDetlNm the saleMgrDetlNm to set
	 */
	public void setSaleMgrDetlNm(String saleMgrDetlNm) {
		this.saleMgrDetlNm = saleMgrDetlNm;
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