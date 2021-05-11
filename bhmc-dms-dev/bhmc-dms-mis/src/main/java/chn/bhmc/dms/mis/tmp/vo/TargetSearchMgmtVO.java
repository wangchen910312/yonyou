package chn.bhmc.dms.mis.tmp.vo;

import chn.bhmc.dms.core.datatype.SearchVO;
/**
 * <pre>
 * [제조사] 년월간 목표 조회
 * </pre>
 *
 * @ClassName   : TargetSearchMgmtVO.java
 * @Description : [제조사] 년월간 목표 조회
 * @author chibeom.song
 * @since 2016. 7. 22.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 7. 22.   chibeom.song     최초 생성
 * </pre>
 */

public class TargetSearchMgmtVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 3137693936684897186L;

    // 조회조건
    private String sGoalYy;                 // 목표년도
    private String sGoalQq;                 // 목표분기
    private String sGoalMm;                 // 목표월
    private String sSdptCd;                 // 사업부코드
    private String sOfficeCd;               // 사무소코드
    private String sDealerCd;               // 딜러코드
    private String sCarLineCd;              // 차종코드

    // 데이터

    private int rnum;                       // 번호
    private String goalYy;                  // 목표년도
    private String goalMm;                  // 목표월
    private String sdptCd;                  // 사업부코드
    private String sdptNm;                  // 사업부명
    private String officeCd;                // 사무소코드
    private String officeNm;                // 사무소명
    private String dlrCd;                   // 딜러코드
    private String dlrNm;                   // 딜러명
    private String carLineCd;               // 차종코드
    private String carLineNm;               // 차종명

    private String sumYear;                 // 년별 총합계
    private String sumMonth;                // 월별 총합계
    private String querterQ01;              // 1분기 합계
    private String monthM01;                // 1월
    private String monthM02;                // 2월
    private String monthM03;                // 3월
    private String querterQ02;              // 2분기 합계
    private String monthM04;                // 4월
    private String monthM05;                // 5월
    private String monthM06;                // 6월
    private String querterQ03;              // 3분기 합계
    private String monthM07;                // 7월
    private String monthM08;                // 8월
    private String monthM09;                // 9월
    private String querterQ04;              // 4분기 합계
    private String monthM10;                // 10월
    private String monthM11;                // 11월
    private String monthM12;                // 12월
    /**
     * @return the sGoalYy
     */
    public String getsGoalYy() {
        return sGoalYy;
    }
    /**
     * @param sGoalYy the sGoalYy to set
     */
    public void setsGoalYy(String sGoalYy) {
        this.sGoalYy = sGoalYy;
    }
    /**
     * @return the sGoalQq
     */
    public String getsGoalQq() {
        return sGoalQq;
    }
    /**
     * @param sGoalQq the sGoalQq to set
     */
    public void setsGoalQq(String sGoalQq) {
        this.sGoalQq = sGoalQq;
    }
    /**
     * @return the sGoalMm
     */
    public String getsGoalMm() {
        return sGoalMm;
    }
    /**
     * @param sGoalMm the sGoalMm to set
     */
    public void setsGoalMm(String sGoalMm) {
        this.sGoalMm = sGoalMm;
    }
    /**
     * @return the sSdptCd
     */
    public String getsSdptCd() {
        return sSdptCd;
    }
    /**
     * @param sSdptCd the sSdptCd to set
     */
    public void setsSdptCd(String sSdptCd) {
        this.sSdptCd = sSdptCd;
    }
    /**
     * @return the sOfficeCd
     */
    public String getsOfficeCd() {
        return sOfficeCd;
    }
    /**
     * @param sOfficeCd the sOfficeCd to set
     */
    public void setsOfficeCd(String sOfficeCd) {
        this.sOfficeCd = sOfficeCd;
    }
    /**
     * @return the sDealerCd
     */
    public String getsDealerCd() {
        return sDealerCd;
    }
    /**
     * @param sDealerCd the sDealerCd to set
     */
    public void setsDealerCd(String sDealerCd) {
        this.sDealerCd = sDealerCd;
    }
    /**
     * @return the sCarLineCd
     */
    public String getsCarLineCd() {
        return sCarLineCd;
    }
    /**
     * @param sCarLineCd the sCarLineCd to set
     */
    public void setsCarLineCd(String sCarLineCd) {
        this.sCarLineCd = sCarLineCd;
    }
    /**
     * @return the rnum
     */
    public int getRnum() {
        return rnum;
    }
    /**
     * @param rnum the rnum to set
     */
    public void setRnum(int rnum) {
        this.rnum = rnum;
    }
    /**
     * @return the goalYy
     */
    public String getGoalYy() {
        return goalYy;
    }
    /**
     * @param goalYy the goalYy to set
     */
    public void setGoalYy(String goalYy) {
        this.goalYy = goalYy;
    }
    /**
     * @return the goalMm
     */
    public String getGoalMm() {
        return goalMm;
    }
    /**
     * @param goalMm the goalMm to set
     */
    public void setGoalMm(String goalMm) {
        this.goalMm = goalMm;
    }
    /**
     * @return the sdptCd
     */
    public String getSdptCd() {
        return sdptCd;
    }
    /**
     * @param sdptCd the sdptCd to set
     */
    public void setSdptCd(String sdptCd) {
        this.sdptCd = sdptCd;
    }
    /**
     * @return the sdptNm
     */
    public String getSdptNm() {
        return sdptNm;
    }
    /**
     * @param sdptNm the sdptNm to set
     */
    public void setSdptNm(String sdptNm) {
        this.sdptNm = sdptNm;
    }
    /**
     * @return the officeCd
     */
    public String getOfficeCd() {
        return officeCd;
    }
    /**
     * @param officeCd the officeCd to set
     */
    public void setOfficeCd(String officeCd) {
        this.officeCd = officeCd;
    }
    /**
     * @return the officeNm
     */
    public String getOfficeNm() {
        return officeNm;
    }
    /**
     * @param officeNm the officeNm to set
     */
    public void setOfficeNm(String officeNm) {
        this.officeNm = officeNm;
    }
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
     * @return the dlrNm
     */
    public String getDlrNm() {
        return dlrNm;
    }
    /**
     * @param dlrNm the dlrNm to set
     */
    public void setDlrNm(String dlrNm) {
        this.dlrNm = dlrNm;
    }
    /**
     * @return the carLineCd
     */
    public String getCarLineCd() {
        return carLineCd;
    }
    /**
     * @param carLineCd the carLineCd to set
     */
    public void setCarLineCd(String carLineCd) {
        this.carLineCd = carLineCd;
    }
    /**
     * @return the carLineNm
     */
    public String getCarLineNm() {
        return carLineNm;
    }
    /**
     * @param carLineNm the carLineNm to set
     */
    public void setCarLineNm(String carLineNm) {
        this.carLineNm = carLineNm;
    }
    /**
     * @return the sumYear
     */
    public String getSumYear() {
        return sumYear;
    }
    /**
     * @param sumYear the sumYear to set
     */
    public void setSumYear(String sumYear) {
        this.sumYear = sumYear;
    }
    /**
     * @return the sumMonth
     */
    public String getSumMonth() {
        return sumMonth;
    }
    /**
     * @param sumMonth the sumMonth to set
     */
    public void setSumMonth(String sumMonth) {
        this.sumMonth = sumMonth;
    }
    /**
     * @return the querterQ01
     */
    public String getQuerterQ01() {
        return querterQ01;
    }
    /**
     * @param querterQ01 the querterQ01 to set
     */
    public void setQuerterQ01(String querterQ01) {
        this.querterQ01 = querterQ01;
    }
    /**
     * @return the monthM01
     */
    public String getMonthM01() {
        return monthM01;
    }
    /**
     * @param monthM01 the monthM01 to set
     */
    public void setMonthM01(String monthM01) {
        this.monthM01 = monthM01;
    }
    /**
     * @return the monthM02
     */
    public String getMonthM02() {
        return monthM02;
    }
    /**
     * @param monthM02 the monthM02 to set
     */
    public void setMonthM02(String monthM02) {
        this.monthM02 = monthM02;
    }
    /**
     * @return the monthM03
     */
    public String getMonthM03() {
        return monthM03;
    }
    /**
     * @param monthM03 the monthM03 to set
     */
    public void setMonthM03(String monthM03) {
        this.monthM03 = monthM03;
    }
    /**
     * @return the querterQ02
     */
    public String getQuerterQ02() {
        return querterQ02;
    }
    /**
     * @param querterQ02 the querterQ02 to set
     */
    public void setQuerterQ02(String querterQ02) {
        this.querterQ02 = querterQ02;
    }
    /**
     * @return the monthM04
     */
    public String getMonthM04() {
        return monthM04;
    }
    /**
     * @param monthM04 the monthM04 to set
     */
    public void setMonthM04(String monthM04) {
        this.monthM04 = monthM04;
    }
    /**
     * @return the monthM05
     */
    public String getMonthM05() {
        return monthM05;
    }
    /**
     * @param monthM05 the monthM05 to set
     */
    public void setMonthM05(String monthM05) {
        this.monthM05 = monthM05;
    }
    /**
     * @return the monthM06
     */
    public String getMonthM06() {
        return monthM06;
    }
    /**
     * @param monthM06 the monthM06 to set
     */
    public void setMonthM06(String monthM06) {
        this.monthM06 = monthM06;
    }
    /**
     * @return the querterQ03
     */
    public String getQuerterQ03() {
        return querterQ03;
    }
    /**
     * @param querterQ03 the querterQ03 to set
     */
    public void setQuerterQ03(String querterQ03) {
        this.querterQ03 = querterQ03;
    }
    /**
     * @return the monthM07
     */
    public String getMonthM07() {
        return monthM07;
    }
    /**
     * @param monthM07 the monthM07 to set
     */
    public void setMonthM07(String monthM07) {
        this.monthM07 = monthM07;
    }
    /**
     * @return the monthM08
     */
    public String getMonthM08() {
        return monthM08;
    }
    /**
     * @param monthM08 the monthM08 to set
     */
    public void setMonthM08(String monthM08) {
        this.monthM08 = monthM08;
    }
    /**
     * @return the monthM09
     */
    public String getMonthM09() {
        return monthM09;
    }
    /**
     * @param monthM09 the monthM09 to set
     */
    public void setMonthM09(String monthM09) {
        this.monthM09 = monthM09;
    }
    /**
     * @return the querterQ04
     */
    public String getQuerterQ04() {
        return querterQ04;
    }
    /**
     * @param querterQ04 the querterQ04 to set
     */
    public void setQuerterQ04(String querterQ04) {
        this.querterQ04 = querterQ04;
    }
    /**
     * @return the monthM10
     */
    public String getMonthM10() {
        return monthM10;
    }
    /**
     * @param monthM10 the monthM10 to set
     */
    public void setMonthM10(String monthM10) {
        this.monthM10 = monthM10;
    }
    /**
     * @return the monthM11
     */
    public String getMonthM11() {
        return monthM11;
    }
    /**
     * @param monthM11 the monthM11 to set
     */
    public void setMonthM11(String monthM11) {
        this.monthM11 = monthM11;
    }
    /**
     * @return the monthM12
     */
    public String getMonthM12() {
        return monthM12;
    }
    /**
     * @param monthM12 the monthM12 to set
     */
    public void setMonthM12(String monthM12) {
        this.monthM12 = monthM12;
    }



}
