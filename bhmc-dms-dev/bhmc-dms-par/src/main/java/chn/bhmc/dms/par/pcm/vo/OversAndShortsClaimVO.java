package chn.bhmc.dms.par.pcm.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : OversAndShortsClaimVO.java
 * @Description : OversAndShortsClaimVO.class
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

public class OversAndShortsClaimVO extends BaseVO{

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
     * 딜러코드
     **/
    private String dlrNm;

    /**
     * DMS클레임번호
     **/
    private String claimNo;

    /**
     * BMP클레임코드
     **/
    private String claimantNo;

    /**
     * 상태
     **/
    private int status;

    /**
     * 상태명
     **/
    private String statusNm;

    /**
     * 클레임배상
     **/
    private String claimantName;

    /**
     * 신고일
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date createTime;

    /**
     * 신고일
     **/
    private String createTimeChar;

    /**
     * 송장문서번호
     **/
    private String boxingNo;

    /**
     * 판매리스트코드
     **/
    private String sellInventoryNo;

    /**
     * 운송번호
     **/
    private String waybillNo;

    /**
     * 도착일
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date arrivedDate;

    /**
     * 도착일
     **/
    private String arrivedDateChar;

    /**
     * 출고서일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date deliveryInventoryDate;

    /**
     * 출고서일자
     **/
    private String   deliveryInventoryDateChar;

    /**
     * 출고서번호
     **/
    private String deliveryInventoryNo;

    /**
     * 포장완벽여부
     **/
    private int isIntact;

    /**
     * 첨부파일
     **/
    private String attachmentFileUrl;

    /**
     * 첨부파일명
     **/
    private String attachmentFileName;

    /**
     * 첨부파일데이터
     **/
    private byte[] atchFileCont;

    /**
     * 첨부파일명
     **/
    private String attachmentName;

    /**
     * 첨부파일URL
     **/
    private String attachmentUrl;

    /**
     * 클레임총금액
     **/
    private Double claimantTotalAmount;

    /**
     * BMP배상금액
     **/
    private Double bmpPaymentAmount;

    /**
     * 미배상원인
     **/
    private String noReparationReason;

    /**
     * 심사통과여부
     **/
    private String isPass;

    /**
     * 심사불통원인
     **/
    private String noPassReason;

    /**
     * 선불금계좌에배상금이입금
     **/
    private String isAccountArrived;

    /**
     * 상세서술
     **/
    private String describe;

    /**
     * 조작
     **/
    private String control;

    /**
     * 오더번호
     **/
    private String orderNo;

    /**
     * 포장완벽여부
     **/
    private int auditType;

    /**
     * 포장완벽여부
     **/
    private int auditUserId;

    /**
     * 조작
     **/
    private String auditUserName;


    /**
     * 출고서일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date auditTime;

    /**
     * 포장완벽여부
     **/
    private int confirmType;

    /**
     * 포장완벽여부
     **/
    private int confirmUserId;

    /**
     * 조작
     **/
    private String confirmUserName;


    /**
     * 출고서일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date confirmTime;

    /**
     * 포장완벽여부
     **/
    private int handleType;

    /**
     * 포장완벽여부
     **/
    private int handleUserId;

    /**
     * 조작
     **/
    private String handleUserName;

    /**
     * 출고서일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date handleTime;

    /**
     * 포장완벽여부
     **/
    private int accountTrackType;

    /**
     * 포장완벽여부
     **/
    private int accountUserId;

    /**
     * 조작
     **/
    private String accountUserName;


    /**
     * 출고서일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date accountTime;

    /**
     * 포장완벽여부
     **/
    private int followTrackType;

    /**
     * 포장완벽여부
     **/
    private int followUserId;

    /**
     * 조작
     **/
    private String followUserName;

    /**
     * 출고서일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date followTime;

    /**
     * 품목건수
     **/
    private int itemCnt;

    /**
     * 품목수량(클레임수량)
     **/
    private Double itemQty;

    /**
     * 클레임총금액(입고단가기준)
     **/
    private Double invcClaimAmt;

    /**
     * 저장 성공실패 여부
     **/
    private boolean resultYn;

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
     * @return the claimantNo
     */
    public String getClaimantNo() {
        return claimantNo;
    }

    /**
     * @param claimantNo the claimantNo to set
     */
    public void setClaimantNo(String claimantNo) {
        this.claimantNo = claimantNo;
    }

    /**
     * @return the status
     */
    public int getStatus() {
        return status;
    }

