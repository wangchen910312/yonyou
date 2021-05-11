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
 * @ClassName   : ContDeliveryVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author yewon.kim
 * @since 2016. 10. 23
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 10. 23     yewon.kim             최초 생성
 *
 * </pre>
 */

public class ContDeliveryVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 2924692645434750515L;


    //계약정보 목록
    private String dlrCd;						//딜러코드
    private String contractNo;					//계약번호
    private String beforeNo;                    //예판번호
    private String contractCustNo;				//계약고객번호
    private String contractCustNm;				//계약고객명
    private String saleEmpNo;					//판매고문번호
    private String saleEmpNm;					//판매고문이름
    private String hpNo;						//전화번호
    private String carlineCd;					//차종코드
    private String carlineNm;					//차종명
    private String carlineEnNm;					//CRS76 不能申请充电装的订单类型，除了试驾车N7以外，现在又增加了新的订单类型的需求，具体明细见  贾明2020-5-9 适用车型
    private String fscCd;                       //차관코드
    private String fscNm;                       //차관명
    private String modelCd;						//모델코드
    private String modelNm;						//모델명
    private String ocnCd;						//OCN코드
    private String ocnNm;						//OCN명
    private String extColorCd;					//외장색코드
    private String extColorNm;					//외장색명
    private String intColorCd;					//내장색코드
    private String intColorNm;					//내장색명
    private String contractVinNo;				//임시점용VIN
    private String grpContractNo;				//집단판매계약번호
    private String saleOpptNo;					//판매기회번호
    private String saleOpptSeq;                 //판매기회일련번호
    private String ssnCrnNo;					//신분증번호
    private String contractStatCd;				//계약상태
    private String saleTp;						//
    private String contractTp;
    private String reqUsrId;
    private String updtUsrId;
    private int kmseq;
    private String kmopt;
    private String befSaleOpptNo;
    private String befSaleOpptSeq;

    //차량정보 목록
    private String carId;						//CAR ID
    private String vinNo;						//VIN NO
    private String vinNo1;						//VIN NO1
    private String vinNo2;						//VIN NO2
    private String rfidNo;						//RFID NO
    private String cmpCarDstinCd;				//회사차유형
    private String cmpCarYn;					//회사차여부
    private String ordTp;						//오더유형(소매유형)
    private String blockYn;						//BLOCK여부
    private String blockSaleAdvNo;              //블락 판매고문
    private String damageCd;                    //차량손상코드
    private String fceSaleReqReasonCd;			//이상출고사유
    private String reqStatCd;					//요청상태
    private String expAprYn;					//심사상태
    private String retlTpCd;					//소매유형코드
    private String carStatCd;					//차량상태

    private String fileDocNo;                   // 이상출고 문서
    private int    seq;
    private String carRegNo;                    // 차량등록번호
    private String enginNo;                     // 엔진번호
    private String certNo;                      // 합격증번호
    private String temp4;                       // 보증일자구분(S:판매,I영수증,B:BWMS)

    //출고취소
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date realDlDt;						//실제인도일자
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date reqDt;							//출고취소신청일자
    private String approveYn;					//심사상태
    private String deliveryGb;					//출고구분
    private String cancReasonCd;				//취소사유
    private String tecId;						//테크멘션ID
    private String ownStatCd;                   //차량상태

    //기타
    private String spFlag;
    private String gubun;

    private String errorMessage;				//ERP 출고취소 요청 수신에러메세지
    private int    successCntThis;
    private int    errorCntThis;
    private int    successCntNext;
    private int    errorCntNext;

	private double msPrc;                      // 지도가
	private double promotionAmt;               // 할인가
	private String setFlag;                    // 계약차량여부
	@JsonDeserialize(using=JsonDateDeserializer.class)
	private Date approveDt;                    // 심사일자
	private String crcReqYn;                   // 이상출고심사여부
	private String statCd;                     // 스캔정보

	private String receiptNo1;                  // 기동차 영수증번호
	private String receiptNo2;                  // 기동차 영수증번호

	private String temp1;
	private String temp2;
	private String temp3;
	private String temp5;
	private String temp6;
	private String temp7;
	private String temp8;
	private String temp9;
	private String temp10;

	private String skipYn;             //스캔매핑없이 출고가능여부
	private String zfnewen;
	private String zfnewsub;
	
    public String getZfnewen() {
		return zfnewen;
	}
	public void setZfnewen(String zfnewen) {
		this.zfnewen = zfnewen;
	}
	public String getZfnewsub() {
		return zfnewsub;
	}
	public void setZfnewsub(String zfnewsub) {
		this.zfnewsub = zfnewsub;
	}
	/**
     * @return the befSaleOpptNo
     */
    public String getBefSaleOpptNo() {
        return befSaleOpptNo;
    }
    /**
     * @param befSaleOpptNo the befSaleOpptNo to set
     */
    public void setBefSaleOpptNo(String befSaleOpptNo) {
        this.befSaleOpptNo = befSaleOpptNo;
    }
	/**
     * @return the befSaleOpptSeq
     */
    public String getBefSaleOpptSeq() {
        return befSaleOpptSeq;
    }
    /**
     * @param befSaleOpptSeq the befSaleOpptSeq to set
     */
    public void setBefSaleOpptSeq(String befSaleOpptSeq) {
        this.befSaleOpptSeq = befSaleOpptSeq;
    }
    /**
     * @return the setFlag
     */
    public String getSetFlag() {
        return setFlag;
    }
    /**
     * @param setFlag the setFlag to set
     */
    public void setSetFlag(String setFlag) {
        this.setFlag = setFlag;
    }
    public Date getRealDlDt() {
		return realDlDt;
	}
	public void setRealDlDt(Date realDlDt) {
		this.realDlDt = realDlDt;
	}
	public int getSuccessCntThis() {
		return successCntThis;
	}
	public void setSuccessCntThis(int successCntThis) {
		this.successCntThis = successCntThis;
	}
	public int getErrorCntThis() {
		return errorCntThis;
	}
	public void setErrorCntThis(int errorCntThis) {
		this.errorCntThis = errorCntThis;
	}
	public int getSuccessCntNext() {
		return successCntNext;
	}
	public void setSuccessCntNext(int successCntNext) {
		this.successCntNext = successCntNext;
	}
	public int getErrorCntNext() {
		return errorCntNext;
	}
	public void setErrorCntNext(int errorCntNext) {
		this.errorCntNext = errorCntNext;
	}
	public String getContractTp() {
		return contractTp;
	}
	public void setContractTp(String contractTp) {
		this.contractTp = contractTp;
	}
	public String getReqUsrId() {
		return reqUsrId;
	}
	public void setReqUsrId(String reqUsrId) {
		this.reqUsrId = reqUsrId;
	}
	public String getUpdtUsrId() {
		return updtUsrId;
	}
	public void setUpdtUsrId(String updtUsrId) {
		this.updtUsrId = updtUsrId;
	}
	public String getCarId() {
		return carId;
	}
	public void setCarId(String carId) {
		this.carId = carId;
	}
	public String getTecId() {
		return tecId;
	}
	public void setTecId(String tecId) {
		this.tecId = tecId;
	}
    public String getOwnStatCd() {
        return ownStatCd;
    }
    public void setOwnStatCd(String ownStatCd) {
        this.ownStatCd = ownStatCd;
    }
    public String getCancReasonCd() {
		return cancReasonCd;
	}
	public void setCancReasonCd(String cancReasonCd) {
		this.cancReasonCd = cancReasonCd;
	}
	public String getDeliveryGb() {
		return deliveryGb;
	}
	public void setDeliveryGb(String deliveryGb) {
		this.deliveryGb = deliveryGb;
	}
	public Date getReqDt() {
		return reqDt;
	}
	public void setReqDt(Date reqDt) {
		this.reqDt = reqDt;
	}
	public String getApproveYn() {
		return approveYn;
	}
	public void setApproveYn(String approveYn) {
		this.approveYn = approveYn;
	}
	public String getGubun() {
		return gubun;
	}
	public void setGubun(String gubun) {
		this.gubun = gubun;
	}
	public String getSaleTp() {
		return saleTp;
	}
	public void setSaleTp(String saleTp) {
		this.saleTp = saleTp;
	}
	public String getCarStatCd() {
		return carStatCd;
	}
	public void setCarStatCd(String carStatCd) {
		this.carStatCd = carStatCd;
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
     * @return the carRegNo
     */
    public String getCarRegNo() {
        return carRegNo;
    }
    /**
     * @param carRegNo the carRegNo to set
     */
    public void setCarRegNo(String carRegNo) {
        this.carRegNo = carRegNo;
    }
    /**
     * @return the enginNo
     */
    public String getEnginNo() {
        return enginNo;
    }
    /**
     * @param enginNo the enginNo to set
     */
    public void setEnginNo(String enginNo) {
        this.enginNo = enginNo;
    }
    /**
     * @return the certNo
     */
    public String getCertNo() {
        return certNo;
    }
    /**
     * @param certNo the certNo to set
     */
    public void setCertNo(String certNo) {
        this.certNo = certNo;
    }
    /**
     * @return the temp4
     */
    public String getTemp4() {
        return temp4;
    }
    /**
     * @param temp4 the temp4 to set
     */
    public void setTemp4(String temp4) {
        this.temp4 = temp4;
    }
    public String getContractStatCd() {
		return contractStatCd;
	}
	public void setContractStatCd(String contractStatCd) {
		this.contractStatCd = contractStatCd;
	}
	public String getRetlTpCd() {
		return retlTpCd;
	}
	public void setRetlTpCd(String retlTpCd) {
		this.retlTpCd = retlTpCd;
	}
	public String getSpFlag() {
		return spFlag;
	}
	public void setSpFlag(String spFlag) {
		this.spFlag = spFlag;
	}
	public String getSsnCrnNo() {
		return ssnCrnNo;
	}
	public void setSsnCrnNo(String ssnCrnNo) {
		this.ssnCrnNo = ssnCrnNo;
	}
	public String getSaleOpptNo() {
		return saleOpptNo;
	}
	public void setSaleOpptNo(String saleOpptNo) {
		this.saleOpptNo = saleOpptNo;
	}
    public String getSaleOpptSeq() {
        return saleOpptSeq;
    }
    public void setSaleOpptSeq(String saleOpptSeq) {
        this.saleOpptSeq = saleOpptSeq;
    }
    public String getGrpContractNo() {
		return grpContractNo;
	}
	public void setGrpContractNo(String grpContractNo) {
		this.grpContractNo = grpContractNo;
	}
	public String getDlrCd() {
		return dlrCd;
	}
	public void setDlrCd(String dlrCd) {
		this.dlrCd = dlrCd;
	}
	public String getVinNo1() {
		return vinNo1;
	}
	public void setVinNo1(String vinNo1) {
		this.vinNo1 = vinNo1;
	}
	public String getVinNo2() {
		return vinNo2;
	}
	public void setVinNo2(String vinNo2) {
		this.vinNo2 = vinNo2;
	}
	public String getVinNo() {
		return vinNo;
	}
	public void setVinNo(String vinNo) {
		this.vinNo = vinNo;
	}
	public String getRfidNo() {
		return rfidNo;
	}
	public void setRfidNo(String rfidNo) {
		this.rfidNo = rfidNo;
	}
	public String getCmpCarDstinCd() {
		return cmpCarDstinCd;
	}
	public void setCmpCarDstinCd(String cmpCarDstinCd) {
		this.cmpCarDstinCd = cmpCarDstinCd;
	}
	public String getCmpCarYn() {
		return cmpCarYn;
	}
	public void setCmpCarYn(String cmpCarYn) {
		this.cmpCarYn = cmpCarYn;
	}
	public String getOrdTp() {
		return ordTp;
	}
	public void setOrdTp(String ordTp) {
		this.ordTp = ordTp;
	}
	public String getBlockYn() {
		return blockYn;
	}
	public void setBlockYn(String blockYn) {
		this.blockYn = blockYn;
	}
	/**
     * @return the blockSaleAdvNo
     */
    public String getBlockSaleAdvNo() {
        return blockSaleAdvNo;
    }
    /**
     * @param blockSaleAdvNo the blockSaleAdvNo to set
     */
    public void setBlockSaleAdvNo(String blockSaleAdvNo) {
        this.blockSaleAdvNo = blockSaleAdvNo;
    }
    public String getDamageCd() {
        return damageCd;
    }
    public void setDamageCd(String damageCd) {
        this.damageCd = damageCd;
    }
    public String getFceSaleReqReasonCd() {
		return fceSaleReqReasonCd;
	}
	public void setFceSaleReqReasonCd(String fceSaleReqReasonCd) {
		this.fceSaleReqReasonCd = fceSaleReqReasonCd;
	}
	public String getReqStatCd() {
		return reqStatCd;
	}
	public void setReqStatCd(String reqStatCd) {
		this.reqStatCd = reqStatCd;
	}
	public String getExpAprYn() {
		return expAprYn;
	}
	public void setExpAprYn(String expAprYn) {
		this.expAprYn = expAprYn;
	}
	public String getOcnCd() {
		return ocnCd;
	}
	public void setOcnCd(String ocnCd) {
		this.ocnCd = ocnCd;
	}
	public String getOcnNm() {
		return ocnNm;
	}
	public void setOcnNm(String ocnNm) {
		this.ocnNm = ocnNm;
	}
	public String getExtColorCd() {
		return extColorCd;
	}
	public void setExtColorCd(String extColorCd) {
		this.extColorCd = extColorCd;
	}
	public String getExtColorNm() {
		return extColorNm;
	}
	public void setExtColorNm(String extColorNm) {
		this.extColorNm = extColorNm;
	}
	public String getIntColorCd() {
		return intColorCd;
	}
	public void setIntColorCd(String intColorCd) {
		this.intColorCd = intColorCd;
	}
	public String getIntColorNm() {
		return intColorNm;
	}
	public void setIntColorNm(String intColorNm) {
		this.intColorNm = intColorNm;
	}
	public String getContractVinNo() {
		return contractVinNo;
	}
	public void setContractVinNo(String contractVinNo) {
		this.contractVinNo = contractVinNo;
	}
	public String getCarlineCd() {
		return carlineCd;
	}
	public void setCarlineCd(String carlineCd) {
		this.carlineCd = carlineCd;
	}
	public String getCarlineNm() {
		return carlineNm;
	}
	public void setCarlineNm(String carlineNm) {
		this.carlineNm = carlineNm;
	}
    public String getFscCd() {
        return fscCd;
    }
    public void setFscCd(String fscCd) {
        this.fscCd = fscCd;
    }
    public String getFscNm() {
        return fscNm;
    }
    public void setFscNm(String fscNm) {
        this.fscNm = fscNm;
    }
    public String getModelCd() {
		return modelCd;
	}
	public void setModelCd(String modelCd) {
		this.modelCd = modelCd;
	}
	public String getModelNm() {
		return modelNm;
	}
	public void setModelNm(String modelNm) {
		this.modelNm = modelNm;
	}
	public String getHpNo() {
		return hpNo;
	}
	public void setHpNo(String hpNo) {
		this.hpNo = hpNo;
	}
	public String getContractCustNo() {
		return contractCustNo;
	}
	public void setContractCustNo(String contractCustNo) {
		this.contractCustNo = contractCustNo;
	}
	public String getContractCustNm() {
		return contractCustNm;
	}
	public void setContractCustNm(String contractCustNm) {
		this.contractCustNm = contractCustNm;
	}
	public String getSaleEmpNo() {
		return saleEmpNo;
	}
	public void setSaleEmpNo(String saleEmpNo) {
		this.saleEmpNo = saleEmpNo;
	}
	public String getSaleEmpNm() {
		return saleEmpNm;
	}
	public void setSaleEmpNm(String saleEmpNm) {
		this.saleEmpNm = saleEmpNm;
	}
	public String getContractNo() {
		return contractNo;
	}
	public void setContractNo(String contractNo) {
		this.contractNo = contractNo;
	}
    /**
     * @return the beforeNo
     */
    public String getBeforeNo() {
        return beforeNo;
    }
    /**
     * @param beforeNo the beforeNo to set
     */
    public void setBeforeNo(String beforeNo) {
        this.beforeNo = beforeNo;
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
     * @return the msPrc
     */
    public double getMsPrc() {
        return msPrc;
    }
    /**
     * @param msPrc the msPrc to set
     */
    public void setMsPrc(double msPrc) {
        this.msPrc = msPrc;
    }
    /**
     * @return the promotionAmt
     */
    public double getPromotionAmt() {
        return promotionAmt;
    }
    /**
     * @param promotionAmt the promotionAmt to set
     */
    public void setPromotionAmt(double promotionAmt) {
        this.promotionAmt = promotionAmt;
    }
    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
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
     * @return the crcReqYn
     */
    public String getCrcReqYn() {
        return crcReqYn;
    }
    /**
     * @param crcReqYn the crcReqYn to set
     */
    public void setCrcReqYn(String crcReqYn) {
        this.crcReqYn = crcReqYn;
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
     * @return the receiptNo1
     */
    public String getReceiptNo1() {
        return receiptNo1;
    }
    /**
     * @param receiptNo1 the receiptNo1 to set
     */
    public void setReceiptNo1(String receiptNo1) {
        this.receiptNo1 = receiptNo1;
    }
    /**
     * @return the receiptNo2
     */
    public String getReceiptNo2() {
        return receiptNo2;
    }
    /**
     * @param receiptNo2 the receiptNo2 to set
     */
    public void setReceiptNo2(String receiptNo2) {
        this.receiptNo2 = receiptNo2;
    }
    /**
     * @return the kmseq
     */
    public int getKmseq() {
        return kmseq;
    }
    /**
     * @param kmseq the kmseq to set
     */
    public void setKmseq(int kmseq) {
        this.kmseq = kmseq;
    }
    /**
     * @return the kmopt
     */
    public String getKmopt() {
        return kmopt;
    }
    /**
     * @param kmopt the kmopt to set
     */
    public void setKmopt(String kmopt) {
        this.kmopt = kmopt;
    }
    /**
     * @return the temp1
     */
    public String getTemp1() {
        return temp1;
    }
    /**
     * @param temp1 the temp1 to set
     */
    public void setTemp1(String temp1) {
        this.temp1 = temp1;
    }
    /**
     * @return the temp2
     */
    public String getTemp2() {
        return temp2;
    }
    /**
     * @param temp2 the temp2 to set
     */
    public void setTemp2(String temp2) {
        this.temp2 = temp2;
    }
    /**
     * @return the temp3
     */
    public String getTemp3() {
        return temp3;
    }
    /**
     * @param temp3 the temp3 to set
     */
    public void setTemp3(String temp3) {
        this.temp3 = temp3;
    }
    /**
     * @return the temp5
     */
    public String getTemp5() {
        return temp5;
    }
    /**
     * @param temp5 the temp5 to set
     */
    public void setTemp5(String temp5) {
        this.temp5 = temp5;
    }
    /**
     * @return the temp6
     */
    public String getTemp6() {
        return temp6;
    }
    /**
     * @param temp6 the temp6 to set
     */
    public void setTemp6(String temp6) {
        this.temp6 = temp6;
    }
    /**
     * @return the temp7
     */
    public String getTemp7() {
        return temp7;
    }
    /**
     * @param temp7 the temp7 to set
     */
    public void setTemp7(String temp7) {
        this.temp7 = temp7;
    }
    /**
     * @return the temp8
     */
    public String getTemp8() {
        return temp8;
    }
    /**
     * @param temp8 the temp8 to set
     */
    public void setTemp8(String temp8) {
        this.temp8 = temp8;
    }
    /**
     * @return the temp9
     */
    public String getTemp9() {
        return temp9;
    }
    /**
     * @param temp9 the temp9 to set
     */
    public void setTemp9(String temp9) {
        this.temp9 = temp9;
    }
    /**
     * @return the temp10
     */
    public String getTemp10() {
        return temp10;
    }
    /**
     * @param temp10 the temp10 to set
     */
    public void setTemp10(String temp10) {
        this.temp10 = temp10;
    }
    /**
     * @return the skipYn
     */
    public String getSkipYn() {
        return skipYn;
    }
    /**
     * @param skipYn the skipYn to set
     */
    public void setSkipYn(String skipYn) {
        this.skipYn = skipYn;
    }
	public String getCarlineEnNm() {
		return carlineEnNm;
	}
	public void setCarlineEnNm(String carlineEnNm) {
		this.carlineEnNm = carlineEnNm;
	}

}