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
 * @ClassName   : PackageCouponHisSearchVO.java
 * @Description : 패키지 쿠폰 이력 검색 VO
 * @author Lee In Moon
 * @since 2016. 6. 9.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 6. 9.     Lee In Moon     최초 생성
 * </pre>
 */

public class PackageCouponHisSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 6227789815214122860L;

    /**
    * 딜러코드
    **/
    private  String       sDlrCd;

    /**
    * 일련번호
    **/
    private  int          sSeq;

    /**
    * 멤버쉽번호
    **/
    private  String       sMembershipNo;

    /**
    * 패키지일련번호
    **/
    private  int          sPkgSeq;

    /**
    * 패키지명
    **/
    private  String       sPkgNm;

    /**
    * 패키지금액
    **/
    private  int          sPkgAmt;

    /**
    * 패키지내용
    **/
    private  String       sPkgCont;

    /**
    * 쿠폰일련번호
    **/
    private  int          sCupnSeq;

    /**
    * 쿠폰명
    **/
    private  String       sCupnNm;

    /**
    * 쿠폰내용
    **/
    private  String       sCupnCont;

    /**
    * 쿠폰소멸일자
    **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date         sCupnDestDt;

    /**
    * 쿠폰사용여부
    **/
    private  String       sCupnUseYn;

    /**
    * 쿠폰사용일자
    **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date         sCupnUseDt;

    /**
    * 사용부서명
    **/
    private  String       sUseDeptNm;

    /**
    * 사용담당자ID
    **/
    private  String       sUsePrsnId;

    /**
     * 쿠폰번호
     **/
    private  String       sCupnNo;

    /**
     * 고객번호
     **/
    private  String       sCustNo;

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
     * @return the sSeq
     */
    public int getsSeq() {
        return sSeq;
    }

    /**
     * @param sSeq the sSeq to set
     */
    public void setsSeq(int sSeq) {
        this.sSeq = sSeq;
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
     * @return the sCupnDestDt
     */
    public Date getsCupnDestDt() {
        return sCupnDestDt;
    }

    /**
     * @param sCupnDestDt the sCupnDestDt to set
     */
    public void setsCupnDestDt(Date sCupnDestDt) {
        this.sCupnDestDt = sCupnDestDt;
    }

    /**
     * @return the sCupnUseYn
     */
    public String getsCupnUseYn() {
        return sCupnUseYn;
    }

    /**
     * @param sCupnUseYn the sCupnUseYn to set
     */
    public void setsCupnUseYn(String sCupnUseYn) {
        this.sCupnUseYn = sCupnUseYn;
    }

    /**
     * @return the sCupnUseDt
     */
    public Date getsCupnUseDt() {
        return sCupnUseDt;
    }

    /**
     * @param sCupnUseDt the sCupnUseDt to set
     */
    public void setsCupnUseDt(Date sCupnUseDt) {
        this.sCupnUseDt = sCupnUseDt;
    }

    /**
     * @return the sUseDeptNm
     */
    public String getsUseDeptNm() {
        return sUseDeptNm;
    }

    /**
     * @param sUseDeptNm the sUseDeptNm to set
     */
    public void setsUseDeptNm(String sUseDeptNm) {
        this.sUseDeptNm = sUseDeptNm;
    }

    /**
     * @return the sUsePrsnId
     */
    public String getsUsePrsnId() {
        return sUsePrsnId;
    }

    /**
     * @param sUsePrsnId the sUsePrsnId to set
     */
    public void setsUsePrsnId(String sUsePrsnId) {
        this.sUsePrsnId = sUsePrsnId;
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
     * @return the sCustNo
     */
    public String getsCustNo() {
        return sCustNo;
    }

    /**
     * @param sCustNo the sCustNo to set
     */
    public void setsCustNo(String sCustNo) {
        this.sCustNo = sCustNo;
    }


}
