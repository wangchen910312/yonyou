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


public class QualityClaimVO extends BaseVO{


     /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -2828539812288053295L;

    /**
     * 딜러코드
     **/
    private  String                dlrCd;

    /**
     * 부품명
     **/
    //PART_NM
    private  String                partNm;
    
    /**
     * 부품명(영문)
     **/
    //PART_EN_NM
    private  String                partEnNm;
    
    /**
     * 부대비용 설명ㄴ
     **/
    //SURCHARGE_EXPLAIN
    private  String                surchargeExplain;

    /**
     * DMS클레임번호
     **/
    private  String                claimNo;

    /**
     * BMP클레임번호
     **/
    //CLAIM_CODE

    private  String                claimCode;

    /**
     * 오더번호
     **/
    //ORDER_NO

    private  String                orderNo;

    /**
     * 오더라인번호
     **/
    //ORDER_LN

    private  String                orderLn;

    /**
     * 부품번호
     **/
    //PART_NO

    private  String                partNo;

    /**
     * 도착일
     **/
    //ARRIVAL_DATE
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date                  arrivalDate;

    /**
     * 도착일
     **/
    //ARRIVAL_DATE
    private  String                  arrivalDateChar;

    /**
     * VIN코드
     **/
    //VIN

    private  String                vin;

    /**
     * 엔진실린더
     **/
    //ENGINE_CYLINDER

    private  String                engineCylinder;

    /**
     * 클레임수량
     **/
    //CLAIM_NUM

    private  Double                claimNum;

    /**
     * 문제발견일
     **/
    //PROBLEM_DATE
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date                  problemDate;

    /**
     * 문제발견일
     **/
    //PROBLEM_DATE
    private  String                  problemDateChar;

    /**
     * 신청일자
     **/
    //CREATE_TIME
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date                  createTime;

    /**
     * 차형코드
     **/
    //CAR_MODEL

    private  int                   carModel;
    
    /**
     * 차형코드명
     **/
    //CAR_MODEL_NM
    
    private  String                   carModelNm;

    /**
     * 클레임유형
     **/
    //CLAIM_TYPE

    private  int                   claimType;
    
    /**
     * 클레임유형명
     **/
    //CLAIM_TYPE_NM
    
    private  String                   claimTypeNm;

    /**
     * 클레임방식
     **/
    //DEALER_CLAIM_WAY

    private  int                   dealerClaimWay;
    
    /**
     * 클레임방식명
     **/
    //DEALER_CLAIM_WAY_NM
    
    private  String                   dealerClaimWayNm;

    /**
     * 발주창고
     **/
    //PRC_CODE

    private  int                   prcCode;
    
    /**
     * 발주창고명
     **/
    //PRC_CODE_NM
    
    private  String                   prcCodeNm;

    /**
     * 배송방식
     **/
    //DELIVERY_TYPE

    private  int                   deliveryType;
    
    /**
     * 배송방식명
     **/
    //DELIVERY_TYPE_NM
    
    private  String                   deliveryTypeNm;

    /**
     * 화물송장코드
     **/
    //TRANSPORT_NO

    private  String                transportNo;

    /**
     * 화물송장비고
     **/
    //DELIVERY_REMARK

    private  String                deliveryRemark;

    /**
     * 상세묘사
     **/
    //DESCRIPTION

    private  String                description;

    /**
     * 부품종이박스포장
     **/
    //IS_INDIVIDUAL_WRAPPED

    private  String                isIndividualWrapped;

    /**
     * 종이박스포장온전함
     **/
    //IS_PACKING_SOUND

    private  String                isPackingSound;

    /**
     * 포장내깨진조각있음
     **/
    //HAS_PART_FRAGMENT

    private  String                hasPartFragment;

    /**
     * 종이박스가AD/SQ에있음
     **/
    //HAS_OUTER_WRAPPER

    private  String                hasOuterWrapper;

    /**
     * SD/SQ박스온전
     **/
    //IS_OUTER_PACKING_SOUND

