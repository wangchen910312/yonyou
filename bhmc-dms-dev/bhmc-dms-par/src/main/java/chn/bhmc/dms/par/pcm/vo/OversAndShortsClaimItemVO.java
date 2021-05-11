package chn.bhmc.dms.par.pcm.vo;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ClaimVO.java
 * @Description : ClaimVO.class
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


public class OversAndShortsClaimItemVO extends BaseVO{

     /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -2828539812288053295L;

    /**
     * 딜러코드
     **/
    private String dlrCd;

    /**
     * DMS클레임번호
     **/
    private String claimNo;

    /**
     * 클레임라인번호
     **/
    private int claimLine;

    /**
     * 오더번호
     **/
    private String orderNo;

    /**
     * 부품번호
     **/
    private String partNo;

    /**
     * 클레임유형
     **/
    private int claimantType;

    /**
     * 오전송부품번호
     **/
    private String errorPartNo;

    /**
     * 발주수량
     **/
    private Double orderNum;

    /**
     * 실제도착수량
     **/
    private Double realNum;

    /**
     * 클레임수량
     **/
    private Double claimantNum;

    /**
     * 클레임금액
     **/
    private Double claimantAmount;

    /**
     * 부품단가
     **/
    private Double partPrice;


    /**
     * 수불문서년월
     **/
    private String mvtDocYyMm;

    /**
     * 수불문서번호
     **/
    private String mvtDocNo;

    /**
     * 수불문서라인번호
     **/
    private int mvtDocLineNo;

    /**
     * 조작
     **/
    private String control;

    /**
     * 수불문서라인번호
     **/
    private int isPass;

    /**
     * 수불문서라인번호
     **/
    private int noPassReason;

    /**
     * 수불문서라인번호
     **/
    private int siteVerifyResult;

    /**
     * 수불문서라인번호
     **/
    private int siteHandleView;

    /**
     * 수불문서라인번호
     **/
    private int handleMode;

    /**
     * 수불문서라인번호
     **/
    private Double bmpPaymentAmount;

    /**
     * 수불문서라인번호
     **/
    private int noReparationReason;

    /**
     * 수불문서라인번호
     **/
    private int isAccountArrived;

    /**
     * 수불문서라인번호
     **/
    private int followTrack;

    /**
     * 수불문서라인번호
     **/
    private String respDetermin;

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
     * @return the claimNo
     */
    public String getClaimNo() {
        return claimNo;
    }

    /**
     * @param claimNo the claimNo to set
     */
    public void setClaimNo(String claimNo) {
        this.claimNo = claimNo;
    }

    /**
     * @return the claimLine
     */
    public int getClaimLine() {
        return claimLine;
    }

    /**
     * @param claimLine the claimLine to set
     */
    public void setClaimLine(int claimLine) {
        this.claimLine = claimLine;
    }

    /**
     * @return the orderNo
     */
    public String getOrderNo() {
        return orderNo;
    }

    /**
     * @param orderNo the orderNo to set
     */
    public void setOrderNo(String orderNo) {
        this.orderNo = orderNo;
    }

    /**
     * @return the partNo
     */
    public String getPartNo() {
        return partNo;
    }

    /**
     * @param partNo the partNo to set
     */
    public void setPartNo(String partNo) {
        this.partNo = partNo;
    }

    /**
     * @return the claimantType
     */
    public int getClaimantType() {
        return claimantType;
    }

    /**
     * @param claimantType the claimantType to set
     */
    public void setClaimantType(int claimantType) {
        this.claimantType = claimantType;
    }

    /**
     * @return the errorPartNo
     */
    public String getErrorPartNo() {
        return errorPartNo;
    }

    /**
     * @param errorPartNo the errorPartNo to set
     */
    public void setErrorPartNo(String errorPartNo) {
        this.errorPartNo = errorPartNo;
    }

    /**
     * @return the orderNum
     */
    public Double getOrderNum() {
        return orderNum;
    }

    /**
     * @param orderNum the orderNum to set
     */
    public void setOrderNum(Double orderNum) {
        this.orderNum = orderNum;
    }

    /**
     * @return the realNum
     */
    public Double getRealNum() {
        return realNum;
    }

    /**
     * @param realNum the realNum to set
     */
    public void setRealNum(Double realNum) {
        this.realNum = realNum;
    }

    /**
     * @return the claimantNum
     */
    public Double getClaimantNum() {
        return claimantNum;
    }

    /**
     * @param claimantNum the claimantNum to set
     */
    public void setClaimantNum(Double claimantNum) {
        this.claimantNum = claimantNum;
    }

