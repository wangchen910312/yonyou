package chn.bhmc.dms.crm.dmm.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.SearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : PackageCouponStandbySearchVO.java
 * @Description : 무료 패키지쿠폰 결재 조회 VO
 * @author Kim Hyun Ho
 * @since 2016. 7. 21.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 7. 21.     Kim Hyun Ho     최초 생성
 * </pre>
 */

public class PackageCouponStandbySearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -6819076384345043103L;

    /**
    * 딜러코드
    **/

    private  String         sDlrCd;

    /**
    * 쿠폰증정일련번호
    **/

    private  int            sCupnPrenSeq;

    /**
    * 멤버쉽번호
    **/

    private  String         sMembershipNo;

    /**
    * 결제문서번호
    **/

    private  String         sSignDocNo;

    /**
    * 패키지일련번호
    **/

    private  int            sPkgSeq;

    /**
    * 패키지명
    **/

    private  String         sPkgNm;

    /**
    * 패키지금액
    **/

    private  int            sPkgAmt;

    /**
    * 패키지내용
    **/

    private  String         sPkgCont;

    /**
    * 쿠폰일련번호
    **/

    private  int            sCupnSeq;

    /**
    * 쿠폰번호
    **/

    private  String         sCupnNo;

    /**
    * 쿠폰명
    **/

    private  String         sCupnNm;

    /**
    * 쿠폰내용
    **/

    private  String         sCupnCont;

    /**
    * 쿠폰소멸일자
    **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date           sCupnExtcDt;

    /**
    * 쿠폰유효기간
    **/

    private  int            sCupnValidPrid;

    /**
    * 등록자ID
    **/

    private  String         sRegUsrId;

    /**
    * 등록일자
    **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date           sRegDt;

    /**
    * 수정자ID
    **/

    private  String         sUpdtUsrId;

    /**
    * 수정일자
    **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date           sUpdtDt;

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
     * @return the sCupnPrenSeq
     */
    public int getsCupnPrenSeq() {
        return sCupnPrenSeq;
    }

    /**
     * @param sCupnPrenSeq the sCupnPrenSeq to set
     */
    public void setsCupnPrenSeq(int sCupnPrenSeq) {
        this.sCupnPrenSeq = sCupnPrenSeq;
    }

    /**
     * @return the sMembershipNo
     */
    public String getsMembershipNo() {
        return sMembershipNo;
    }

    /**
     * @param sMembershipNo the sMembershipNo to set
     */
    public void setsMembershipNo(String sMembershipNo) {
        this.sMembershipNo = sMembershipNo;
    }

    /**
     * @return the sSignDocNo
     */
    public String getsSignDocNo() {
        return sSignDocNo;
    }

    /**
     * @param sSignDocNo the sSignDocNo to set
     */
    public void setsSignDocNo(String sSignDocNo) {
        this.sSignDocNo = sSignDocNo;
    }

    /**
     * @return the sPkgSeq
     */
    public int getsPkgSeq() {
        return sPkgSeq;
    }

    /**
     * @param sPkgSeq the sPkgSeq to set
     */
    public void setsPkgSeq(int sPkgSeq) {
        this.sPkgSeq = sPkgSeq;
    }

    /**
     * @return the sPkgNm
     */
    public String getsPkgNm() {
        return sPkgNm;
    }

    /**
     * @param sPkgNm the sPkgNm to set
     */
    public void setsPkgNm(String sPkgNm) {
        this.sPkgNm = sPkgNm;
    }

    /**
     * @return the sPkgAmt
     */
    public int getsPkgAmt() {
        return sPkgAmt;
    }

    /**
     * @param sPkgAmt the sPkgAmt to set
     */
    public void setsPkgAmt(int sPkgAmt) {
        this.sPkgAmt = sPkgAmt;
    }

    /**
     * @return the sPkgCont
     */
    public String getsPkgCont() {
        return sPkgCont;
    }

    /**
     * @param sPkgCont the sPkgCont to set
     */
    public void setsPkgCont(String sPkgCont) {
        this.sPkgCont = sPkgCont;
    }

    /**
     * @return the sCupnSeq
     */
    public int getsCupnSeq() {
        return sCupnSeq;
    }

    /**
     * @param sCupnSeq the sCupnSeq to set
     */
    public void setsCupnSeq(int sCupnSeq) {
        this.sCupnSeq = sCupnSeq;
    }

    /**
     * @return the sCupnNo
     */
    public String getsCupnNo() {
        return sCupnNo;
    }

    /**
     * @param sCupnNo the sCupnNo to set
     */
    public void setsCupnNo(String sCupnNo) {
        this.sCupnNo = sCupnNo;
    }

    /**
     * @return the sCupnNm
     */
    public String getsCupnNm() {
        return sCupnNm;
    }

    /**
     * @param sCupnNm the sCupnNm to set
     */
    public void setsCupnNm(String sCupnNm) {
        this.sCupnNm = sCupnNm;
    }

    /**
     * @return the sCupnCont
     */
    public String getsCupnCont() {
        return sCupnCont;
    }

    /**
     * @param sCupnCont the sCupnCont to set
     */
    public void setsCupnCont(String sCupnCont) {
        this.sCupnCont = sCupnCont;
    }

    /**
     * @return the sCupnExtcDt
     */
    public Date getsCupnExtcDt() {
        return sCupnExtcDt;
    }

    /**
     * @param sCupnExtcDt the sCupnExtcDt to set
     */
    public void setsCupnExtcDt(Date sCupnExtcDt) {
        this.sCupnExtcDt = sCupnExtcDt;
    }

    /**
     * @return the sCupnValidPrid
     */
    public int getsCupnValidPrid() {
        return sCupnValidPrid;
    }

    /**
     * @param sCupnValidPrid the sCupnValidPrid to set
     */
    public void setsCupnValidPrid(int sCupnValidPrid) {
        this.sCupnValidPrid = sCupnValidPrid;
    }

    /**
     * @return the sRegUsrId
     */
    public String getsRegUsrId() {
        return sRegUsrId;
    }

    /**
     * @param sRegUsrId the sRegUsrId to set
     */
    public void setsRegUsrId(String sRegUsrId) {
        this.sRegUsrId = sRegUsrId;
    }

    /**
     * @return the sRegDt
     */
    public Date getsRegDt() {
        return sRegDt;
    }

    /**
     * @param sRegDt the sRegDt to set
     */
    public void setsRegDt(Date sRegDt) {
        this.sRegDt = sRegDt;
    }

    /**
     * @return the sUpdtUsrId
     */
    public String getsUpdtUsrId() {
        return sUpdtUsrId;
    }

    /**
     * @param sUpdtUsrId the sUpdtUsrId to set
     */
    public void setsUpdtUsrId(String sUpdtUsrId) {
        this.sUpdtUsrId = sUpdtUsrId;
    }

    /**
     * @return the sUpdtDt
     */
    public Date getsUpdtDt() {
        return sUpdtDt;
    }

    /**
     * @param sUpdtDt the sUpdtDt to set
     */
    public void setsUpdtDt(Date sUpdtDt) {
        this.sUpdtDt = sUpdtDt;
    }



}
