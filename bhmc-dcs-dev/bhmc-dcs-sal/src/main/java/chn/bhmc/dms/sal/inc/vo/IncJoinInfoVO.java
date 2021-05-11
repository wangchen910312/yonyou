package chn.bhmc.dms.sal.inc.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : IncJoinInfoVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author kim yewon
 * @since 2016. 5. 03.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 03.     Kim yewon             최초 생성
 *
 * </pre>
 */

public class IncJoinInfoVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 2924692645434750515L;


    private String dlrCd;                               //딜러코드
    private String incNo;                               //보험번호
    private String carlineCd;                           //차종코드
    private String carlineNm;                           //차종명
    private String modelCd;                             //모델코드
    private String modelNm;                             //모델명
    private String ocnCd;                               //OCN코드
    private String ocnNm;                               //OCN명
    private String extColorCd;                          //외장색코드
    private String extColorNm;                          //외장색명
    private String intColorCd;                          //내장색코드
    private String intColorNm;                          //내장색명
    private String vinNo;                               //차대번호
    private String enginSerialNo;                       //엔진시리얼번호
    private String cartNo;                              //합격증번호
    private String carRegNo;                            //차량등록번호
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date carSaleDt;                             //차량판매일자
    private Double incExpcTotAmt;                       //보험예상총금액
    private Double realIncTotAmt;                       //실보험총금액
    private Double incFeeTotAmt;                        //보험수수료총금액
    private String saleId;                              //판매ID
    private String saleNm;                              //판매고문명
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date incJoinDt;                             //보험가입일자
    private String custNo;
    private String custNm;
    private String incCustNo;                           //고객번호
    private String incCustNm;                           //고객명
    private String custTelNo;                           //고객전화번호
    private String incProfitNm;                         //보험수익자명
    private String incPrsnId;                           //보험담당자ID
    private String incRcptNm;                           //보험영수증명
    private String custSsnCrnNo;                        //고객주민사업자등록번호
    private String incCmpCd;                            //보험회사코드
    private String dutyIncNo;                           //의무보험번호
    private String cmcIncNo;                            //상업보험번호
    private String regUsrId;                            //등록자ID
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date regDt;                                 //등록일
    private String updtUsrId;                           //수정자ID
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date updtDt;                                //수정일자
    private String custSsnCrnTp;                        //고객주민사업자등록유형
    private String contractNo;                          //계약번호
    private String custTp;                              //고객유형





    //보험심청정보명세
    private String incPk;                               //PK
    private String incTp;                               //보험유형(SAL019)
    private Double incExpcAmt;                          //보험예상금액
    private Double realIncAmt;                          //실보험금액
    private int incPrid;                                //보험기간
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date incStartDt;                            //보험시작일자
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date incEndDt;                              //보험종료일자
    private Double incAmt;                              //보험금액
    private String remark;                              //비고






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
     * @return the incExpcAmt
     */
    public Double getIncExpcAmt() {
        return incExpcAmt;
    }
    /**
     * @param incExpcAmt the incExpcAmt to set
     */
    public void setIncExpcAmt(Double incExpcAmt) {
        this.incExpcAmt = incExpcAmt;
    }
    /**
     * @return the realIncAmt
     */
    public Double getRealIncAmt() {
        return realIncAmt;
    }
    /**
     * @param realIncAmt the realIncAmt to set
     */
    public void setRealIncAmt(Double realIncAmt) {
        this.realIncAmt = realIncAmt;
    }
    /**
     * @return the incAmt
     */
    public Double getIncAmt() {
        return incAmt;
    }
    /**
     * @param incAmt the incAmt to set
     */
    public void setIncAmt(Double incAmt) {
        this.incAmt = incAmt;
    }
    /**
     * @return the incPk
     */
    public String getIncPk() {
        return incPk;
    }
    /**
     * @param incPk the incPk to set
     */
    public void setIncPk(String incPk) {
        this.incPk = incPk;
    }
    /**
     * @return the incTp
     */
    public String getIncTp() {
        return incTp;
    }
    /**
     * @param incTp the incTp to set
     */
    public void setIncTp(String incTp) {
        this.incTp = incTp;
    }
    /**
     * @return the incPrid
     */
    public int getIncPrid() {
        return incPrid;
    }
    /**
     * @param incPrid the incPrid to set
     */
    public void setIncPrid(int incPrid) {
        this.incPrid = incPrid;
    }
    /**
     * @return the incStartDt
     */
    public Date getIncStartDt() {
        return incStartDt;
    }
    /**
     * @param incStartDt the incStartDt to set
     */
    public void setIncStartDt(Date incStartDt) {
        this.incStartDt = incStartDt;
    }
    /**
     * @return the incEndDt
     */
    public Date getIncEndDt() {
        return incEndDt;
    }
    /**
     * @param incEndDt the incEndDt to set
     */
    public void setIncEndDt(Date incEndDt) {
        this.incEndDt = incEndDt;
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
     * @return the saleId
     */
    public String getSaleId() {
        return saleId;
    }
    /**
     * @param saleId the saleId to set
     */
    public void setSaleId(String saleId) {
        this.saleId = saleId;
    }
    /**
     * @return the saleNm
     */
    public String getSaleNm() {
        return saleNm;
    }
    /**
     * @param saleNm the saleNm to set
     */
    public void setSaleNm(String saleNm) {
        this.saleNm = saleNm;
    }
    /**
     * @return the incRcptNm
     */
    public String getIncRcptNm() {
        return incRcptNm;
    }
    /**
     * @param incRcptNm the incRcptNm to set
     */
    public void setIncRcptNm(String incRcptNm) {
        this.incRcptNm = incRcptNm;
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
     * @return the custSsnCrnTp
     */
    public String getCustSsnCrnTp() {
        return custSsnCrnTp;
    }
    /**
     * @param custSsnCrnTp the custSsnCrnTp to set
     */
    public void setCustSsnCrnTp(String custSsnCrnTp) {
        this.custSsnCrnTp = custSsnCrnTp;
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
     * @return the incNo
     */
    public String getIncNo() {
        return incNo;
    }
    /**
     * @param incNo the incNo to set
     */
    public void setIncNo(String incNo) {
        this.incNo = incNo;
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
     * @return the enginSerialNo
     */
    public String getEnginSerialNo() {
        return enginSerialNo;
    }
    /**
     * @param enginSerialNo the enginSerialNo to set
     */
    public void setEnginSerialNo(String enginSerialNo) {
        this.enginSerialNo = enginSerialNo;
    }
    /**
     * @return the cartNo
     */
    public String getCartNo() {
        return cartNo;
    }
    /**
     * @param cartNo the cartNo to set
     */
    public void setCartNo(String cartNo) {
        this.cartNo = cartNo;
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
     * @return the carSaleDt
     */
    public Date getCarSaleDt() {
        return carSaleDt;
    }
    /**
     * @param carSaleDt the carSaleDt to set
     */
    public void setCarSaleDt(Date carSaleDt) {
        this.carSaleDt = carSaleDt;
    }
    /**
     * @return the incExpcTotAmt
     */
    public Double getIncExpcTotAmt() {
        return incExpcTotAmt;
    }
    /**
     * @param incExpcTotAmt the incExpcTotAmt to set
     */
    public void setIncExpcTotAmt(Double incExpcTotAmt) {
        this.incExpcTotAmt = incExpcTotAmt;
    }
    /**
     * @return the realIncTotAmt
     */
    public Double getRealIncTotAmt() {
        return realIncTotAmt;
    }
    /**
     * @param realIncTotAmt the realIncTotAmt to set
     */
    public void setRealIncTotAmt(Double realIncTotAmt) {
        this.realIncTotAmt = realIncTotAmt;
    }
    /**
     * @return the incFeeTotAmt
     */
    public Double getIncFeeTotAmt() {
        return incFeeTotAmt;
    }
    /**
     * @param incFeeTotAmt the incFeeTotAmt to set
     */
    public void setIncFeeTotAmt(Double incFeeTotAmt) {
        this.incFeeTotAmt = incFeeTotAmt;
    }
    /**
     * @return the incJoinDt
     */
    public Date getIncJoinDt() {
        return incJoinDt;
    }
    /**
     * @param incJoinDt the incJoinDt to set
     */
    public void setIncJoinDt(Date incJoinDt) {
        this.incJoinDt = incJoinDt;
    }
    /**
     * @return the incCustNo
     */
    public String getIncCustNo() {
        return incCustNo;
    }
    /**
     * @param incCustNo the incCustNo to set
     */
    public void setIncCustNo(String incCustNo) {
        this.incCustNo = incCustNo;
    }
    /**
     * @return the incCustNm
     */
    public String getIncCustNm() {
        return incCustNm;
    }
    /**
     * @param incCustNm the incCustNm to set
     */
    public void setIncCustNm(String incCustNm) {
        this.incCustNm = incCustNm;
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
     * @return the incProfitNm
     */
    public String getIncProfitNm() {
        return incProfitNm;
    }
    /**
     * @param incProfitNm the incProfitNm to set
     */
    public void setIncProfitNm(String incProfitNm) {
        this.incProfitNm = incProfitNm;
    }
    /**
     * @return the incPrsnId
     */
    public String getIncPrsnId() {
        return incPrsnId;
    }
    /**
     * @param incPrsnId the incPrsnId to set
     */
    public void setIncPrsnId(String incPrsnId) {
        this.incPrsnId = incPrsnId;
    }
    /**
     * @return the custSsnCrnNo
     */
    public String getCustSsnCrnNo() {
        return custSsnCrnNo;
    }
    /**
     * @param custSsnCrnNo the custSsnCrnNo to set
     */
    public void setCustSsnCrnNo(String custSsnCrnNo) {
        this.custSsnCrnNo = custSsnCrnNo;
    }
    /**
     * @return the incCmpCd
     */
    public String getIncCmpCd() {
        return incCmpCd;
    }
    /**
     * @param incCmpCd the incCmpCd to set
     */
    public void setIncCmpCd(String incCmpCd) {
        this.incCmpCd = incCmpCd;
    }
    /**
     * @return the dutyIncNo
     */
    public String getDutyIncNo() {
        return dutyIncNo;
    }
    /**
     * @param dutyIncNo the dutyIncNo to set
     */
    public void setDutyIncNo(String dutyIncNo) {
        this.dutyIncNo = dutyIncNo;
    }
    /**
     * @return the cmcIncNo
     */
    public String getCmcIncNo() {
        return cmcIncNo;
    }
    /**
     * @param cmcIncNo the cmcIncNo to set
     */
    public void setCmcIncNo(String cmcIncNo) {
        this.cmcIncNo = cmcIncNo;
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
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }



}
