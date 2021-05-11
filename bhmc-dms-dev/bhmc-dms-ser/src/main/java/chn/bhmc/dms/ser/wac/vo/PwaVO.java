package chn.bhmc.dms.ser.wac.vo;

import java.util.Date;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : PwaVO.java
 * @Description : PWA 상세 VO
 * @author Kwon Ki Hyun
 * @since 2016. 2. 26.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 26.     Kwon Ki Hyun     최초 생성
 * </pre>
 */

public class PwaVO extends BaseVO{


    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -5723623161443249733L;

    /**
     * 딜러코드
     */
    private String dlrCd;

    /**
     * 딜러명
     */
    private String dlrNm;

    /**
     * 차대번호
     */
    @NotBlank
    private String vinNo;

    /**
     * PWA NO
     */
    private String pwaDocNo;

    /**
     * PWA 상태
     */
    private String pwaStatCd;

    /**
     * PWA 상태명
     */
    private String pwaStatNm;

    /**
     * 원인작업항목
     */
    @NotBlank
    private String cauOperAtcCd;

    /**
     * 원인작업항목명
     */
    private String cauOperAtcNm;

    /**
     * 원인부품코드
     */
    private String cauItemCd;

    /**
     * 원인부품명
     */
    private String cauItemNm;

    /**
     *원인코드
     */
    private String cauCd;

    /**
     * 원인명
     */
    private String cauNm;

    /**
     * 현상코드
     */
    private String phenCd;

    /**
     * 현상명
     */
    private String phenNm;

    /**
     * 주행거리
     */
    private int runDistVal;

    /**
     * 고장현상내용
     */
    @Length(min=2, max=1300)
    @NotBlank
    private String errPhenCont;

    /**
     * 수리방법내용
     */
    @Length(min=2, max=1300)
    @NotBlank
    private String rpirMtdCont;

    /**
     * 반송사유내용
     */
    private String returnReasonCont;

    /**
     * PWA 유형코드1
     */
    @NotBlank
    private String pwaTpCd1;

    /**
     * PWA 유형코드2
     */
    private String pwaTpCd2;

    /**
     * 생산일자
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date creDt;

    /**
     * 보증수리일자
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date wartDt;

    /**
     * 保修结束日期
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date wartExpireDt;
    /**
     * 첨부파일키명
     */
    private String fileKeyNm;

    /**
     * 공임발생금액
     */
    private Double lbrOccrAmt;

    /**
     * 부품발생금액
     */
    private Double itemOccrAmt;

    /**
     * 외주발생금액
     */
    private Double subLbrOccrAmt;

    /**
     * 청구 합계금액
     */
    private Double totOccrAmt;

    /**
     * 딜러결재요청일자
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date dlrSignReqDt;

    /**
     * 딜러결재요청횟수
     */
    private int dlrSignReqCnt;

    /**
     * pwa 승인번호
     */
    private String pwaApproveNo;

    /**
     * 본사승인일자
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date hqApproveDt;

    /**
     * 공임승인금액
     */
    private Double lbrApproveAmt;

    /**
     * 부품승인금액
     */
    private Double itemApproveAmt;

    /**
     * 외주 승인금액
     */

    private Double subLbrApproveAmt;

    /**
     * 승인금액 합계
     */
    private Double totApproveAmt;

    /**
     * PWA 작성자 ID
     */
    private String pwaWrtrId;

    /**
     * PWA 작성자명
     */
    private String pwaWrtrNm;

    private String carRegNo; // 차량번호

    private String enginNo; //엔진번호

    private String carOwnerId; //고객ID

    private String carOwnerNm;//고객명

    private String carOwnerTelNo; //연락처

    private String carlineCd; //차종 코드
    
    private String ifResltYn; //인터페이스 데이터 존재여부 확인

    /**
     * PWA사용 내역
     */
    private String pwaUseYn;
    
    private int returnCnt;
    
    
    /**
     * PWA申请 csr 62 需求延保索赔申请类型的PWA申请单 贾明 2020-3-26
     * pwaRequiNo : 关联申请单号
     * calcDocNo   服务结算单号
     * relatedId   传参关联的标注识 S 代表需要校验
     */
    private String pwaRequiNo;
    private String calcDocNo;
    private String relatedId;
   

