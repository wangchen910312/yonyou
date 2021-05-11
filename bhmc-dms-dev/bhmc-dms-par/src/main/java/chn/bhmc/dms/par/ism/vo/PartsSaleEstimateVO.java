package chn.bhmc.dms.par.ism.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : PurcSaleEstimateVO.java
 * @Description : PurcSaleEstimateVO.class
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

public class PartsSaleEstimateVO extends BaseVO{

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
     * 부품판매견적번호
     **/
    private String estimateDocNo;

    /**
     * 상태코드
     **/
    private String statCd;

    /**
     * 견적일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date              estimateDt;

    /**
     * 판매유형
     **/
    private String   saleTp;

    /**
     * 고객유형
     **/
    private String custTp;

    /**
     * 고객코드
     **/
    private String custNo;

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
     * SALE_PRSN_ID
     **/
    private String salePrsnId;

    /**
     * SAL_PRSN_NM
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
     * 수정일시(UPDATE시 가능여부 체크용)
     **/
    private String updtDtStr;

    /**
     * VIN번호
     **/
    private String vinNo;

    /**
     * 차량등록번호
     **/
    private String carRegNo;

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
     * @return the estimateDocNo
     */
    public String getEstimateDocNo() {
        return estimateDocNo;
    }

    /**
     * @param estimateDocNo the estimateDocNo to set
     */
    public void setEstimateDocNo(String estimateDocNo) {
        this.estimateDocNo = estimateDocNo;
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
     * @return the estimateDt
     */
    public Date getEstimateDt() {
        return estimateDt;
    }

    /**
     * @param estimateDt the estimateDt to set
     */
    public void setEstimateDt(Date estimateDt) {
        this.estimateDt = estimateDt;
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
     * @param salPrsnId the salePrsnId to set
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
}