    /**
     * @param status the status to set
     */
    public void setStatus(int status) {
        this.status = status;
    }

    /**
     * @return the claimantName
     */
    public String getClaimantName() {
        return claimantName;
    }

    /**
     * @param claimantName the claimantName to set
     */
    public void setClaimantName(String claimantName) {
        this.claimantName = claimantName;
    }

    /**
     * @return the createTime
     */
    public Date getCreateTime() {
        return createTime;
    }

    /**
     * @param createTime the createTime to set
     */
    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    /**
     * @return the boxingNo
     */
    public String getBoxingNo() {
        return boxingNo;
    }

    /**
     * @param boxingNo the boxingNo to set
     */
    public void setBoxingNo(String boxingNo) {
        this.boxingNo = boxingNo;
    }

    /**
     * @return the sellInventoryNo
     */
    public String getSellInventoryNo() {
        return sellInventoryNo;
    }

    /**
     * @param sellInventoryNo the sellInventoryNo to set
     */
    public void setSellInventoryNo(String sellInventoryNo) {
        this.sellInventoryNo = sellInventoryNo;
    }

    /**
     * @return the waybillNo
     */
    public String getWaybillNo() {
        return waybillNo;
    }

    /**
     * @param waybillNo the waybillNo to set
     */
    public void setWaybillNo(String waybillNo) {
        this.waybillNo = waybillNo;
    }

    /**
     * @return the arrivedDate
     */
    public Date getArrivedDate() {
        return arrivedDate;
    }

    /**
     * @param arrivedDate the arrivedDate to set
     */
    public void setArrivedDate(Date arrivedDate) {
        this.arrivedDate = arrivedDate;
    }

    /**
     * @return the deliveryInventoryDate
     */
    public Date getDeliveryInventoryDate() {
        return deliveryInventoryDate;
    }

    /**
     * @param deliveryInventoryDate the deliveryInventoryDate to set
     */
    public void setDeliveryInventoryDate(Date deliveryInventoryDate) {
        this.deliveryInventoryDate = deliveryInventoryDate;
    }

    /**
     * @return the deliveryInventoryNo
     */
    public String getDeliveryInventoryNo() {
        return deliveryInventoryNo;
    }

    /**
     * @param deliveryInventoryNo the deliveryInventoryNo to set
     */
    public void setDeliveryInventoryNo(String deliveryInventoryNo) {
        this.deliveryInventoryNo = deliveryInventoryNo;
    }

    /**
     * @return the isIntact
     */
    public int getIsIntact() {
        return isIntact;
    }

    /**
     * @param isIntact the isIntact to set
     */
    public void setIsIntact(int isIntact) {
        this.isIntact = isIntact;
    }

    /**
     * @return the attachmentName
     */
    public String getAttachmentName() {
        return attachmentName;
    }

    /**
     * @param attachmentName the attachmentName to set
     */
    public void setAttachmentName(String attachmentName) {
        this.attachmentName = attachmentName;
    }

    /**
     * @return the attachmentUrl
     */
    public String getAttachmentUrl() {
        return attachmentUrl;
    }

    /**
     * @param attachmentUrl the attachmentUrl to set
     */
    public void setAttachmentUrl(String attachmentUrl) {
        this.attachmentUrl = attachmentUrl;
    }

    /**
     * @return the claimantTotalAmount
     */
    public Double getClaimantTotalAmount() {
        return claimantTotalAmount;
    }