    /**
     * @return the claimantAmount
     */
    public Double getClaimantAmount() {
        return claimantAmount;
    }

    /**
     * @param claimantAmount the claimantAmount to set
     */
    public void setClaimantAmount(Double claimantAmount) {
        this.claimantAmount = claimantAmount;
    }

    /**
     * @return the partPrice
     */
    public Double getPartPrice() {
        return partPrice;
    }

    /**
     * @param partPrice the partPrice to set
     */
    public void setPartPrice(Double partPrice) {
        this.partPrice = partPrice;
    }

    /**
     * @return the mvtDocYyMm
     */
    public String getMvtDocYyMm() {
        return mvtDocYyMm;
    }

    /**
     * @param mvtDocYyMm the mvtDocYyMm to set
     */
    public void setMvtDocYyMm(String mvtDocYyMm) {
        this.mvtDocYyMm = mvtDocYyMm;
    }

    /**
     * @return the mvtDocNo
     */
    public String getMvtDocNo() {
        return mvtDocNo;
    }

    /**
     * @param mvtDocNo the mvtDocNo to set
     */
    public void setMvtDocNo(String mvtDocNo) {
        this.mvtDocNo = mvtDocNo;
    }

    /**
     * @return the mvtDocLineNo
     */
    public int getMvtDocLineNo() {
        return mvtDocLineNo;
    }

    /**
     * @param mvtDocLineNo the mvtDocLineNo to set
     */
    public void setMvtDocLineNo(int mvtDocLineNo) {
        this.mvtDocLineNo = mvtDocLineNo;
    }

    /**
     * @return the control
     */
    public String getControl() {
        return control;
    }

    /**
     * @param control the control to set
     */
    public void setControl(String control) {
        this.control = control;
    }

    /**
     * @return the isPass
     */
    public int getIsPass() {
        return isPass;
    }

    /**
     * @param isPass the isPass to set
     */
    public void setIsPass(int isPass) {
        this.isPass = isPass;
    }

    /**
     * @return the noPassReason
     */
    public int getNoPassReason() {
        return noPassReason;
    }

    /**
     * @param noPassReason the noPassReason to set
     */
    public void setNoPassReason(int noPassReason) {
        this.noPassReason = noPassReason;
    }

    /**
     * @return the siteVerifyResult
     */
    public int getSiteVerifyResult() {
        return siteVerifyResult;
    }

    /**
     * @param siteVerifyResult the siteVerifyResult to set
     */
    public void setSiteVerifyResult(int siteVerifyResult) {
        this.siteVerifyResult = siteVerifyResult;
    }

    /**
     * @return the siteHandleView
     */
    public int getSiteHandleView() {
        return siteHandleView;
    }

    /**
     * @param siteHandleView the siteHandleView to set
     */
    public void setSiteHandleView(int siteHandleView) {
        this.siteHandleView = siteHandleView;
    }

    /**
     * @return the handleMode
     */
    public int getHandleMode() {
        return handleMode;
    }

    /**
     * @param handleMode the handleMode to set
     */
    public void setHandleMode(int handleMode) {
        this.handleMode = handleMode;
    }

    /**
     * @return the bmpPaymentAmount
     */
    public Double getBmpPaymentAmount() {
        return bmpPaymentAmount;
    }

    /**
     * @param bmpPaymentAmount the bmpPaymentAmount to set
     */
    public void setBmpPaymentAmount(Double bmpPaymentAmount) {
        this.bmpPaymentAmount = bmpPaymentAmount;
    }

    /**
     * @return the noReparationReason
     */
    public int getNoReparationReason() {
        return noReparationReason;
    }

    /**
     * @param noReparationReason the noReparationReason to set
     */
    public void setNoReparationReason(int noReparationReason) {
        this.noReparationReason = noReparationReason;
    }

    /**
     * @return the isAccountArrived
     */
    public int getIsAccountArrived() {
        return isAccountArrived;
    }

    /**
     * @param isAccountArrived the isAccountArrived to set
     */
    public void setIsAccountArrived(int isAccountArrived) {
        this.isAccountArrived = isAccountArrived;
    }

    /**
     * @return the followTrack
     */
    public int getFollowTrack() {
        return followTrack;
    }

    /**
     * @param followTrack the followTrack to set
     */
    public void setFollowTrack(int followTrack) {
        this.followTrack = followTrack;
    }

    /**
     * @return the respDetermin
     */
    public String getRespDetermin() {
        return respDetermin;
    }

    /**
     * @param respDetermin the respDetermin to set
     */
    public void setRespDetermin(String respDetermin) {
        this.respDetermin = respDetermin;
    }
}
