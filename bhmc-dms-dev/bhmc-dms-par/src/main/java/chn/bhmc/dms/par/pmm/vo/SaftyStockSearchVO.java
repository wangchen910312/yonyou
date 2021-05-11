package chn.bhmc.dms.par.pmm.vo;

import org.hibernate.validator.constraints.NotEmpty;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * 안전재고 검색 VO
 *
 * @ClassName   : SaftyStockSearchVO.java
 * @Description : SaftyStockSearchVO Class
 * @author Bo In Shim
 * @since 2016. 1. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 11.     Bo In Shim     최초 생성
 * </pre>
 */

public class SaftyStockSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 6416993950710191989L;

    /**
     * sDlrCd
     */
    @NotEmpty
    private String sDlrCd;

    /**
     * sPltCd
     */
    @NotEmpty
    private String sPltCd;

    /**
     * 라인번호
     */
    private int sLineNo = 0;

    /**
     * 사용유무
     */
    private String sUseYn = "Y";

    /**
     * 수요시작기간
     */
    private double sDmndStartPrid = 0.0;

    /**
     * 수요종료기간
     */
    private double sDmndEndPrid = 0.0;

    /**
     * 기준수요기간
     */
    private double sStdDmndPrid = 0.0;

    /**
     * 평균편차반영여부
     */
    private String sAvgDvsRflYn;

    /**
     * 평균편차반영율
     */
    private double sAvgDvsRflRate = 0.0;

    /**
     * @return the sDlrCd
     */
    public String getsDlrCd() {
        return sDlrCd;
    }

    /**
     * @param sDlrCd the sDlrCd to set
     */
    public void setsDlrCd(String sDlrCd) {
        this.sDlrCd = sDlrCd;
    }

    /**
     * @return the sPltCd
     */
    public String getsPltCd() {
        return sPltCd;
    }

    /**
     * @param sPltCd the sPltCd to set
     */
    public void setsPltCd(String sPltCd) {
        this.sPltCd = sPltCd;
    }

    /**
     * @return the sLineNo
     */
    public int getsLineNo() {
        return sLineNo;
    }

    /**
     * @param sLineNo the sLineNo to set
     */
    public void setsLineNo(int sLineNo) {
        this.sLineNo = sLineNo;
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

    /**
     * @return the sDmndStartPrid
     */
    public double getsDmndStartPrid() {
        return sDmndStartPrid;
    }

    /**
     * @param sDmndStartPrid the sDmndStartPrid to set
     */
    public void setsDmndStartPrid(double sDmndStartPrid) {
        this.sDmndStartPrid = sDmndStartPrid;
    }

    /**
     * @return the sDmndEndPrid
     */
    public double getsDmndEndPrid() {
        return sDmndEndPrid;
    }

    /**
     * @param sDmndEndPrid the sDmndEndPrid to set
     */
    public void setsDmndEndPrid(double sDmndEndPrid) {
        this.sDmndEndPrid = sDmndEndPrid;
    }

    /**
     * @return the sStdDmndPrid
     */
    public double getsStdDmndPrid() {
        return sStdDmndPrid;
    }

    /**
     * @param sStdDmndPrid the sStdDmndPrid to set
     */
    public void setsStdDmndPrid(double sStdDmndPrid) {
        this.sStdDmndPrid = sStdDmndPrid;
    }

    /**
     * @return the sAvgDvsRflYn
     */
    public String getsAvgDvsRflYn() {
        return sAvgDvsRflYn;
    }

    /**
     * @param sAvgDvsRflYn the sAvgDvsRflYn to set
     */
    public void setsAvgDvsRflYn(String sAvgDvsRflYn) {
        this.sAvgDvsRflYn = sAvgDvsRflYn;
    }

    /**
     * @return the sAvgDvsRflRate
     */
    public double getsAvgDvsRflRate() {
        return sAvgDvsRflRate;
    }

    /**
     * @param sAvgDvsRflRate the sAvgDvsRflRate to set
     */
    public void setsAvgDvsRflRate(double sAvgDvsRflRate) {
        this.sAvgDvsRflRate = sAvgDvsRflRate;
    }
}
