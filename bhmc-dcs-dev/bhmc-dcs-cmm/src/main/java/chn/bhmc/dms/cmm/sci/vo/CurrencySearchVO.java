package chn.bhmc.dms.cmm.sci.vo;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * <pre>
 * 통화코드 정보 조회 SearchVO
 * </pre>
 *
 * @ClassName   : CurrencySearchVO.java
 * @Description :
 * @author Kang Seok Han
 * @since 2016. 1. 7.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 7.     Kang Seok Han     최초 생성
 * </pre>
 */

public class CurrencySearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 6597362465400454050L;

    /**
     * 조회조건 - 통화코드
     */
    private String sCurrencyCd;

    /**
     * 조회조건 - 통화명
     */
    private String sCurrencyNm;

    /**
     * 조회조건 - 환율관리 대상여부
     */
    private String sExrTargYn;


    /**
     * @return the sCurrencyCd
     */
    public String getsCurrencyCd() {
        return sCurrencyCd;
    }

    /**
     * @param sCurrencyCd the sCurrencyCd to set
     */
    public void setsCurrencyCd(String sCurrencyCd) {
        this.sCurrencyCd = sCurrencyCd;
    }

    /**
     * @return the sCurrencyNm
     */
    public String getsCurrencyNm() {
        return sCurrencyNm;
    }

    /**
     * @param sCurrencyNm the sCurrencyNm to set
     */
    public void setsCurrencyNm(String sCurrencyNm) {
        this.sCurrencyNm = sCurrencyNm;
    }

    /**
     * @return the sExrTargYn
     */
    public String getsExrTargYn() {
        return sExrTargYn;
    }

    /**
     * @param sExrTargYn the sExrTargYn to set
     */
    public void setsExrTargYn(String sExrTargYn) {
        this.sExrTargYn = sExrTargYn;
    }

    /*
     * @see java.lang.Object#hashCode()
     */
    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((sCurrencyCd == null) ? 0 : sCurrencyCd.hashCode());
        result = prime * result + ((sCurrencyNm == null) ? 0 : sCurrencyNm.hashCode());
        result = prime * result + ((sExrTargYn == null) ? 0 : sExrTargYn.hashCode());
        return result;
    }

    /*
     * @see java.lang.Object#equals(java.lang.Object)
     */
    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (obj == null)
            return false;
        if (getClass() != obj.getClass())
            return false;
        CurrencySearchVO other = (CurrencySearchVO) obj;
        if (sCurrencyCd == null) {
            if (other.sCurrencyCd != null)
                return false;
        } else if (!sCurrencyCd.equals(other.sCurrencyCd))
            return false;
        if (sCurrencyNm == null) {
            if (other.sCurrencyNm != null)
                return false;
        } else if (!sCurrencyNm.equals(other.sCurrencyNm))
            return false;
        if (sExrTargYn == null) {
            if (other.sExrTargYn != null)
                return false;
        } else if (!sExrTargYn.equals(other.sExrTargYn))
            return false;
        return true;
    }
}
