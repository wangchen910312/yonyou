package chn.bhmc.dms.par.ism.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : PurcOrdVO.java
 * @Description : PurcOrdVO.class
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

@ValidDescriptor({
    @ValidField(field="dlrCd", mesgKey="par.lbl.dlrCd")
    ,@ValidField(field="parSaleOrdNo", mesgKey="par.lbl.parSaleOrdNo")
    ,@ValidField(field="ordStatCd" , mesgKey="par.lbl.ordStat")
    ,@ValidField(field="ordDt", mesgKey="par.lbl.orderDt")
    ,@ValidField(field="saleTp", mesgKey="par.lbl.saleType")
    ,@ValidField(field="custTp", mesgKey="par.lbl.custTp")
    ,@ValidField(field="custCd", mesgKey="par.lbl.custCd")
    ,@ValidField(field="custNm", mesgKey="par.lbl.custNm")
    ,@ValidField(field="custTelNo", mesgKey="par.title.venderTel")
    ,@ValidField(field="saId", mesgKey="par.lbl.prsNm")
    ,@ValidField(field="remark", mesgKey="par.lbl.remark")
    ,@ValidField(field="dcRate", mesgKey="par.lbl.dcRate")
    ,@ValidField(field="dcBefTotAmt", mesgKey="par.lbl.totAmtBefDc")
    ,@ValidField(field="dcAmt", mesgKey="sal.lbl.dcAmt")
    ,@ValidField(field="totAmt", mesgKey="par.lbl.totAmt")
    ,@ValidField(field="vatAmt", mesgKey="par.lbl.vatAmt")
    ,@ValidField(field="cancReasonCd", mesgKey="par.lbl.cancReasonCd")
    ,@ValidField(field="cancReasonRemark", mesgKey="par.lbl.cancReasonCd")
})
public class PartsSaleOrdVO extends BaseVO{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -6071720494896446459L;

    /**
     * 저장 성공실패 여부
     **/
    private boolean resultYn;

    /**
     * 딜러코드
     **/
    private String dlrCd;

    /**
     * 부품판매오더번호
     **/
    private String parSaleOrdNo;

    /**
     * 반품판매오더번호
     **/
    private String returnDocNo;

    /**
     * 부품판매오더 정산번호
     **/
    private String calcDocNo;

    /**
     * 부품판매오더 정산상태
     **/
    private String calcStatCd;

    /**
     * 블루멤버쉽 사용금액
     **/
    private Double parBmPointUseAmt;

    /**
     * 딜러멤버쉽 사용금액
     **/
    private Double parPointUseAmt;

    /**
     * 딜러멤버쉽 사용금액
     **/
    private Double pointTotAmt;

    /**
     * 기타할인율 금액
     **/
    private Double parEtcDcAmt;

    /**
     * 정산 총 합계금액
     **/
    private Double parCalcSumAmt;

    /**
     * 부품할인율(정산정보)
     **/
    private Double parDcRate;

    /**
     * 부품할인금액(정산정보)
     **/
    private Double parDcAmt;

    /**
     * 부품정산금액
     **/
    private Double parCalcAmt;

    /**
     * 수납대상금액
     **/
    private Double paymAmt;

    /**
     * 오더상태코드
     **/
    private String ordStatCd;

    /**
     * 오더일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date ordDt;

    /**
     * 정산일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date calcDt;

    /**
     * 정산완료일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date calcEndDt;

    /**
     * 정산취소일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date calcCancDt;

    /**
     * 취소일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date cancDt;

    /**
     * 반품일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date returnDt;

    /**
     * 판매유형
     **/
    private String saleTp;

    /**
     * 고객유형
     **/
    private String custTp;

    /**
     * 고객코드
     **/
    private String custCd;

    /**
     * 고객명
     **/
    private String custNm;

    /**
     * 고객전화번호
     **/
    private String custTelNo;

    /**
     * SA_ID
     **/
    private String saId;

    /**
     * SA_NM
     **/
    private String saNm;

    /**
     * CANC_ID
     **/
    private String cancId;

    /**
     * CANC_NM
     **/
    private String cancNm;

    /**
     * CALC_COMP_USR_ID
     **/
    private String calcCompUsrId;

    /**
     * CALC_COMP_USR_NM
     **/
    private String calcCompUsrNm;

    /**
     * CALC_USR_ID
     **/
    private String calcUsrId;