    /**
     * @param claimantTotalAmount the claimantTotalAmount to set
     */
    public void setClaimantTotalAmount(Double claimantTotalAmount) {
        this.claimantTotalAmount = claimantTotalAmount;
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
    public String getNoReparationReason() {
        return noReparationReason;
    }

    /**
     * @param noReparationReason the noReparationReason to set
     */
    public void setNoReparationReason(String noReparationReason) {
        this.noReparationReason = noReparationReason;
    }

    /**
     * @return the isPass
     */
    public String getIsPass() {
        return isPass;
    }

    /**
     * @param isPass the isPass to set
     */
    public void setIsPass(String isPass) {
        this.isPass = isPass;
    }

    /**
     * @return the noPassReason
     */
    public String getNoPassReason() {
        return noPassReason;
    }

    /**
     * @param noPassReason the noPassReason to set
     */
    public void setNoPassReason(String noPassReason) {
        this.noPassReason = noPassReason;
    }

    /**
     * @return the isAccountArrived
     */
    public String getIsAccountArrived() {
        return isAccountArrived;
    }

    /**
     * @param isAccountArrived the isAccountArrived to set
     */
    public void setIsAccountArrived(String isAccountArrived) {
        this.isAccountArrived = isAccountArrived;
    }

    /**
     * @return the describe
     */
    public String getDescribe() {
        return describe;
    }

    /**
     * @param describe the describe to set
     */
    public void setDescribe(String describe) {
        this.describe = describe;
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
     * @return the attachmentFileUrl
     */
    public String getAttachmentFileUrl() {
        return attachmentFileUrl;
    }

    /**
     * @param attachmentFileUrl the attachmentFileUrl to set
     */
    public void setAttachmentFileUrl(String attachmentFileUrl) {
        this.attachmentFileUrl = attachmentFileUrl;
    }

    /**
     * @return the attachmentFileName
     */
    public String getAttachmentFileName() {
        return attachmentFileName;
    }

    /**
     * @param attachmentFileName the attachmentFileName to set
     */
    public void setAttachmentFileName(String attachmentFileName) {
        this.attachmentFileName = attachmentFileName;
    }

    /**
     * @return the atchFileCont
     */
    public byte[] getAtchFileCont() {
        return atchFileCont;
    }

    /**
     * @param atchFileCont the atchFileCont to set
     */
    public void setAtchFileCont(byte[] atchFileCont) {
        this.atchFileCont = atchFileCont;
    }

    /**
     * @return the createTimeChar
     */
    public String getCreateTimeChar() {
        return createTimeChar;
    }

    /**
     * @param createTimeChar the createTimeChar to set
     */
    public void setCreateTimeChar(String createTimeChar) {
        this.createTimeChar = createTimeChar;
    }

    /**
     * @return the arrivedDateChar
     */
    public String getArrivedDateChar() {
        return arrivedDateChar;
    }

    /**
     * @param arrivedDateChar the arrivedDateChar to set
     */
    public void setArrivedDateChar(String arrivedDateChar) {
        this.arrivedDateChar = arrivedDateChar;
    }

    /**
     * @return the deliveryInventoryDateChar
     */
    public String getDeliveryInventoryDateChar() {
        return deliveryInventoryDateChar;
    }

    /**
     * @param deliveryInventoryDateChar the deliveryInventoryDateChar to set
     */
    public void setDeliveryInventoryDateChar(String deliveryInventoryDateChar) {
        this.deliveryInventoryDateChar = deliveryInventoryDateChar;
    }

    /**
     * @return the resultYn
     */
    public boolean isResultYn() {
        return resultYn;
    }

    /**
     * @param resultYn the resultYn to set
     */
    public void setResultYn(boolean resultYn) {
        this.resultYn = resultYn;
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
     * @return the auditType
     */
    public int getAuditType() {
        return auditType;
    }

    /**
     * @param auditType the auditType to set
     */
    public void setAuditType(int auditType) {
        this.auditType = auditType;
    }

    /**
     * @return the auditUserId
     */
    public int getAuditUserId() {
        return auditUserId;
    }

    /**
     * @param auditUserId the auditUserId to set
     */
    public void setAuditUserId(int auditUserId) {
        this.auditUserId = auditUserId;
    }

    /**
     * @return the auditUserName
     */
    public String getAuditUserName() {
        return auditUserName;
    }

    /**
     * @param auditUserName the auditUserName to set
     */
    public void setAuditUserName(String auditUserName) {
        this.auditUserName = auditUserName;
    }

    /**
     * @return the auditTime
     */
    public Date getAuditTime() {
        return auditTime;
    }

    /**
     * @param auditTime the auditTime to set
     */
    public void setAuditTime(Date auditTime) {
        this.auditTime = auditTime;
    }

    /**
     * @return the confirmType
     */
    public int getConfirmType() {
        return confirmType;
    }

    /**
     * @param confirmType the confirmType to set
     */
    public void setConfirmType(int confirmType) {
        this.confirmType = confirmType;
    }

    /**
     * @return the confirmUserId
     */
    public int getConfirmUserId() {
        return confirmUserId;
    }

    /**
     * @param confirmUserId the confirmUserId to set
     */
    public void setConfirmUserId(int confirmUserId) {
        this.confirmUserId = confirmUserId;
    }

    /**
     * @return the confirmUserName
     */
    public String getConfirmUserName() {
        return confirmUserName;
    }

    /**
     * @param confirmUserName the confirmUserName to set
     */
    public void setConfirmUserName(String confirmUserName) {
        this.confirmUserName = confirmUserName;
    }

    /**
     * @return the confirmTime
     */
    public Date getConfirmTime() {
        return confirmTime;
    }

    /**
     * @param confirmTime the confirmTime to set
     */
    public void setConfirmTime(Date confirmTime) {
        this.confirmTime = confirmTime;
    }

    /**
     * @return the handleType
     */
    public int getHandleType() {
        return handleType;
    }

    /**
     * @param handleType the handleType to set
     */
    public void setHandleType(int handleType) {
        this.handleType = handleType;
    }

    /**
     * @return the handleUserId
     */
    public int getHandleUserId() {
        return handleUserId;
    }

    /**
     * @param handleUserId the handleUserId to set
     */
    public void setHandleUserId(int handleUserId) {
        this.handleUserId = handleUserId;
    }

    /**
     * @return the handleUserName
     */
    public String getHandleUserName() {
        return handleUserName;
    }

    /**
     * @param handleUserName the handleUserName to set
     */
    public void setHandleUserName(String handleUserName) {
        this.handleUserName = handleUserName;
    }

    /**
     * @return the handleTime
     */
    public Date getHandleTime() {
        return handleTime;
    }

    /**
     * @param handleTime the handleTime to set
     */
    public void setHandleTime(Date handleTime) {
        this.handleTime = handleTime;
    }

    /**
     * @return the accountTrackType
     */
    public int getAccountTrackType() {
        return accountTrackType;
    }

    /**
     * @param accountTrackType the accountTrackType to set
     */
    public void setAccountTrackType(int accountTrackType) {
        this.accountTrackType = accountTrackType;
    }

    /**
     * @return the accountUserId
     */
    public int getAccountUserId() {
        return accountUserId;
    }

    /**
     * @param accountUserId the accountUserId to set
     */
    public void setAccountUserId(int accountUserId) {
        this.accountUserId = accountUserId;
    }

    /**
     * @return the accountUserName
     */
    public String getAccountUserName() {
        return accountUserName;
    }

    /**
     * @param accountUserName the accountUserName to set
     */
    public void setAccountUserName(String accountUserName) {
        this.accountUserName = accountUserName;
    }

    /**
     * @return the accountTime
     */
    public Date getAccountTime() {
        return accountTime;
    }

    /**
     * @param accountTime the accountTime to set
     */
    public void setAccountTime(Date accountTime) {
        this.accountTime = accountTime;
    }

    /**
     * @return the followTrackType
     */
    public int getFollowTrackType() {
        return followTrackType;
    }

    /**
     * @param followTrackType the followTrackType to set
     */
    public void setFollowTrackType(int followTrackType) {
        this.followTrackType = followTrackType;
    }

    /**
     * @return the followUserId
     */
    public int getFollowUserId() {
        return followUserId;
    }

    /**
     * @param followUserId the followUserId to set
     */
    public void setFollowUserId(int followUserId) {
        this.followUserId = followUserId;
    }

    /**
     * @return the followUserName
     */
    public String getFollowUserName() {
        return followUserName;
    }

    /**
     * @param followUserName the followUserName to set
     */
    public void setFollowUserName(String followUserName) {
        this.followUserName = followUserName;
    }

    /**
     * @return the followTime
     */
    public Date getFollowTime() {
        return followTime;
    }

    /**
     * @param followTime the followTime to set
     */
    public void setFollowTime(Date followTime) {
        this.followTime = followTime;
    }

    /**
     * @return the itemCnt
     */
    public int getItemCnt() {
        return itemCnt;
    }

    /**
     * @param itemCnt the itemCnt to set
     */
    public void setItemCnt(int itemCnt) {
        this.itemCnt = itemCnt;
    }

    /**
     * @return the itemQty
     */
    public Double getItemQty() {
        return itemQty;
    }

    /**
     * @param itemQty the itemQty to set
     */
    public void setItemQty(Double itemQty) {
        this.itemQty = itemQty;
    }

    /**
     * @return the invcClaimAmt
     */
    public Double getInvcClaimAmt() {
        return invcClaimAmt;
    }

    /**
     * @param invcClaimAmt the invcClaimAmt to set
     */
    public void setInvcClaimAmt(Double invcClaimAmt) {
        this.invcClaimAmt = invcClaimAmt;
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
     * @return the statusNm
     */
    public String getStatusNm() {
        return statusNm;
    }

    /**
     * @param statusNm the statusNm to set
     */
    public void setStatusNm(String statusNm) {
        this.statusNm = statusNm;
    }

}
