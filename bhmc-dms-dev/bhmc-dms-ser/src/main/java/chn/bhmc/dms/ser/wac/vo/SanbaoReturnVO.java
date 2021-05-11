package chn.bhmc.dms.ser.wac.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName : SanbaoReturnVO.java
 * @Description : 삼보 반품신청 VO
 * @author Kwon ki hyun
 * @since 2016. 7. 26.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *  since   author description
 * =========== ============= ===========================
 * 2016. 7. 26.  Kwon ki hyun  최초 생성
 * </pre>
 */
@ValidDescriptor({

})
public class SanbaoReturnVO extends BaseVO{



    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -8319339625840551880L;

    /**
     * 딜러코드
     **/
    private String dlrCd;

    /**
     * 라인번호
     **/
    private int lineNo;

    /**
     * 반품요청일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date returnReqDt;

    /**
     * 차대번호
     **/
    private String vinNo;

    /**
     * 차대번호1
     **/
    private String vinNo1;

    /**
     * 차대번호2
     **/
    private String vinNo2;

    /**
     * LTS모델코드 (정비차종코드)
     **/
    private String ltsModelCd;

    /**
     * LTS모델명(정비차종명)
     */
    private String ltsModelNm;

    /**
     * 반품상태코드
     **/
    private String returnStatCd;

    /**
     * 차량소유자ID
     **/
    private String carOwnerId;

    /**
     * 차량소유자명
     **/
    private String carOwnerNm;

    /**
     * 차량접수문제내용
     **/
    private String carAcptPblmCont;

    /**
     * 담당딜러 ID
     **/
    private String dlrRespId;

    /**
     * 담당딜러 전화번호
     **/
    private String dlrRespTelNo;

    /**
     * 담당딜러 내용
     **/
    private String dlrRespCont;

    /**
     * 원인품목코드
     **/
    private String cauItemCd;

    /**
     * 원인품목명
     **/
    private String cauItemNm;

    /**
     * 파일키명
     **/
    private String fileKeyNm;

    /**
     * 요청구분유형
     **/
    private String reqDstinTp;

    /**
     * 반품구분유형
     **/
    private String returnDstinTp;

    private Double returnRate;

    private String preFixId;

    private String ifResltYn;




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

    /**
     * @return the preFixId
     */
    public String getPreFixId() {
        return preFixId;
    }

    /**
     * @param preFixId the preFixId to set
     */
    public void setPreFixId(String preFixId) {
        this.preFixId = preFixId;
    }

    /**
     * 접수일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date acptDt;

    /**
     * 판정일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date judgDt;

    /**
     * 생산일자
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date creDt;

    /**
     * 판매일자
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date saleDt;

    /**
     * 총 작업소요일
     */
    private String totWorkDay;

    /**
     * 삼포잔여기간 월
     */
    private String sanbaoRmMonth;

    /**
     * 삼포잔여기간 KM
     */
    private int sanbaoRmRunDistVal;


    /**
     * 반품승인번호
     **/
    private String returnApproveNo;

    /**
     * 법인의견내용
     **/
    private String corpOpnCont;

    /**
     * 차량인보이스금액
     **/
    private Double carInvcAmt;

    /**
     * 주행거리값
     **/
    private int lastRunDistVal;

    /**
     * 주행거리값
     **/
    private int runDistVal;

    /**
     * 감가상각률
     **/
    private Double dpcaAmt;

    /**
     * 고객부담금액
     **/
    private Double custBudnAmt;

    /**
     * 중고차평가금액
     **/
    private Double ocarEvalAmt;

    /**
     * 요청금액
     **/
    private Double reqAmt;

    /**
     * 딜러부담금액
     **/
    private Double dlrBudnAmt;

    /**
     * 법인부담금액
     **/
    private Double corpBudnAmt;

    /**
     * PWA사용여부
     **/
    private String pwaUseYn;

    /**
     * PWA승인번호
     **/
    private String pwaApproveNo;

    /**
     * 고객 증서유형
     */
    private String mathDocTp;

    /**
     * 고객 증서번호
     */
    private String ssnCrnNo;

    /**
     * 고객 증서번호
     */
    private String carOwnerHpNo;

    /**
     * 고객 E-MAIL
     */
    private String carOwnerEmailNm;

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
     * @return the lineNo
     */
    public int getLineNo() {
        return lineNo;
    }

