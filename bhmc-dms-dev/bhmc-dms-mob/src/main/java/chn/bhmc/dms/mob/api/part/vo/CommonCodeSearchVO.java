package chn.bhmc.dms.mob.api.part.vo;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CommonCodeSearchVO.java
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

public class CommonCodeSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 6534031744201367732L;

    /**
     * 공통코드 그룹코드
     */
    private String sCmmGrpCd;

    /**
     * 비고1
     */
    private String sRemark1;

    /**
     * 비고2
     */
    private String sRemark2;

    /**
     * 비고3
     */
    private String sRemark3;

    /**
     * 비고4
     */
    private String sRemark4;

    /**
     * 비고5
     */
    private String sRemark5;

    /**
     * 비고6
     */
    private String sRemark6;

    /**
     * 비고7
     */
    private String sRemark7;

    /**
     * 비고8
     */
    private String sRemark8;

    /**
     * 비고9
     */
    private String sRemark9;

    /**
     * 비고10
     */
    private String sRemark10;

    /**
     * 공통코드 사용 여부
     */
    private String sUseYn;

    /**
     * @return the sCmmGrpCdNm
     */
    public String getsCmmGrpCd() {
        return sCmmGrpCd;
    }

    /**
     * @param sCmmGrpCdNm the sCmmGrpCdNm to set
     */
    public void setsCmmGrpCd(String sCmmGrpCd) {
        this.sCmmGrpCd = sCmmGrpCd;
    }

    /**
     * @return the sRemark1
     */
    public String getsRemark1() {
        return sRemark1;
    }

    /**
     * @param sRemark1 the sRemark1 to set
     */
    public void setsRemark1(String sRemark1) {
        this.sRemark1 = sRemark1;
    }

    /**
     * @return the sRemark2
     */
    public String getsRemark2() {
        return sRemark2;
    }

    /**
     * @param sRemark2 the sRemark2 to set
     */
    public void setsRemark2(String sRemark2) {
        this.sRemark2 = sRemark2;
    }

    /**
     * @return the sRemark3
     */
    public String getsRemark3() {
        return sRemark3;
    }

    /**
     * @param sRemark3 the sRemark3 to set
     */
    public void setsRemark3(String sRemark3) {
        this.sRemark3 = sRemark3;
    }

    /**
     * @return the sRemark4
     */
    public String getsRemark4() {
        return sRemark4;
    }

    /**
     * @param sRemark4 the sRemark4 to set
     */
    public void setsRemark4(String sRemark4) {
        this.sRemark4 = sRemark4;
    }

    /**
     * @return the sRemark5
     */
    public String getsRemark5() {
        return sRemark5;
    }

    /**
     * @param sRemark5 the sRemark5 to set
     */
    public void setsRemark5(String sRemark5) {
        this.sRemark5 = sRemark5;
    }

    /**
     * @return the sRemark6
     */
    public String getsRemark6() {
        return sRemark6;
    }

    /**
     * @param sRemark6 the sRemark6 to set
     */
    public void setsRemark6(String sRemark6) {
        this.sRemark6 = sRemark6;
    }

    /**
     * @return the sRemark7
     */
    public String getsRemark7() {
        return sRemark7;
    }

    /**
     * @param sRemark7 the sRemark7 to set
     */
    public void setsRemark7(String sRemark7) {
        this.sRemark7 = sRemark7;
    }

    /**
     * @return the sRemark8
     */
    public String getsRemark8() {
        return sRemark8;
    }

    /**
     * @param sRemark8 the sRemark8 to set
     */
    public void setsRemark8(String sRemark8) {
        this.sRemark8 = sRemark8;
    }

    /**
     * @return the sRemark9
     */
    public String getsRemark9() {
        return sRemark9;
    }

    /**
     * @param sRemark9 the sRemark9 to set
     */
    public void setsRemark9(String sRemark9) {
        this.sRemark9 = sRemark9;
    }

    /**
     * @return the sRemark10
     */
    public String getsRemark10() {
        return sRemark10;
    }

    /**
     * @param sRemark10 the sRemark10 to set
     */
    public void setsRemark10(String sRemark10) {
        this.sRemark10 = sRemark10;
    }

    /**
     * @param sUseYn the sUseYn to set
     */
    public void setsUseYn(String sUseYn) {
        this.sUseYn = sUseYn;
    }

    /**
     * @return the sUseYn
     */
    public String getsUseYn() {
        return sUseYn;
    }

    /*
     * @see java.lang.Object#hashCode()
     */
    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((sCmmGrpCd == null) ? 0 : sCmmGrpCd.hashCode());
        result = prime * result + ((sRemark1 == null) ? 0 : sRemark1.hashCode());
        result = prime * result + ((sRemark10 == null) ? 0 : sRemark10.hashCode());
        result = prime * result + ((sRemark2 == null) ? 0 : sRemark2.hashCode());
        result = prime * result + ((sRemark3 == null) ? 0 : sRemark3.hashCode());
        result = prime * result + ((sRemark4 == null) ? 0 : sRemark4.hashCode());
        result = prime * result + ((sRemark5 == null) ? 0 : sRemark5.hashCode());
        result = prime * result + ((sRemark6 == null) ? 0 : sRemark6.hashCode());
        result = prime * result + ((sRemark7 == null) ? 0 : sRemark7.hashCode());
        result = prime * result + ((sRemark8 == null) ? 0 : sRemark8.hashCode());
        result = prime * result + ((sRemark9 == null) ? 0 : sRemark9.hashCode());
        result = prime * result + ((sUseYn == null) ? 0 : sUseYn.hashCode());
        result = prime * result + ((getsLangCd() == null) ? 0 : getsLangCd().hashCode());
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
        CommonCodeSearchVO other = (CommonCodeSearchVO) obj;
        if (sCmmGrpCd == null) {
            if (other.sCmmGrpCd != null)
                return false;
        } else if (!sCmmGrpCd.equals(other.sCmmGrpCd))
            return false;
        if (sRemark1 == null) {
            if (other.sRemark1 != null)
                return false;
        } else if (!sRemark1.equals(other.sRemark1))
            return false;
        if (sRemark10 == null) {
            if (other.sRemark10 != null)
                return false;
        } else if (!sRemark10.equals(other.sRemark10))
            return false;
        if (sRemark2 == null) {
            if (other.sRemark2 != null)
                return false;
        } else if (!sRemark2.equals(other.sRemark2))
            return false;
        if (sRemark3 == null) {
            if (other.sRemark3 != null)
                return false;
        } else if (!sRemark3.equals(other.sRemark3))
            return false;
        if (sRemark4 == null) {
            if (other.sRemark4 != null)
                return false;
        } else if (!sRemark4.equals(other.sRemark4))
            return false;
        if (sRemark5 == null) {
            if (other.sRemark5 != null)
                return false;
        } else if (!sRemark5.equals(other.sRemark5))
            return false;
        if (sRemark6 == null) {
            if (other.sRemark6 != null)
                return false;
        } else if (!sRemark6.equals(other.sRemark6))
            return false;
        if (sRemark7 == null) {
            if (other.sRemark7 != null)
                return false;
        } else if (!sRemark7.equals(other.sRemark7))
            return false;
        if (sRemark8 == null) {
            if (other.sRemark8 != null)
                return false;
        } else if (!sRemark8.equals(other.sRemark8))
            return false;
        if (sRemark9 == null) {
            if (other.sRemark9 != null)
                return false;
        } else if (!sRemark9.equals(other.sRemark9))
            return false;
        if (sUseYn == null) {
            if (other.sUseYn != null)
                return false;
        } else if (!sUseYn.equals(other.sUseYn))
            return false;
        if (getsLangCd() == null) {
            if (other.getsLangCd() != null)
                return false;
        } else if (!getsLangCd().equals(other.getsLangCd()))
            return false;
        return true;
    }

}
