package chn.bhmc.dms.par.pcm.vo;

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
 * @ClassName   : ReceiveEtcVO.java
 * @Description : ReceiveEtcVO.class
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
     @ValidField(field="dlrCd"       , mesgKey="par.lbl.dlrCd")
    ,@ValidField(field="etcGrDocNo"  , mesgKey="par.lbl.etcGrDocNo")
    ,@ValidField(field="statCd"      , mesgKey="par.lbl.statNm")
    ,@ValidField(field="mvtTp"       , mesgKey="par.lbl.mvtTp")
    ,@ValidField(field="pltCd"       , mesgKey="par.lbl.pltCd")
    ,@ValidField(field="bpCd"        , mesgKey="par.lbl.bpCd")
    ,@ValidField(field="remark"      , mesgKey="par.lbl.remark")
   })
public class ReceiveEtcVO extends BaseVO{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -6071720494896446459L;

    /**
     * 저장 성공실패 여부
     **/
    private  boolean resultYn;

    /**
     * 딜러코드
     **/
    private  String dlrCd;

    /**
     * 기타입고문서번호
     **/
    private  String etcGrDocNo;

    /**
     * 참조문서번호
     **/
    private  String refDocNo;

    /**
     * 입고문서업무구분
     */
    private String etcGrDocTp;

    /**
     * 상태코드
     **/
    //STAT_CD
    private  String statCd;

    /**
     * 반환상태
     **/
    //RETURN_STAT
    private  String returnStat;

    /**
     * 수불유형
     **/
    //MVT_TP
    private  String mvtTp;

    /**
     * 센터코드
     **/
    //PLT_CD
    private  String pltCd;

    /**
     * 거래처코드
     **/
    //BP_CD
    private  String bpCd;

    /**
     * 거래처코드
     **/
    //BP_NM
    private  String bpNm;

    /**
     * 등록자명
     **/
    //REG_USR_NM
    private  String regUsrNm;

    /**
     * 비고
     **/
    //REMARK
    private  String remark;

    /**
     * 품목건수
     **/
    //ITEM_CNT
    private  Double itemCnt;

    /**
     * 품목수량
     **/
    //ITEM_QTY
    private  Double itemQty;

    /**
     * 반품수량
     **/
    //RETURN_QTY
    private  Double returnQty;

    /**
     * 부가세 제외 총금액
     **/
    //GR_TAX_DDCT_AMT
    private  Double grTaxDdctAmt;

    /**
     * 총금액
     **/
    //GR_TOT_AMT
    private  Double grTotAmt;

    /**
     * 세액
     **/
    //GR_TAX_AMT
    private  Double grTaxAmt;

    /**
     * 부가세
     **/
    //VAT_AMT
    private  Double vatAmt;

    /**
     * 할인율
     **/
    //DC_RATE
    private  Double dcRate;

    /**
     * 기반품수량(합)
     **/
    //PRE_RETURN_QTY
    private  Double preReturnQty;

    /**
     * 기반품금액합
     **/
    //PRE_RETURN_AMT
    private  Double preReturnAmt;

    /**
     * 반품건수
     **/
    //RETURN_ITEM_CNT
    private  Double returnItemCnt;

    /**
     * 반품수량(합)
     **/
    //RETURN_ITEM_QTY
    private  Double returnItemQty;

    /**
     * 반품금액(합)
     **/
    //RETURN_TOT_AMT
    private  Double returnTotAmt;

    /**
     * 반품금액(합)
     **/
    //RETURN_TAX_DDCT_AMT
    private  Double returnTaxDdctAmt;

    /**
     * 반품세금(합)
     **/
    //RETURN_TAX_AMT
    private  Double returnTaxAmt;

    /**
     * 반품이동평균총금액
     **/
    //RETURN_MOVING_AVG_TOT_AMT
    private  Double returnMovingAvgTotAmt;


    /**
     * 수정일시(UPDATE시 가능여부 체크용)
     **/
    //UPDT_DT_STR
    private  String          updtDtStr;

    /**
     * 입고일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date grDt;

    /**
     * 반품일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date returnDt;

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
     * @return the etcGrDocNo
     */
    public String getEtcGrDocNo() {
        return etcGrDocNo;
    }

    /**
     * @param etcGrDocNo the etcGrDocNo to set
     */
    public void setEtcGrDocNo(String etcGrDocNo) {
        this.etcGrDocNo = etcGrDocNo;
    }

    /**
     * @return the etcGrDocTp
     */
    public String getEtcGrDocTp() {
        return etcGrDocTp;
    }

