package chn.bhmc.dms.sal.fas.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CoercionApprovalVO.java
 * @Description : 강제판매승인 VO
 * @author Jin Suk Kim
 * @since 2016. 3. 22.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 22.     Jin Suk Kim     최초 생성
 * </pre>
 */

public class CoercionApprovalVO extends BaseVO{
    private static final long serialVersionUID = 8835548827065572989L;

    private int seq;                						// 일련번호
    private String reqStatCd;       						// 요청상태 (승인/불승인 상태 여부)
    private String dlrCd;									// 딜러코드
    private String dlrNm;									// 딜러명
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date  reqDt;									// 신청일자
    private String fceSaleReqReasonCd;  					// 강제판매신청사유
    private String reasonTp;								// 사유유형
    private String contractNo;								// 계약번호
    private String carlineCd;								// 차종코드
    private String carlineNm;								// 차종명
    private String modelCd;                                 // 차관코드
    private String modelNm;                                 // 차관명
    private String vinNo;									// 차대번호
    private String vinNo1;									// 차대번호1
    private String vinNo2;									// 차대번호2
    private String rfidNo;									// RFID NO
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date realDlDt;   								// 실제고객 인도일
    private String approveYn;   							// 심사여부
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date approveDt;								// 승인일자
    private String fileDocNo;   							// 첨부파일
    private String updtUsrId;   							// 수정자
    private String approveId;   							// 승인자id
    private String contractCustNo;							// 고객번호
    private String contractCustNm;							// 고객명
    private String sdptCd;                                  // 사업부코드
    private String sdptNm;                                  // 사업부명
    private String distOfficeCd;                            // 사무소코드
    private String distOfficeNm;                            // 사무소명
    private String regUsrId;                                // 사용자성명
    private String ronum;                                   // 순번
    private String saleEmpNo;
    private String ordTp;
    
    private String carTaxReceiptNo;                         // 영수증유무(기동차)
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date  carTaxReceiptIssDt;                       // 영수증일자(기동차)
    private String carTaxTaxpayerIdCd;                      // 납세자번호(기동차)
    private String etcTaxReceiptNo;                         // 영수증유무(증치세)
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date etcTaxReceiptIssDt;                        // 영수증일자(증치세)
    private String etcTaxTaxpayerIdCd;                      // 납세자번호(증치세)
    
    private String carTaxReceiptYn; 						// 是否有发票(机动车统一发票)
    private String etcTaxReceiptYn;							// 是否有发票(增值税发票)
    private String reqStatNm;                               // 审核状态名称
    