    /**
     * @param lineNo the lineNo to set
     */
    public void setLineNo(int lineNo) {
        this.lineNo = lineNo;
    }

    /**
     * @return the returnReqDt
     */
    public Date getReturnReqDt() {
        return returnReqDt;
    }

    /**
     * @param returnReqDt the returnReqDt to set
     */
    public void setReturnReqDt(Date returnReqDt) {
        this.returnReqDt = returnReqDt;
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
     * @return the returnStatCd
     */
    public String getReturnStatCd() {
        return returnStatCd;
    }

    /**
     * @param returnStatCd the returnStatCd to set
     */
    public void setReturnStatCd(String returnStatCd) {
        this.returnStatCd = returnStatCd;
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
     * @return the carAcptPblmCont
     */
    public String getCarAcptPblmCont() {
        return carAcptPblmCont;
    }

    /**
     * @param carAcptPblmCont the carAcptPblmCont to set
     */
    public void setCarAcptPblmCont(String carAcptPblmCont) {
        this.carAcptPblmCont = carAcptPblmCont;
    }

    /**
     * @return the dlrRespId
     */
    public String getDlrRespId() {
        return dlrRespId;
    }

    /**
     * @param dlrRespId the dlrRespId to set
     */
    public void setDlrRespId(String dlrRespId) {
        this.dlrRespId = dlrRespId;
    }



    /**
     * @return the dlrRespTelNo
     */
    public String getDlrRespTelNo() {
        return dlrRespTelNo;
    }

    /**
     * @param dlrRespTelNo the dlrRespTelNo to set
     */
    public void setDlrRespTelNo(String dlrRespTelNo) {
        this.dlrRespTelNo = dlrRespTelNo;
    }

    /**
     * @return the dlrRespCont
     */
    public String getDlrRespCont() {
        return dlrRespCont;
    }

    /**
     * @param dlrRespCont the dlrRespCont to set
     */
    public void setDlrRespCont(String dlrRespCont) {
        this.dlrRespCont = dlrRespCont;
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
     * @return the reqDstinTp
     */
    public String getReqDstinTp() {
        return reqDstinTp;
    }

    /**
     * @param reqDstinTp the reqDstinTp to set
     */
    public void setReqDstinTp(String reqDstinTp) {
        this.reqDstinTp = reqDstinTp;
    }

    /**
     * @return the returnDstinTp
     */
    public String getReturnDstinTp() {
        return returnDstinTp;
    }

    /**
     * @param returnDstinTp the returnDstinTp to set
     */
    public void setReturnDstinTp(String returnDstinTp) {
        this.returnDstinTp = returnDstinTp;
    }

    /**
     * @return the acptDt
     */
    public Date getAcptDt() {
        return acptDt;
    }

    /**
     * @param acptDt the acptDt to set
     */
    public void setAcptDt(Date acptDt) {
        this.acptDt = acptDt;
    }

    /**
     * @return the judgDt
     */
    public Date getJudgDt() {
        return judgDt;
    }

    /**
     * @param judgDt the judgDt to set
     */
    public void setJudgDt(Date judgDt) {
        this.judgDt = judgDt;
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
     * @return the saleDt
     */
    public Date getSaleDt() {
        return saleDt;
    }

    /**
     * @param saleDt the saleDt to set
     */
    public void setSaleDt(Date saleDt) {
        this.saleDt = saleDt;
    }

    /**
     * @return the totWorkDay
     */
    public String getTotWorkDay() {
        return totWorkDay;
    }

    /**
     * @param totWorkDay the totWorkDay to set
     */
    public void setTotWorkDay(String totWorkDay) {
        this.totWorkDay = totWorkDay;
    }

    /**
     * @return the sanbaoRmMonth
     */
    public String getSanbaoRmMonth() {
        return sanbaoRmMonth;
    }

    /**
     * @param sanbaoRmMonth the sanbaoRmMonth to set
     */
    public void setSanbaoRmMonth(String sanbaoRmMonth) {
        this.sanbaoRmMonth = sanbaoRmMonth;
    }

    /**
     * @return the sanbaoRmRunDistVal
     */
    public int getSanbaoRmRunDistVal() {
        return sanbaoRmRunDistVal;
    }

    /**
     * @param sanbaoRmRunDistVal the sanbaoRmRunDistVal to set
     */
    public void setSanbaoRmRunDistVal(int sanbaoRmRunDistVal) {
        this.sanbaoRmRunDistVal = sanbaoRmRunDistVal;
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
     * @return the corpOpnCont
     */
    public String getCorpOpnCont() {
        return corpOpnCont;
    }

    /**
     * @param corpOpnCont the corpOpnCont to set
     */
    public void setCorpOpnCont(String corpOpnCont) {
        this.corpOpnCont = corpOpnCont;
    }

    /**
     * @return the carInvcAmt
     */
    public Double getCarInvcAmt() {
        return carInvcAmt;
    }

    /**
     * @param carInvcAmt the carInvcAmt to set
     */
    public void setCarInvcAmt(Double carInvcAmt) {
        this.carInvcAmt = carInvcAmt;
    }

    /**
     * @return the lastRunDistVal
     */
    public int getLastRunDistVal() {
        return lastRunDistVal;
    }

    /**
     * @param lastRunDistVal the lastRunDistVal to set
     */
    public void setLastRunDistVal(int lastRunDistVal) {
        this.lastRunDistVal = lastRunDistVal;
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
     * @return the dpcaAmt
     */
    public Double getDpcaAmt() {
        return dpcaAmt;
    }

    /**
     * @param dpcaAmt the dpcaAmt to set
     */
    public void setDpcaAmt(Double dpcaAmt) {
        this.dpcaAmt = dpcaAmt;
    }

    /**
     * @return the custBudnAmt
     */
    public Double getCustBudnAmt() {
        return custBudnAmt;
    }

    /**
     * @param custBudnAmt the custBudnAmt to set
     */
    public void setCustBudnAmt(Double custBudnAmt) {
        this.custBudnAmt = custBudnAmt;
    }

    /**
     * @return the ocarEvalAmt
     */
    public Double getOcarEvalAmt() {
        return ocarEvalAmt;
    }

    /**
     * @param ocarEvalAmt the ocarEvalAmt to set
     */
    public void setOcarEvalAmt(Double ocarEvalAmt) {
        this.ocarEvalAmt = ocarEvalAmt;
    }

    /**
     * @return the reqAmt
     */
    public Double getReqAmt() {
        return reqAmt;
    }

    /**
     * @param reqAmt the reqAmt to set
     */
    public void setReqAmt(Double reqAmt) {
        this.reqAmt = reqAmt;
    }

    /**
     * @return the dlrBudnAmt
     */
    public Double getDlrBudnAmt() {
        return dlrBudnAmt;
    }

    /**
     * @param dlrBudnAmt the dlrBudnAmt to set
     */
    public void setDlrBudnAmt(Double dlrBudnAmt) {
        this.dlrBudnAmt = dlrBudnAmt;
    }

    /**
     * @return the corpBudnAmt
     */
    public Double getCorpBudnAmt() {
        return corpBudnAmt;
    }

    /**
     * @param corpBudnAmt the corpBudnAmt to set
     */
    public void setCorpBudnAmt(Double corpBudnAmt) {
        this.corpBudnAmt = corpBudnAmt;
    }

    /**
     * @return the pwaUseYn
     */
    public String getPwaUseYn() {
        return pwaUseYn;
    }

    /**
     * @param pwaUseYn the pwaUseYn to set
     */
    public void setPwaUseYn(String pwaUseYn) {
        this.pwaUseYn = pwaUseYn;
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
     * @return the carOwnerHpNo
     */
    public String getCarOwnerHpNo() {
        return carOwnerHpNo;
    }

    /**
     * @param carOwnerHpNo the carOwnerHpNo to set
     */
    public void setCarOwnerHpNo(String carOwnerHpNo) {
        this.carOwnerHpNo = carOwnerHpNo;
    }

    /**
     * @return the carOwnerEmailNm
     */
    public String getCarOwnerEmailNm() {
        return carOwnerEmailNm;
    }

    /**
     * @param carOwnerEmailNm the carOwnerEmailNm to set
     */
    public void setCarOwnerEmailNm(String carOwnerEmailNm) {
        this.carOwnerEmailNm = carOwnerEmailNm;
    }

    /**
     * @return the returnRate
     */
    public Double getReturnRate() {
        return returnRate;
    }

    /**
     * @param returnRate the returnRate to set
     */
    public void setReturnRate(Double returnRate) {
        this.returnRate = returnRate;
    }




}
