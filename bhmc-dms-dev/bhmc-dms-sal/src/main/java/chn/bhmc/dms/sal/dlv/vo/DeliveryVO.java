package chn.bhmc.dms.sal.dlv.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : DeliveryVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author kim yewon
 * @since 2016. 3. 10.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 10.     Kim yewon             최초 생성
 *
 * </pre>
 */

public class DeliveryVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 2924692645434750515L;

    //계약정보
    private String dlrCd;                           //딜러
    private String contractNo;                      //계약번호
    private String contractStatCd;                  //계약상태
    private String contractCustNo;                  //고객
    private String contractCustNm;                  //고객명
    private String contractTp;                      //판매유형
    private String saleEmpNo;                       //판매사원
    private String saleEmpNm;                       //판매사원명
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date contractDt;                      //계약일자
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date dlReqDt;                         //인도요청일자
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date giDt;                            //출고일자
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date realDlDt;                        //실제인도일자
    private String tovrNm;                          //인수자명
    private String tovrRelCd;                       //인수자관계
    private String dstbChnCd;                       //유통채널
    private String retlTp;                          //소매유형
    private String cancReasonCd;                    //판매취소사유
    private String fileDocId;                       //첨부파일번호
    private String gubun;                           //구분(C:인도,D:인도취소)
    private String contractVinNo;                   //계약시 임시배정된 vin no
    private String contractVinNo1;                  //계약시 임시배정된 VIN - VIN NO1
    private String contractVinNo2;                  //계약시 임시배정된 VIN - VIN NO2
    private String saleOpptNo;                      //판매기회번호
    private String grpContractNo;                   //집단판매계약번호
    private String grpContractStatCd;               //집단계약상태


    //차량정보
    private String vinNo;                           //VIN NO
    private String vinNo1;                          //VIN NO1
    private String vinNo2;                          //VIN NO2
    private String rfidNo;                          //RFID NO
    private String ownStatCd;                       //차량보유상태
    private String carlineCd;                       //차종
    private String carlineNm;                       //차종명
    private String modelCd;                         //모델
    private String modelNm;                         //모델명
    private String ocnCd;                           //OCN
    private String ocnNm;                           //OCN명
    private String extColorCd;                      //외장색코드
    private String extColorNm;                      //외장색명
    private String intColorCd;                      //내장색코드
    private String intColorNm;                      //내장색명
    private String carStatCd;                       //차량상태코드

    //강제판매처리요청
    private String reqStatCd;                       //요청상태코드
    private String fceSaleReqReasonCd;              //강제판매요청사유코드
    private String approveYn;                       //이월소매취소
    private String tecId;                           //서비스고문
    private String fileDocNo;                       //첨부파일
    private int seq;                                //일련번호
    private String expAprYn;                        //이상출고심사여부
    private String deliveryVinNo;                   //출고 VIN NO
    private String deliveryRfidNo;                  //출고 VIN의 RFID NO



    //고객정보(CR_0101)
    private String custNo;                          //고객번호
    private String custNm;                          //고객명
    private String custTp;                          //고객유형
    private String hpNo;                            //전화번호(휴대폰)
    private String mathDocTp;                       //주요인증문서번호(证件类型)
    private String ssnCrnNo;                        //신분사업증번호


    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date cancDt;                            //취소일자
    private String dstbChnNo;                       //유통채널
    private String contractPdpstNm;                 //계약입금자명
    private String contractRcptNo;                  //계약영수증번호
    private Double contractRcptAmt;                 //계약영수증금액
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date contractRcptDt;                    //계약영수증일자
    private String contractRcptId;                  //영수증스캔
    private String ordTp;                           //주문유형
    private String contractOrdTp;                   //주문유형 - 임시배정 빈
    private String deliveryOrdTp;                   //주문유형 - 출고 빈
    private String saleTp;                          //판매유형
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date grteStartDt;                       //보증시작일자
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date invcPublDt;                        //인보이스발행일자
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date custSaleDt;                        //고객판매일자
    private String retlTpCd;                        //소매유형코드



    //인도취소
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date reqDt;                             //취소요청일자(인도취소일자)
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date approveDt;                         //승인일자
    private String aprroveYn;                       //승인여부
    private String deliveryGb;                      //이월취소여부

    private String spFlag;                          //이월취소여부
    private String carDstinCd;                      //승상구분

    /**
     * @return the contractVinNo1
     */
    public String getContractVinNo1() {
        return contractVinNo1;
    }
    /**
     * @param contractVinNo1 the contractVinNo1 to set
     */
    public void setContractVinNo1(String contractVinNo1) {
        this.contractVinNo1 = contractVinNo1;
    }
    /**
     * @return the contractVinNo2
     */
    public String getContractVinNo2() {
        return contractVinNo2;
    }
    /**
     * @param contractVinNo2 the contractVinNo2 to set
     */
    public void setContractVinNo2(String contractVinNo2) {
        this.contractVinNo2 = contractVinNo2;
    }
    /**
     * @return the grpContractStatCd
     */
    public String getGrpContractStatCd() {
        return grpContractStatCd;
    }
    /**
     * @param grpContractStatCd the grpContractStatCd to set
     */
    public void setGrpContractStatCd(String grpContractStatCd) {
        this.grpContractStatCd = grpContractStatCd;
    }
    /**
     * @return the grpContractNo
     */
    public String getGrpContractNo() {
        return grpContractNo;
    }
    /**
     * @param grpContractNo the grpContractNo to set
     */
    public void setGrpContractNo(String grpContractNo) {
        this.grpContractNo = grpContractNo;
    }
    /**
     * @return the saleOpptNo
     */
    public String getSaleOpptNo() {
        return saleOpptNo;
    }
    /**
     * @param saleOpptNo the saleOpptNo to set
     */
    public void setSaleOpptNo(String saleOpptNo) {
        this.saleOpptNo = saleOpptNo;
    }
    /**
     * @return the saleTp
     */
    public String getSaleTp() {
        return saleTp;
    }
    /**
     * @param saleTp the saleTp to set
     */
    public void setSaleTp(String saleTp) {
        this.saleTp = saleTp;
    }
    /**
     * @return the grteStartDt
     */
    public Date getGrteStartDt() {
        return grteStartDt;
    }
    /**
     * @param grteStartDt the grteStartDt to set
     */
    public void setGrteStartDt(Date grteStartDt) {
        this.grteStartDt = grteStartDt;
    }
    /**
     * @return the invcPublDt
     */
    public Date getInvcPublDt() {
        return invcPublDt;
    }
    /**
     * @param invcPublDt the invcPublDt to set
     */
    public void setInvcPublDt(Date invcPublDt) {
        this.invcPublDt = invcPublDt;
    }
    /**
     * @return the custSaleDt
     */
    public Date getCustSaleDt() {
        return custSaleDt;
    }
    /**
     * @param custSaleDt the custSaleDt to set
     */
    public void setCustSaleDt(Date custSaleDt) {
        this.custSaleDt = custSaleDt;
    }
    /**
     * @return the retlTpCd
     */
    public String getRetlTpCd() {
        return retlTpCd;
    }
    /**
     * @param retlTpCd the retlTpCd to set
     */
    public void setRetlTpCd(String retlTpCd) {
        this.retlTpCd = retlTpCd;
    }
    /**
     * @return the contractOrdTp
     */
    public String getContractOrdTp() {
        return contractOrdTp;
    }
    /**
     * @param contractOrdTp the contractOrdTp to set
     */
    public void setContractOrdTp(String contractOrdTp) {
        this.contractOrdTp = contractOrdTp;
    }
    /**
     * @return the deliveryOrdTp
     */
    public String getDeliveryOrdTp() {
        return deliveryOrdTp;
    }
    /**
     * @param deliveryOrdTp the deliveryOrdTp to set
     */
    public void setDeliveryOrdTp(String deliveryOrdTp) {
        this.deliveryOrdTp = deliveryOrdTp;
    }
    /**
     * @return the contractVinNo
     */
    public String getContractVinNo() {
        return contractVinNo;
    }
    /**
     * @param contractVinNo the contractVinNo to set
     */
    public void setContractVinNo(String contractVinNo) {
        this.contractVinNo = contractVinNo;
    }
    /**
     * @return the deliveryRfidNo
     */
    public String getDeliveryRfidNo() {
        return deliveryRfidNo;
    }
    /**
     * @param deliveryRfidNo the deliveryRfidNo to set
     */
    public void setDeliveryRfidNo(String deliveryRfidNo) {
        this.deliveryRfidNo = deliveryRfidNo;
    }
    /**
     * @return the deliveryVinNo
     */
    public String getDeliveryVinNo() {
        return deliveryVinNo;
    }
    /**
     * @param deliveryVinNo the deliveryVinNo to set
     */
    public void setDeliveryVinNo(String deliveryVinNo) {
        this.deliveryVinNo = deliveryVinNo;
    }
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
     * @return the seq
     */
    public int getSeq() {
        return seq;
    }
    /**
     * @param seq the seq to set
     */
    public void setSeq(int seq) {
        this.seq = seq;
    }
    /**
     * @return the fileDocNo
     */
    public String getFileDocNo() {
        return fileDocNo;
    }
    /**
     * @param fileDocNo the fileDocNo to set
     */
    public void setFileDocNo(String fileDocNo) {
        this.fileDocNo = fileDocNo;
    }
    /**
     * @return the gubun
     */
    public String getGubun() {
        return gubun;
    }
    /**
     * @param gubun the gubun to set
     */
    public void setGubun(String gubun) {
        this.gubun = gubun;
    }
    /**
     * @return the fileDocId
     */
    public String getFileDocId() {
        return fileDocId;
    }
    /**
     * @param fileDocId the fileDocId to set
     */
    public void setFileDocId(String fileDocId) {
        this.fileDocId = fileDocId;
    }
    /**
     * @return the deliveryGb
     */
    public String getDeliveryGb() {
        return deliveryGb;
    }
    /**
     * @param deliveryGb the deliveryGb to set
     */
    public void setDeliveryGb(String deliveryGb) {
        this.deliveryGb = deliveryGb;
    }
    /**
     * @return the reqDt
     */
    public Date getReqDt() {
        return reqDt;
    }
    /**
     * @param reqDt the reqDt to set
     */
    public void setReqDt(Date reqDt) {
        this.reqDt = reqDt;
    }
    /**
     * @return the approveDt
     */
    public Date getApproveDt() {
        return approveDt;
    }
    /**
     * @param approveDt the approveDt to set
     */
    public void setApproveDt(Date approveDt) {
        this.approveDt = approveDt;
    }
    /**
     * @return the aprroveYn
     */
    public String getAprroveYn() {
        return aprroveYn;
    }
    /**
     * @param aprroveYn the aprroveYn to set
     */
    public void setAprroveYn(String aprroveYn) {
        this.aprroveYn = aprroveYn;
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
     * @return the contractRcptId
     */
    public String getContractRcptId() {
        return contractRcptId;
    }
    /**
     * @param contractRcptId the contractRcptId to set
     */
    public void setContractRcptId(String contractRcptId) {
        this.contractRcptId = contractRcptId;
    }
    /**
     * @return the cancDt
     */
    public Date getCancDt() {
        return cancDt;
    }
    /**
     * @param cancDt the cancDt to set
     */
    public void setCancDt(Date cancDt) {
        this.cancDt = cancDt;
    }
    /**
     * @return the dstbChnNo
     */
    public String getDstbChnNo() {
        return dstbChnNo;
    }
    /**
     * @param dstbChnNo the dstbChnNo to set
     */
    public void setDstbChnNo(String dstbChnNo) {
        this.dstbChnNo = dstbChnNo;
    }
    /**
     * @return the contractPdpstNm
     */
    public String getContractPdpstNm() {
        return contractPdpstNm;
    }
    /**
     * @param contractPdpstNm the contractPdpstNm to set
     */
    public void setContractPdpstNm(String contractPdpstNm) {
        this.contractPdpstNm = contractPdpstNm;
    }
    /**
     * @return the contractRcptNo
     */
    public String getContractRcptNo() {
        return contractRcptNo;
    }
    /**
     * @param contractRcptNo the contractRcptNo to set
     */
    public void setContractRcptNo(String contractRcptNo) {
        this.contractRcptNo = contractRcptNo;
    }
    /**
     * @return the contractRcptAmt
     */
    public Double getContractRcptAmt() {
        return contractRcptAmt;
    }
    /**
     * @param contractRcptAmt the contractRcptAmt to set
     */
    public void setContractRcptAmt(Double contractRcptAmt) {
        this.contractRcptAmt = contractRcptAmt;
    }
    /**
     * @return the contractRcptDt
     */
    public Date getContractRcptDt() {
        return contractRcptDt;
    }
    /**
     * @param contractRcptDt the contractRcptDt to set
     */
    public void setContractRcptDt(Date contractRcptDt) {
        this.contractRcptDt = contractRcptDt;
    }
    /**
     * @return the custNo
     */
    public String getCustNo() {
        return custNo;
    }
    /**
     * @param custNo the custNo to set
     */
    public void setCustNo(String custNo) {
        this.custNo = custNo;
    }
    /**
     * @return the custNm
     */
    public String getCustNm() {
        return custNm;
    }
    /**
     * @param custNm the custNm to set
     */
    public void setCustNm(String custNm) {
        this.custNm = custNm;
    }
    /**
     * @return the custTp
     */
    public String getCustTp() {
        return custTp;
    }
    /**
     * @param custTp the custTp to set
     */
    public void setCustTp(String custTp) {
        this.custTp = custTp;
    }
    /**
     * @return the hpNo
     */
    public String getHpNo() {
        return hpNo;
    }
    /**
     * @param hpNo the hpNo to set
     */
    public void setHpNo(String hpNo) {
        this.hpNo = hpNo;
    }
    /**
     * @return the mathDocTp
     */
    public String getMathDocTp() {
        return mathDocTp;
    }
    /**
     * @param mathDocTp the mathDocTp to set
     */
    public void setMathDocTp(String mathDocTp) {
        this.mathDocTp = mathDocTp;
    }
    /**
     * @return the ssnCrnNo
     */
    public String getSsnCrnNo() {
        return ssnCrnNo;
    }
    /**
     * @param ssnCrnNo the ssnCrnNo to set
     */
    public void setSsnCrnNo(String ssnCrnNo) {
        this.ssnCrnNo = ssnCrnNo;
    }
    /**
     * @return the dstbChnCd
     */
    public String getDstbChnCd() {
        return dstbChnCd;
    }
    /**
     * @param dstbChnCd the dstbChnCd to set
     */
    public void setDstbChnCd(String dstbChnCd) {
        this.dstbChnCd = dstbChnCd;
    }
    /**
     * @return the retlTp
     */
    public String getRetlTp() {
        return retlTp;
    }
    /**
     * @param retlTp the retlTp to set
     */
    public void setRetlTp(String retlTp) {
        this.retlTp = retlTp;
    }
    /**
     * @return the cancReasonCd
     */
    public String getCancReasonCd() {
        return cancReasonCd;
    }
    /**
     * @param cancReasonCd the cancReasonCd to set
     */
    public void setCancReasonCd(String cancReasonCd) {
        this.cancReasonCd = cancReasonCd;
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
     * @return the tecId
     */
    public String getTecId() {
        return tecId;
    }
    /**
     * @param tecId the tecId to set
     */
    public void setTecId(String tecId) {
        this.tecId = tecId;
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
     * @return the carStatCd
     */
    public String getCarStatCd() {
        return carStatCd;
    }
    /**
     * @param carStatCd the carStatCd to set
     */
    public void setCarStatCd(String carStatCd) {
        this.carStatCd = carStatCd;
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
     * @return the contractDt
     */
    public Date getContractDt() {
        return contractDt;
    }
    /**
     * @param contractDt the contractDt to set
     */
    public void setContractDt(Date contractDt) {
        this.contractDt = contractDt;
    }
    /**
     * @return the dlReqDt
     */
    public Date getDlReqDt() {
        return dlReqDt;
    }
    /**
     * @param dlReqDt the dlReqDt to set
     */
    public void setDlReqDt(Date dlReqDt) {
        this.dlReqDt = dlReqDt;
    }
    /**
     * @return the giDt
     */
    public Date getGiDt() {
        return giDt;
    }
    /**
     * @param giDt the giDt to set
     */
    public void setGiDt(Date giDt) {
        this.giDt = giDt;
    }
    /**
     * @return the realDlDt
     */
    public Date getRealDlDt() {
        return realDlDt;
    }
    /**
     * @param realDlDt the realDlDt to set
     */
    public void setRealDlDt(Date realDlDt) {
        this.realDlDt = realDlDt;
    }
    /**
     * @return the tovrNm
     */
    public String getTovrNm() {
        return tovrNm;
    }
    /**
     * @param tovrNm the tovrNm to set
     */
    public void setTovrNm(String tovrNm) {
        this.tovrNm = tovrNm;
    }
    /**
     * @return the tovrRelCd
     */
    public String getTovrRelCd() {
        return tovrRelCd;
    }
    /**
     * @param tovrRelCd the tovrRelCd to set
     */
    public void setTovrRelCd(String tovrRelCd) {
        this.tovrRelCd = tovrRelCd;
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
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }
    /**
     * @return the spFlag
     */
    public String getSpFlag() {
        return spFlag;
    }
    /**
     * @param spFlag the spFlag to set
     */
    public void setSpFlag(String spFlag) {
        this.spFlag = spFlag;
    }
    /**
     * @return the carDstinCd
     */
    public String getCarDstinCd() {
        return carDstinCd;
    }
    /**
     * @param carDstinCd the carDstinCd to set
     */
    public void setCarDstinCd(String carDstinCd) {
        this.carDstinCd = carDstinCd;
    }

}