    public String getPwaUseYn() {
        return pwaUseYn;
    }

    public void setPwaUseYn(String pwaUseYn) {
        this.pwaUseYn = pwaUseYn;
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
     * 등록일자
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date regDt;

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
     * @return the cauOperAtcNm
     */
    public String getCauOperAtcNm() {
        return cauOperAtcNm;
    }

    /**
     * @param cauOperAtcNm the cauOperAtcNm to set
     */
    public void setCauOperAtcNm(String cauOperAtcNm) {
        this.cauOperAtcNm = cauOperAtcNm;
    }

    /**
     * @return the cauItemNm
     */
    public String getCauItemNm() {
        return cauItemNm;
    }

    /**
     * @param cauItemNm the cauItemNm to set
     */
    public void setCauItemNm(String cauItemNm) {
        this.cauItemNm = cauItemNm;
    }

    /**
     * @return the totOccrAmt
     */
    public Double getTotOccrAmt() {
        return totOccrAmt;
    }

    /**
     * @param totOccrAmt the totOccrAmt to set
     */
    public void setTotOccrAmt(Double totOccrAmt) {
        this.totOccrAmt = totOccrAmt;
    }

    /**
     * @return the subLbrApproveAmt
     */
    public Double getSubLbrApproveAmt() {
        return subLbrApproveAmt;
    }

    /**
     * @param subLbrApproveAmt the subLbrApproveAmt to set
     */
    public void setSubLbrApproveAmt(Double subLbrApproveAmt) {
        this.subLbrApproveAmt = subLbrApproveAmt;
    }



    /**
     * @return the totApproveAmt
     */
    public Double getTotApproveAmt() {
        return totApproveAmt;
    }

    /**
     * @param totApproveAmt the totApproveAmt to set
     */
    public void setTotApproveAmt(Double totApproveAmt) {
        this.totApproveAmt = totApproveAmt;
    }

    /**
     * @return the hqApproveId
     */
    public String getHqApproveId() {
        return hqApproveId;
    }

    /**
     * @param hqApproveId the hqApproveId to set
     */
    public void setHqApproveId(String hqApproveId) {
        this.hqApproveId = hqApproveId;
    }

    /**
     * @return the ltsModelCd
     */
    public String getLtsModelCd() {
        return ltsModelCd;
    }

    /**
     * @param ltsModelCd the ltsModelCd to set
     */
    public void setLtsModelCd(String ltsModelCd) {
        this.ltsModelCd = ltsModelCd;
    }

    /**
     * @return the ltsModelNm
     */
    public String getLtsModelNm() {
        return ltsModelNm;
    }

    /**
     * @param ltsModelNm the ltsModelNm to set
     */
    public void setLtsModelNm(String ltsModelNm) {
        this.ltsModelNm = ltsModelNm;
    }

    /**
     * 본사승인 ID
     */
    private String hqApproveId;

    /**
     * 본사 승인자명
     */
    private String hqApproveNm;

    /**
     * RO번호
     */
    private String roDocNo;

    /**
     * 승인사유내용
     */
    private String approveReasonCont;

    /**
     * 반품승인번호
     */

    private String returnApproveNo;

    /**
     * 반품승인번호 삭제여부
     */

    private String returnApproveNoYn;

    /**
     * LTS MODEL
     */
    private String ltsModelCd;

    /**
     * LTS MODEL NM
     */
    private String ltsModelNm;
    
    /**
     * 반송일자
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date returnDt;

    /**
     * 거절일자
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date rejectDt;
    

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
     * @return the pwaDocNo
     */
    public String getPwaDocNo() {
        return pwaDocNo;
    }

    /**
     * @param pwaDocNo the pwaDocNo to set
     */
    public void setPwaDocNo(String pwaDocNo) {
        this.pwaDocNo = pwaDocNo;
    }

    /**
     * @return the pwaStatCd
     */
    public String getPwaStatCd() {
        return pwaStatCd;
    }

    /**
     * @param pwaStatCd the pwaStatCd to set
     */
    public void setPwaStatCd(String pwaStatCd) {
        this.pwaStatCd = pwaStatCd;
    }



    /**
     * @return the pwaStatNm
     */
    public String getPwaStatNm() {
        return pwaStatNm;
    }

    /**
     * @param pwaStatNm the pwaStatNm to set
     */
    public void setPwaStatNm(String pwaStatNm) {
        this.pwaStatNm = pwaStatNm;
    }

    /**
     * @return the cauOperAtcCd
     */
    public String getCauOperAtcCd() {
        return cauOperAtcCd;
    }

    /**
     * @param cauOperAtcCd the cauOperAtcCd to set
     */
    public void setCauOperAtcCd(String cauOperAtcCd) {
        this.cauOperAtcCd = cauOperAtcCd;
    }

    /**
     * @return the cauItemCd
     */
    public String getCauItemCd() {
        return cauItemCd;
    }

    /**
     * @param cauItemCd the cauItemCd to set
     */
    public void setCauItemCd(String cauItemCd) {
        this.cauItemCd = cauItemCd;
    }

    /**
     * @return the cauCd
     */
    public String getCauCd() {
        return cauCd;
    }

    /**
     * @param cauCd the cauCd to set
     */
    public void setCauCd(String cauCd) {
        this.cauCd = cauCd;
    }

    /**
     * @return the cauNm
     */
    public String getCauNm() {
        return cauNm;
    }

    /**
     * @param cauNm the cauNm to set
     */
    public void setCauNm(String cauNm) {
        this.cauNm = cauNm;
    }

    /**
     * @return the phenCd
     */
    public String getPhenCd() {
        return phenCd;
    }

    /**
     * @param phenCd the phenCd to set
     */
    public void setPhenCd(String phenCd) {
        this.phenCd = phenCd;
    }

    /**
     * @return the phenNm
     */
    public String getPhenNm() {
        return phenNm;
    }

    /**
     * @param phenNm the phenNm to set
     */
    public void setPhenNm(String phenNm) {
        this.phenNm = phenNm;
    }

    /**
     * @return the runDistVal
     */
    public int getRunDistVal() {
        return runDistVal;
    }

    /**
     * @param runDistVal the runDistVal to set
     */
    public void setRunDistVal(int runDistVal) {
        this.runDistVal = runDistVal;
    }

    /**
     * @return the errPhenCont
     */
    public String getErrPhenCont() {
        return errPhenCont;
    }

    /**
     * @param errPhenCont the errPhenCont to set
     */
    public void setErrPhenCont(String errPhenCont) {
        this.errPhenCont = errPhenCont;
    }

    /**
     * @return the rpirMtdCont
     */
    public String getRpirMtdCont() {
        return rpirMtdCont;
    }

    /**
     * @param rpirMtdCont the rpirMtdCont to set
     */
    public void setRpirMtdCont(String rpirMtdCont) {
        this.rpirMtdCont = rpirMtdCont;
    }

    /**
     * @return the returnReasonCont
     */
    public String getReturnReasonCont() {
        return returnReasonCont;
    }

    /**
     * @param returnReasonCont the returnReasonCont to set
     */
    public void setReturnReasonCont(String returnReasonCont) {
        this.returnReasonCont = returnReasonCont;
    }

    /**
     * @return the pwaTpCd1
     */
    public String getPwaTpCd1() {
        return pwaTpCd1;
    }

    /**
     * @param pwaTpCd1 the pwaTpCd1 to set
     */
    public void setPwaTpCd1(String pwaTpCd1) {
        this.pwaTpCd1 = pwaTpCd1;
    }

    /**
     * @return the pwaTpCd2
     */
    public String getPwaTpCd2() {
        return pwaTpCd2;
    }

    /**
     * @param pwaTpCd2 the pwaTpCd2 to set
     */
    public void setPwaTpCd2(String pwaTpCd2) {
        this.pwaTpCd2 = pwaTpCd2;
    }

    /**
     * @return the creDt
     */
    public Date getCreDt() {
        return creDt;
    }

    /**
     * @param creDt the creDt to set
     */
    public void setCreDt(Date creDt) {
        this.creDt = creDt;
    }


    /**
     * @return the wartDt
     */
    public Date getWartDt() {
        return wartDt;
    }

    /**
     * @param wartDt the wartDt to set
     */
    public void setWartDt(Date wartDt) {
        this.wartDt = wartDt;
    }

    /**
     * @return the returnApproveNo
     */
    public String getReturnApproveNo() {
        return returnApproveNo;
    }

    /**
     * @param returnApproveNo the returnApproveNo to set
     */
    public void setReturnApproveNo(String returnApproveNo) {
        this.returnApproveNo = returnApproveNo;
    }

    /**
     * @return the returnApproveNoYn
     */
    public String getReturnApproveNoYn() {
        return returnApproveNoYn;
    }

    /**
     * @param returnApproveNoYn the returnApproveNoYn to set
     */
    public void setReturnApproveNoYn(String returnApproveNoYn) {
        this.returnApproveNoYn = returnApproveNoYn;
    }

    /**
     * @return the fileKeyNm
     */
    public String getFileKeyNm() {
        return fileKeyNm;
    }

    /**
     * @param fileKeyNm the fileKeyNm to set
     */
    public void setFileKeyNm(String fileKeyNm) {
        this.fileKeyNm = fileKeyNm;
    }

    /**
     * @return the lbrOccrAmt
     */
    public Double getLbrOccrAmt() {
        return lbrOccrAmt;
    }

    /**
     * @param lbrOccrAmt the lbrOccrAmt to set
     */
    public void setLbrOccrAmt(Double lbrOccrAmt) {
        this.lbrOccrAmt = lbrOccrAmt;
    }

    /**
     * @return the itemOccrAmt
     */
    public Double getItemOccrAmt() {
        return itemOccrAmt;
    }

    /**
     * @param itemOccrAmt the itemOccrAmt to set
     */
    public void setItemOccrAmt(Double itemOccrAmt) {
        this.itemOccrAmt = itemOccrAmt;
    }

    /**
     * @return the subLbrOccrAmt
     */
    public Double getSubLbrOccrAmt() {
        return subLbrOccrAmt;
    }

    /**
     * @param subLbrOccrAmt the subLbrOccrAmt to set
     */
    public void setSubLbrOccrAmt(Double subLbrOccrAmt) {
        this.subLbrOccrAmt = subLbrOccrAmt;
    }

    /**
     * @return the dlrSignReqDt
     */
    public Date getDlrSignReqDt() {
        return dlrSignReqDt;
    }

    /**
     * @param dlrSignReqDt the dlrSignReqDt to set
     */
    public void setDlrSignReqDt(Date dlrSignReqDt) {
        this.dlrSignReqDt = dlrSignReqDt;
    }

    /**
     * @return the dlrSignReqCnt
     */
    public int getDlrSignReqCnt() {
        return dlrSignReqCnt;
    }

    /**
     * @param dlrSignReqCnt the dlrSignReqCnt to set
     */
    public void setDlrSignReqCnt(int dlrSignReqCnt) {
        this.dlrSignReqCnt = dlrSignReqCnt;
    }

    /**
     * @return the pwaApproveNo
     */
    public String getPwaApproveNo() {
        return pwaApproveNo;
    }

    /**
     * @param pwaApproveNo the pwaApproveNo to set
     */
    public void setPwaApproveNo(String pwaApproveNo) {
        this.pwaApproveNo = pwaApproveNo;
    }

    /**
     * @return the hqApproveDt
     */
    public Date getHqApproveDt() {
        return hqApproveDt;
    }

    /**
     * @param hqApproveDt the hqApproveDt to set
     */
    public void setHqApproveDt(Date hqApproveDt) {
        this.hqApproveDt = hqApproveDt;
    }

    /**
     * @return the lbrApproveAmt
     */
    public Double getLbrApproveAmt() {
        return lbrApproveAmt;
    }

    /**
     * @param lbrApproveAmt the lbrApproveAmt to set
     */
    public void setLbrApproveAmt(Double lbrApproveAmt) {
        this.lbrApproveAmt = lbrApproveAmt;
    }

    /**
     * @return the itemApproveAmt
     */
    public Double getItemApproveAmt() {
        return itemApproveAmt;
    }

    /**
     * @param itemApproveAmt the itemApproveAmt to set
     */
    public void setItemApproveAmt(Double itemApproveAmt) {
        this.itemApproveAmt = itemApproveAmt;
    }

    /**
     * @return the pwaWrtrId
     */
    public String getPwaWrtrId() {
        return pwaWrtrId;
    }

    /**
     * @param pwaWrtrId the pwaWrtrId to set
     */
    public void setPwaWrtrId(String pwaWrtrId) {
        this.pwaWrtrId = pwaWrtrId;
    }

    /**
     * @return the pwaWrtrNm
     */
    public String getPwaWrtrNm() {
        return pwaWrtrNm;
    }

    /**
     * @param pwaWrtrNm the pwaWrtrNm to set
     */
    public void setPwaWrtrNm(String pwaWrtrNm) {
        this.pwaWrtrNm = pwaWrtrNm;
    }

    /**
     * @return the hqApproveNm
     */
    public String getHqApproveNm() {
        return hqApproveNm;
    }

    /**
     * @param hqApproveNm the hqApproveNm to set
     */
    public void setHqApproveNm(String hqApproveNm) {
        this.hqApproveNm = hqApproveNm;
    }

    /**
     * @return the roDocNo
     */
    public String getRoDocNo() {
        return roDocNo;
    }

    /**
     * @param roDocNo the roDocNo to set
     */
    public void setRoDocNo(String roDocNo) {
        this.roDocNo = roDocNo;
    }

    /**
     * @return the approveReasonCont
     */
    public String getApproveReasonCont() {
        return approveReasonCont;
    }

    /**
     * @param approveReasonCont the approveReasonCont to set
     */
    public void setApproveReasonCont(String approveReasonCont) {
        this.approveReasonCont = approveReasonCont;
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
     * @return the carOwnerId
     */
    public String getCarOwnerId() {
        return carOwnerId;
    }

    /**
     * @param carOwnerId the carOwnerId to set
     */
    public void setCarOwnerId(String carOwnerId) {
        this.carOwnerId = carOwnerId;
    }

    /**
     * @return the carOwnerNm
     */
    public String getCarOwnerNm() {
        return carOwnerNm;
    }

    /**
     * @param carOwnerNm the carOwnerNm to set
     */
    public void setCarOwnerNm(String carOwnerNm) {
        this.carOwnerNm = carOwnerNm;
    }

    /**
     * @return the carOwnerTelNo
     */
    public String getCarOwnerTelNo() {
        return carOwnerTelNo;
    }

    /**
     * @param carOwnerTelNo the carOwnerTelNo to set
     */
    public void setCarOwnerTelNo(String carOwnerTelNo) {
        this.carOwnerTelNo = carOwnerTelNo;
    }

    /**
     * @return the ifResltYn
     */
    public String getIfResltYn() {
        return ifResltYn;
    }

    /**
     * @param ifResltYn the ifResltYn to set
     */
    public void setIfResltYn(String ifResltYn) {
        this.ifResltYn = ifResltYn;
    }

    public int getReturnCnt() {
        return returnCnt;
    }

    public void setReturnCnt(int returnCnt) {
        this.returnCnt = returnCnt;
    }

    public Date getReturnDt() {
        return returnDt;
    }

    public void setReturnDt(Date returnDt) {
        this.returnDt = returnDt;
    }

    public Date getRejectDt() {
        return rejectDt;
    }

    public void setRejectDt(Date rejectDt) {
        this.rejectDt = rejectDt;
    }

	public String getPwaRequiNo() {
		return pwaRequiNo;
	}

	public void setPwaRequiNo(String pwaRequiNo) {
		this.pwaRequiNo = pwaRequiNo;
	}

	public String getCalcDocNo() {
		return calcDocNo;
	}

	public void setCalcDocNo(String calcDocNo) {
		this.calcDocNo = calcDocNo;
	}

	public String getRelatedId() {
		return relatedId;
	}

	public void setRelatedId(String relatedId) {
		this.relatedId = relatedId;
	}

	public Date getWartExpireDt() {
		return wartExpireDt;
	}

	public void setWartExpireDt(Date wartExpireDt) {
		this.wartExpireDt = wartExpireDt;
	}


}