    /**
     * @return the ronum
     */
    public String getRonum() {
        return ronum;
    }
    /**
     * @param ronum the ronum to set
     */
    public void setRonum(String ronum) {
        this.ronum = ronum;
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
    public String getReasonTp() {
		return reasonTp;
	}
	public void setReasonTp(String reasonTp) {
		this.reasonTp = reasonTp;
	}
	public String getContractNo() {
		return contractNo;
	}
	public void setContractNo(String contractNo) {
		this.contractNo = contractNo;
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
     * @return the approveId
     */
    public String getApproveId() {
        return approveId;
    }
    /**
     * @param approveId the approveId to set
     */
    public void setApproveId(String approveId) {
        this.approveId = approveId;
    }
    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }
    /**
     * @return the sdptCd
     */
    public String getSdptCd() {
        return sdptCd;
    }
    /**
     * @return the sdptNm
     */
    public String getSdptNm() {
        return sdptNm;
    }
    /**
     * @return the distOfficeCd
     */
    public String getDistOfficeCd() {
        return distOfficeCd;
    }
    /**
     * @return the distOfficeNm
     */
    public String getDistOfficeNm() {
        return distOfficeNm;
    }
    /**
     * @param sdptCd the sdptCd to set
     */
    public void setSdptCd(String sdptCd) {
        this.sdptCd = sdptCd;
    }
    /**
     * @param sdptNm the sdptNm to set
     */
    public void setSdptNm(String sdptNm) {
        this.sdptNm = sdptNm;
    }
    /**
     * @param distOfficeCd the distOfficeCd to set
     */
    public void setDistOfficeCd(String distOfficeCd) {
        this.distOfficeCd = distOfficeCd;
    }
    /**
     * @param distOfficeNm the distOfficeNm to set
     */
    public void setDistOfficeNm(String distOfficeNm) {
        this.distOfficeNm = distOfficeNm;
    }
    /**
     * @return the modelCd
     */
    public String getModelCd() {
        return modelCd;
    }
    /**
     * @return the modelNm
     */
    public String getModelNm() {
        return modelNm;
    }
    /**
     * @param modelCd the modelCd to set
     */
    public void setModelCd(String modelCd) {
        this.modelCd = modelCd;
    }
    /**
     * @param modelNm the modelNm to set
     */
    public void setModelNm(String modelNm) {
        this.modelNm = modelNm;
    }
    /**
     * @return the saleEmpNo
     */
    public String getSaleEmpNo() {
        return saleEmpNo;
    }
    /**
     * @return the ordTp
     */
    public String getOrdTp() {
        return ordTp;
    }
    /**
     * @param saleEmpNo the saleEmpNo to set
     */
    public void setSaleEmpNo(String saleEmpNo) {
        this.saleEmpNo = saleEmpNo;
    }
    /**
     * @param ordTp the ordTp to set
     */
    public void setOrdTp(String ordTp) {
        this.ordTp = ordTp;
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
     * @return the carTaxReceiptNo
     */
    public String getCarTaxReceiptNo() {
        return carTaxReceiptNo;
    }
    /**
     * @param carTaxReceiptNo the carTaxReceiptNo to set
     */
    public void setCarTaxReceiptNo(String carTaxReceiptNo) {
        this.carTaxReceiptNo = carTaxReceiptNo;
    }
    /**
     * @return the carTaxReceiptIssDt
     */
    public Date getCarTaxReceiptIssDt() {
        return carTaxReceiptIssDt;
    }
    /**
     * @param carTaxReceiptIssDt the carTaxReceiptIssDt to set
     */
    public void setCarTaxReceiptIssDt(Date carTaxReceiptIssDt) {
        this.carTaxReceiptIssDt = carTaxReceiptIssDt;
    }
    /**
     * @return the carTaxTaxpayerIdCd
     */
    public String getCarTaxTaxpayerIdCd() {
        return carTaxTaxpayerIdCd;
    }
    /**
     * @param carTaxTaxpayerIdCd the carTaxTaxpayerIdCd to set
     */
    public void setCarTaxTaxpayerIdCd(String carTaxTaxpayerIdCd) {
        this.carTaxTaxpayerIdCd = carTaxTaxpayerIdCd;
    }
    /**
     * @return the etcTaxReceiptNo
     */
    public String getEtcTaxReceiptNo() {
        return etcTaxReceiptNo;
    }
    /**
     * @param etcTaxReceiptNo the etcTaxReceiptNo to set
     */
    public void setEtcTaxReceiptNo(String etcTaxReceiptNo) {
        this.etcTaxReceiptNo = etcTaxReceiptNo;
    }
    /**
     * @return the etcTaxReceiptIssDt
     */
    public Date getEtcTaxReceiptIssDt() {
        return etcTaxReceiptIssDt;
    }
    /**
     * @param etcTaxReceiptIssDt the etcTaxReceiptIssDt to set
     */
    public void setEtcTaxReceiptIssDt(Date etcTaxReceiptIssDt) {
        this.etcTaxReceiptIssDt = etcTaxReceiptIssDt;
    }
    /**
     * @return the etcTaxTaxpayerIdCd
     */
    public String getEtcTaxTaxpayerIdCd() {
        return etcTaxTaxpayerIdCd;
    }
    /**
     * @param etcTaxTaxpayerIdCd the etcTaxTaxpayerIdCd to set
     */
    public void setEtcTaxTaxpayerIdCd(String etcTaxTaxpayerIdCd) {
        this.etcTaxTaxpayerIdCd = etcTaxTaxpayerIdCd;
    }
    
	public String getCarTaxReceiptYn() {
		return carTaxReceiptYn;
	}
	
	public void setCarTaxReceiptYn(String carTaxReceiptYn) {
		this.carTaxReceiptYn = carTaxReceiptYn;
	}
	
	public String getEtcTaxReceiptYn() {
		return etcTaxReceiptYn;
	}
	
	public void setEtcTaxReceiptYn(String etcTaxReceiptYn) {
		this.etcTaxReceiptYn = etcTaxReceiptYn;
	}
	
	public String getReqStatNm() {
		return reqStatNm;
	}
	
	public void setReqStatNm(String reqStatNm) {
		this.reqStatNm = reqStatNm;
	}
	
    
}