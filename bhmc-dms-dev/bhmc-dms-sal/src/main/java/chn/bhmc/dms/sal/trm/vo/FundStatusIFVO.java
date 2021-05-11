package chn.bhmc.dms.sal.trm.vo;

import com.fasterxml.jackson.annotation.JsonProperty;

import chn.bhmc.dms.core.datatype.BaseVO;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : FundStatusIFVO
 * @Description : 자금현황 if VO
 * @author Kim Jin Suk
 * @since 2016. 8. 22.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author           description
 *  ===========    =============    ===========================
 *  2016. 8. 22.    Kim Jin Suk        최초 생성
 * </pre>
 */

public class FundStatusIFVO extends BaseVO{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 6187529761993138328L;


    @JsonProperty("DPYEAR")
    private String dpyear;        // 년도

    @JsonProperty("DPMOTH")
    private String dpmoth;        // 월

    @JsonProperty("DPDAY")
    private String dpday;         // 일

    @JsonProperty("DPDELR")
    private String dpdelr;        // 딜러

    @JsonProperty("DPPRT3")
    private double dpprt3;        // 입금금액 : 3방어음

    @JsonProperty("DPPRT2")
    private double dpprt2;        // 입금금액 : 2방어음

    @JsonProperty("DPCASH")
    private double dpcash;        // 입금금액 : 현금

    @JsonProperty("DPINCN")
    private double dpincn;        // 입금금액 : 인센티브

    @JsonProperty("DPIPPR")
    private double dpippr;        // 입금금액 (=3방+2방+현금+인센티브+조정금)

    @JsonProperty("DPIPAMT")
    private double dpipamt;       // 입금금액 : 가격변경

    @JsonProperty("DPOPPR")
    private double dpoppr;        // 출금금액

    @JsonProperty("DPOPCN")
    private double dpopcn;        // 출금금액 취소

    @JsonProperty("DPCRCS")
    private double dpcrcs;        // 현금잔액(현금+인센티브+조정금)

    @JsonProperty("DPDEPO")
    private double dpdepo;        // 총잔액

    @JsonProperty("DPBAL3")
    private double dpbal3;        // 3방잔액

    @JsonProperty("DPBAL2")
    private double dpbal2;        // 2방잔액

    @JsonProperty("DPOPRT3")
    private double dpoprt3;        // 3방출금금액

    @JsonProperty("DPOPRT2")
    private double dpoprt2;        // 2방출금금액

    @JsonProperty("DPOCASH")
    private double dpocash;        // 현금출금금액

    /**
     * @return the dpyear
     */
    public String getDpyear() {
        return dpyear;
    }

    /**
     * @param dpyear the dpyear to set
     */
    public void setDpyear(String dpyear) {
        this.dpyear = dpyear;
    }

    /**
     * @return the dpmoth
     */
    public String getDpmoth() {
        return dpmoth;
    }

    /**
     * @param dpmoth the dpmoth to set
     */
    public void setDpmoth(String dpmoth) {
        this.dpmoth = dpmoth;
    }

    /**
     * @return the dpday
     */
    public String getDpday() {
        return dpday;
    }

    /**
     * @param dpday the dpday to set
     */
    public void setDpday(String dpday) {
        this.dpday = dpday;
    }

    /**
     * @return the dpdelr
     */
    public String getDpdelr() {
        return dpdelr;
    }

    /**
     * @param dpdelr the dpdelr to set
     */
    public void setDpdelr(String dpdelr) {
        this.dpdelr = dpdelr;
    }

    /**
     * @return the dpprt3
     */
    public double getDpprt3() {
        return dpprt3;
    }

    /**
     * @param dpprt3 the dpprt3 to set
     */
    public void setDpprt3(double dpprt3) {
        this.dpprt3 = dpprt3;
    }

    /**
     * @return the dpprt2
     */
    public double getDpprt2() {
        return dpprt2;
    }

    /**
     * @param dpprt2 the dpprt2 to set
     */
    public void setDpprt2(double dpprt2) {
        this.dpprt2 = dpprt2;
    }

    /**
     * @return the dpcash
     */
    public double getDpcash() {
        return dpcash;
    }

    /**
     * @param dpcash the dpcash to set
     */
    public void setDpcash(double dpcash) {
        this.dpcash = dpcash;
    }

    /**
     * @return the dpincn
     */
    public double getDpincn() {
        return dpincn;
    }

    /**
     * @param dpincn the dpincn to set
     */
    public void setDpincn(double dpincn) {
        this.dpincn = dpincn;
    }

    /**
     * @return the dpippr
     */
    public double getDpippr() {
        return dpippr;
    }

    /**
     * @param dpippr the dpippr to set
     */
    public void setDpippr(double dpippr) {
        this.dpippr = dpippr;
    }

    /**
     * @return the dpipamt
     */
    public double getDpipamt() {
        return dpipamt;
    }

    /**
     * @param dpipamt the dpipamt to set
     */
    public void setDpipamt(double dpipamt) {
        this.dpipamt = dpipamt;
    }

    /**
     * @return the dpoppr
     */
    public double getDpoppr() {
        return dpoppr;
    }

    /**
     * @param dpoppr the dpoppr to set
     */
    public void setDpoppr(double dpoppr) {
        this.dpoppr = dpoppr;
    }

    /**
     * @return the dpopcn
     */
    public double getDpopcn() {
        return dpopcn;
    }

    /**
     * @param dpopcn the dpopcn to set
     */
    public void setDpopcn(double dpopcn) {
        this.dpopcn = dpopcn;
    }

    /**
     * @return the dpcrcs
     */
    public double getDpcrcs() {
        return dpcrcs;
    }

    /**
     * @param dpcrcs the dpcrcs to set
     */
    public void setDpcrcs(double dpcrcs) {
        this.dpcrcs = dpcrcs;
    }

    /**
     * @return the dpdepo
     */
    public double getDpdepo() {
        return dpdepo;
    }

    /**
     * @param dpdepo the dpdepo to set
     */
    public void setDpdepo(double dpdepo) {
        this.dpdepo = dpdepo;
    }

    /**
     * @return the dpbal3
     */
    public double getDpbal3() {
        return dpbal3;
    }

    /**
     * @param dpbal3 the dpbal3 to set
     */
    public void setDpbal3(double dpbal3) {
        this.dpbal3 = dpbal3;
    }

    /**
     * @return the dpbal2
     */
    public double getDpbal2() {
        return dpbal2;
    }

    /**
     * @param dpbal2 the dpbal2 to set
     */
    public void setDpbal2(double dpbal2) {
        this.dpbal2 = dpbal2;
    }

    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }

    /**
     * @return the dpocash
     */
    public double getDpocash() {
        return dpocash;
    }

    /**
     * @param dpocash the dpocash to set
     */
    public void setDpocash(double dpocash) {
        this.dpocash = dpocash;
    }

    /**
     * @return the dpoprt3
     */
    public double getDpoprt3() {
        return dpoprt3;
    }

    /**
     * @param dpoprt3 the dpoprt3 to set
     */
    public void setDpoprt3(double dpoprt3) {
        this.dpoprt3 = dpoprt3;
    }

    /**
     * @return the dpoprt2
     */
    public double getDpoprt2() {
        return dpoprt2;
    }

    /**
     * @param dpoprt2 the dpoprt2 to set
     */
    public void setDpoprt2(double dpoprt2) {
        this.dpoprt2 = dpoprt2;
    }
}