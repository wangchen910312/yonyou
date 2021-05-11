package chn.bhmc.dms.mob.api.crm.vo;

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
    private String fscCd;                               //차관코드
    private String fscNm;                               //차관명
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
    private String useCarNm;                            //차종명
    private String useCarCd;
    private String carBrandCd;                          //브랜드코드
    private String carBrandNm;                          //브랜드명
    private String ncarDstinCd;                         //자차/타사차
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
    private String custTelNo;                           //고객전화번호
    private String incProfitNm;                         //보험수익자명
    private String incPrsnNm;                           //보험담당자명
    private String incPrsnId;                           //보험담당자ID
    private String incRcptNm;                           //보험영수증명
    private String custSsnCrnNo;                        //고객주민사업자등록번호
    private String incCmpCd;                            //보험회사코드
    private String incCmpNm;                            //보험회사명
    private double frcIncAmt;                           //의무보험금액
    private double busIncAmt;                           //상업보험금액
    private double transTaxAmt;                         //차량운송세금
    private String regUsrId;                            //등록자ID
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date regDt;                                 //등록일
    private String updtUsrId;                           //수정자ID
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date updtDt;                                //수정일자
    private String custSsnCrnTp;                        //고객주민사업자등록유형
    private String contractNo;                          //계약번호
    private String custTp;                              //고객유형
    private String pageGubun;                           //구분("G":집단판매고객인도)
    private String incCustNm;                           //보험고객명
    private String incCustTelNo;                        //보험고객전화번호

    //보험심청정보명세
    private String incPk;                               //PK
    private String incTp;                               //보험유형(SAL019)
    private String incTpNm;                             //보험유형명칭
    private Double incExpcAmt;                          //보험예상금액
    private Double realIncAmt;                          //실보험금액
    private int incPrid;                                //보험기간
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date incStartDt;                            //보험시작일자
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date incEndDt;                              //보험종료일자
    private Double incAmt;                              //보험금액
    private String remark;                              //비고
    
    private String incPconCustNm;                       //연계인
    private String incPconCustTelNo;                    //연계인 전화번호
    private String finImplyYn;                          //재무수납포함여부
    private String incCs;                               //보험종류
    private String incCsNm;                             //보험종류
    private String incStat;                             //보험상태
    private String incStatNm;                           //보험상태
    private String implyYn;                             //총금액포함여부(계약)
    
    private String sungCd;                              //성코드
    private String sungNm;                              //성이름
    private String cityCd;                              //도시코드
    private String cityNm;                              //도시명
    private String distCd;                              //구코드
    private String distNm;                              //구명
    
    private String fincYn;                              //대출여부
    private String fincCmpCd;                           //금융회사
    
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
     * @return the fscCd
     */
    public String getFscCd() {
        return fscCd;
    }
    /**
     * @param fscCd the fscCd to set
     */
    public void setFscCd(String fscCd) {
        this.fscCd = fscCd;
    }
    /**
     * @return the fscNm
     */
    public String getFscNm() {
        return fscNm;
    }
    /**
     * @param fscNm the fscNm to set
     */
    public void setFscNm(String fscNm) {
        this.fscNm = fscNm;
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
     * @return the useCarNm
     */
    public String getUseCarNm() {
        return useCarNm;
    }
    /**
     * @param useCarNm the useCarNm to set
     */
    public void setUseCarNm(String useCarNm) {
        this.useCarNm = useCarNm;
    }
    /**
     * @return the useCarCd
     */
    public String getUseCarCd() {
        return useCarCd;
    }
    /**
     * @param useCarCd the useCarCd to set
     */
    public void setUseCarCd(String useCarCd) {
        this.useCarCd = useCarCd;
    }
    /**
     * @return the carBrandCd
     */
    public String getCarBrandCd() {
        return carBrandCd;
    }
    /**
     * @param carBrandCd the carBrandCd to set
     */
    public void setCarBrandCd(String carBrandCd) {
        this.carBrandCd = carBrandCd;
    }
    /**
     * @return the carBrandNm
     */
    public String getCarBrandNm() {
        return carBrandNm;
    }
    /**
     * @param carBrandNm the carBrandNm to set
     */
    public void setCarBrandNm(String carBrandNm) {
        this.carBrandNm = carBrandNm;
    }
    /**
     * @return the ncarDstinCd
     */
    public String getNcarDstinCd() {
        return ncarDstinCd;
    }
    /**
     * @param ncarDstinCd the ncarDstinCd to set
     */
    public void setNcarDstinCd(String ncarDstinCd) {
        this.ncarDstinCd = ncarDstinCd;
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
     * @return the incCustTelNo
     */
    public String getIncCustTelNo() {
        return incCustTelNo;
    }
    /**
     * @param incCustTelNo the incCustTelNo to set
     */
    public void setIncCustTelNo(String incCustTelNo) {
        this.incCustTelNo = incCustTelNo;
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
     * @return the incPrsnNm
     */
    public String getIncPrsnNm() {
        return incPrsnNm;
    }
    /**
     * @param incPrsnNm the incPrsnNm to set
     */
    public void setIncPrsnNm(String incPrsnNm) {
        this.incPrsnNm = incPrsnNm;
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
     * @return the incCmpNm
     */
    public String getIncCmpNm() {
        return incCmpNm;
    }
    /**
     * @param incCmpNm the incCmpNm to set
     */
    public void setIncCmpNm(String incCmpNm) {
        this.incCmpNm = incCmpNm;
    }
    /**
     * @return the frcIncAmt
     */
    public double getFrcIncAmt() {
        return frcIncAmt;
    }
    /**
     * @param frcIncAmt the frcIncAmt to set
     */
    public void setFrcIncAmt(double frcIncAmt) {
        this.frcIncAmt = frcIncAmt;
    }
    /**
     * @return the busIncAmt
     */
    public double getBusIncAmt() {
        return busIncAmt;
    }
    /**
     * @param busIncAmt the busIncAmt to set
     */
    public void setBusIncAmt(double busIncAmt) {
        this.busIncAmt = busIncAmt;
    }
    /**
     * @return the transTaxAmt
     */
    public double getTransTaxAmt() {
        return transTaxAmt;
    }
    /**
     * @param transTaxAmt the transTaxAmt to set
     */
    public void setTransTaxAmt(double transTaxAmt) {
        this.transTaxAmt = transTaxAmt;
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
     * @return the pageGubun
     */
    public String getPageGubun() {
        return pageGubun;
    }
    /**
     * @param pageGubun the pageGubun to set
     */
    public void setPageGubun(String pageGubun) {
        this.pageGubun = pageGubun;
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
     * @return the incTpNm
     */
    public String getIncTpNm() {
        return incTpNm;
    }
    /**
     * @param incTpNm the incTpNm to set
     */
    public void setIncTpNm(String incTpNm) {
        this.incTpNm = incTpNm;
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
     * @return the incPconCustNm
     */
    public String getIncPconCustNm() {
        return incPconCustNm;
    }
    /**
     * @param incPconCustNm the incPconCustNm to set
     */
    public void setIncPconCustNm(String incPconCustNm) {
        this.incPconCustNm = incPconCustNm;
    }
    /**
     * @return the incPconCustTelNo
     */
    public String getIncPconCustTelNo() {
        return incPconCustTelNo;
    }
    /**
     * @param incPconCustTelNo the incPconCustTelNo to set
     */
    public void setIncPconCustTelNo(String incPconCustTelNo) {
        this.incPconCustTelNo = incPconCustTelNo;
    }
    /**
     * @return the finImplyYn
     */
    public String getFinImplyYn() {
        return finImplyYn;
    }
    /**
     * @param finImplyYn the finImplyYn to set
     */
    public void setFinImplyYn(String finImplyYn) {
        this.finImplyYn = finImplyYn;
    }
    /**
     * @return the incCs
     */
    public String getIncCs() {
        return incCs;
    }
    /**
     * @param incCs the incCs to set
     */
    public void setIncCs(String incCs) {
        this.incCs = incCs;
    }
    /**
     * @return the incCsNm
     */
    public String getIncCsNm() {
        return incCsNm;
    }
    /**
     * @param incCsNm the incCsNm to set
     */
    public void setIncCsNm(String incCsNm) {
        this.incCsNm = incCsNm;
    }
    /**
     * @return the incStat
     */
    public String getIncStat() {
        return incStat;
    }
    /**
     * @param incStat the incStat to set
     */
    public void setIncStat(String incStat) {
        this.incStat = incStat;
    }
    /**
     * @return the incStatNm
     */
    public String getIncStatNm() {
        return incStatNm;
    }
    /**
     * @param incStatNm the incStatNm to set
     */
    public void setIncStatNm(String incStatNm) {
        this.incStatNm = incStatNm;
    }
    
    /**
     * @return the implyYn
     */
    public String getImplyYn() {
        return implyYn;
    }
    /**
     * @param implyYn the implyYn to set
     */
    public void setImplyYn(String implyYn) {
        this.implyYn = implyYn;
    }
    /**
     * @return the sungCd
     */
    public String getSungCd() {
        return sungCd;
    }
    /**
     * @param sungCd the sungCd to set
     */
    public void setSungCd(String sungCd) {
        this.sungCd = sungCd;
    }
    /**
     * @return the sungNm
     */
    public String getSungNm() {
        return sungNm;
    }
    /**
     * @param sungNm the sungNm to set
     */
    public void setSungNm(String sungNm) {
        this.sungNm = sungNm;
    }
    /**
     * @return the cityCd
     */
    public String getCityCd() {
        return cityCd;
    }
    /**
     * @param cityCd the cityCd to set
     */
    public void setCityCd(String cityCd) {
        this.cityCd = cityCd;
    }
    /**
     * @return the cityNm
     */
    public String getCityNm() {
        return cityNm;
    }
    /**
     * @param cityNm the cityNm to set
     */
    public void setCityNm(String cityNm) {
        this.cityNm = cityNm;
    }
    /**
     * @return the distCd
     */
    public String getDistCd() {
        return distCd;
    }
    /**
     * @param distCd the distCd to set
     */
    public void setDistCd(String distCd) {
        this.distCd = distCd;
    }
    /**
     * @return the distNm
     */
    public String getDistNm() {
        return distNm;
    }
    /**
     * @param distNm the distNm to set
     */
    public void setDistNm(String distNm) {
        this.distNm = distNm;
    }
    /**
     * @return the fincYn
     */
    public String getFincYn() {
        return fincYn;
    }
    /**
     * @param fincYn the fincYn to set
     */
    public void setFincYn(String fincYn) {
        this.fincYn = fincYn;
    }
    /**
     * @return the fincCmpCd
     */
    public String getFincCmpCd() {
        return fincCmpCd;
    }
    /**
     * @param fincCmpCd the fincCmpCd to set
     */
    public void setFincCmpCd(String fincCmpCd) {
        this.fincCmpCd = fincCmpCd;
    }
    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }
}