    /**
     * CALC_USR_NM
     **/
    private String calcUsrNm;

    /**
     * CALC_CANC_ID
     **/
    private String calcCancId;

    /**
     * CALC_CANC_NM
     **/
    private String calcCancNm;

    /**
     * RETURN_ID
     **/
    private String returnId;

    /**
     * SA_NM
     **/
    private String returnNm;

    /**
     * SALE_PRSN_ID
     **/
    private String salePrsnId;

    /**
     * SALE_PRSN_NM
     **/
    private String salePrsnNm;

    /**
     * 비고
     **/
    private String remark;

    /**
     * 할인율
     **/
    private Double dcRate;

    /**
     * 할인전총금액
     **/
    private Double dcBefTotAmt;

    /**
     * 할인금액
     **/
    private Double dcAmt;

    /**
     * 총금액
     **/
    private Double totAmt;

    /**
     * 부가세금액
     **/
    private Double vatAmt;

    /**
     * 품목건수
     **/
    private Double itemCnt;

    /**
     * 품목수량
     **/
    private Double itemQty;

    /**
     * 품목금액
     **/
    private Double itemAmt;

    /**
     * 반품품목건수
     **/
    private Double returnItemCnt;

    /**
     * 반품품목수량
     **/
    private Double returnItemQty;

    /**
     * 반품품목금액
     **/
    private Double returnItemAmt;

    /**
     * 취소사유코드
     **/
    private String cancReasonCd;

    /**
     * 취소사유비고
     **/
    private String cancReasonRemark;

    /**
     * 수불문서년월일자
     **/
    private String mvtDocYyMm;

    /**
     * 수불문서번호
     **/
    private String mvtDocNo;

    /**
     * 참조번호
     **/
    private String refDocNo;

    /**
     * 수정일시(UPDATE시 가능여부 체크용)
     **/
    private String updtDtStr;

    /**
     * 기타할인번호
     **/
    private String etcDcCd;

    /**
     * 기타할인유형
     **/
    private String etcDcTp;

    /**
     * 이동평균금액
     **/
    private  Double movingAvgAmt;

    /**
     * 이평가금액(세금미포함)
     **/
    private  Double movingAvgTaxDdctAmt;
    
    private String carRegNo;

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
     * @return the parSaleOrdNo
     */
    public String getParSaleOrdNo() {
        return parSaleOrdNo;
    }

    /**
     * @param parSaleOrdNo the parSaleOrdNo to set
     */
    public void setParSaleOrdNo(String parSaleOrdNo) {
        this.parSaleOrdNo = parSaleOrdNo;
    }

    /**
     * @return the ordStatCd
     */
    public String getOrdStatCd() {
        return ordStatCd;
    }

    /**
     * @param ordStatCd the ordStatCd to set
     */
    public void setOrdStatCd(String ordStatCd) {
        this.ordStatCd = ordStatCd;
    }

    /**
     * @return the ordDt
     */
    public Date getOrdDt() {
        return ordDt;
    }

