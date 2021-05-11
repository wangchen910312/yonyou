package chn.bhmc.dms.cmm.cmp.vo;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * <pre>
 * 판매고문직무상세 정보 조회 SearchVO
 * </pre>
 *
 * @ClassName   : SalesMgrDetlSearchVO.java
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

public class SalesMgrDetlSearchVO extends SearchVO {

    /**
	 * 
	 */
	private static final long serialVersionUID = -1435874736519801800L;

    /**
     * 판매고문 직무상세코드
     */
    private String sSaleMgrDetlCd;

    /**
     * 판매고문 직무상세명
     */
    private String sSaleMgrDetlNm;
    
    /**
     * 사용여부
     */
    private String sUseYn;

	/**
	 * @return the sSaleMgrDetlCd
	 */
	public String getsSaleMgrDetlCd() {
		return sSaleMgrDetlCd;
	}

	/**
	 * @param sSaleMgrDetlCd the sSaleMgrDetlCd to set
	 */
	public void setsSaleMgrDetlCd(String sSaleMgrDetlCd) {
		this.sSaleMgrDetlCd = sSaleMgrDetlCd;
	}

	/**
	 * @return the sSaleMgrDetlNm
	 */
	public String getsSaleMgrDetlNm() {
		return sSaleMgrDetlNm;
	}

	/**
	 * @param sSaleMgrDetlNm the sSaleMgrDetlNm to set
	 */
	public void setsSaleMgrDetlNm(String sSaleMgrDetlNm) {
		this.sSaleMgrDetlNm = sSaleMgrDetlNm;
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
