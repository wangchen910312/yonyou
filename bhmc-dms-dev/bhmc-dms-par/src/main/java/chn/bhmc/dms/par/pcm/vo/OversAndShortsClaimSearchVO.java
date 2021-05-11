package chn.bhmc.dms.par.pcm.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.SearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : OversAndShortsClaimSearchVO.java
 * @Description : OversAndShortsClaimSearchVO.class
 * @author Ju Won Lee
 * @since 2016. 2. 3.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 3.     Ju Won Lee     최초 생성
 * </pre>
 */


public class OversAndShortsClaimSearchVO extends SearchVO{


     /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -2828539812288053295L;

    /**
     * 딜러코드
     **/
    private String sDlrCd;

    /**
     * DMS클레임번호
     **/
    private String sClaimNo;

    /**
     * BMP클레임코드
     **/
    private String sClaimantNo;

    /**
     * 상태
     **/
    private int sStatus;

    /**
     * 클레임배상
     **/
    private String sClaimantName;

    /**
     * 신고일
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sCreateTime;

    /**
     * 신고일
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sCreateTimeFr;

    /**
     * 신고일
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sCreateTimeTo;

    /**
     * 송장문서번호
     **/
    private String sBoxingNo;

    /**
     * 판매리스트코드
     **/
    private String sSellInventoryNo;

    /**
     * 운송번호
     **/
    private String sWaybillNo;

    /**
     * 클레임신청여부
     **/
    private  String                sRequestClaimYn;

    /**
     * 도착일
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sArrivedDate;

    /**
     * 출고서일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sDeliveryInventoryDate;

    /**
     * 출고서번호
     **/

    private String sDeliveryInventoryNo;

    /**
     * 포장완벽여부
     **/
    private int sIsIntact;

    /**
     * 미배상원인
     **/
    private String sNoReparationReason;

    /**
     * 심사통과여부
     **/
    private String sIsPass;

    /**
     * 심사불통원인
     **/
    private String sNoPassReason;

      /**
     * 오더번호
     **/
    private String sOrderNo;

    /**
     * 부품번호
     **/
    private String sPartNo;

    /**
     * 부품명
     **/
    private String sPartNm;

    /**
     * 클레임유형
     **/
    private int sClaimantType;

    /**
     * 오전송부품번호
     **/
    private String sErrorPartNo;

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
     * @return the sClaimNo
     */
    public String getsClaimNo() {
        return sClaimNo;
    }

    /**
     * @param sClaimNo the sClaimNo to set
     */
    public void setsClaimNo(String sClaimNo) {
        this.sClaimNo = sClaimNo;
    }

    /**
     * @return the sClaimantNo
     */
    public String getsClaimantNo() {
        return sClaimantNo;
    }

    /**
     * @param sClaimantNo the sClaimantNo to set
     */
    public void setsClaimantNo(String sClaimantNo) {
        this.sClaimantNo = sClaimantNo;
    }

    /**
     * @return the sStatus
     */
    public int getsStatus() {
        return sStatus;
    }

    /**
     * @param sStatus the sStatus to set
     */
    public void setsStatus(int sStatus) {
        this.sStatus = sStatus;
    }

    /**
     * @return the sClaimantName
     */
    public String getsClaimantName() {
        return sClaimantName;
    }

    /**
     * @param sClaimantName the sClaimantName to set
     */
    public void setsClaimantName(String sClaimantName) {
        this.sClaimantName = sClaimantName;
    }

    /**
     * @return the sCreateTime
     */
    public Date getsCreateTime() {
        return sCreateTime;
    }

    /**
     * @param sCreateTime the sCreateTime to set
     */
    public void setsCreateTime(Date sCreateTime) {
        this.sCreateTime = sCreateTime;
    }

    /**
     * @return the sBoxingNo
     */
    public String getsBoxingNo() {
        return sBoxingNo;
    }

    /**
     * @param sBoxingNo the sBoxingNo to set
     */
    public void setsBoxingNo(String sBoxingNo) {
        this.sBoxingNo = sBoxingNo;
    }

    /**
     * @return the sSellInventoryNo
     */
    public String getsSellInventoryNo() {
        return sSellInventoryNo;
    }

    /**
     * @param sSellInventoryNo the sSellInventoryNo to set
     */
    public void setsSellInventoryNo(String sSellInventoryNo) {
        this.sSellInventoryNo = sSellInventoryNo;
    }

    /**
     * @return the sWaybillNo
     */
    public String getsWaybillNo() {
        return sWaybillNo;
    }

    /**
     * @param sWaybillNo the sWaybillNo to set
     */
    public void setsWaybillNo(String sWaybillNo) {
        this.sWaybillNo = sWaybillNo;
    }

    /**
     * @return the sArrivedDate
     */
    public Date getsArrivedDate() {
        return sArrivedDate;
    }