    private  String                isOuterPackingSound;

    /**
     * 부속품(태그)
     **/
    //TAG_FILE_URL

    private  String                tagFileUrl;

    /**
     * 부속품(태그)명
     **/
    //TAG_FILE_NAME

    private  String                tagFileName;

    /**
     * 부속품(태그)
     **/
    //TAG_FILE_DATA

    private  byte[]                 tagFileDataCont;

    /**
     * 부속품(부품)
     **/
    //PART_FILE_URL

    private  String                partFileUrl;

    /**
     * 부속품(부품)명
     **/
    //PART_FILE_NAME

    private  String                partFileName;

    /**
     * 부속품(부품)
     **/
    //PAR_FILE_DATA_CONT

    private  byte[]                 parFileDataCont;

    /**
     * 부속품(포장)
     **/
    //PACK_FILE_URL

    private  String                packFileUrl;


    /**
     * 부속품(포장)명
     **/
    //PACK_FILE_NAME

    private  String                packFileName;

    /**
     * 부속품(포장)
     **/
    //PACK_FILE

    private  byte[]                 packFileDataCont;

    /**
     * 부품매니저
     **/
    //CLAIMANTS

    private  int                   claimants;

    /**
     * 클레임신고일
     **/
    //CLAIM_PERSON

    private  String                claimPerson;

    /**
     * 신고인연락처
     **/
    //TELEPHONE

    private  String                telephone;

    /**
     * 배상방식
     **/
    //COMPENSATION_WAY

    private  int                   compensationWay;
    
    /**
     * 배상방식명
     **/
    //COMPENSATION_WAY_NM
    
    private  String                   compensationWayNm;

    /**
     * 배상총금액세금포함
     **/
    //TOTAL_MONEY_TAX

    private  Double                totalMoneyTax;

    /**
     * 유형표기
     **/
    //CLAI_CATEGORY

    private  int                   claimCategory;
    
    /**
     * 유형표기명
     **/
    //CLAI_CATEGORY_NM
    
    private  String                   claimCategoryNm;

    /**
     * 책임표기
     **/
    //RESPONSIBILITY

    private  int                   responsibility;
    
    /**
     * 책임표기명
     **/
    //RESPONSIBILITY_NM
    
    private  String                   responsibilityNm;

    /**
     * 처리상태
     **/
    //STATUS

    private  String                status;

    /**
     * 에러메세지
     **/
    //ERROR_MESSAGE

    private  String                errorMessage;

    /**
     * 배상년월
     **/
    //DEAL_DATE
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date                  dealDate;

    /**
     * 배상년월
     **/
    //DEAL_DATE
    private  String                  dealDateChar;

    /**
     * 배상표기
     **/
    //DEAL_MARK

    private  String                dealMark;

    /**
     * 클레임건처리
     **/
    //WORN_DEAL

    private  int                   wornDeal;
    
    /**
     * 클레임건처리명
     **/
    //WORN_DEAL_NM
    
    private  String                   wornDealNm;

    /**
     * 클레임건상태
     **/
    //WORN_STATUS

    private  String                wornStatus;

    /**
     * 탁송여부
     **/
    //IS_CHECK

    private  String                isCheck;

    /**
     * 도착여부
     **/
    //HAS_ARRIVED

    private  String                hasArrived;

    /**
     * 클레임건도착수량
     **/
    //WORN_ARRIVAL_NUM

    private  int                   wornArrivalNum;

    /**
     * 변상수령증
     **/
    //HAS_SUBMIT

    private  String                hasSubmit;

    /**
     * 화물송장코드회수
     **/
    //RECLAIM_ORDER

    private  String                reclaimOrder;

    /**
     * 영수증코드
     **/
    //BILL_NO

    private  String                billNo;

    /**
     * 공급상코드
     **/
    //SUPPLIER_CODE

    private  String                supplierCode;

    /**
     * 배상여부
     **/
    //IS_COMPENSATION

    private  String                isCompensation;

