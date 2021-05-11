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
 * @ClassName   : GroupSalesDeliveryVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author kim yewon
 * @since 2016. 8. 12.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 8. 12.     Kim yewon             최초 생성
 *
 * </pre>
 */

public class GroupSalesDeliveryVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 2924692645434750515L;


    //집단판매헤더
    private String dlrCd;                                       //딜러코드
    private String grpContractNo;                               //그룹계약번호
    private String contractTp;                                  //계약유형
    private String grpContractStatCd;                           //계약상태코드(집단 - 집단판매 계약상태)
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date contractDt;                                    //계약일자
    private String saleEmpNo;                                   //판매사원번호
    private String saleMngNm;                                   //판매관리번호
    private String contractCustNo;                              //계약고객번호
    private String custNo;                                      //고객코드
    private String custNm;                                      //고객명
    private String custTp;                                      //고객유형
    private String telNo1;                                      //전화번호1
    private String telNo2;                                      //전화번호2
    private String mathDocTp;                                   //주요인증문서유형
    private String ssnCrnNo;                                    //주민사업자등록번호
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date dlReqDt;                                       //인도요청일자
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date confirmDt;                                     //확정일자
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date cancDt;                                        //취소일자
    private String saleOpptSeq;                                 //판매기회번호
    private String payTp;                                       //지불유형
    private Double carlineCnt;                                  //차종수량
    private Double carCnt;                                      //차량수량
    private Double totSaleAmt;                                  //총판매금액
    private String lv2DlrYn;                                    //2급딜러여부
    private String lv2DlrOrgCd;                                 //2급딜러조직코드
    private String remark;                                      //비고
    private String regUsrId;                                    //등록자ID
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date regDt;                                         //등록일자
    private String updtUsrId;                                   //수정자ID
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date updtDt;                                        //수정일자



    //집단판매차종
    private String carlineCd;                                   //차종코드
    private String carlineNm;                                   //차종명
    private String modelCd;                                     //모델코드
    private String modelNm;                                     //모델명
    private String ocnCd;                                       //OCN코드
    private String ocnNm;                                       //OCN명
    private String extColorCd;                                  //외장색코드
    private String extColorNm;                                  //외장색명
    private String intColorCd;                                  //내장색코드
    private String intColorNm;                                  //내장색명
    private Double retlPrc;                                     //소매가격
    private String promotionNo;                                 //프로모션코드
    private String promotionNm;                                 //프로모션명
    private Double promotionAmt;                                //프로모션금액
    private Double realCarAmt;                                  //실제차량금액
    private Double realPayAmt;                                  //실제지불금액

    //계약
    private String vinNo;                                       //차대번호
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date realDlDt;                                      //출고일자
    private String retailContractStatCd;                        //계약상태(소매-계약별 상태)
    private String contractNo;                                  //계약번호
    private String ordTp;                                       //주문유형
    private String retlTpCd;                                    //소매유형





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
     * @return the retailContractStatCd
     */
    public String getRetailContractStatCd() {
        return retailContractStatCd;
    }
    /**
     * @param retailContractStatCd the retailContractStatCd to set
     */
    public void setRetailContractStatCd(String retailContractStatCd) {
        this.retailContractStatCd = retailContractStatCd;
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
     * @return the saleMngNm
     */
    public String getSaleMngNm() {
        return saleMngNm;
    }
    /**
     * @param saleMngNm the saleMngNm to set
     */
    public void setSaleMngNm(String saleMngNm) {
        this.saleMngNm = saleMngNm;
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
     * @return the telNo1
     */
    public String getTelNo1() {
        return telNo1;
    }
    /**
     * @param telNo1 the telNo1 to set
     */
    public void setTelNo1(String telNo1) {
        this.telNo1 = telNo1;
    }
    /**
     * @return the telNo2
     */
    public String getTelNo2() {
        return telNo2;
    }
    /**
     * @param telNo2 the telNo2 to set
     */
    public void setTelNo2(String telNo2) {
        this.telNo2 = telNo2;
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
     * @return the confirmDt
     */
    public Date getConfirmDt() {
        return confirmDt;
    }
    /**
     * @param confirmDt the confirmDt to set
     */
    public void setConfirmDt(Date confirmDt) {
        this.confirmDt = confirmDt;
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
     * @return the saleOpptSeq
     */
    public String getSaleOpptSeq() {
        return saleOpptSeq;
    }
    /**
     * @param saleOpptSeq the saleOpptSeq to set
     */
    public void setSaleOpptSeq(String saleOpptSeq) {
        this.saleOpptSeq = saleOpptSeq;
    }
    /**
     * @return the payTp
     */
    public String getPayTp() {
        return payTp;
    }
    /**
     * @param payTp the payTp to set
     */
    public void setPayTp(String payTp) {
        this.payTp = payTp;
    }
    /**
     * @return the carlineCnt
     */
    public Double getCarlineCnt() {
        return carlineCnt;
    }
    /**
     * @param carlineCnt the carlineCnt to set
     */
    public void setCarlineCnt(Double carlineCnt) {
        this.carlineCnt = carlineCnt;
    }
    /**
     * @return the carCnt
     */
    public Double getCarCnt() {
        return carCnt;
    }
    /**
     * @param carCnt the carCnt to set
     */
    public void setCarCnt(Double carCnt) {
        this.carCnt = carCnt;
    }
    /**
     * @return the totSaleAmt
     */
    public Double getTotSaleAmt() {
        return totSaleAmt;
    }
    /**
     * @param totSaleAmt the totSaleAmt to set
     */
    public void setTotSaleAmt(Double totSaleAmt) {
        this.totSaleAmt = totSaleAmt;
    }
    /**
     * @return the lv2DlrYn
     */
    public String getLv2DlrYn() {
        return lv2DlrYn;
    }
    /**
     * @param lv2DlrYn the lv2DlrYn to set
     */
    public void setLv2DlrYn(String lv2DlrYn) {
        this.lv2DlrYn = lv2DlrYn;
    }
    /**
     * @return the lv2DlrOrgCd
     */
    public String getLv2DlrOrgCd() {
        return lv2DlrOrgCd;
    }
    /**
     * @param lv2DlrOrgCd the lv2DlrOrgCd to set
     */
    public void setLv2DlrOrgCd(String lv2DlrOrgCd) {
        this.lv2DlrOrgCd = lv2DlrOrgCd;
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
     * @return the retlPrc
     */
    public Double getRetlPrc() {
        return retlPrc;
    }
    /**
     * @param retlPrc the retlPrc to set
     */
    public void setRetlPrc(Double retlPrc) {
        this.retlPrc = retlPrc;
    }
    /**
     * @return the promotionNo
     */
    public String getPromotionNo() {
        return promotionNo;
    }
    /**
     * @param promotionNo the promotionNo to set
     */
    public void setPromotionNo(String promotionNo) {
        this.promotionNo = promotionNo;
    }
    /**
     * @return the promotionNm
     */
    public String getPromotionNm() {
        return promotionNm;
    }
    /**
     * @param promotionNm the promotionNm to set
     */
    public void setPromotionNm(String promotionNm) {
        this.promotionNm = promotionNm;
    }
    /**
     * @return the promotionAmt
     */
    public Double getPromotionAmt() {
        return promotionAmt;
    }
    /**
     * @param promotionAmt the promotionAmt to set
     */
    public void setPromotionAmt(Double promotionAmt) {
        this.promotionAmt = promotionAmt;
    }
    /**
     * @return the realCarAmt
     */
    public Double getRealCarAmt() {
        return realCarAmt;
    }
    /**
     * @param realCarAmt the realCarAmt to set
     */
    public void setRealCarAmt(Double realCarAmt) {
        this.realCarAmt = realCarAmt;
    }
    /**
     * @return the realPayAmt
     */
    public Double getRealPayAmt() {
        return realPayAmt;
    }
    /**
     * @param realPayAmt the realPayAmt to set
     */
    public void setRealPayAmt(Double realPayAmt) {
        this.realPayAmt = realPayAmt;
    }
    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
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


}