    /**
     * @param etcGrDocTp the etcGrDocTp to set
     */
    public void setEtcGrDocTp(String etcGrDocTp) {
        this.etcGrDocTp = etcGrDocTp;
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
     * @return the mvtTp
     */
    public String getMvtTp() {
        return mvtTp;
    }

    /**
     * @param mvtTp the mvtTp to set
     */
    public void setMvtTp(String mvtTp) {
        this.mvtTp = mvtTp;
    }

    /**
     * @return the pltCd
     */
    public String getPltCd() {
        return pltCd;
    }

    /**
     * @param pltCd the pltCd to set
     */
    public void setPltCd(String pltCd) {
        this.pltCd = pltCd;
    }

    /**
     * @return the bpCd
     */
    public String getBpCd() {
        return bpCd;
    }

    /**
     * @param bpCd the bpCd to set
     */
    public void setBpCd(String bpCd) {
        this.bpCd = bpCd;
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
     * @return the bpNm
     */
    public String getBpNm() {
        return bpNm;
    }

    /**
     * @param bpNm the bpNm to set
     */
    public void setBpNm(String bpNm) {
        this.bpNm = bpNm;
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
     * @return the grDt
     */
    public Date getGrDt() {
        return grDt;
    }

    /**
     * @param grDt the grDt to set
     */
    public void setGrDt(Date grDt) {
        this.grDt = grDt;
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
     * @return the grTaxDdctAmt
     */
    public Double getGrTaxDdctAmt() {
        return grTaxDdctAmt;
    }

    /**
     * @param grTaxDdctAmt the grTaxDdctAmt to set
     */
    public void setGrTaxDdctAmt(Double grTaxDdctAmt) {
        this.grTaxDdctAmt = grTaxDdctAmt;
    }

    /**
     * @return the grTotAmt
     */
    public Double getGrTotAmt() {
        return grTotAmt;
    }

    /**
     * @param grTotAmt the grTotAmt to set
     */
    public void setGrTotAmt(Double grTotAmt) {
        this.grTotAmt = grTotAmt;
    }

    /**
     * @return the grTaxAmt
     */
    public Double getGrTaxAmt() {
        return grTaxAmt;
    }

    /**
     * @param grTaxAmt the grTaxAmt to set
     */
    public void setGrTaxAmt(Double grTaxAmt) {
        this.grTaxAmt = grTaxAmt;
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
     * @return the regUsrNm
     */
    public String getRegUsrNm() {
        return regUsrNm;
    }

    /**
     * @param regUsrNm the regUsrNm to set
     */
    public void setRegUsrNm(String regUsrNm) {
        this.regUsrNm = regUsrNm;
    }

    /**
     * @return the returnQty
     */
    public Double getReturnQty() {
        return returnQty;
    }

    /**
     * @param returnQty the returnQty to set
     */
    public void setReturnQty(Double returnQty) {
        this.returnQty = returnQty;
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
     * @return the returnTaxDdctAmt
     */
    public Double getReturnTaxDdctAmt() {
        return returnTaxDdctAmt;
    }

    /**
     * @param returnTaxDdctAmt the returnTaxDdctAmt to set
     */
    public void setReturnTaxDdctAmt(Double returnTaxDdctAmt) {
        this.returnTaxDdctAmt = returnTaxDdctAmt;
    }

    /**
     * @return the returnTaxAmt
     */
    public Double getReturnTaxAmt() {
        return returnTaxAmt;
    }

    /**
     * @param returnTaxAmt the returnTaxAmt to set
     */
    public void setReturnTaxAmt(Double returnTaxAmt) {
        this.returnTaxAmt = returnTaxAmt;
    }

    /**
     * @return the returnTotAmt
     */
    public Double getReturnTotAmt() {
        return returnTotAmt;
    }

    /**
     * @param returnTotAmt the returnTotAmt to set
     */
    public void setReturnTotAmt(Double returnTotAmt) {
        this.returnTotAmt = returnTotAmt;
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
     * @return the preReturnQty
     */
    public Double getPreReturnQty() {
        return preReturnQty;
    }

    /**
     * @param preReturnQty the preReturnQty to set
     */
    public void setPreReturnQty(Double preReturnQty) {
        this.preReturnQty = preReturnQty;
    }

    /**
     * @return the preReturnAmt
     */
    public Double getPreReturnAmt() {
        return preReturnAmt;
    }

    /**
     * @param preReturnAmt the preReturnAmt to set
     */
    public void setPreReturnAmt(Double preReturnAmt) {
        this.preReturnAmt = preReturnAmt;
    }

    /**
     * @return the returnStat
     */
    public String getReturnStat() {
        return returnStat;
    }

    /**
     * @param returnStat the returnStat to set
     */
    public void setReturnStat(String returnStat) {
        this.returnStat = returnStat;
    }

    /**
     * @return the returnMovingAvgTotAmt
     */
    public Double getReturnMovingAvgTotAmt() {
        return returnMovingAvgTotAmt;
    }

    /**
     * @param returnMovingAvgTotAmt the returnMovingAvgTotAmt to set
     */
    public void setReturnMovingAvgTotAmt(Double returnMovingAvgTotAmt) {
        this.returnMovingAvgTotAmt = returnMovingAvgTotAmt;
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