    /**
     * 서큘레이션번호
     **/
    //CIRCULATION_NO

    private  String                circulationNo;

    /**
     * 판매망가격
     **/
    //SHOP_PRICE

    private  Double                shopPrice;

    /**
     * 총판매금액
     **/
    //TOTAL_PRICE

    private  Double                totalPrice;

    /**
     * 부대금액
     **/
    //SURCHARGE

    private  Double                surcharge;

    /**
     * 배상율
     **/
    //PROPORTION

    private  Double                proportion;

    /**
     * 세금율
     **/
    //TAX

    private  Double                tax;

    /**
     * 배부율
     **/
    //ORPTION_RATE_DEALER

    private  Double                orptionRateDealer;

    /**
     * 공임비용
     **/
    //LABOR_FEE

    private  Double                laborFee;

    /**
     * 외주비용
     **/
    //OUT_FEE

    private  Double                outFee;

    /**
     * 배상총금액
     **/
    //TOTAL_MONEY

    private  Double                totalMoney;

    /**
     * 배상비고
     **/
    //REMARK

    private  String                remark;

    /**
     * 보완자료
     **/
    //ADDED

    private  String                added;

    /**
     * 처리담당
     **/
    //BMP_DEAL_CHIEF

    private  int                   bmpDealChief;

    /**
     * 판정일
     **/
    //DECIDE_DATE
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date                  decideDate;

    /**
     * 판정일
     **/
    //DECIDE_DATE
    private  String                  decideDateChar;

    /**
     * 수불문서년월
     **/
    //MVT_DOC_YY_MM

    private  String                mvtDocYyMm;

    /**
     * 수불문서번호
     **/
    //MVT_DOC_NO

    private  String                mvtDocNo;

    /**
     * 수불문서라인번호
     **/
    //MVT_DOC_LINE_NO

    private  int                   mvtDocLineNo;

    /**
     * 저장 성공실패 여부
     **/

    private  boolean          resultYn;

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
     * @return the partNm
     */
    public String getPartNm() {
        return partNm;
    }