    /**
     * @param sArrivedDate the sArrivedDate to set
     */
    public void setsArrivedDate(Date sArrivedDate) {
        this.sArrivedDate = sArrivedDate;
    }

    /**
     * @return the sDeliveryInventoryDate
     */
    public Date getsDeliveryInventoryDate() {
        return sDeliveryInventoryDate;
    }

    /**
     * @param sDeliveryInventoryDate the sDeliveryInventoryDate to set
     */
    public void setsDeliveryInventoryDate(Date sDeliveryInventoryDate) {
        this.sDeliveryInventoryDate = sDeliveryInventoryDate;
    }

    /**
     * @return the sDeliveryInventoryNo
     */
    public String getsDeliveryInventoryNo() {
        return sDeliveryInventoryNo;
    }

    /**
     * @param sDeliveryInventoryNo the sDeliveryInventoryNo to set
     */
    public void setsDeliveryInventoryNo(String sDeliveryInventoryNo) {
        this.sDeliveryInventoryNo = sDeliveryInventoryNo;
    }

    /**
     * @return the sIsIntact
     */
    public int getsIsIntact() {
        return sIsIntact;
    }

    /**
     * @param sIsIntact the sIsIntact to set
     */
    public void setsIsIntact(int sIsIntact) {
        this.sIsIntact = sIsIntact;
    }

    /**
     * @return the sNoReparationReason
     */
    public String getsNoReparationReason() {
        return sNoReparationReason;
    }

    /**
     * @param sNoReparationReason the sNoReparationReason to set
     */
    public void setsNoReparationReason(String sNoReparationReason) {
        this.sNoReparationReason = sNoReparationReason;
    }

    /**
     * @return the sIsPass
     */
    public String getsIsPass() {
        return sIsPass;
    }

    /**
     * @param sIsPass the sIsPass to set
     */
    public void setsIsPass(String sIsPass) {
        this.sIsPass = sIsPass;
    }

    /**
     * @return the sNoPassReason
     */
    public String getsNoPassReason() {
        return sNoPassReason;
    }

    /**
     * @param sNoPassReason the sNoPassReason to set
     */
    public void setsNoPassReason(String sNoPassReason) {
        this.sNoPassReason = sNoPassReason;
    }

    /**
     * @return the sOrderNo
     */
    public String getsOrderNo() {
        return sOrderNo;
    }

    /**
     * @param sOrderNo the sOrderNo to set
     */
    public void setsOrderNo(String sOrderNo) {
        this.sOrderNo = sOrderNo;
    }

    /**
     * @return the sPartNo
     */
    public String getsPartNo() {
        return sPartNo;
    }

    /**
     * @param sPartNo the sPartNo to set
     */
    public void setsPartNo(String sPartNo) {
        this.sPartNo = sPartNo;
    }

    /**
     * @return the sPartNm
     */
    public String getsPartNm() {
        return sPartNm;
    }

    /**
     * @param sPartNm the sPartNm to set
     */
    public void setsPartNm(String sPartNm) {
        this.sPartNm = sPartNm;
    }

    /**
     * @return the sClaimantType
     */
    public int getsClaimantType() {
        return sClaimantType;
    }

    /**
     * @param sClaimantType the sClaimantType to set
     */
    public void setsClaimantType(int sClaimantType) {
        this.sClaimantType = sClaimantType;
    }

    /**
     * @return the sErrorPartNo
     */
    public String getsErrorPartNo() {
        return sErrorPartNo;
    }

    /**
     * @param sErrorPartNo the sErrorPartNo to set
     */
    public void setsErrorPartNo(String sErrorPartNo) {
        this.sErrorPartNo = sErrorPartNo;
    }

    /**
     * @return the sCreateTimeFr
     */
    public Date getsCreateTimeFr() {
        return sCreateTimeFr;
    }

    /**
     * @param sCreateTimeFr the sCreateTimeFr to set
     */
    public void setsCreateTimeFr(Date sCreateTimeFr) {
        this.sCreateTimeFr = sCreateTimeFr;
    }

    /**
     * @return the sCreateTimeTo
     */
    public Date getsCreateTimeTo() {
        return sCreateTimeTo;
    }

    /**
     * @param sCreateTimeTo the sCreateTimeTo to set
     */
    public void setsCreateTimeTo(Date sCreateTimeTo) {
        this.sCreateTimeTo = sCreateTimeTo;
    }

    /**
     * @return the sRequestClaimYn
     */
    public String getsRequestClaimYn() {
        return sRequestClaimYn;
    }

    /**
     * @param sRequestClaimYn the sRequestClaimYn to set
     */
    public void setsRequestClaimYn(String sRequestClaimYn) {
        this.sRequestClaimYn = sRequestClaimYn;
    }


}
