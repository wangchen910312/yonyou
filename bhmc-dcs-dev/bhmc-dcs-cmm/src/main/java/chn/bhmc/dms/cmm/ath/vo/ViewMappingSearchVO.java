package chn.bhmc.dms.cmm.ath.vo;

import java.util.List;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * <pre>
 * 화면-사용자/직무/부서 매핑 조회 SearchVO
 * </pre>
 *
 * @ClassName   : ViewMappingSearchVO.java
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

public class ViewMappingSearchVO extends SearchVO {

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
     * 웹-모바일 구분
     * 'W':웹
     * 'M':모바일
     */
    private String sWebMobileDstinCd;

    /**
     * 참조유형
     * 'U':사용자
     * 'T':직무
     * 'D':부서
     */
    private String sRefTp;

    /**
     * 참조ID
     * 사용자/직무/부서
     */
    private String sRefId;

    /**
     * 참조ID 목록
     */
    private List<String> sRefIds;

    /**
     * 화면유형
     * '01':화면
     * '02':버튼
     */
    private String sViewTp;

    /**
     * 상위화면ID
     */
    private String sParentViewId;

    /**
     * 화면ID
     */
    private String sViewId;

    /**
     * 출력여부
     */
    private String sDisplayYn;

    /**
     * 사용여부
     */
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
     * @return the sWebMobileDstinCd
     */
    public String getsWebMobileDstinCd() {
        return sWebMobileDstinCd;
    }

    /**
     * @param sWebMobileDstinCd the sWebMobileDstinCd to set
     */
    public void setsWebMobileDstinCd(String sWebMobileDstinCd) {
        this.sWebMobileDstinCd = sWebMobileDstinCd;
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
     * @return the sRefIds
     */
    public List<String> getsRefIds() {
        return sRefIds;
    }

    /**
     * @param sRefIds the sRefIds to set
     */
    public void setsRefIds(List<String> sRefIds) {
        this.sRefIds = sRefIds;
    }

    /**
     * @return the sViewTp
     */
    public String getsViewTp() {
        return sViewTp;
    }

    /**
     * @param sViewTp the sViewTp to set
     */
    public void setsViewTp(String sViewTp) {
        this.sViewTp = sViewTp;
    }

    /**
     * @return the sParentViewId
     */
    public String getsParentViewId() {
        return sParentViewId;
    }

    /**
     * @param sParentViewId the sParentViewId to set
     */
    public void setsParentViewId(String sParentViewId) {
        this.sParentViewId = sParentViewId;
    }

    /**
     * @return the sViewId
     */
    public String getsViewId() {
        return sViewId;
    }

    /**
     * @param sViewId the sViewId to set
     */
    public void setsViewId(String sViewId) {
        this.sViewId = sViewId;
    }

    /**
     * @return the sDisplayYn
     */
    public String getsDisplayYn() {
        return sDisplayYn;
    }

    /**
     * @param sDisplayYn the sDisplayYn to set
     */
    public void setsDisplayYn(String sDisplayYn) {
        this.sDisplayYn = sDisplayYn;
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

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((sDisplayYn == null) ? 0 : sDisplayYn.hashCode());
		result = prime * result + ((sParentViewId == null) ? 0 : sParentViewId.hashCode());
		result = prime * result + ((sRefId == null) ? 0 : sRefId.hashCode());
		result = prime * result + ((sRefIds == null) ? 0 : sRefIds.hashCode());
		result = prime * result + ((sRefTp == null) ? 0 : sRefTp.hashCode());
		result = prime * result + ((sSysCd == null) ? 0 : sSysCd.hashCode());
		result = prime * result + ((sUseYn == null) ? 0 : sUseYn.hashCode());
		result = prime * result + ((sViewId == null) ? 0 : sViewId.hashCode());
		result = prime * result + ((sViewTp == null) ? 0 : sViewTp.hashCode());
		result = prime * result + ((sWebMobileDstinCd == null) ? 0 : sWebMobileDstinCd.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		ViewMappingSearchVO other = (ViewMappingSearchVO) obj;
		if (sDisplayYn == null) {
			if (other.sDisplayYn != null)
				return false;
		} else if (!sDisplayYn.equals(other.sDisplayYn))
			return false;
		if (sParentViewId == null) {
			if (other.sParentViewId != null)
				return false;
		} else if (!sParentViewId.equals(other.sParentViewId))
			return false;
		if (sRefId == null) {
			if (other.sRefId != null)
				return false;
		} else if (!sRefId.equals(other.sRefId))
			return false;
		if (sRefIds == null) {
			if (other.sRefIds != null)
				return false;
		} else if (!sRefIds.equals(other.sRefIds))
			return false;
		if (sRefTp == null) {
			if (other.sRefTp != null)
				return false;
		} else if (!sRefTp.equals(other.sRefTp))
			return false;
		if (sSysCd == null) {
			if (other.sSysCd != null)
				return false;
		} else if (!sSysCd.equals(other.sSysCd))
			return false;
		if (sUseYn == null) {
			if (other.sUseYn != null)
				return false;
		} else if (!sUseYn.equals(other.sUseYn))
			return false;
		if (sViewId == null) {
			if (other.sViewId != null)
				return false;
		} else if (!sViewId.equals(other.sViewId))
			return false;
		if (sViewTp == null) {
			if (other.sViewTp != null)
				return false;
		} else if (!sViewTp.equals(other.sViewTp))
			return false;
		if (sWebMobileDstinCd == null) {
			if (other.sWebMobileDstinCd != null)
				return false;
		} else if (!sWebMobileDstinCd.equals(other.sWebMobileDstinCd))
			return false;
		return true;
	}   
    
}