    /**
     * @param partNm the partNm to set
     */
    public void setPartNm(String partNm) {
        this.partNm = partNm;
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
     * @return the claimCode
     */
    public String getClaimCode() {
        return claimCode;
    }

    /**
     * @param claimCode the claimCode to set
     */
    public void setClaimCode(String claimCode) {
        this.claimCode = claimCode;
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
     * @return the orderLn
     */
    public String getOrderLn() {
        return orderLn;
    }

    /**
     * @param orderLn the orderLn to set
     */
    public void setOrderLn(String orderLn) {
        this.orderLn = orderLn;
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
     * @return the arrivalDate
     */
    public Date getArrivalDate() {
        return arrivalDate;
    }

    /**
     * @param arrivalDate the arrivalDate to set
     */
    public void setArrivalDate(Date arrivalDate) {
        this.arrivalDate = arrivalDate;
    }

    /**
     * @return the vin
     */
    public String getVin() {
        return vin;
    }

    /**
     * @param vin the vin to set
     */
    public void setVin(String vin) {
        this.vin = vin;
    }

    /**
     * @return the engineCylinder
     */
    public String getEngineCylinder() {
        return engineCylinder;
    }

    /**
     * @param engineCylinder the engineCylinder to set
     */
    public void setEngineCylinder(String engineCylinder) {
        this.engineCylinder = engineCylinder;
    }

    /**
     * @return the claimNum
     */
    public Double getClaimNum() {
        return claimNum;
    }

    /**
     * @param claimNum the claimNum to set
     */
    public void setClaimNum(Double claimNum) {
        this.claimNum = claimNum;
    }

    /**
     * @return the problemDate
     */
    public Date getProblemDate() {
        return problemDate;
    }

    /**
     * @param problemDate the problemDate to set
     */
    public void setProblemDate(Date problemDate) {
        this.problemDate = problemDate;
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
     * @return the carModel
     */
    public int getCarModel() {
        return carModel;
    }

    /**
     * @param carModel the carModel to set
     */
    public void setCarModel(int carModel) {
        this.carModel = carModel;
    }

    /**
     * @return the claimType
     */
    public int getClaimType() {
        return claimType;
    }

    /**
     * @param claimType the claimType to set
     */
    public void setClaimType(int claimType) {
        this.claimType = claimType;
    }

    /**
     * @return the dealerClaimWay
     */
    public int getDealerClaimWay() {
        return dealerClaimWay;
    }

    /**
     * @param dealerClaimWay the dealerClaimWay to set
     */
    public void setDealerClaimWay(int dealerClaimWay) {
        this.dealerClaimWay = dealerClaimWay;
    }

    /**
     * @return the prcCode
     */
    public int getPrcCode() {
        return prcCode;
    }

    /**
     * @param prcCode the prcCode to set
     */
    public void setPrcCode(int prcCode) {
        this.prcCode = prcCode;
    }

    /**
     * @return the deliveryType
     */
    public int getDeliveryType() {
        return deliveryType;
    }

    /**
     * @param deliveryType the deliveryType to set
     */
    public void setDeliveryType(int deliveryType) {
        this.deliveryType = deliveryType;
    }

    /**
     * @return the transportNo
     */
    public String getTransportNo() {
        return transportNo;
    }

    /**
     * @param transportNo the transportNo to set
     */
    public void setTransportNo(String transportNo) {
        this.transportNo = transportNo;
    }

    /**
     * @return the deliveryRemark
     */
    public String getDeliveryRemark() {
        return deliveryRemark;
    }

    /**
     * @param deliveryRemark the deliveryRemark to set
     */
    public void setDeliveryRemark(String deliveryRemark) {
        this.deliveryRemark = deliveryRemark;
    }

    /**
     * @return the description
     */
    public String getDescription() {
        return description;
    }

    /**
     * @param description the description to set
     */
    public void setDescription(String description) {
        this.description = description;
    }

    /**
     * @return the isIndividualWrapped
     */
    public String getIsIndividualWrapped() {
        return isIndividualWrapped;
    }

    /**
     * @param isIndividualWrapped the isIndividualWrapped to set
     */
    public void setIsIndividualWrapped(String isIndividualWrapped) {
        this.isIndividualWrapped = isIndividualWrapped;
    }

    /**
     * @return the isPackingSound
     */
    public String getIsPackingSound() {
        return isPackingSound;
    }

    /**
     * @param isPackingSound the isPackingSound to set
     */
    public void setIsPackingSound(String isPackingSound) {
        this.isPackingSound = isPackingSound;
    }

    /**
     * @return the hasPartFragment
     */
    public String getHasPartFragment() {
        return hasPartFragment;
    }

    /**
     * @param hasPartFragment the hasPartFragment to set
     */
    public void setHasPartFragment(String hasPartFragment) {
        this.hasPartFragment = hasPartFragment;
    }

    /**
     * @return the hasOuterWrapper
     */
    public String getHasOuterWrapper() {
        return hasOuterWrapper;
    }

    /**
     * @param hasOuterWrapper the hasOuterWrapper to set
     */
    public void setHasOuterWrapper(String hasOuterWrapper) {
        this.hasOuterWrapper = hasOuterWrapper;
    }

    /**
     * @return the isOuterPackingSound
     */
    public String getIsOuterPackingSound() {
        return isOuterPackingSound;
    }

    /**
     * @param isOuterPackingSound the isOuterPackingSound to set
     */
    public void setIsOuterPackingSound(String isOuterPackingSound) {
        this.isOuterPackingSound = isOuterPackingSound;
    }

    /**
     * @return the tagFileUrl
     */
    public String getTagFileUrl() {
        return tagFileUrl;
    }

    /**
     * @param tagFileUrl the tagFileUrl to set
     */
    public void setTagFileUrl(String tagFileUrl) {
        this.tagFileUrl = tagFileUrl;
    }

    /**
     * @return the partFileUrl
     */
    public String getPartFileUrl() {
        return partFileUrl;
    }

    /**
     * @param partFileUrl the partFileUrl to set
     */
    public void setPartFileUrl(String partFileUrl) {
        this.partFileUrl = partFileUrl;
    }

    /**
     * @return the packFileUrl
     */
    public String getPackFileUrl() {
        return packFileUrl;
    }

    /**
     * @param packFileUrl the packFileUrl to set
     */
    public void setPackFileUrl(String packFileUrl) {
        this.packFileUrl = packFileUrl;
    }

    /**
     * @return the claimants
     */
    public int getClaimants() {
        return claimants;
    }

    /**
     * @param claimants the claimants to set
     */
    public void setClaimants(int claimants) {
        this.claimants = claimants;
    }

    /**
     * @return the claimPerson
     */
    public String getClaimPerson() {
        return claimPerson;
    }

    /**
     * @param claimPerson the claimPerson to set
     */
    public void setClaimPerson(String claimPerson) {
        this.claimPerson = claimPerson;
    }

    /**
     * @return the telephone
     */
    public String getTelephone() {
        return telephone;
    }

    /**
     * @param telephone the telephone to set
     */
    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    /**
     * @return the compensationWay
     */
    public int getCompensationWay() {
        return compensationWay;
    }

    /**
     * @param compensationWay the compensationWay to set
     */
    public void setCompensationWay(int compensationWay) {
        this.compensationWay = compensationWay;
    }

    /**
     * @return the totalMoneyTax
     */
    public Double getTotalMoneyTax() {
        return totalMoneyTax;
    }

    /**
     * @param totalMoneyTax the totalMoneyTax to set
     */
    public void setTotalMoneyTax(Double totalMoneyTax) {
        this.totalMoneyTax = totalMoneyTax;
    }

    /**
     * @return the claimCategory
     */
    public int getClaimCategory() {
        return claimCategory;
    }

    /**
     * @param claimCategory the claimCategory to set
     */
    public void setClaimCategory(int claimCategory) {
        this.claimCategory = claimCategory;
    }

    /**
     * @return the responsibility
     */
    public int getResponsibility() {
        return responsibility;
    }

    /**
     * @param responsibility the responsibility to set
     */
    public void setResponsibility(int responsibility) {
        this.responsibility = responsibility;
    }

    /**
     * @return the status
     */
    public String getStatus() {
        return status;
    }

    /**
     * @param status the status to set
     */
    public void setStatus(String status) {
        this.status = status;
    }

    /**
     * @return the dealDate
     */
    public Date getDealDate() {
        return dealDate;
    }

    /**
     * @param dealDate the dealDate to set
     */
    public void setDealDate(Date dealDate) {
        this.dealDate = dealDate;
    }

    /**
     * @return the dealMark
     */
    public String getDealMark() {
        return dealMark;
    }

    /**
     * @param dealMark the dealMark to set
     */
    public void setDealMark(String dealMark) {
        this.dealMark = dealMark;
    }

    /**
     * @return the wornDeal
     */
    public int getWornDeal() {
        return wornDeal;
    }

    /**
     * @param wornDeal the wornDeal to set
     */
    public void setWornDeal(int wornDeal) {
        this.wornDeal = wornDeal;
    }

    /**
     * @return the wornStatus
     */
    public String getWornStatus() {
        return wornStatus;
    }

    /**
     * @param wornStatus the wornStatus to set
     */
    public void setWornStatus(String wornStatus) {
        this.wornStatus = wornStatus;
    }

    /**
     * @return the isCheck
     */
    public String getIsCheck() {
        return isCheck;
    }

    /**
     * @param isCheck the isCheck to set
     */
    public void setIsCheck(String isCheck) {
        this.isCheck = isCheck;
    }

    /**
     * @return the hasArrived
     */
    public String getHasArrived() {
        return hasArrived;
    }

    /**
     * @param hasArrived the hasArrived to set
     */
    public void setHasArrived(String hasArrived) {
        this.hasArrived = hasArrived;
    }

    /**
     * @return the wornArrivalNum
     */
    public int getWornArrivalNum() {
        return wornArrivalNum;
    }

    /**
     * @param wornArrivalNum the wornArrivalNum to set
     */
    public void setWornArrivalNum(int wornArrivalNum) {
        this.wornArrivalNum = wornArrivalNum;
    }

    /**
     * @return the hasSubmit
     */
    public String getHasSubmit() {
        return hasSubmit;
    }

    /**
     * @param hasSubmit the hasSubmit to set
     */
    public void setHasSubmit(String hasSubmit) {
        this.hasSubmit = hasSubmit;
    }

    /**
     * @return the reclaimOrder
     */
    public String getReclaimOrder() {
        return reclaimOrder;
    }

    /**
     * @param reclaimOrder the reclaimOrder to set
     */
    public void setReclaimOrder(String reclaimOrder) {
        this.reclaimOrder = reclaimOrder;
    }

    /**
     * @return the billNo
     */
    public String getBillNo() {
        return billNo;
    }

    /**
     * @param billNo the billNo to set
     */
    public void setBillNo(String billNo) {
        this.billNo = billNo;
    }

    /**
     * @return the supplierCode
     */
    public String getSupplierCode() {
        return supplierCode;
    }

    /**
     * @param supplierCode the supplierCode to set
     */
    public void setSupplierCode(String supplierCode) {
        this.supplierCode = supplierCode;
    }

    /**
     * @return the isCompensation
     */
    public String getIsCompensation() {
        return isCompensation;
    }

    /**
     * @param isCompensation the isCompensation to set
     */
    public void setIsCompensation(String isCompensation) {
        this.isCompensation = isCompensation;
    }

    /**
     * @return the circulationNo
     */
    public String getCirculationNo() {
        return circulationNo;
    }

    /**
     * @param circulationNo the circulationNo to set
     */
    public void setCirculationNo(String circulationNo) {
        this.circulationNo = circulationNo;
    }

    /**
     * @return the shopPrice
     */
    public Double getShopPrice() {
        return shopPrice;
    }

    /**
     * @param shopPrice the shopPrice to set
     */
    public void setShopPrice(Double shopPrice) {
        this.shopPrice = shopPrice;
    }

    /**
     * @return the totalPrice
     */
    public Double getTotalPrice() {
        return totalPrice;
    }

    /**
     * @param totalPrice the totalPrice to set
     */
    public void setTotalPrice(Double totalPrice) {
        this.totalPrice = totalPrice;
    }

    /**
     * @return the surcharge
     */
    public Double getSurcharge() {
        return surcharge;
    }

    /**
     * @param surcharge the surcharge to set
     */
    public void setSurcharge(Double surcharge) {
        this.surcharge = surcharge;
    }

    /**
     * @return the proportion
     */
    public Double getProportion() {
        return proportion;
    }

    /**
     * @param proportion the proportion to set
     */
    public void setProportion(Double proportion) {
        this.proportion = proportion;
    }

    /**
     * @return the tax
     */
    public Double getTax() {
        return tax;
    }

    /**
     * @param tax the tax to set
     */
    public void setTax(Double tax) {
        this.tax = tax;
    }

    /**
     * @return the orptionRateDealer
     */
    public Double getOrptionRateDealer() {
        return orptionRateDealer;
    }

    /**
     * @param orptionRateDealer the orptionRateDealer to set
     */
    public void setOrptionRateDealer(Double orptionRateDealer) {
        this.orptionRateDealer = orptionRateDealer;
    }

    /**
     * @return the laborFee
     */
    public Double getLaborFee() {
        return laborFee;
    }

    /**
     * @param laborFee the laborFee to set
     */
    public void setLaborFee(Double laborFee) {
        this.laborFee = laborFee;
    }

    /**
     * @return the outFee
     */
    public Double getOutFee() {
        return outFee;
    }

    /**
     * @param outFee the outFee to set
     */
    public void setOutFee(Double outFee) {
        this.outFee = outFee;
    }

    /**
     * @return the totalMoney
     */
    public Double getTotalMoney() {
        return totalMoney;
    }

    /**
     * @param totalMoney the totalMoney to set
     */
    public void setTotalMoney(Double totalMoney) {
        this.totalMoney = totalMoney;
    }

    /**
     * @return the remark
     */
    public String getRemark() {
        return remark;
    }

    /**
     * @param remark the remark to set
     */
    public void setRemark(String remark) {
        this.remark = remark;
    }

    /**
     * @return the added
     */
    public String getAdded() {
        return added;
    }

    /**
     * @param added the added to set
     */
    public void setAdded(String added) {
        this.added = added;
    }

    /**
     * @return the bmpDealChief
     */
    public int getBmpDealChief() {
        return bmpDealChief;
    }

    /**
     * @param bmpDealChief the bmpDealChief to set
     */
    public void setBmpDealChief(int bmpDealChief) {
        this.bmpDealChief = bmpDealChief;
    }

    /**
     * @return the decideDate
     */
    public Date getDecideDate() {
        return decideDate;
    }

    /**
     * @param decideDate the decideDate to set
     */
    public void setDecideDate(Date decideDate) {
        this.decideDate = decideDate;
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
     * @return the tagFileName
     */
    public String getTagFileName() {
        return tagFileName;
    }

    /**
     * @param tagFileName the tagFileName to set
     */
    public void setTagFileName(String tagFileName) {
        this.tagFileName = tagFileName;
    }

    /**
     * @return the partFileName
     */
    public String getPartFileName() {
        return partFileName;
    }

    /**
     * @param partFileName the partFileName to set
     */
    public void setPartFileName(String partFileName) {
        this.partFileName = partFileName;
    }

    /**
     * @return the packFileName
     */
    public String getPackFileName() {
        return packFileName;
    }

    /**
     * @param packFileName the packFileName to set
     */
    public void setPackFileName(String packFileName) {
        this.packFileName = packFileName;
    }

    /**
     * @return the arrivalDateChar
     */
    public String getArrivalDateChar() {
        return arrivalDateChar;
    }

    /**
     * @param arrivalDateChar the arrivalDateChar to set
     */
    public void setArrivalDateChar(String arrivalDateChar) {
        this.arrivalDateChar = arrivalDateChar;
    }

    /**
     * @return the problemDateChar
     */
    public String getProblemDateChar() {
        return problemDateChar;
    }

    /**
     * @param problemDateChar the problemDateChar to set
     */
    public void setProblemDateChar(String problemDateChar) {
        this.problemDateChar = problemDateChar;
    }

    /**
     * @return the dealDateChar
     */
    public String getDealDateChar() {
        return dealDateChar;
    }

    /**
     * @param dealDateChar the dealDateChar to set
     */
    public void setDealDateChar(String dealDateChar) {
        this.dealDateChar = dealDateChar;
    }

    /**
     * @return the decideDateChar
     */
    public String getDecideDateChar() {
        return decideDateChar;
    }

    /**
     * @param decideDateChar the decideDateChar to set
     */
    public void setDecideDateChar(String decideDateChar) {
        this.decideDateChar = decideDateChar;
    }

    /**
     * @return the errorMessage
     */
    public String getErrorMessage() {
        return errorMessage;
    }

    /**
     * @param errorMessage the errorMessage to set
     */
    public void setErrorMessage(String errorMessage) {
        this.errorMessage = errorMessage;
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
     * @return the tagFileDataCont
     */
    public byte[] getTagFileDataCont() {
        return tagFileDataCont;
    }

    /**
     * @param tagFileDataCont the tagFileDataCont to set
     */
    public void setTagFileDataCont(byte[] tagFileDataCont) {
        this.tagFileDataCont = tagFileDataCont;
    }

    /**
     * @return the parFileDataCont
     */
    public byte[] getParFileDataCont() {
        return parFileDataCont;
    }

    /**
     * @param parFileDataCont the parFileDataCont to set
     */
    public void setParFileDataCont(byte[] parFileDataCont) {
        this.parFileDataCont = parFileDataCont;
    }

    /**
     * @return the packFileDataCont
     */
    public byte[] getPackFileDataCont() {
        return packFileDataCont;
    }

    /**
     * @param packFileDataCont the packFileDataCont to set
     */
    public void setPackFileDataCont(byte[] packFileDataCont) {
        this.packFileDataCont = packFileDataCont;
    }

    /**
     * @return the carModelNm
     */
    public String getCarModelNm() {
        return carModelNm;
    }

    /**
     * @param carModelNm the carModelNm to set
     */
    public void setCarModelNm(String carModelNm) {
        this.carModelNm = carModelNm;
    }

    /**
     * @return the claimTypeNm
     */
    public String getClaimTypeNm() {
        return claimTypeNm;
    }

    /**
     * @param claimTypeNm the claimTypeNm to set
     */
    public void setClaimTypeNm(String claimTypeNm) {
        this.claimTypeNm = claimTypeNm;
    }

    /**
     * @return the dealerClaimWayNm
     */
    public String getDealerClaimWayNm() {
        return dealerClaimWayNm;
    }

    /**
     * @param dealerClaimWayNm the dealerClaimWayNm to set
     */
    public void setDealerClaimWayNm(String dealerClaimWayNm) {
        this.dealerClaimWayNm = dealerClaimWayNm;
    }

    /**
     * @return the prcCodeNm
     */
    public String getPrcCodeNm() {
        return prcCodeNm;
    }

    /**
     * @param prcCodeNm the prcCodeNm to set
     */
    public void setPrcCodeNm(String prcCodeNm) {
        this.prcCodeNm = prcCodeNm;
    }

    /**
     * @return the deliveryTypeNm
     */
    public String getDeliveryTypeNm() {
        return deliveryTypeNm;
    }

    /**
     * @param deliveryTypeNm the deliveryTypeNm to set
     */
    public void setDeliveryTypeNm(String deliveryTypeNm) {
        this.deliveryTypeNm = deliveryTypeNm;
    }

    /**
     * @return the compensationWayNm
     */
    public String getCompensationWayNm() {
        return compensationWayNm;
    }

    /**
     * @param compensationWayNm the compensationWayNm to set
     */
    public void setCompensationWayNm(String compensationWayNm) {
        this.compensationWayNm = compensationWayNm;
    }

    /**
     * @return the claimCategoryNm
     */
    public String getClaimCategoryNm() {
        return claimCategoryNm;
    }

    /**
     * @param claimCategoryNm the claimCategoryNm to set
     */
    public void setClaimCategoryNm(String claimCategoryNm) {
        this.claimCategoryNm = claimCategoryNm;
    }

    /**
     * @return the responsibilityNm
     */
    public String getResponsibilityNm() {
        return responsibilityNm;
    }

    /**
     * @param responsibilityNm the responsibilityNm to set
     */
    public void setResponsibilityNm(String responsibilityNm) {
        this.responsibilityNm = responsibilityNm;
    }

    /**
     * @return the wornDealNm
     */
    public String getWornDealNm() {
        return wornDealNm;
    }

    /**
     * @param wornDealNm the wornDealNm to set
     */
    public void setWornDealNm(String wornDealNm) {
        this.wornDealNm = wornDealNm;
    }

    /**
     * @return the partEnNm
     */
    public String getPartEnNm() {
        return partEnNm;
    }

    /**
     * @param partEnNm the partEnNm to set
     */
    public void setPartEnNm(String partEnNm) {
        this.partEnNm = partEnNm;
    }

    /**
     * @return the surchargeExplain
     */
    public String getSurchargeExplain() {
        return surchargeExplain;
    }

    /**
     * @param surchargeExplain the surchargeExplain to set
     */
    public void setSurchargeExplain(String surchargeExplain) {
        this.surchargeExplain = surchargeExplain;
    }



}
