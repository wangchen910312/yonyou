package chn.bhmc.dms.par.cpm.vo;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * 임무관리 VO.
 *
 * @ClassName   : SalePlanActVO.java
 * @Description : SalePlanActVO Class
 * @author In Bo Shim
 * @since 2016. 7. 27.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 7. 27.     In Bo Shim     최초 생성
 * </pre>
 */

public class SalePlanActVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 235838929117710323L;

    /**
     * 부품유형
     **/
    private String itemDstinCd = "";

    /**
     * 판매구분
     **/
    private String saleTp = "N";

    /**
     * 구분
     **/
    private String dstDstinCd = "";

    /**
     * 임무
     **/
    private String dstDstinTp = "";

    /**
     * 작년
     **/
    private String lastYear = "";

    /**
     * 년
     **/
    private String thisYear = "";

    /**
     * 년월
     **/
    private String yyMm = "";

    /**
     * 작년총금액
     **/
    private Double lastYearTot = 0.0;

    /**
     * 올해총금액
     **/
    private Double thisYearTot = 0.0;

    /**
     * 1월
     **/
    private Double month01 = 0.0;

    /**
     * 1월 변경전 가격
     **/
    private Double month01Cost = 0.0;

    /**
     * 2월
     **/
    private Double month02 = 0.0;

    /**
     * 2월 변경전 가격
     **/
    private Double month02Cost = 0.0;

    /**
     * 3월
     **/
    private Double month03 = 0.0;

    /**
     * 3월 변경전 가격
     **/
    private Double month03Cost = 0.0;

    /**
     * 4월
     **/
    private Double month04 = 0.0;

    /**
     * 4월 변경전 가격
     **/
    private Double month04Cost = 0.0;

    /**
     * 5월
     **/
    private Double month05 = 0.0;

    /**
     * 5월 변경전 가격
     **/
    private Double month05Cost = 0.0;

    /**
     * 6월
     **/
    private Double month06 = 0.0;

    /**
     * 6월 변경전 가격
     **/
    private Double month06Cost = 0.0;

    /**
     * 7월
     **/
    private Double month07 = 0.0;

    /**
     * 7월 변경전 가격
     **/
    private Double month07Cost = 0.0;

    /**
     * 8월
     **/
    private Double month08 = 0.0;

    /**
     * 8월 변경전 가격
     **/
    private Double month08Cost = 0.0;

    /**
     * 9월
     **/
    private Double month09 = 0.0;

    /**
     * 9월 변경전 가격
     **/
    private Double month09Cost = 0.0;

    /**
     * 10월
     **/
    private Double month10 = 0.0;

    /**
     * 10월 변경전 가격
     **/
    private Double month10Cost = 0.0;

    /**
     * 11월
     **/
    private Double month11 = 0.0;

    /**
     * 11월 변경전 가격
     **/
    private Double month11Cost = 0.0;

    /**
     * 12월
     **/
    private Double month12 = 0.0;

    /**
     * 12월 변경전 가격
     **/
    private Double month12Cost = 0.0;

    /**
     * @return the itemDstinCd
     */
    public String getItemDstinCd() {
        return itemDstinCd;
    }
    /**
     * @param itemDstinCd the itemDstinCd to set
     */
    public void setItemDstinCd(String itemDstinCd) {
        this.itemDstinCd = itemDstinCd;
    }
    /**
     * @return the saleTp
     */
    public String getSaleTp() {
        return saleTp;
    }
    /**
     * @param saleTp the saleTp to set
     */
    public void setSaleTp(String saleTp) {
        this.saleTp = saleTp;
    }
    /**
     * @return the dstDstinCd
     */
    public String getDstDstinCd() {
        return dstDstinCd;
    }
    /**
     * @param dstDstinCd the dstDstinCd to set
     */
    public void setDstDstinCd(String dstDstinCd) {
        this.dstDstinCd = dstDstinCd;
    }
    /**
     * @return the dstDstinTp
     */
    public String getDstDstinTp() {
        return dstDstinTp;
    }
    /**
     * @param dstDstinTp the dstDstinTp to set
     */
    public void setDstDstinTp(String dstDstinTp) {
        this.dstDstinTp = dstDstinTp;
    }
    /**
     * @return the lastYear
     */
    public String getLastYear() {
        return lastYear;
    }
    /**
     * @param lastYear the lastYear to set
     */
    public void setLastYear(String lastYear) {
        this.lastYear = lastYear;
    }
    /**
     * @return the thisYear
     */
    public String getThisYear() {
        return thisYear;
    }
    /**
     * @param thisYear the thisYear to set
     */
    public void setThisYear(String thisYear) {
        this.thisYear = thisYear;
    }
    /**
     * @return the yyMm
     */
    public String getYyMm() {
        return yyMm;
    }
    /**
     * @param yyMm the yyMm to set
     */
    public void setYyMm(String yyMm) {
        this.yyMm = yyMm;
    }
    /**
     * @return the lastYearTot
     */
    public Double getLastYearTot() {
        return lastYearTot;
    }
    /**
     * @param lastYearTot the lastYearTot to set
     */
    public void setLastYearTot(Double lastYearTot) {
        this.lastYearTot = lastYearTot;
    }
    /**
     * @return the thisYearTot
     */
    public Double getThisYearTot() {
        return thisYearTot;
    }
    /**
     * @param thisYearTot the thisYearTot to set
     */
    public void setThisYearTot(Double thisYearTot) {
        this.thisYearTot = thisYearTot;
    }
    /**
     * @return the month01
     */
    public Double getMonth01() {
        return month01;
    }
    /**
     * @param month01 the month01 to set
     */
    public void setMonth01(Double month01) {
        this.month01 = month01;
    }
    /**
     * @return the month01Cost
     */
    public Double getMonth01Cost() {
        return month01Cost;
    }
    /**
     * @param month01Cost the month01Cost to set
     */
    public void setMonth01Cost(Double month01Cost) {
        this.month01Cost = month01Cost;
    }
    /**
     * @return the month02
     */
    public Double getMonth02() {
        return month02;
    }
    /**
     * @param month02 the month02 to set
     */
    public void setMonth02(Double month02) {
        this.month02 = month02;
    }
    /**
     * @return the month02Cost
     */
    public Double getMonth02Cost() {
        return month02Cost;
    }
    /**
     * @param month02Cost the month02Cost to set
     */
    public void setMonth02Cost(Double month02Cost) {
        this.month02Cost = month02Cost;
    }
    /**
     * @return the month03
     */
    public Double getMonth03() {
        return month03;
    }
    /**
     * @param month03 the month03 to set
     */
    public void setMonth03(Double month03) {
        this.month03 = month03;
    }
    /**
     * @return the month03Cost
     */
    public Double getMonth03Cost() {
        return month03Cost;
    }
    /**
     * @param month03Cost the month03Cost to set
     */
    public void setMonth03Cost(Double month03Cost) {
        this.month03Cost = month03Cost;
    }
    /**
     * @return the month04
     */
    public Double getMonth04() {
        return month04;
    }
    /**
     * @param month04 the month04 to set
     */
    public void setMonth04(Double month04) {
        this.month04 = month04;
    }
    /**
     * @return the month04Cost
     */
    public Double getMonth04Cost() {
        return month04Cost;
    }
    /**
     * @param month04Cost the month04Cost to set
     */
    public void setMonth04Cost(Double month04Cost) {
        this.month04Cost = month04Cost;
    }
    /**
     * @return the month05
     */
    public Double getMonth05() {
        return month05;
    }
    /**
     * @param month05 the month05 to set
     */
    public void setMonth05(Double month05) {
        this.month05 = month05;
    }
    /**
     * @return the month05Cost
     */
    public Double getMonth05Cost() {
        return month05Cost;
    }
    /**
     * @param month05Cost the month05Cost to set
     */
    public void setMonth05Cost(Double month05Cost) {
        this.month05Cost = month05Cost;
    }
    /**
     * @return the month06
     */
    public Double getMonth06() {
        return month06;
    }
    /**
     * @param month06 the month06 to set
     */
    public void setMonth06(Double month06) {
        this.month06 = month06;
    }
    /**
     * @return the month06Cost
     */
    public Double getMonth06Cost() {
        return month06Cost;
    }
    /**
     * @param month06Cost the month06Cost to set
     */
    public void setMonth06Cost(Double month06Cost) {
        this.month06Cost = month06Cost;
    }
    /**
     * @return the month07
     */
    public Double getMonth07() {
        return month07;
    }
    /**
     * @param month07 the month07 to set
     */
    public void setMonth07(Double month07) {
        this.month07 = month07;
    }
    /**
     * @return the month07Cost
     */
    public Double getMonth07Cost() {
        return month07Cost;
    }
    /**
     * @param month07Cost the month07Cost to set
     */
    public void setMonth07Cost(Double month07Cost) {
        this.month07Cost = month07Cost;
    }
    /**
     * @return the month08
     */
    public Double getMonth08() {
        return month08;
    }
    /**
     * @param month08 the month08 to set
     */
    public void setMonth08(Double month08) {
        this.month08 = month08;
    }
    /**
     * @return the month08Cost
     */
    public Double getMonth08Cost() {
        return month08Cost;
    }
    /**
     * @param month08Cost the month08Cost to set
     */
    public void setMonth08Cost(Double month08Cost) {
        this.month08Cost = month08Cost;
    }
    /**
     * @return the month09
     */
    public Double getMonth09() {
        return month09;
    }
    /**
     * @param month09 the month09 to set
     */
    public void setMonth09(Double month09) {
        this.month09 = month09;
    }
    /**
     * @return the month09Cost
     */
    public Double getMonth09Cost() {
        return month09Cost;
    }
    /**
     * @param month09Cost the month09Cost to set
     */
    public void setMonth09Cost(Double month09Cost) {
        this.month09Cost = month09Cost;
    }
    /**
     * @return the month10
     */
    public Double getMonth10() {
        return month10;
    }
    /**
     * @param month10 the month10 to set
     */
    public void setMonth10(Double month10) {
        this.month10 = month10;
    }
    /**
     * @return the month10Cost
     */
    public Double getMonth10Cost() {
        return month10Cost;
    }
    /**
     * @param month10Cost the month10Cost to set
     */
    public void setMonth10Cost(Double month10Cost) {
        this.month10Cost = month10Cost;
    }
    /**
     * @return the month11
     */
    public Double getMonth11() {
        return month11;
    }
    /**
     * @param month11 the month11 to set
     */
    public void setMonth11(Double month11) {
        this.month11 = month11;
    }
    /**
     * @return the month11Cost
     */
    public Double getMonth11Cost() {
        return month11Cost;
    }
    /**
     * @param month11Cost the month11Cost to set
     */
    public void setMonth11Cost(Double month11Cost) {
        this.month11Cost = month11Cost;
    }
    /**
     * @return the month12
     */
    public Double getMonth12() {
        return month12;
    }
    /**
     * @param month12 the month12 to set
     */
    public void setMonth12(Double month12) {
        this.month12 = month12;
    }
    /**
     * @return the month12Cost
     */
    public Double getMonth12Cost() {
        return month12Cost;
    }
    /**
     * @param month12Cost the month12Cost to set
     */
    public void setMonth12Cost(Double month12Cost) {
        this.month12Cost = month12Cost;
    }

}
