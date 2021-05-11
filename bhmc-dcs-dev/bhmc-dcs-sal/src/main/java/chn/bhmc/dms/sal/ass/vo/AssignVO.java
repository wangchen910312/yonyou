package chn.bhmc.dms.sal.ass.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : AssignVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author kim yewon
 * @since 2016. 3. 3.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 3.       Kim yewon             최초 생성
 *
 * </pre>
 */

public class AssignVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 2924692645434750515L;


    //배정 마스터
    private String dlrCd;                                       //딜러코드
    private String contractNo;                                  //계약번호
    private String allocQueNo;                                  //배정큐번호
    private String allocDt;                                     //배정일자
    private String statCd;                                      //상태코드(SAL045)
    private String vinNo;                                       //차대번호
    private String rVinNo;                                      //교환차대번호
    private String regUsrId;                                    //등록자
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date regDt;                                         //등록일
    private String updtUsrId;                                   //수정자
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date updtDt;                                        //수정일

    //기타
    private String assignYn;                                    //배정여부
    private String assignVinNo;                                 //배정-VIN NO
    private String vehicleVinNo;                                //차량-VIN NO
    private String vinNo1;                                      //차량교환(VIN NO1)
    private String vinNo2;                                      //차량교환(VIN NO2)
    private String allocQueNo1;                                 //차량교환배정번호1
    private String allocQueNo2;                                 //차량교환배정번호2
    private String contractNo1;                                 //차량교환계약번호1
    private String contractNo2;                                 //차량교환계약번호2



    //차량정보 및 계약정보
    private String carlineCd;                                   //차종코드
    private String carlineNm;                                   //차종명
    private String modelCd;                                     //모델코드
    private String modelNm;                                     //모델명
    private String ocnCd;                                       //OCN코드
    private String ocnNm;                                       //OCN명
    private String extColorCd;                                  //외장색코드
    private String extColorNm;                                  //외장색명칭
    private String intColorCd;                                  //내장색코드
    private String intColorNm;                                  //내장색명칭
    private String contractCustNo;                              //고객번호
    private String contractCustNm;                              //고객명
    private String saleEmpNo;                                   //판매사원번호
    private String saleEmpNm;                                   //판매사원명
    private String contractDt;                                  //계약일
    private String dlReqDt;                                     //인도요청일
    private String stockTp;                                     //재고상태(SAL074)
    private String manufactYyMnDt;                              //제작년월일자
    private String strgeCd;                                     //창고코드
    private String strgeNm;                                     //창고명
    private String locCd;                                       //위치코드
    private String locNm;                                       //위치명
    private String contractStatCd;                              //계약상태코드
    private String ownStatCd;                                   //소유상태코드
    private String contractTp;                                  //계약유형(판매유형)
    private String ordTp;                                       //주문유형
    private String manufactYyMmDt;                              //제조년월
    private String grDt;                                        //입고일자
    private String rfidNo;                                      //RFID NO
    private String lv2DlrStockYn;                               //2급딜러재고여부



    //인도처리 정보
    private String fceSaleReqReasonCd;                          //강제판매신청사유
    private String reqStatCd;                                   //강제판매신청상태
    private String approveYn;                                   //강제판매신청승인여부
    private String expAprYn;                                    //이상출고심사여부(강제판매신청승인여부과 같은 필드)




    /**
     * @return the expAprYn
     */
    public String getExpAprYn() {
        return expAprYn;
    }
    /**
     * @param expAprYn the expAprYn to set
     */
    public void setExpAprYn(String expAprYn) {
        this.expAprYn = expAprYn;
    }
    /**
     * @return the approveYn
     */
    public String getApproveYn() {
        return approveYn;
    }
    /**
     * @param approveYn the approveYn to set
     */
    public void setApproveYn(String approveYn) {
        this.approveYn = approveYn;
    }
    /**
     * @return the fceSaleReqReasonCd
     */
    public String getFceSaleReqReasonCd() {
        return fceSaleReqReasonCd;
    }
    /**
     * @param fceSaleReqReasonCd the fceSaleReqReasonCd to set
     */
    public void setFceSaleReqReasonCd(String fceSaleReqReasonCd) {
        this.fceSaleReqReasonCd = fceSaleReqReasonCd;
    }
    /**
     * @return the reqStatCd
     */
    public String getReqStatCd() {
        return reqStatCd;
    }
    /**
     * @param reqStatCd the reqStatCd to set
     */
    public void setReqStatCd(String reqStatCd) {
        this.reqStatCd = reqStatCd;
    }
    /**
     * @return the ordTp
     */
    public String getOrdTp() {
        return ordTp;
    }
    /**
     * @param ordTp the ordTp to set
     */
    public void setOrdTp(String ordTp) {
        this.ordTp = ordTp;
    }
    /**
     * @return the manufactYyMmDt
     */
    public String getManufactYyMmDt() {
        return manufactYyMmDt;
    }
    /**
     * @param manufactYyMmDt the manufactYyMmDt to set
     */
    public void setManufactYyMmDt(String manufactYyMmDt) {
        this.manufactYyMmDt = manufactYyMmDt;
    }
    /**
     * @return the grDt
     */
    public String getGrDt() {
        return grDt;
    }
    /**
     * @param grDt the grDt to set
     */
    public void setGrDt(String grDt) {
        this.grDt = grDt;
    }
    /**
     * @return the rfidNo
     */
    public String getRfidNo() {
        return rfidNo;
    }
    /**
     * @param rfidNo the rfidNo to set
     */
    public void setRfidNo(String rfidNo) {
        this.rfidNo = rfidNo;
    }
    /**
     * @return the lv2DlrStockYn
     */
    public String getLv2DlrStockYn() {
        return lv2DlrStockYn;
    }
    /**
     * @param lv2DlrStockYn the lv2DlrStockYn to set
     */
    public void setLv2DlrStockYn(String lv2DlrStockYn) {
        this.lv2DlrStockYn = lv2DlrStockYn;
    }
    /**
     * @return the contractTp
     */
    public String getContractTp() {
        return contractTp;
    }
    /**
     * @param contractTp the contractTp to set
     */
    public void setContractTp(String contractTp) {
        this.contractTp = contractTp;
    }
    /**
     * @return the allocQueNo1
     */
    public String getAllocQueNo1() {
        return allocQueNo1;
    }
    /**
     * @param allocQueNo1 the allocQueNo1 to set
     */
    public void setAllocQueNo1(String allocQueNo1) {
        this.allocQueNo1 = allocQueNo1;
    }
    /**
     * @return the allocQueNo2
     */
    public String getAllocQueNo2() {
        return allocQueNo2;
    }
    /**
     * @param allocQueNo2 the allocQueNo2 to set
     */
    public void setAllocQueNo2(String allocQueNo2) {
        this.allocQueNo2 = allocQueNo2;
    }
    /**
     * @return the contractNo1
     */
    public String getContractNo1() {
        return contractNo1;
    }
    /**
     * @param contractNo1 the contractNo1 to set
     */
    public void setContractNo1(String contractNo1) {
        this.contractNo1 = contractNo1;
    }
    /**
     * @return the contractNo2
     */
    public String getContractNo2() {
        return contractNo2;
    }
    /**
     * @param contractNo2 the contractNo2 to set
     */
    public void setContractNo2(String contractNo2) {
        this.contractNo2 = contractNo2;
    }
    /**
     * @return the vinNo1
     */
    public String getVinNo1() {
        return vinNo1;
    }
    /**
     * @param vinNo1 the vinNo1 to set
     */
    public void setVinNo1(String vinNo1) {
        this.vinNo1 = vinNo1;
    }
    /**
     * @return the vinNo2
     */
    public String getVinNo2() {
        return vinNo2;
    }
    /**
     * @param vinNo2 the vinNo2 to set
     */
    public void setVinNo2(String vinNo2) {
        this.vinNo2 = vinNo2;
    }
    /**
     * @return the ownStatCd
     */
    public String getOwnStatCd() {
        return ownStatCd;
    }
    /**
     * @param ownStatCd the ownStatCd to set
     */
    public void setOwnStatCd(String ownStatCd) {
        this.ownStatCd = ownStatCd;
    }
    /**
     * @return the contractStatCd
     */
    public String getContractStatCd() {
        return contractStatCd;
    }
    /**
     * @param contractStatCd the contractStatCd to set
     */
    public void setContractStatCd(String contractStatCd) {
        this.contractStatCd = contractStatCd;
    }
    /**
     * @return the assignVinNo
     */
    public String getAssignVinNo() {
        return assignVinNo;
    }
    /**
     * @param assignVinNo the assignVinNo to set
     */
    public void setAssignVinNo(String assignVinNo) {
        this.assignVinNo = assignVinNo;
    }
    /**
     * @return the vehicleVinNo
     */
    public String getVehicleVinNo() {
        return vehicleVinNo;
    }
    /**
     * @param vehicleVinNo the vehicleVinNo to set
     */
    public void setVehicleVinNo(String vehicleVinNo) {
        this.vehicleVinNo = vehicleVinNo;
    }
    /**
     * @return the manufactYyMnDt
     */
    public String getManufactYyMnDt() {
        return manufactYyMnDt;
    }
    /**
     * @param manufactYyMnDt the manufactYyMnDt to set
     */
    public void setManufactYyMnDt(String manufactYyMnDt) {
        this.manufactYyMnDt = manufactYyMnDt;
    }
    /**
     * @return the strgeCd
     */
    public String getStrgeCd() {
        return strgeCd;
    }
    /**
     * @param strgeCd the strgeCd to set
     */
    public void setStrgeCd(String strgeCd) {
        this.strgeCd = strgeCd;
    }
    /**
     * @return the strgeNm
     */
    public String getStrgeNm() {
        return strgeNm;
    }
    /**
     * @param strgeNm the strgeNm to set
     */
    public void setStrgeNm(String strgeNm) {
        this.strgeNm = strgeNm;
    }
    /**
     * @return the locCd
     */
    public String getLocCd() {
        return locCd;
    }
    /**
     * @param locCd the locCd to set
     */
    public void setLocCd(String locCd) {
        this.locCd = locCd;
    }
    /**
     * @return the locNm
     */
    public String getLocNm() {
        return locNm;
    }
    /**
     * @param locNm the locNm to set
     */
    public void setLocNm(String locNm) {
        this.locNm = locNm;
    }
    /**
     * @return the carlineNm
     */
    public String getCarlineNm() {
        return carlineNm;
    }
    /**
     * @param carlineNm the carlineNm to set
     */
    public void setCarlineNm(String carlineNm) {
        this.carlineNm = carlineNm;
    }
    /**
     * @return the modelNm
     */
    public String getModelNm() {
        return modelNm;
    }
    /**
     * @param modelNm the modelNm to set
     */
    public void setModelNm(String modelNm) {
        this.modelNm = modelNm;
    }
    /**
     * @return the ocnNm
     */
    public String getOcnNm() {
        return ocnNm;
    }
    /**
     * @param ocnNm the ocnNm to set
     */
    public void setOcnNm(String ocnNm) {
        this.ocnNm = ocnNm;
    }
    /**
     * @return the extColorNm
     */
    public String getExtColorNm() {
        return extColorNm;
    }
    /**
     * @param extColorNm the extColorNm to set
     */
    public void setExtColorNm(String extColorNm) {
        this.extColorNm = extColorNm;
    }
    /**
     * @return the intColorNm
     */
    public String getIntColorNm() {
        return intColorNm;
    }
    /**
     * @param intColorNm the intColorNm to set
     */
    public void setIntColorNm(String intColorNm) {
        this.intColorNm = intColorNm;
    }
    /**
     * @return the contractCustNm
     */
    public String getContractCustNm() {
        return contractCustNm;
    }
    /**
     * @param contractCustNm the contractCustNm to set
     */
    public void setContractCustNm(String contractCustNm) {
        this.contractCustNm = contractCustNm;
    }
    /**
     * @return the saleEmpNm
     */
    public String getSaleEmpNm() {
        return saleEmpNm;
    }
    /**
     * @param saleEmpNm the saleEmpNm to set
     */
    public void setSaleEmpNm(String saleEmpNm) {
        this.saleEmpNm = saleEmpNm;
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
     * @return the contractNo
     */
    public String getContractNo() {
        return contractNo;
    }
    /**
     * @param contractNo the contractNo to set
     */
    public void setContractNo(String contractNo) {
        this.contractNo = contractNo;
    }
    /**
     * @return the allocQueNo
     */
    public String getAllocQueNo() {
        return allocQueNo;
    }
    /**
     * @param allocQueNo the allocQueNo to set
     */
    public void setAllocQueNo(String allocQueNo) {
        this.allocQueNo = allocQueNo;
    }
    /**
     * @return the allocDt
     */
    public String getAllocDt() {
        return allocDt;
    }
    /**
     * @param allocDt the allocDt to set
     */
    public void setAllocDt(String allocDt) {
        this.allocDt = allocDt;
    }
    /**
     * @return the statCd
     */
    public String getStatCd() {
        return statCd;
    }
    /**
     * @param statCd the statCd to set
     */
    public void setStatCd(String statCd) {
        this.statCd = statCd;
    }
    /**
     * @return the vinNo
     */
    public String getVinNo() {
        return vinNo;
    }
    /**
     * @param vinNo the vinNo to set
     */
    public void setVinNo(String vinNo) {
        this.vinNo = vinNo;
    }
    /**
     * @return the rVinNo
     */
    public String getrVinNo() {
        return rVinNo;
    }
    /**
     * @param rVinNo the rVinNo to set
     */
    public void setrVinNo(String rVinNo) {
        this.rVinNo = rVinNo;
    }
    /**
     * @return the regUsrId
     */
    public String getRegUsrId() {
        return regUsrId;
    }
    /**
     * @param regUsrId the regUsrId to set
     */
    public void setRegUsrId(String regUsrId) {
        this.regUsrId = regUsrId;
    }
    /**
     * @return the regDt
     */
    public Date getRegDt() {
        return regDt;
    }
    /**
     * @param regDt the regDt to set
     */
    public void setRegDt(Date regDt) {
        this.regDt = regDt;
    }
    /**
     * @return the updtUsrId
     */
    public String getUpdtUsrId() {
        return updtUsrId;
    }
    /**
     * @param updtUsrId the updtUsrId to set
     */
    public void setUpdtUsrId(String updtUsrId) {
        this.updtUsrId = updtUsrId;
    }
    /**
     * @return the updtDt
     */
    public Date getUpdtDt() {
        return updtDt;
    }
    /**
     * @param updtDt the updtDt to set
     */
    public void setUpdtDt(Date updtDt) {
        this.updtDt = updtDt;
    }
    /**
     * @return the assignYn
     */
    public String getAssignYn() {
        return assignYn;
    }
    /**
     * @param assignYn the assignYn to set
     */
    public void setAssignYn(String assignYn) {
        this.assignYn = assignYn;
    }
    /**
     * @return the carlineCd
     */
    public String getCarlineCd() {
        return carlineCd;
    }
    /**
     * @param carlineCd the carlineCd to set
     */
    public void setCarlineCd(String carlineCd) {
        this.carlineCd = carlineCd;
    }
    /**
     * @return the modelCd
     */
    public String getModelCd() {
        return modelCd;
    }
    /**
     * @param modelCd the modelCd to set
     */
    public void setModelCd(String modelCd) {
        this.modelCd = modelCd;
    }
    /**
     * @return the ocnCd
     */
    public String getOcnCd() {
        return ocnCd;
    }
    /**
     * @param ocnCd the ocnCd to set
     */
    public void setOcnCd(String ocnCd) {
        this.ocnCd = ocnCd;
    }
    /**
     * @return the extColorCd
     */
    public String getExtColorCd() {
        return extColorCd;
    }
    /**
     * @param extColorCd the extColorCd to set
     */
    public void setExtColorCd(String extColorCd) {
        this.extColorCd = extColorCd;
    }
    /**
     * @return the intColorCd
     */
    public String getIntColorCd() {
        return intColorCd;
    }
    /**
     * @param intColorCd the intColorCd to set
     */
    public void setIntColorCd(String intColorCd) {
        this.intColorCd = intColorCd;
    }
    /**
     * @return the contractCustNo
     */
    public String getContractCustNo() {
        return contractCustNo;
    }
    /**
     * @param contractCustNo the contractCustNo to set
     */
    public void setContractCustNo(String contractCustNo) {
        this.contractCustNo = contractCustNo;
    }
    /**
     * @return the saleEmpNo
     */
    public String getSaleEmpNo() {
        return saleEmpNo;
    }
    /**
     * @param saleEmpNo the saleEmpNo to set
     */
    public void setSaleEmpNo(String saleEmpNo) {
        this.saleEmpNo = saleEmpNo;
    }
    /**
     * @return the contractDt
     */
    public String getContractDt() {
        return contractDt;
    }
    /**
     * @param contractDt the contractDt to set
     */
    public void setContractDt(String contractDt) {
        this.contractDt = contractDt;
    }
    /**
     * @return the dlReqDt
     */
    public String getDlReqDt() {
        return dlReqDt;
    }
    /**
     * @param dlReqDt the dlReqDt to set
     */
    public void setDlReqDt(String dlReqDt) {
        this.dlReqDt = dlReqDt;
    }
    /**
     * @return the stockTp
     */
    public String getStockTp() {
        return stockTp;
    }
    /**
     * @param stockTp the stockTp to set
     */
    public void setStockTp(String stockTp) {
        this.stockTp = stockTp;
    }
    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }



}