    /**
     * @param ordDt the ordDt to set
     */
    public void setOrdDt(Date ordDt) {
        this.ordDt = ordDt;
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
     * @return the returnDt
     */
    public Date getReturnDt() {
        return returnDt;
    }

    /**
     * @param returnDt the returnDt to set
     */
    public void setReturnDt(Date returnDt) {
        this.returnDt = returnDt;
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
     * @return the custCd
     */
    public String getCustCd() {
        return custCd;
    }

    /**
     * @param custCd the custCd to set
     */
    public void setCustCd(String custCd) {
        this.custCd = custCd;
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
     * @return the custTelNo
     */
    public String getCustTelNo() {
        return custTelNo;
    }

    /**
     * @param custTelNo the custTelNo to set
     */
    public void setCustTelNo(String custTelNo) {
        this.custTelNo = custTelNo;
    }

    /**
     * @return the saId
     */
    public String getSaId() {
        return saId;
    }

    /**
     * @param saId the saId to set
     */
    public void setSaId(String saId) {
        this.saId = saId;
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
     * @return the dcRate
     */
    public Double getDcRate() {
        return dcRate;
    }

    /**
     * @param dcRate the dcRate to set
     */
    public void setDcRate(Double dcRate) {
        this.dcRate = dcRate;
    }

    /**
     * @return the dcBefTotAmt
     */
    public Double getDcBefTotAmt() {
        return dcBefTotAmt;
    }

    /**
     * @param dcBefTotAmt the dcBefTotAmt to set
     */
    public void setDcBefTotAmt(Double dcBefTotAmt) {
        this.dcBefTotAmt = dcBefTotAmt;
    }

    /**
     * @return the dcAmt
     */
    public Double getDcAmt() {
        return dcAmt;
    }

    /**
     * @param dcAmt the dcAmt to set
     */
    public void setDcAmt(Double dcAmt) {
        this.dcAmt = dcAmt;
    }

    /**
     * @return the totAmt
     */
    public Double getTotAmt() {
        return totAmt;
    }

    /**
     * @param totAmt the totAmt to set
     */
    public void setTotAmt(Double totAmt) {
        this.totAmt = totAmt;
    }

    /**
     * @return the vatAmt
     */
    public Double getVatAmt() {
        return vatAmt;
    }

    /**
     * @param vatAmt the vatAmt to set
     */
    public void setVatAmt(Double vatAmt) {
        this.vatAmt = vatAmt;
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
     * @return the cancReasonRemark
     */
    public String getCancReasonRemark() {
        return cancReasonRemark;
    }

    /**
     * @param cancReasonRemark the cancReasonRemark to set
     */
    public void setCancReasonRemark(String cancReasonRemark) {
        this.cancReasonRemark = cancReasonRemark;
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
     * @return the saNm
     */
    public String getSaNm() {
        return saNm;
    }

    /**
     * @param saNm the saNm to set
     */
    public void setSaNm(String saNm) {
        this.saNm = saNm;
    }


    /**
     * @return the salePrsnId
     */
    public String getSalePrsnId() {
        return salePrsnId;
    }

    /**
     * @param salePrsnId the salePrsnId to set
     */
    public void setSalePrsnId(String salePrsnId) {
        this.salePrsnId = salePrsnId;
    }

    /**
     * @return the salePrsnNm
     */
    public String getSalePrsnNm() {
        return salePrsnNm;
    }

    /**
     * @param salePrsnNm the salePrsnNm to set
     */
    public void setSalePrsnNm(String salePrsnNm) {
        this.salePrsnNm = salePrsnNm;
    }

    /**
     * @return the cancId
     */
    public String getCancId() {
        return cancId;
    }

    /**
     * @param cancId the cancId to set
     */
    public void setCancId(String cancId) {
        this.cancId = cancId;
    }

    /**
     * @return the cancNm
     */
    public String getCancNm() {
        return cancNm;
    }

    /**
     * @param cancNm the cancNm to set
     */
    public void setCancNm(String cancNm) {
        this.cancNm = cancNm;
    }

    /**
     * @return the returnId
     */
    public String getReturnId() {
        return returnId;
    }

    /**
     * @param returnId the returnId to set
     */
    public void setReturnId(String returnId) {
        this.returnId = returnId;
    }

    /**
     * @return the returnNm
     */
    public String getReturnNm() {
        return returnNm;
    }

    /**
     * @param returnNm the returnNm to set
     */
    public void setReturnNm(String returnNm) {
        this.returnNm = returnNm;
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
     * @return the refDocNo
     */
    public String getRefDocNo() {
        return refDocNo;
    }

    /**
     * @param refDocNo the refDocNo to set
     */
    public void setRefDocNo(String refDocNo) {
        this.refDocNo = refDocNo;
    }

    /**
     * @return the calcDocNo
     */
    public String getCalcDocNo() {
        return calcDocNo;
    }

    /**
     * @param calcDocNo the calcDocNo to set
     */
    public void setCalcDocNo(String calcDocNo) {
        this.calcDocNo = calcDocNo;
    }

    /**
     * @return the itemCnt
     */
    public Double getItemCnt() {
        return itemCnt;
    }

    /**
     * @param itemCnt the itemCnt to set
     */
    public void setItemCnt(Double itemCnt) {
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
     * @return the itemAmt
     */
    public Double getItemAmt() {
        return itemAmt;
    }

    /**
     * @param itemAmt the itemAmt to set
     */
    public void setItemAmt(Double itemAmt) {
        this.itemAmt = itemAmt;
    }

    /**
     * @return the returnDocNo
     */
    public String getReturnDocNo() {
        return returnDocNo;
    }

    /**
     * @param returnDocNo the returnDocNo to set
     */
    public void setReturnDocNo(String returnDocNo) {
        this.returnDocNo = returnDocNo;
    }

    /**
     * @return the returnItemCnt
     */
    public Double getReturnItemCnt() {
        return returnItemCnt;
    }

    /**
     * @param returnItemCnt the returnItemCnt to set
     */
    public void setReturnItemCnt(Double returnItemCnt) {
        this.returnItemCnt = returnItemCnt;
    }

    /**
     * @return the returnItemQty
     */
    public Double getReturnItemQty() {
        return returnItemQty;
    }

    /**
     * @param returnItemQty the returnItemQty to set
     */
    public void setReturnItemQty(Double returnItemQty) {
        this.returnItemQty = returnItemQty;
    }

    /**
     * @return the returnItemAmt
     */
    public Double getReturnItemAmt() {
        return returnItemAmt;
    }

    /**
     * @param returnItemAmt the returnItemAmt to set
     */
    public void setReturnItemAmt(Double returnItemAmt) {
        this.returnItemAmt = returnItemAmt;
    }

    /**
     * @return the calcDt
     */
    public Date getCalcDt() {
        return calcDt;
    }

    /**
     * @param calcDt the calcDt to set
     */
    public void setCalcDt(Date calcDt) {
        this.calcDt = calcDt;
    }

    /**
     * @return the calcStatCd
     */
    public String getCalcStatCd() {
        return calcStatCd;
    }

    /**
     * @param calcStatCd the calcStatCd to set
     */
    public void setCalcStatCd(String calcStatCd) {
        this.calcStatCd = calcStatCd;
    }

    /**
     * @return the parBmPointUseAmt
     */
    public Double getParBmPointUseAmt() {
        return parBmPointUseAmt;
    }

    /**
     * @param parBmPointUseAmt the parBmPointUseAmt to set
     */
    public void setParBmPointUseAmt(Double parBmPointUseAmt) {
        this.parBmPointUseAmt = parBmPointUseAmt;
    }

    /**
     * @return the parPointUseAmt
     */
    public Double getParPointUseAmt() {
        return parPointUseAmt;
    }

    /**
     * @param parPointUseAmt the parPointUseAmt to set
     */
    public void setParPointUseAmt(Double parPointUseAmt) {
        this.parPointUseAmt = parPointUseAmt;
    }

    /**
     * @return the parEtcDcAmt
     */
    public Double getParEtcDcAmt() {
        return parEtcDcAmt;
    }

    /**
     * @param parEtcDcAmt the parEtcDcAmt to set
     */
    public void setParEtcDcAmt(Double parEtcDcAmt) {
        this.parEtcDcAmt = parEtcDcAmt;
    }

    /**
     * @return the parCalcSumAmt
     */
    public Double getParCalcSumAmt() {
        return parCalcSumAmt;
    }

    /**
     * @param parCalcSumAmt the parCalcSumAmt to set
     */
    public void setParCalcSumAmt(Double parCalcSumAmt) {
        this.parCalcSumAmt = parCalcSumAmt;
    }

    /**
     * @return the parDcRate
     */
    public Double getParDcRate() {
        return parDcRate;
    }

    /**
     * @param parDcRate the parDcRate to set
     */
    public void setParDcRate(Double parDcRate) {
        this.parDcRate = parDcRate;
    }

    /**
     * @return the parDcAmt
     */
    public Double getParDcAmt() {
        return parDcAmt;
    }

    /**
     * @param parDcAmt the parDcAmt to set
     */
    public void setParDcAmt(Double parDcAmt) {
        this.parDcAmt = parDcAmt;
    }

    /**
     * @return the parCalcAmt
     */
    public Double getParCalcAmt() {
        return parCalcAmt;
    }

    /**
     * @param parCalcAmt the parCalcAmt to set
     */
    public void setParCalcAmt(Double parCalcAmt) {
        this.parCalcAmt = parCalcAmt;
    }

    /**
     * @return the updtDtStr
     */
    public String getUpdtDtStr() {
        return updtDtStr;
    }

    /**
     * @param updtDtStr the updtDtStr to set
     */
    public void setUpdtDtStr(String updtDtStr) {
        this.updtDtStr = updtDtStr;
    }

    /**
     * @return the etcDcCd
     */
    public String getEtcDcCd() {
        return etcDcCd;
    }

    /**
     * @param etcDcCd the etcDcCd to set
     */
    public void setEtcDcCd(String etcDcCd) {
        this.etcDcCd = etcDcCd;
    }

    /**
     * @return the etcDcTp
     */
    public String getEtcDcTp() {
        return etcDcTp;
    }

    /**
     * @param etcDcTp the etcDcTp to set
     */
    public void setEtcDcTp(String etcDcTp) {
        this.etcDcTp = etcDcTp;
    }

    /**
     * @return the pointTotAmt
     */
    public Double getPointTotAmt() {
        return pointTotAmt;
    }

    /**
     * @param pointTotAmt the pointTotAmt to set
     */
    public void setPointTotAmt(Double pointTotAmt) {
        this.pointTotAmt = pointTotAmt;
    }

    /**
     * @return the calcEndDt
     */
    public Date getCalcEndDt() {
        return calcEndDt;
    }

    /**
     * @param calcEndDt the calcEndDt to set
     */
    public void setCalcEndDt(Date calcEndDt) {
        this.calcEndDt = calcEndDt;
    }

    /**
     * @return the calcCancDt
     */
    public Date getCalcCancDt() {
        return calcCancDt;
    }

    /**
     * @param calcCancDt the calcCancDt to set
     */
    public void setCalcCancDt(Date calcCancDt) {
        this.calcCancDt = calcCancDt;
    }

    /**
     * @return the calcCompUsrId
     */
    public String getCalcCompUsrId() {
        return calcCompUsrId;
    }

    /**
     * @param calcCompUsrId the calcCompUsrId to set
     */
    public void setCalcCompUsrId(String calcCompUsrId) {
        this.calcCompUsrId = calcCompUsrId;
    }

    /**
     * @return the calcCompUsrNm
     */
    public String getCalcCompUsrNm() {
        return calcCompUsrNm;
    }

    /**
     * @param calcCompUsrNm the calcCompUsrNm to set
     */
    public void setCalcCompUsrNm(String calcCompUsrNm) {
        this.calcCompUsrNm = calcCompUsrNm;
    }

    /**
     * @return the calcCancId
     */
    public String getCalcCancId() {
        return calcCancId;
    }

    /**
     * @param calcCancId the calcCancId to set
     */
    public void setCalcCancId(String calcCancId) {
        this.calcCancId = calcCancId;
    }

    /**
     * @return the calcCancNm
     */
    public String getCalcCancNm() {
        return calcCancNm;
    }

    /**
     * @param calcCancNm the calcCancNm to set
     */
    public void setCalcCancNm(String calcCancNm) {
        this.calcCancNm = calcCancNm;
    }

    /**
     * @return the calcUsrId
     */
    public String getCalcUsrId() {
        return calcUsrId;
    }

    /**
     * @param calcUsrId the calcUsrId to set
     */
    public void setCalcUsrId(String calcUsrId) {
        this.calcUsrId = calcUsrId;
    }

    /**
     * @return the calcUsrNm
     */
    public String getCalcUsrNm() {
        return calcUsrNm;
    }

    /**
     * @param calcUsrNm the calcUsrNm to set
     */
    public void setCalcUsrNm(String calcUsrNm) {
        this.calcUsrNm = calcUsrNm;
    }

    /**
     * @return the paymAmt
     */
    public Double getPaymAmt() {
        return paymAmt;
    }

    /**
     * @param paymAmt the paymAmt to set
     */
    public void setPaymAmt(Double paymAmt) {
        this.paymAmt = paymAmt;
    }

    /**
     * @return the movingAvgAmt
     */
    public Double getMovingAvgAmt() {
        return movingAvgAmt;
    }

    /**
     * @param movingAvgAmt the movingAvgAmt to set
     */
    public void setMovingAvgAmt(Double movingAvgAmt) {
        this.movingAvgAmt = movingAvgAmt;
    }

    /**
     * @return the movingAvgTaxDdctAmt
     */
    public Double getMovingAvgTaxDdctAmt() {
        return movingAvgTaxDdctAmt;
    }

    /**
     * @param movingAvgTaxDdctAmt the movingAvgTaxDdctAmt to set
     */
    public void setMovingAvgTaxDdctAmt(Double movingAvgTaxDdctAmt) {
        this.movingAvgTaxDdctAmt = movingAvgTaxDdctAmt;
    }

	public String getCarRegNo() {
		return carRegNo;
	}

	public void setCarRegNo(String carRegNo) {
		this.carRegNo = carRegNo;
	}

}
