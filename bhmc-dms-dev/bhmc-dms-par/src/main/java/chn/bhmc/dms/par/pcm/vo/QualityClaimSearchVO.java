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
 * @ClassName   : QualityClaimSearchVO.java
 * @Description : QualityClaimSearchVO.class
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


public class QualityClaimSearchVO extends SearchVO{


     /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -2828539812288053295L;

    /**
     * 딜러코드
     **/
    private  String                sDlrCd;

    /**
     * DMS클레임번호
     **/
    private  String                sClaimNo;

    /**
     * BMP클레임번호
     **/
    private  String                sClaimCode;

    /**
     * 오더번호
     **/
    private  String                sOrderNo;

    /**
     * 오더라인번호
     **/
    private  String                sOrderLn;

    /**
     * 부품번호
     **/
    private  String                sPartNo;

    /**
     * 도착일
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date                  sArrivalDate;

    /**
     * VIN코드
     **/
    private  String                sVin;

    /**
     * 엔진실린더
     **/
    private  String                sEngineCylinder;
    
    /**
     * 클레임신청여부
     **/
    private  String                sRequestClaimYn;

    /**
     * 클레임수량
     **/
    private  Double                sClaimNum;

    /**
     * 문제발견일
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date                  sProblemDate;

    /**
     * 신청일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date                  sCreateTime;

    /**
     * 신청일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date                  sCreateTimeFr;

    /**
     * 신청일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date                  sCreateTimeTo;

    /**
     * 차형코드
     **/
    private  int                   sCarModel;

    /**
     * 클레임유형
     **/
    private  int                   sClaimType;

    /**
     * 클레임방식
     **/
    private  int                   sDealerClaimWay;

    /**
     * 발주창고
     **/
    private  int                   sPrcCode;

    /**
     * 배송방식
     **/
    private  int                   sDeliveryType;

    /**
     * 화물송장코드
     **/
    private  String                sTransportNo;

    /**
     * 화물송장비고
     **/
    private  String                sDeliveryRemark;

    /**
     * 상세묘사
     **/
    private  String                sDescription;

    /**
     * 부품종이박스포장
     **/
    private  String                sIsIndividualWrapped;

    /**
     * 종이박스포장온전함
     **/
    private  String                sIsPackingSound;

    /**
     * 포장내깨진조각있음
     **/
    private  String                sHasPartFragment;

    /**
     * 종이박스가AD/SQ에있음
     **/
    private  String                sHasOuterWrapper;

    /**
     * SD/SQ박스온전
     **/
    private  String                sIsOuterPackingSound;

    /**
     * 부속품(태그)
     **/
    private  String                sTagFileUrl;

    /**
     * 부속품(부품)
     **/
    private  String                sPartFileUrl;

    /**
     * 부속품(포장)
     **/
    private  String                sPackFileUrl;

    /**
     * 부품매니저
     **/
    private  int                   sClaimants;

    /**
     * 클레임신고일
     **/
    private  String                sClaimPerson;

    /**
     * 신고인연락처
     **/
    private  String                sTelephone;

    /**
     * 배상방식
     **/
    private  int                   sCompensationWay;

    /**
     * 배상총금액세금포함
     **/
    private  Double                sTotalMoneyTax;

    /**
     * 유형표기
     **/
    private  int                   sClaimCategory;

    /**
     * 책임표기
     **/
    private  int                   sResponsibility;

    /**
     * 처리상태
     **/
    private  String                sStatus;

    /**
     * 배상년월
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date                  sDealDate;

    /**
     * 배상년월
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date                  sDealDateFr;

    /**
     * 배상년월
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date                  sDealDateTo;

    /**
     * 배상표기
     **/
    private  String                sDealMark;

    /**
     * 클레임건처리
     **/
    private  int                   sWornDeal;

    /**
     * 클레임건상태
     **/
    private  String                sWornStatus;

