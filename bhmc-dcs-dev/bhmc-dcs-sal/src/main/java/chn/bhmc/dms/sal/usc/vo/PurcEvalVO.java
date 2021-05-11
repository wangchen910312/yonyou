package chn.bhmc.dms.sal.usc.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : PromotionVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author kim yewon
 * @since 2016. 2. 15.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 15.       Kim yewon             최초 생성
 *
 * </pre>
 */

public class PurcEvalVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 2924692645434750515L;

    private String gubun;                                       //신규등록,수정 구분
    private String stat;                                        //매입:P,평가:A

    //매입관리 테이블(SA_0241T)
    private String dlrCd;                                       //딜러코드
    private String purcNo;                                      //매입번호
    private String seq;                                         //순번
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date purcRegDt;                                     //매입등록일자
    private String purcStatCd;                                  //매입상태코드
    private String exchYn;                                      //치환여부
    private String contractNo;                                  //계약번호
    private String purcCustNo;                                  //구매고객번호
    private String purcCustNm;                                  //구매고객명
    private String telNo1;                                      //전화번호1
    private String corpCarDstinCd;                              //자사차량구분코드
    private String carBrandCd;                                  //차량브랜드코드
    private String carlineCd;                                   //차종코드
    private String carlineNm;                                   //차종명
    private String modelCd;                                     //모델코드
    private String modelNm;                                     //모델명
    private String ocnCd;                                       //OCN코드
    private String ocnNm;                                       //OCN
    private String extColorCd;                                  //외장색코드
    private String extColorNm;                                  //외장색명
    private String intColorCd;                                  //내장색코드
    private String intColorNm;                                  //내장색명
    private Double carDispQty;                                  //차량배기량
    private String vinNo;                                       //차대번호
    private Double carRunDistVal;                               //차량주행거리값
    private String manufactYyMmDt;                              //제작년월일자
    private String pcDstinCd;                                   //승상용구분코드
    private String fuelCd;                                      //연료코드
    private String drvMthCd;                                    //구동방식코드
    private Double carLmtVal;                                   //차량정원값
    private Double purcTotAmt;                                  //매입총금액
    private Double purcAmt;                                     //매입금액
    private Double exchAmt;                                     //치환금액
    private Double recomSaleAmt;                                //추천판매금액
    private Double dlrPromotionAmt;                             //딜러프로모션금액
    private Double carUseAmt;                                   //차량사용금액
    private String noSaleYn;                                    //번호판매여부
    private String platNo;                                      //번호판번호
    private Double platAmt;                                     //번호판금액
    private String fceIncPrid;                                  //강제보험기간
    private String carTaxPrid;                                  //차량세금기간
    private String yyTestPrid;                                  //년검사기간
    private String cmcIncPrid;                                  //상업보험기간
    private String evalMthCd;                                   //평가방법코드
    private String evalPrsnNm;                                  //평가담당자명
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date evalDt;                                        //평가일자
    private String evalRemark;                                  //평가비고
    private Double custHopeAmt;                                 //고객희망금액
    private Double evalAmt;                                     //평가금액
    private Double lastAmt;                                     //최종금액
    private Double carRegAmt;                                   //차량등록금액
    private String carStatCd;                                   //차량상태코드
    private String regUsrId;                                    //등록자ID
    private String regUsrNm;                                    //등록자명
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date regDt;                                         //등록일자
    private String updtUsrId;                                   //수정자ID
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date updtDt;                                        //수정일자
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date retlDt;                                        //소매일자
    private String lastOwnerNm;                                 //최종소유자

    //경매(위탁)정보 테이블 (SA_0242T)
    private String auctCd;                                      //경매코드
    private String auctPlaceNm;                                 //경매장소명
    private Double auctAmt;                                     //경매금액
    private String goodsDetlCont;                               //용품상세내용
    private String carDlYn;                                     //차량인도여부
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date scheConfirmDt;                                 //예정확정일자
    private String remark;                                      //비고
    private String auctPk;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date vehicleInspecDt;                               //차량검증일자

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
     * @return the retlDt
     */
    public Date getRetlDt() {
        return retlDt;
    }
    /**
     * @param retlDt the retlDt to set
     */
    public void setRetlDt(Date retlDt) {
        this.retlDt = retlDt;
    }
    /**
     * @return the lastOwnerNm
     */
    public String getLastOwnerNm() {
        return lastOwnerNm;
    }
    /**
     * @param lastOwnerNm the lastOwnerNm to set
     */
    public void setLastOwnerNm(String lastOwnerNm) {
        this.lastOwnerNm = lastOwnerNm;
    }
    /**
     * @return the seq
     */
    public String getSeq() {
        return seq;
    }
    /**
     * @param seq the seq to set
     */
    public void setSeq(String seq) {
        this.seq = seq;
    }
    /**
     * @return the auctPk
     */
    public String getAuctPk() {
        return auctPk;
    }
    /**
     * @param auctPk the auctPk to set
     */
    public void setAuctPk(String auctPk) {
        this.auctPk = auctPk;
    }
    /**
     * @return the auctCd
     */
    public String getAuctCd() {
        return auctCd;
    }
    /**
     * @param auctCd the auctCd to set
     */
    public void setAuctCd(String auctCd) {
        this.auctCd = auctCd;
    }
    /**
     * @return the purcCustNm
     */
    public String getPurcCustNm() {
        return purcCustNm;
    }
    /**
     * @param purcCustNm the purcCustNm to set
     */
    public void setPurcCustNm(String purcCustNm) {
        this.purcCustNm = purcCustNm;
    }
    /**
     * @return the stat
     */
    public String getStat() {
        return stat;
    }
    /**
     * @param stat the stat to set
     */
    public void setStat(String stat) {
        this.stat = stat;
    }
    /**
     * @return the gubun
     */
    public String getGubun() {
        return gubun;
    }
    /**
     * @param gubun the gubun to set
     */
    public void setGubun(String gubun) {
        this.gubun = gubun;
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
     * @return the purcNo
     */
    public String getPurcNo() {
        return purcNo;
    }
    /**
     * @param purcNo the purcNo to set
     */
    public void setPurcNo(String purcNo) {
        this.purcNo = purcNo;
    }
    /**
     * @return the purcRegDt
     */
    public Date getPurcRegDt() {
        return purcRegDt;
    }
    /**
     * @param purcRegDt the purcRegDt to set
     */
    public void setPurcRegDt(Date purcRegDt) {
        this.purcRegDt = purcRegDt;
    }
    /**
     * @return the purcStatCd
     */
    public String getPurcStatCd() {
        return purcStatCd;
    }
    /**
     * @param purcStatCd the purcStatCd to set
     */
    public void setPurcStatCd(String purcStatCd) {
        this.purcStatCd = purcStatCd;
    }
    /**
     * @return the exchYn
     */
    public String getExchYn() {
        return exchYn;
    }
    /**
     * @param exchYn the exchYn to set
     */
    public void setExchYn(String exchYn) {
        this.exchYn = exchYn;
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
     * @return the purcCustNo
     */
    public String getPurcCustNo() {
        return purcCustNo;
    }
    /**
     * @param purcCustNo the purcCustNo to set
     */
    public void setPurcCustNo(String purcCustNo) {
        this.purcCustNo = purcCustNo;
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
     * @return the corpCarDstinCd
     */
    public String getCorpCarDstinCd() {
        return corpCarDstinCd;
    }
    /**
     * @param corpCarDstinCd the corpCarDstinCd to set
     */
    public void setCorpCarDstinCd(String corpCarDstinCd) {
        this.corpCarDstinCd = corpCarDstinCd;
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
     * @return the carDispQty
     */
    public Double getCarDispQty() {
        return carDispQty;
    }
    /**
     * @param carDispQty the carDispQty to set
     */
    public void setCarDispQty(Double carDispQty) {
        this.carDispQty = carDispQty;
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
     * @return the carRunDistVal
     */
    public Double getCarRunDistVal() {
        return carRunDistVal;
    }
    /**
     * @param carRunDistVal the carRunDistVal to set
     */
    public void setCarRunDistVal(Double carRunDistVal) {
        this.carRunDistVal = carRunDistVal;
    }
    /**
     * @return the manufactYyMmDt
     */
    public String getManufactYyMmDt() {
        return manufactYyMmDt;
    }
    /**
     * @param manufactYyMmDt the manufactYyMmDt to set
     */
    public void setManufactYyMmDt(String manufactYyMmDt) {
        this.manufactYyMmDt = manufactYyMmDt;
    }
    /**
     * @return the pcDstinCd
     */
    public String getPcDstinCd() {
        return pcDstinCd;
    }
    /**
     * @param pcDstinCd the pcDstinCd to set
     */
    public void setPcDstinCd(String pcDstinCd) {
        this.pcDstinCd = pcDstinCd;
    }
    /**
     * @return the fuelCd
     */
    public String getFuelCd() {
        return fuelCd;
    }
    /**
     * @param fuelCd the fuelCd to set
     */
    public void setFuelCd(String fuelCd) {
        this.fuelCd = fuelCd;
    }
    /**
     * @return the drvMthCd
     */
    public String getDrvMthCd() {
        return drvMthCd;
    }
    /**
     * @param drvMthCd the drvMthCd to set
     */
    public void setDrvMthCd(String drvMthCd) {
        this.drvMthCd = drvMthCd;
    }
    /**
     * @return the carLmtVal
     */
    public Double getCarLmtVal() {
        return carLmtVal;
    }
    /**
     * @param carLmtVal the carLmtVal to set
     */
    public void setCarLmtVal(Double carLmtVal) {
        this.carLmtVal = carLmtVal;
    }
    /**
     * @return the purcTotAmt
     */
    public Double getPurcTotAmt() {
        return purcTotAmt;
    }
    /**
     * @param purcTotAmt the purcTotAmt to set
     */
    public void setPurcTotAmt(Double purcTotAmt) {
        this.purcTotAmt = purcTotAmt;
    }
    /**
     * @return the purcAmt
     */
    public Double getPurcAmt() {
        return purcAmt;
    }
    /**
     * @param purcAmt the purcAmt to set
     */
    public void setPurcAmt(Double purcAmt) {
        this.purcAmt = purcAmt;
    }
    /**
     * @return the exchAmt
     */
    public Double getExchAmt() {
        return exchAmt;
    }
    /**
     * @param exchAmt the exchAmt to set
     */
    public void setExchAmt(Double exchAmt) {
        this.exchAmt = exchAmt;
    }
    /**
     * @return the recomSaleAmt
     */
    public Double getRecomSaleAmt() {
        return recomSaleAmt;
    }
    /**
     * @param recomSaleAmt the recomSaleAmt to set
     */
    public void setRecomSaleAmt(Double recomSaleAmt) {
        this.recomSaleAmt = recomSaleAmt;
    }
    /**
     * @return the dlrPromotionAmt
     */
    public Double getDlrPromotionAmt() {
        return dlrPromotionAmt;
    }
    /**
     * @param dlrPromotionAmt the dlrPromotionAmt to set
     */
    public void setDlrPromotionAmt(Double dlrPromotionAmt) {
        this.dlrPromotionAmt = dlrPromotionAmt;
    }
    /**
     * @return the carUseAmt
     */
    public Double getCarUseAmt() {
        return carUseAmt;
    }
    /**
     * @param carUseAmt the carUseAmt to set
     */
    public void setCarUseAmt(Double carUseAmt) {
        this.carUseAmt = carUseAmt;
    }
    /**
     * @return the noSaleYn
     */
    public String getNoSaleYn() {
        return noSaleYn;
    }
    /**
     * @param noSaleYn the noSaleYn to set
     */
    public void setNoSaleYn(String noSaleYn) {
        this.noSaleYn = noSaleYn;
    }
    /**
     * @return the platNo
     */
    public String getPlatNo() {
        return platNo;
    }
    /**
     * @param platNo the platNo to set
     */
    public void setPlatNo(String platNo) {
        this.platNo = platNo;
    }
    /**
     * @return the platAmt
     */
    public Double getPlatAmt() {
        return platAmt;
    }
    /**
     * @param platAmt the platAmt to set
     */
    public void setPlatAmt(Double platAmt) {
        this.platAmt = platAmt;
    }
    /**
     * @return the fceIncPrid
     */
    public String getFceIncPrid() {
        return fceIncPrid;
    }
    /**
     * @param fceIncPrid the fceIncPrid to set
     */
    public void setFceIncPrid(String fceIncPrid) {
        this.fceIncPrid = fceIncPrid;
    }
    /**
     * @return the carTaxPrid
     */
    public String getCarTaxPrid() {
        return carTaxPrid;
    }
    /**
     * @param carTaxPrid the carTaxPrid to set
     */
    public void setCarTaxPrid(String carTaxPrid) {
        this.carTaxPrid = carTaxPrid;
    }
    /**
     * @return the yyTestPrid
     */
    public String getYyTestPrid() {
        return yyTestPrid;
    }
    /**
     * @param yyTestPrid the yyTestPrid to set
     */
    public void setYyTestPrid(String yyTestPrid) {
        this.yyTestPrid = yyTestPrid;
    }
    /**
     * @return the cmcIncPrid
     */
    public String getCmcIncPrid() {
        return cmcIncPrid;
    }
    /**
     * @param cmcIncPrid the cmcIncPrid to set
     */
    public void setCmcIncPrid(String cmcIncPrid) {
        this.cmcIncPrid = cmcIncPrid;
    }
    /**
     * @return the evalMthCd
     */
    public String getEvalMthCd() {
        return evalMthCd;
    }
    /**
     * @param evalMthCd the evalMthCd to set
     */
    public void setEvalMthCd(String evalMthCd) {
        this.evalMthCd = evalMthCd;
    }
    /**
     * @return the evalPrsnNm
     */
    public String getEvalPrsnNm() {
        return evalPrsnNm;
    }
    /**
     * @param evalPrsnNm the evalPrsnNm to set
     */
    public void setEvalPrsnNm(String evalPrsnNm) {
        this.evalPrsnNm = evalPrsnNm;
    }
    /**
     * @return the evalDt
     */
    public Date getEvalDt() {
        return evalDt;
    }
    /**
     * @param evalDt the evalDt to set
     */
    public void setEvalDt(Date evalDt) {
        this.evalDt = evalDt;
    }
    /**
     * @return the evalRemark
     */
    public String getEvalRemark() {
        return evalRemark;
    }
    /**
     * @param evalRemark the evalRemark to set
     */
    public void setEvalRemark(String evalRemark) {
        this.evalRemark = evalRemark;
    }
    /**
     * @return the custHopeAmt
     */
    public Double getCustHopeAmt() {
        return custHopeAmt;
    }
    /**
     * @param custHopeAmt the custHopeAmt to set
     */
    public void setCustHopeAmt(Double custHopeAmt) {
        this.custHopeAmt = custHopeAmt;
    }
    /**
     * @return the evalAmt
     */
    public Double getEvalAmt() {
        return evalAmt;
    }
    /**
     * @param evalAmt the evalAmt to set
     */
    public void setEvalAmt(Double evalAmt) {
        this.evalAmt = evalAmt;
    }
    /**
     * @return the lastAmt
     */
    public Double getLastAmt() {
        return lastAmt;
    }
    /**
     * @param lastAmt the lastAmt to set
     */
    public void setLastAmt(Double lastAmt) {
        this.lastAmt = lastAmt;
    }
    /**
     * @return the carRegAmt
     */
    public Double getCarRegAmt() {
        return carRegAmt;
    }
    /**
     * @param carRegAmt the carRegAmt to set
     */
    public void setCarRegAmt(Double carRegAmt) {
        this.carRegAmt = carRegAmt;
    }
    /**
     * @return the carStatCd
     */
    public String getCarStatCd() {
        return carStatCd;
    }
    /**
     * @param carStatCd the carStatCd to set
     */
    public void setCarStatCd(String carStatCd) {
        this.carStatCd = carStatCd;
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
     * @return the auctPlaceNm
     */
    public String getAuctPlaceNm() {
        return auctPlaceNm;
    }
    /**
     * @param auctPlaceNm the auctPlaceNm to set
     */
    public void setAuctPlaceNm(String auctPlaceNm) {
        this.auctPlaceNm = auctPlaceNm;
    }
    /**
     * @return the auctAmt
     */
    public Double getAuctAmt() {
        return auctAmt;
    }
    /**
     * @param auctAmt the auctAmt to set
     */
    public void setAuctAmt(Double auctAmt) {
        this.auctAmt = auctAmt;
    }
    /**
     * @return the goodsDetlCont
     */
    public String getGoodsDetlCont() {
        return goodsDetlCont;
    }
    /**
     * @param goodsDetlCont the goodsDetlCont to set
     */
    public void setGoodsDetlCont(String goodsDetlCont) {
        this.goodsDetlCont = goodsDetlCont;
    }
    /**
     * @return the carDlYn
     */
    public String getCarDlYn() {
        return carDlYn;
    }
    /**
     * @param carDlYn the carDlYn to set
     */
    public void setCarDlYn(String carDlYn) {
        this.carDlYn = carDlYn;
    }
    /**
     * @return the scheConfirmDt
     */
    public Date getScheConfirmDt() {
        return scheConfirmDt;
    }
    /**
     * @param scheConfirmDt the scheConfirmDt to set
     */
    public void setScheConfirmDt(Date scheConfirmDt) {
        this.scheConfirmDt = scheConfirmDt;
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
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }
    /**
     * @return the vehicleInspecDt
     */
    public Date getVehicleInspecDt() {
        return vehicleInspecDt;
    }
    /**
     * @param vehicleInspecDt the vehicleInspecDt to set
     */
    public void setVehicleInspecDt(Date vehicleInspecDt) {
        this.vehicleInspecDt = vehicleInspecDt;
    }


}
