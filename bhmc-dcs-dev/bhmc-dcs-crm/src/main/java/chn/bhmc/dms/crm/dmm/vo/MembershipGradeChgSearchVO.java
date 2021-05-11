package chn.bhmc.dms.crm.dmm.vo;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : MembershipGradeChgSearchVO.java
 * @Description : 멤버십 등급변경정보 조회VO
 * @author Kim Hyun Ho
 * @since 2016. 4. 18.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 18.     Kim Hyun Ho     최초 생성
 * </pre>
 */

public class MembershipGradeChgSearchVO extends SearchVO {




    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 6454114203457684597L;

    /**
    * 딜러코드
    **/

    private  String sDlrCd;

    /**
    * 센터코드
    **/

    private  String sPltCd;

    /**
    * 등급일련번호
    **/

    private  String sGradeSeq;

    /**
    * 등급명
    **/

    private  String sGradeNm;

    /**
    * 방문시작횟수
    **/

    private  int sVsitStartCnt;

    /**
    * 방문종료횟수
    **/

    private  int sVsitEndCnt;

    /**
    * 방문조건코드
    **/

    private  String sVsitTermCd;

    /**
    * 구매시작횟수
    **/

    private  int sPurcStartCnt;

    /**
    * 구매종료횟수
    **/

    private  int sPurcEndCnt;

    /**
    * 구매조건코드
    **/

    private  String sPurcTermCd;

    /**
    * 구매시작금액
    **/

    private  int sPurcStartAmt;

    /**
    * 구매종료금액
    **/

    private  int sPurcEndAmt;

    /**
    * 구매조건금액코드
    **/

    private  String sPurcTermAmtCd;

    /**
    * 충전시작금액
    **/

    private  int sRchgStartAmt;

    /**
    * 충전종료금액
    **/

    private  int sRchgEndAmt;

    /**
    * 적립율
    **/

    private  int sAccuRate;

    /**
     * 적립율
     **/

    private  int sMembershipGradeChgSeq;

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
     * @return the sGradeSeq
     */
    public String getsGradeSeq() {
        return sGradeSeq;
    }

    /**
     * @param sGradeSeq the sGradeSeq to set
     */
    public void setsGradeSeq(String sGradeSeq) {
        this.sGradeSeq = sGradeSeq;
    }

    /**
     * @return the sGradeNm
     */
    public String getsGradeNm() {
        return sGradeNm;
    }

    /**
     * @param sGradeNm the sGradeNm to set
     */
    public void setsGradeNm(String sGradeNm) {
        this.sGradeNm = sGradeNm;
    }

    /**
     * @return the sVsitStartCnt
     */
    public int getsVsitStartCnt() {
        return sVsitStartCnt;
    }

    /**
     * @param sVsitStartCnt the sVsitStartCnt to set
     */
    public void setsVsitStartCnt(int sVsitStartCnt) {
        this.sVsitStartCnt = sVsitStartCnt;
    }

    /**
     * @return the sVsitEndCnt
     */
    public int getsVsitEndCnt() {
        return sVsitEndCnt;
    }

    /**
     * @param sVsitEndCnt the sVsitEndCnt to set
     */
    public void setsVsitEndCnt(int sVsitEndCnt) {
        this.sVsitEndCnt = sVsitEndCnt;
    }

    /**
     * @return the sVsitTermCd
     */
    public String getsVsitTermCd() {
        return sVsitTermCd;
    }

    /**
     * @param sVsitTermCd the sVsitTermCd to set
     */
    public void setsVsitTermCd(String sVsitTermCd) {
        this.sVsitTermCd = sVsitTermCd;
    }

    /**
     * @return the sPurcStartCnt
     */
    public int getsPurcStartCnt() {
        return sPurcStartCnt;
    }

    /**
     * @param sPurcStartCnt the sPurcStartCnt to set
     */
    public void setsPurcStartCnt(int sPurcStartCnt) {
        this.sPurcStartCnt = sPurcStartCnt;
    }

    /**
     * @return the sPurcEndCnt
     */
    public int getsPurcEndCnt() {
        return sPurcEndCnt;
    }

    /**
     * @param sPurcEndCnt the sPurcEndCnt to set
     */
    public void setsPurcEndCnt(int sPurcEndCnt) {
        this.sPurcEndCnt = sPurcEndCnt;
    }

    /**
     * @return the sPurcTermCd
     */
    public String getsPurcTermCd() {
        return sPurcTermCd;
    }

    /**
     * @param sPurcTermCd the sPurcTermCd to set
     */
    public void setsPurcTermCd(String sPurcTermCd) {
        this.sPurcTermCd = sPurcTermCd;
    }

    /**
     * @return the sPurcStartAmt
     */
    public int getsPurcStartAmt() {
        return sPurcStartAmt;
    }

    /**
     * @param sPurcStartAmt the sPurcStartAmt to set
     */
    public void setsPurcStartAmt(int sPurcStartAmt) {
        this.sPurcStartAmt = sPurcStartAmt;
    }

    /**
     * @return the sPurcEndAmt
     */
    public int getsPurcEndAmt() {
        return sPurcEndAmt;
    }

    /**
     * @param sPurcEndAmt the sPurcEndAmt to set
     */
    public void setsPurcEndAmt(int sPurcEndAmt) {
        this.sPurcEndAmt = sPurcEndAmt;
    }

    /**
     * @return the sPurcTermAmtCd
     */
    public String getsPurcTermAmtCd() {
        return sPurcTermAmtCd;
    }

    /**
     * @param sPurcTermAmtCd the sPurcTermAmtCd to set
     */
    public void setsPurcTermAmtCd(String sPurcTermAmtCd) {
        this.sPurcTermAmtCd = sPurcTermAmtCd;
    }

    /**
     * @return the sRchgStartAmt
     */
    public int getsRchgStartAmt() {
        return sRchgStartAmt;
    }

    /**
     * @param sRchgStartAmt the sRchgStartAmt to set
     */
    public void setsRchgStartAmt(int sRchgStartAmt) {
        this.sRchgStartAmt = sRchgStartAmt;
    }

    /**
     * @return the sRchgEndAmt
     */
    public int getsRchgEndAmt() {
        return sRchgEndAmt;
    }

    /**
     * @param sRchgEndAmt the sRchgEndAmt to set
     */
    public void setsRchgEndAmt(int sRchgEndAmt) {
        this.sRchgEndAmt = sRchgEndAmt;
    }

    /**
     * @return the sAccuRate
     */
    public int getsAccuRate() {
        return sAccuRate;
    }

    /**
     * @param sAccuRate the sAccuRate to set
     */
    public void setsAccuRate(int sAccuRate) {
        this.sAccuRate = sAccuRate;
    }

    /**
     * @return the sMembershipGradeChgSeq
     */
    public int getsMembershipGradeChgSeq() {
        return sMembershipGradeChgSeq;
    }

    /**
     * @param sMembershipGradeChgSeq the sMembershipGradeChgSeq to set
     */
    public void setsMembershipGradeChgSeq(int sMembershipGradeChgSeq) {
        this.sMembershipGradeChgSeq = sMembershipGradeChgSeq;
    }



}