    /**
     * 탁송여부
     **/
    private  String                sIsCheck;

    /**
     * 도착여부
     **/
    private  String                sHasArrived;

    /**
     * 클레임건도착수량
     **/
    private  int                   sWornArrivalNum;

    /**
     * 변상수령증
     **/
    private  String                sHasSubmit;

    /**
     * 화물송장코드회수
     **/
    private  String                sReclaimOrder;

    /**
     * 영수증코드
     **/
    private  String                sBillNo;

    /**
     * 공급상코드
     **/
    private  String                sSupplierCode;

    /**
     * 배상여부
     **/
    private  String                sIsCompensation;

    /**
     * 서큘레이션번호
     **/
    private  String                sCirculationNo;

    /**
     * 판매망가격
     **/
    private  Double                sShopPrice;

    /**
     * 총판매금액
     **/
    private  Double                sTotalPrice;

    /**
     * 부대금액
     **/
    private  Double                sSurcharge;

    /**
     * 배상율
     **/
    private  Double                sProportion;

    /**
     * 세금율
     **/
    private  Double                sTax;

    /**
     * 배부율
     **/
    private  Double                sOrptionRateDealer;

    /**
     * 공임비용
     **/
    private  Double                sLaborFee;

    /**
     * 외주비용
     **/
    private  Double                sOutFee;

    /**
     * 배상총금액
     **/
    private  Double                sTotalMoney;

    /**
     * 배상비고
     **/
    private  String                sRemark;

    /**
     * 보완자료
     **/
    private  String                sAdded;

    /**
     * 처리담당
     **/
    private  int                   sBmpDealChief;

    /**
     * 판정일
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date                  sDecideDate;

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
     * @return the sClaimCode
     */
    public String getsClaimCode() {
        return sClaimCode;
    }

