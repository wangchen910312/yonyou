package chn.bhmc.dms.par.pmm.vo;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * SaftyStockSettingVO
 *
 * @ClassName   : SaftyStockSettingVO.java
 * @Description : SaftyStockSettingVO Class
 * @author In Bo Shim
 * @since 2016. 5. 03.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 03.     In Bo Shim     최초 생성
 * </pre>
 */

public class SaftyStockSettingVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 3231555104270523640L;

    /**
     * dlrCd
     **/
    private String dlrCd;

    /**
     * pltCd
     **/
    private String pltCd;

    /**
     * dmndStartPrid
     **/
    private double dmndStartPrid = 0;

    /**
     * dmndEndPrid
     **/
    private double dmndEndPrid = 0;

    /**
     * stdDmndPrid
     **/
    private double stdDmndPrid = 0;

    /**
     * avgDvsRflYn
     **/
    private String avgDvsRflYn = "N";

    /**
     * avgDvsRflRate
     **/
    private double avgDvsRflRate = 0.0;

    /**
     * @return the dlrCd
     */
    public String getDlrCd() {
        return dlrCd;
    }

    /**
     * @param dlrCd the dlrCd to set
     */
    public void setDlrCd(String dlrCd) {
        this.dlrCd = dlrCd;
    }

    /**
     * @return the pltCd
     */
    public String getPltCd() {
        return pltCd;
    }

    /**
     * @param pltCd the pltCd to set
     */
    public void setPltCd(String pltCd) {
        this.pltCd = pltCd;
    }

    /**
     * @return the dmndStartPrid
     */
    public double getDmndStartPrid() {
        return dmndStartPrid;
    }

    /**
     * @param dmndStartPrid the dmndStartPrid to set
     */
    public void setDmndStartPrid(double dmndStartPrid) {
        this.dmndStartPrid = dmndStartPrid;
    }

    /**
     * @return the dmndEndPrid
     */
    public double getDmndEndPrid() {
        return dmndEndPrid;
    }

    /**
     * @param dmndEndPrid the dmndEndPrid to set
     */
    public void setDmndEndPrid(double dmndEndPrid) {
        this.dmndEndPrid = dmndEndPrid;
    }

    /**
     * @return the stdDmndPrid
     */
    public double getStdDmndPrid() {
        return stdDmndPrid;
    }

    /**
     * @param stdDmndPrid the stdDmndPrid to set
     */
    public void setStdDmndPrid(double stdDmndPrid) {
        this.stdDmndPrid = stdDmndPrid;
    }

    /**
     * @return the avgDvsRflYn
     */
    public String getAvgDvsRflYn() {
        return avgDvsRflYn;
    }

    /**
     * @param avgDvsRflYn the avgDvsRflYn to set
     */
    public void setAvgDvsRflYn(String avgDvsRflYn) {
        this.avgDvsRflYn = avgDvsRflYn;
    }

    /**
     * @return the avgDvsRflRate
     */
    public double getAvgDvsRflRate() {
        return avgDvsRflRate;
    }

    /**
     * @param avgDvsRflRate the avgDvsRflRate to set
     */
    public void setAvgDvsRflRate(double avgDvsRflRate) {
        this.avgDvsRflRate = avgDvsRflRate;
    }


}