    /**
     * @param sClaimCode the sClaimCode to set
     */
    public void setsClaimCode(String sClaimCode) {
        this.sClaimCode = sClaimCode;
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
     * @return the sOrderLn
     */
    public String getsOrderLn() {
        return sOrderLn;
    }

    /**
     * @param sOrderLn the sOrderLn to set
     */
    public void setsOrderLn(String sOrderLn) {
        this.sOrderLn = sOrderLn;
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
     * @return the sArrivalDate
     */
    public Date getsArrivalDate() {
        return sArrivalDate;
    }

    /**
     * @param sArrivalDate the sArrivalDate to set
     */
    public void setsArrivalDate(Date sArrivalDate) {
        this.sArrivalDate = sArrivalDate;
    }

    /**
     * @return the sVin
     */
    public String getsVin() {
        return sVin;
    }

    /**
     * @param sVin the sVin to set
     */
    public void setsVin(String sVin) {
        this.sVin = sVin;
    }

    /**
     * @return the sEngineCylinder
     */
    public String getsEngineCylinder() {
        return sEngineCylinder;
    }

    /**
     * @param sEngineCylinder the sEngineCylinder to set
     */
    public void setsEngineCylinder(String sEngineCylinder) {
        this.sEngineCylinder = sEngineCylinder;
    }

    /**
     * @return the sClaimNum
     */
    public Double getsClaimNum() {
        return sClaimNum;
    }

    /**
     * @param sClaimNum the sClaimNum to set
     */
    public void setsClaimNum(Double sClaimNum) {
        this.sClaimNum = sClaimNum;
    }

    /**
     * @return the sProblemDate
     */
    public Date getsProblemDate() {
        return sProblemDate;
    }

    /**
     * @param sProblemDate the sProblemDate to set
     */
    public void setsProblemDate(Date sProblemDate) {
        this.sProblemDate = sProblemDate;
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
     * @return the sCarModel
     */
    public int getsCarModel() {
        return sCarModel;
    }

    /**
     * @param sCarModel the sCarModel to set
     */
    public void setsCarModel(int sCarModel) {
        this.sCarModel = sCarModel;
    }

    /**
     * @return the sClaimType
     */
    public int getsClaimType() {
        return sClaimType;
    }

    /**
     * @param sClaimType the sClaimType to set
     */
    public void setsClaimType(int sClaimType) {
        this.sClaimType = sClaimType;
    }

    /**
     * @return the sDealerClaimWay
     */
    public int getsDealerClaimWay() {
        return sDealerClaimWay;
    }

    /**
     * @param sDealerClaimWay the sDealerClaimWay to set
     */
    public void setsDealerClaimWay(int sDealerClaimWay) {
        this.sDealerClaimWay = sDealerClaimWay;
    }

    /**
     * @return the sPrcCode
     */
    public int getsPrcCode() {
        return sPrcCode;
    }

    /**
     * @param sPrcCode the sPrcCode to set
     */
    public void setsPrcCode(int sPrcCode) {
        this.sPrcCode = sPrcCode;
    }

    /**
     * @return the sDeliveryType
     */
    public int getsDeliveryType() {
        return sDeliveryType;
    }

    /**
     * @param sDeliveryType the sDeliveryType to set
     */
    public void setsDeliveryType(int sDeliveryType) {
        this.sDeliveryType = sDeliveryType;
    }

    /**
     * @return the sTransportNo
     */
    public String getsTransportNo() {
        return sTransportNo;
    }

    /**
     * @param sTransportNo the sTransportNo to set
     */
    public void setsTransportNo(String sTransportNo) {
        this.sTransportNo = sTransportNo;
    }

    /**
     * @return the sDeliveryRemark
     */
    public String getsDeliveryRemark() {
        return sDeliveryRemark;
    }

    /**
     * @param sDeliveryRemark the sDeliveryRemark to set
     */
    public void setsDeliveryRemark(String sDeliveryRemark) {
        this.sDeliveryRemark = sDeliveryRemark;
    }

    /**
     * @return the sDescription
     */
    public String getsDescription() {
        return sDescription;
    }

    /**
     * @param sDescription the sDescription to set
     */
    public void setsDescription(String sDescription) {
        this.sDescription = sDescription;
    }

    /**
     * @return the sIsIndividualWrapped
     */
    public String getsIsIndividualWrapped() {
        return sIsIndividualWrapped;
    }

    /**
     * @param sIsIndividualWrapped the sIsIndividualWrapped to set
     */
    public void setsIsIndividualWrapped(String sIsIndividualWrapped) {
        this.sIsIndividualWrapped = sIsIndividualWrapped;
    }

    /**
     * @return the sIsPackingSound
     */
    public String getsIsPackingSound() {
        return sIsPackingSound;
    }

    /**
     * @param sIsPackingSound the sIsPackingSound to set
     */
    public void setsIsPackingSound(String sIsPackingSound) {
        this.sIsPackingSound = sIsPackingSound;
    }

    /**
     * @return the sHasPartFragment
     */
    public String getsHasPartFragment() {
        return sHasPartFragment;
    }

    /**
     * @param sHasPartFragment the sHasPartFragment to set
     */
    public void setsHasPartFragment(String sHasPartFragment) {
        this.sHasPartFragment = sHasPartFragment;
    }

    /**
     * @return the sHasOuterWrapper
     */
    public String getsHasOuterWrapper() {
        return sHasOuterWrapper;
    }

    /**
     * @param sHasOuterWrapper the sHasOuterWrapper to set
     */
    public void setsHasOuterWrapper(String sHasOuterWrapper) {
        this.sHasOuterWrapper = sHasOuterWrapper;
    }

    /**
     * @return the sIsOuterPackingSound
     */
    public String getsIsOuterPackingSound() {
        return sIsOuterPackingSound;
    }

    /**
     * @param sIsOuterPackingSound the sIsOuterPackingSound to set
     */
    public void setsIsOuterPackingSound(String sIsOuterPackingSound) {
        this.sIsOuterPackingSound = sIsOuterPackingSound;
    }

    /**
     * @return the sTagFileUrl
     */
    public String getsTagFileUrl() {
        return sTagFileUrl;
    }

    /**
     * @param sTagFileUrl the sTagFileUrl to set
     */
    public void setsTagFileUrl(String sTagFileUrl) {
        this.sTagFileUrl = sTagFileUrl;
    }

    /**
     * @return the sPartFileUrl
     */
    public String getsPartFileUrl() {
        return sPartFileUrl;
    }

    /**
     * @param sPartFileUrl the sPartFileUrl to set
     */
    public void setsPartFileUrl(String sPartFileUrl) {
        this.sPartFileUrl = sPartFileUrl;
    }

    /**
     * @return the sPackFileUrl
     */
    public String getsPackFileUrl() {
        return sPackFileUrl;
    }

    /**
     * @param sPackFileUrl the sPackFileUrl to set
     */
    public void setsPackFileUrl(String sPackFileUrl) {
        this.sPackFileUrl = sPackFileUrl;
    }

    /**
     * @return the sClaimants
     */
    public int getsClaimants() {
        return sClaimants;
    }

    /**
     * @param sClaimants the sClaimants to set
     */
    public void setsClaimants(int sClaimants) {
        this.sClaimants = sClaimants;
    }

    /**
     * @return the sClaimPerson
     */
    public String getsClaimPerson() {
        return sClaimPerson;
    }

    /**
     * @param sClaimPerson the sClaimPerson to set
     */
    public void setsClaimPerson(String sClaimPerson) {
        this.sClaimPerson = sClaimPerson;
    }

    /**
     * @return the sTelephone
     */
    public String getsTelephone() {
        return sTelephone;
    }

    /**
     * @param sTelephone the sTelephone to set
     */
    public void setsTelephone(String sTelephone) {
        this.sTelephone = sTelephone;
    }

    /**
     * @return the sCompensationWay
     */
    public int getsCompensationWay() {
        return sCompensationWay;
    }

    /**
     * @param sCompensationWay the sCompensationWay to set
     */
    public void setsCompensationWay(int sCompensationWay) {
        this.sCompensationWay = sCompensationWay;
    }

    /**
     * @return the sTotalMoneyTax
     */
    public Double getsTotalMoneyTax() {
        return sTotalMoneyTax;
    }

    /**
     * @param sTotalMoneyTax the sTotalMoneyTax to set
     */
    public void setsTotalMoneyTax(Double sTotalMoneyTax) {
        this.sTotalMoneyTax = sTotalMoneyTax;
    }

    /**
     * @return the sClaimCategory
     */
    public int getsClaimCategory() {
        return sClaimCategory;
    }

    /**
     * @param sClaimCategory the sClaimCategory to set
     */
    public void setsClaimCategory(int sClaimCategory) {
        this.sClaimCategory = sClaimCategory;
    }

    /**
     * @return the sResponsibility
     */
    public int getsResponsibility() {
        return sResponsibility;
    }

    /**
     * @param sResponsibility the sResponsibility to set
     */
    public void setsResponsibility(int sResponsibility) {
        this.sResponsibility = sResponsibility;
    }

    /**
     * @return the sStatus
     */
    public String getsStatus() {
        return sStatus;
    }

    /**
     * @param sStatus the sStatus to set
     */
    public void setsStatus(String sStatus) {
        this.sStatus = sStatus;
    }

    /**
     * @return the sDealDate
     */
    public Date getsDealDate() {
        return sDealDate;
    }

    /**
     * @param sDealDate the sDealDate to set
     */
    public void setsDealDate(Date sDealDate) {
        this.sDealDate = sDealDate;
    }

    /**
     * @return the sDealMark
     */
    public String getsDealMark() {
        return sDealMark;
    }

    /**
     * @param sDealMark the sDealMark to set
     */
    public void setsDealMark(String sDealMark) {
        this.sDealMark = sDealMark;
    }

    /**
     * @return the sWornDeal
     */
    public int getsWornDeal() {
        return sWornDeal;
    }

    /**
     * @param sWornDeal the sWornDeal to set
     */
    public void setsWornDeal(int sWornDeal) {
        this.sWornDeal = sWornDeal;
    }

    /**
     * @return the sWornStatus
     */
    public String getsWornStatus() {
        return sWornStatus;
    }

    /**
     * @param sWornStatus the sWornStatus to set
     */
    public void setsWornStatus(String sWornStatus) {
        this.sWornStatus = sWornStatus;
    }

    /**
     * @return the sIsCheck
     */
    public String getsIsCheck() {
        return sIsCheck;
    }

    /**
     * @param sIsCheck the sIsCheck to set
     */
    public void setsIsCheck(String sIsCheck) {
        this.sIsCheck = sIsCheck;
    }

    /**
     * @return the sHasArrived
     */
    public String getsHasArrived() {
        return sHasArrived;
    }

    /**
     * @param sHasArrived the sHasArrived to set
     */
    public void setsHasArrived(String sHasArrived) {
        this.sHasArrived = sHasArrived;
    }

    /**
     * @return the sWornArrivalNum
     */
    public int getsWornArrivalNum() {
        return sWornArrivalNum;
    }

    /**
     * @param sWornArrivalNum the sWornArrivalNum to set
     */
    public void setsWornArrivalNum(int sWornArrivalNum) {
        this.sWornArrivalNum = sWornArrivalNum;
    }

    /**
     * @return the sHasSubmit
     */
    public String getsHasSubmit() {
        return sHasSubmit;
    }

    /**
     * @param sHasSubmit the sHasSubmit to set
     */
    public void setsHasSubmit(String sHasSubmit) {
        this.sHasSubmit = sHasSubmit;
    }

    /**
     * @return the sReclaimOrder
     */
    public String getsReclaimOrder() {
        return sReclaimOrder;
    }

    /**
     * @param sReclaimOrder the sReclaimOrder to set
     */
    public void setsReclaimOrder(String sReclaimOrder) {
        this.sReclaimOrder = sReclaimOrder;
    }

    /**
     * @return the sBillNo
     */
    public String getsBillNo() {
        return sBillNo;
    }

    /**
     * @param sBillNo the sBillNo to set
     */
    public void setsBillNo(String sBillNo) {
        this.sBillNo = sBillNo;
    }

    /**
     * @return the sSupplierCode
     */
    public String getsSupplierCode() {
        return sSupplierCode;
    }

    /**
     * @param sSupplierCode the sSupplierCode to set
     */
    public void setsSupplierCode(String sSupplierCode) {
        this.sSupplierCode = sSupplierCode;
    }

    /**
     * @return the sIsCompensation
     */
    public String getsIsCompensation() {
        return sIsCompensation;
    }

    /**
     * @param sIsCompensation the sIsCompensation to set
     */
    public void setsIsCompensation(String sIsCompensation) {
        this.sIsCompensation = sIsCompensation;
    }

    /**
     * @return the sCirculationNo
     */
    public String getsCirculationNo() {
        return sCirculationNo;
    }

    /**
     * @param sCirculationNo the sCirculationNo to set
     */
    public void setsCirculationNo(String sCirculationNo) {
        this.sCirculationNo = sCirculationNo;
    }

    /**
     * @return the sShopPrice
     */
    public Double getsShopPrice() {
        return sShopPrice;
    }

    /**
     * @param sShopPrice the sShopPrice to set
     */
    public void setsShopPrice(Double sShopPrice) {
        this.sShopPrice = sShopPrice;
    }

    /**
     * @return the sTotalPrice
     */
    public Double getsTotalPrice() {
        return sTotalPrice;
    }

    /**
     * @param sTotalPrice the sTotalPrice to set
     */
    public void setsTotalPrice(Double sTotalPrice) {
        this.sTotalPrice = sTotalPrice;
    }

    /**
     * @return the sSurcharge
     */
    public Double getsSurcharge() {
        return sSurcharge;
    }

    /**
     * @param sSurcharge the sSurcharge to set
     */
    public void setsSurcharge(Double sSurcharge) {
        this.sSurcharge = sSurcharge;
    }

    /**
     * @return the sProportion
     */
    public Double getsProportion() {
        return sProportion;
    }

    /**
     * @param sProportion the sProportion to set
     */
    public void setsProportion(Double sProportion) {
        this.sProportion = sProportion;
    }

    /**
     * @return the sTax
     */
    public Double getsTax() {
        return sTax;
    }

    /**
     * @param sTax the sTax to set
     */
    public void setsTax(Double sTax) {
        this.sTax = sTax;
    }

    /**
     * @return the sOrptionRateDealer
     */
    public Double getsOrptionRateDealer() {
        return sOrptionRateDealer;
    }

    /**
     * @param sOrptionRateDealer the sOrptionRateDealer to set
     */
    public void setsOrptionRateDealer(Double sOrptionRateDealer) {
        this.sOrptionRateDealer = sOrptionRateDealer;
    }

    /**
     * @return the sLaborFee
     */
    public Double getsLaborFee() {
        return sLaborFee;
    }

    /**
     * @param sLaborFee the sLaborFee to set
     */
    public void setsLaborFee(Double sLaborFee) {
        this.sLaborFee = sLaborFee;
    }

    /**
     * @return the sOutFee
     */
    public Double getsOutFee() {
        return sOutFee;
    }

    /**
     * @param sOutFee the sOutFee to set
     */
    public void setsOutFee(Double sOutFee) {
        this.sOutFee = sOutFee;
    }

    /**
     * @return the sTotalMoney
     */
    public Double getsTotalMoney() {
        return sTotalMoney;
    }

    /**
     * @param sTotalMoney the sTotalMoney to set
     */
    public void setsTotalMoney(Double sTotalMoney) {
        this.sTotalMoney = sTotalMoney;
    }

    /**
     * @return the sRemark
     */
    public String getsRemark() {
        return sRemark;
    }

    /**
     * @param sRemark the sRemark to set
     */
    public void setsRemark(String sRemark) {
        this.sRemark = sRemark;
    }

    /**
     * @return the sAdded
     */
    public String getsAdded() {
        return sAdded;
    }

    /**
     * @param sAdded the sAdded to set
     */
    public void setsAdded(String sAdded) {
        this.sAdded = sAdded;
    }

    /**
     * @return the sBmpDealChief
     */
    public int getsBmpDealChief() {
        return sBmpDealChief;
    }

    /**
     * @param sBmpDealChief the sBmpDealChief to set
     */
    public void setsBmpDealChief(int sBmpDealChief) {
        this.sBmpDealChief = sBmpDealChief;
    }

    /**
     * @return the sDecideDate
     */
    public Date getsDecideDate() {
        return sDecideDate;
    }

    /**
     * @param sDecideDate the sDecideDate to set
     */
    public void setsDecideDate(Date sDecideDate) {
        this.sDecideDate = sDecideDate;
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
     * @return the sDealDateFr
     */
    public Date getsDealDateFr() {
        return sDealDateFr;
    }

    /**
     * @param sDealDateFr the sDealDateFr to set
     */
    public void setsDealDateFr(Date sDealDateFr) {
        this.sDealDateFr = sDealDateFr;
    }

    /**
     * @return the sDealDateTo
     */
    public Date getsDealDateTo() {
        return sDealDateTo;
    }

    /**
     * @param sDealDateTo the sDealDateTo to set
     */
    public void setsDealDateTo(Date sDealDateTo) {
        this.sDealDateTo = sDealDateTo;
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
