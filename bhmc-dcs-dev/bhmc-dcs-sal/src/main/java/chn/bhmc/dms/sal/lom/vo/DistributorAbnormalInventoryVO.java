package chn.bhmc.dms.sal.lom.vo;


import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.context.i18n.LocaleContextHolder;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;

import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;
import chn.bhmc.dms.core.support.excel.AbstractExcelDataBinder;
import chn.bhmc.dms.core.support.excel.ExcelDataBindContext;
import chn.bhmc.dms.core.support.excel.ExcelDataBinderUtil;
import chn.bhmc.dms.core.support.excel.ExcelDataBindingException;
import chn.bhmc.dms.core.support.excel.ExcelUploadError;
import chn.bhmc.dms.core.util.DateUtil;



/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : OrderGradeVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Lee Seungmin
 * @since 2016. 3. 23.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 23.     Lee Seungmin     최초 생성
 * </pre>
 */

public class DistributorAbnormalInventoryVO extends AbstractExcelDataBinder {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 7763510860260107026L;

    /**
     *  시스템 설정정보
     */
    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date exptDate;
    private String delayTime;
    private String tranDetail;

    private String vinNo;
    private String ncarDstinCd;
    private String vinNo1;       //车辆识别码
    private String vinNo2;
    private String carlineCd;    //车种代码
    private String carlineNm;
    private String fscCd;
    private String fscNm;
    private String modelCd;
    private String modelNm;
    private String ocnCd;
    private String ocnNm;
    private String extColorCd; //外观颜色代码
    private String extColorNm;
    private String intColorCd;
    private String intColorNm;
    private String carStatCd;
    private String ownStatCd;
    private String stockTp;
    private String carDstinCd;
    private String strgeCd;
    private String locCd;
    private String dlrCd;  //店代码
    private String saleTp;
    private String contractNo;
    private String greyYn;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date grDt;   // 入库日期  
    private String carRegNo;
    private String manufactYyMmDt;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date grteStartDt;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date grteEndDt;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date disuseDt;
    private String grteStdCd;
    private String delYn;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date carRegDt;
    private String corpCarDstinCd;
    private String mcarCd;
    private String makerCd;
    private String enginModelCd;
    private String enginSerialNo;
    private String keyNo;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date trimDt;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date signoffDt;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date dlrOrdReqDt;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date carVinAllocDt;
    private String carDumpCd;
    private String ordNo;
    private String ordDlrCd;
    private String ordDlrYyMmDt;
    private String ordMmDt;
    private String ordSeq;
    private String certNo;
    private String trsfDlrCd;
    private String trsfCmpCd;
    private String trsfCmpTruckNo;
    private String ordTp;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date pltGiDt;  //生产日期
    private String certSecuCd;
    private String erpOrdNo;
    private String cmpCd;
    private String distCd;
    private String gradeCd;
    private String divCd;
    private String enginNo;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date carAllocCancDt;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date invcPublDt;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date custSaleDt;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date custSaleCancDt;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date dlrGrDt;
    private String vinmEtc2;
    private String grReturnReasonCd;
    private String vinmEtc5;
    private String vinmEtc6;
    private String allocDlrCd;
    private String grReturnDt;
    private String vinmCmiv;
    private String vinmBkcd;
    private String vinmBktx;
    private String vinmWarc;
    private String statCd;
    private String vinmCpgm;
    private String vinmUpgm;
    private String rfidNo;
    private String vinmF20007;
    private String vinmF20008;
    private String vinmF20009;
    private String vinmF20010;
    private String retlTpCd;
    private String retlCancReasonCd;
    private String carNm;
    private String carDispQty;
    private String openYn;
    private String remark;
    private String lv2DlrOrgCd;
    private String lv2DlrStockYn;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date lv2DlrStockGrDt;
    private String cmpCarYn;
    private String cmpCarDstinCd;
    private String carRunDistVal;
    private String tecId;
    private String regUsrId;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date regDt;
    private String updtUsrId;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date updtDt;
    private String carBrandCd;
    private String temp1;
    private String temp2;
    private String temp3;
    private String temp4;
    private String temp5;
    private String temp6;
    private String temp7;
    private String temp8;
    private String temp9;
    private String temp10;

    private String frepCmpnId;
    private String frepCorpCd;
    private String frepDeptType;
    private String frepDeptPlac;
    private String frepDlrCd;
    private String frepCarLine;
    private String frepApplDate;
    private String frepEndDate;
    private String frepPrceRate;
    private String frepUnitPric;
    private String frepDlrChrg;
    private String frepDlrEuro;
    private String frepRtalChrg;
    private String frepRtalEuro;
    private String frepVendChrg;
    private String frepVendEuro;
    private String frepInsrChrg;
    private String frepInsrEuro;
    private String frepEtcChrg1;
    private String frepEtcChrg2;
    private String frepLeadTime;
    private String frepTurnTime;
    private String frepDistant;
    private String frepPricConf;
    private String frepStat;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date frepRgstDate;
    private String frepRgstNo;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date frepLastUpdate;
    private String frepUpdateNo;

    private String uploadTimestamp;
    private String uploadSeq;
    private String uploadDt;
    private String uploadHm;
    private String dstbCmpNm;
    private String trsfCarNo;
    private String trsfLocCd;
    private String trsfStatCd;
    private String driverNm;
    private String driverTelNo;
    private String preAlrtNtceCont;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date dstbCmpDlDt;
    private String dlrNm;
    private String cstlNm;
    private String distOfficeNm;
    private String sdptCd;  //事业部
    private String distOfficeCd; //办事处signoff_dt,t.dlr_gr_dt
    private String signoffDtStr;
    private String dlrGrDtStr;
    
    private Date dlrGrdt; //入库日期

    
    
    public Date getDlrGrdt() {
		return dlrGrdt;
	}

	public void setDlrGrdt(Date dlrGrdt) {
		this.dlrGrdt = dlrGrdt;
	}

	/**
     * @return the exptDate
     */
    public Date getExptDate() {
        return exptDate;
    }

    /**
     * @param exptDate the exptDate to set
     */
    public void setExptDate(Date exptDate) {
        this.exptDate = exptDate;
    }

    /**
     * @return the delayTime
     */
    public String getDelayTime() {
        return delayTime;
    }

    /**
     * @param delayTime the delayTime to set
     */
    public void setDelayTime(String delayTime) {
        this.delayTime = delayTime;
    }

    /**
     * @return the tranDetail
     */
    public String getTranDetail() {
        return tranDetail;
    }

    /**
     * @param tranDetail the tranDetail to set
     */
    public void setTranDetail(String tranDetail) {
        this.tranDetail = tranDetail;
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
     * @return the ownStatCd
     */
    public String getOwnStatCd() {
        return ownStatCd;
    }

    /**
     * @param ownStatCd the ownStatCd to set
     */
    public void setOwnStatCd(String ownStatCd) {
        this.ownStatCd = ownStatCd;
    }

    /**
     * @return the stockTp
     */
    public String getStockTp() {
        return stockTp;
    }

    /**
     * @param stockTp the stockTp to set
     */
    public void setStockTp(String stockTp) {
        this.stockTp = stockTp;
    }

    /**
     * @return the carDstinCd
     */
    public String getCarDstinCd() {
        return carDstinCd;
    }

    /**
     * @param carDstinCd the carDstinCd to set
     */
    public void setCarDstinCd(String carDstinCd) {
        this.carDstinCd = carDstinCd;
    }

    /**
     * @return the strgeCd
     */
    public String getStrgeCd() {
        return strgeCd;
    }

    /**
     * @param strgeCd the strgeCd to set
     */
    public void setStrgeCd(String strgeCd) {
        this.strgeCd = strgeCd;
    }

    /**
     * @return the locCd
     */
    public String getLocCd() {
        return locCd;
    }

    /**
     * @param locCd the locCd to set
     */
    public void setLocCd(String locCd) {
        this.locCd = locCd;
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
     * @return the greyYn
     */
    public String getGreyYn() {
        return greyYn;
    }

    /**
     * @param greyYn the greyYn to set
     */
    public void setGreyYn(String greyYn) {
        this.greyYn = greyYn;
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
     * @return the grteStartDt
     */
    public Date getGrteStartDt() {
        return grteStartDt;
    }

    /**
     * @param grteStartDt the grteStartDt to set
     */
    public void setGrteStartDt(Date grteStartDt) {
        this.grteStartDt = grteStartDt;
    }

    /**
     * @return the grteEndDt
     */
    public Date getGrteEndDt() {
        return grteEndDt;
    }

    /**
     * @param grteEndDt the grteEndDt to set
     */
    public void setGrteEndDt(Date grteEndDt) {
        this.grteEndDt = grteEndDt;
    }

    /**
     * @return the disuseDt
     */
    public Date getDisuseDt() {
        return disuseDt;
    }

    /**
     * @param disuseDt the disuseDt to set
     */
    public void setDisuseDt(Date disuseDt) {
        this.disuseDt = disuseDt;
    }

    /**
     * @return the grteStdCd
     */
    public String getGrteStdCd() {
        return grteStdCd;
    }

    /**
     * @param grteStdCd the grteStdCd to set
     */
    public void setGrteStdCd(String grteStdCd) {
        this.grteStdCd = grteStdCd;
    }

    /**
     * @return the delYn
     */
    public String getDelYn() {
        return delYn;
    }

    /**
     * @param delYn the delYn to set
     */
    public void setDelYn(String delYn) {
        this.delYn = delYn;
    }

    /**
     * @return the carRegDt
     */
    public Date getCarRegDt() {
        return carRegDt;
    }

    /**
     * @param carRegDt the carRegDt to set
     */
    public void setCarRegDt(Date carRegDt) {
        this.carRegDt = carRegDt;
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
     * @return the mcarCd
     */
    public String getMcarCd() {
        return mcarCd;
    }

    /**
     * @param mcarCd the mcarCd to set
     */
    public void setMcarCd(String mcarCd) {
        this.mcarCd = mcarCd;
    }

    /**
     * @return the makerCd
     */
    public String getMakerCd() {
        return makerCd;
    }

    /**
     * @param makerCd the makerCd to set
     */
    public void setMakerCd(String makerCd) {
        this.makerCd = makerCd;
    }

    /**
     * @return the enginModelCd
     */
    public String getEnginModelCd() {
        return enginModelCd;
    }

    /**
     * @param enginModelCd the enginModelCd to set
     */
    public void setEnginModelCd(String enginModelCd) {
        this.enginModelCd = enginModelCd;
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
     * @return the keyNo
     */
    public String getKeyNo() {
        return keyNo;
    }

    /**
     * @param keyNo the keyNo to set
     */
    public void setKeyNo(String keyNo) {
        this.keyNo = keyNo;
    }

    /**
     * @return the trimDt
     */
    public Date getTrimDt() {
        return trimDt;
    }

    /**
     * @param trimDt the trimDt to set
     */
    public void setTrimDt(Date trimDt) {
        this.trimDt = trimDt;
    }

    /**
     * @return the signoffDt
     */
    public Date getSignoffDt() {
        return signoffDt;
    }

    /**
     * @param signoffDt the signoffDt to set
     */
    public void setSignoffDt(Date signoffDt) {
        this.signoffDt = signoffDt;
    }

    /**
     * @return the dlrOrdReqDt
     */
    public Date getDlrOrdReqDt() {
        return dlrOrdReqDt;
    }

    /**
     * @param dlrOrdReqDt the dlrOrdReqDt to set
     */
    public void setDlrOrdReqDt(Date dlrOrdReqDt) {
        this.dlrOrdReqDt = dlrOrdReqDt;
    }

    /**
     * @return the carVinAllocDt
     */
    public Date getCarVinAllocDt() {
        return carVinAllocDt;
    }

    /**
     * @param carVinAllocDt the carVinAllocDt to set
     */
    public void setCarVinAllocDt(Date carVinAllocDt) {
        this.carVinAllocDt = carVinAllocDt;
    }

    /**
     * @return the carDumpCd
     */
    public String getCarDumpCd() {
        return carDumpCd;
    }

    /**
     * @param carDumpCd the carDumpCd to set
     */
    public void setCarDumpCd(String carDumpCd) {
        this.carDumpCd = carDumpCd;
    }

    /**
     * @return the ordNo
     */
    public String getOrdNo() {
        return ordNo;
    }

    /**
     * @param ordNo the ordNo to set
     */
    public void setOrdNo(String ordNo) {
        this.ordNo = ordNo;
    }

    /**
     * @return the ordDlrCd
     */
    public String getOrdDlrCd() {
        return ordDlrCd;
    }

    /**
     * @param ordDlrCd the ordDlrCd to set
     */
    public void setOrdDlrCd(String ordDlrCd) {
        this.ordDlrCd = ordDlrCd;
    }

    /**
     * @return the ordDlrYyMmDt
     */
    public String getOrdDlrYyMmDt() {
        return ordDlrYyMmDt;
    }

    /**
     * @param ordDlrYyMmDt the ordDlrYyMmDt to set
     */
    public void setOrdDlrYyMmDt(String ordDlrYyMmDt) {
        this.ordDlrYyMmDt = ordDlrYyMmDt;
    }

    /**
     * @return the ordMmDt
     */
    public String getOrdMmDt() {
        return ordMmDt;
    }

    /**
     * @param ordMmDt the ordMmDt to set
     */
    public void setOrdMmDt(String ordMmDt) {
        this.ordMmDt = ordMmDt;
    }

    /**
     * @return the ordSeq
     */
    public String getOrdSeq() {
        return ordSeq;
    }

    /**
     * @param ordSeq the ordSeq to set
     */
    public void setOrdSeq(String ordSeq) {
        this.ordSeq = ordSeq;
    }

    /**
     * @return the certNo
     */
    public String getCertNo() {
        return certNo;
    }

    /**
     * @param certNo the certNo to set
     */
    public void setCertNo(String certNo) {
        this.certNo = certNo;
    }

    /**
     * @return the trsfDlrCd
     */
    public String getTrsfDlrCd() {
        return trsfDlrCd;
    }

    /**
     * @param trsfDlrCd the trsfDlrCd to set
     */
    public void setTrsfDlrCd(String trsfDlrCd) {
        this.trsfDlrCd = trsfDlrCd;
    }

    /**
     * @return the trsfCmpCd
     */
    public String getTrsfCmpCd() {
        return trsfCmpCd;
    }

    /**
     * @param trsfCmpCd the trsfCmpCd to set
     */
    public void setTrsfCmpCd(String trsfCmpCd) {
        this.trsfCmpCd = trsfCmpCd;
    }

    /**
     * @return the trsfCmpTruckNo
     */
    public String getTrsfCmpTruckNo() {
        return trsfCmpTruckNo;
    }

    /**
     * @param trsfCmpTruckNo the trsfCmpTruckNo to set
     */
    public void setTrsfCmpTruckNo(String trsfCmpTruckNo) {
        this.trsfCmpTruckNo = trsfCmpTruckNo;
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
     * @return the pltGiDt
     */
    public Date getPltGiDt() {
        return pltGiDt;
    }

    /**
     * @param pltGiDt the pltGiDt to set
     */
    public void setPltGiDt(Date pltGiDt) {
        this.pltGiDt = pltGiDt;
    }

    /**
     * @return the certSecuCd
     */
    public String getCertSecuCd() {
        return certSecuCd;
    }

    /**
     * @param certSecuCd the certSecuCd to set
     */
    public void setCertSecuCd(String certSecuCd) {
        this.certSecuCd = certSecuCd;
    }

    /**
     * @return the erpOrdNo
     */
    public String getErpOrdNo() {
        return erpOrdNo;
    }

    /**
     * @param erpOrdNo the erpOrdNo to set
     */
    public void setErpOrdNo(String erpOrdNo) {
        this.erpOrdNo = erpOrdNo;
    }

    /**
     * @return the cmpCd
     */
    public String getCmpCd() {
        return cmpCd;
    }

    /**
     * @param cmpCd the cmpCd to set
     */
    public void setCmpCd(String cmpCd) {
        this.cmpCd = cmpCd;
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
     * @return the gradeCd
     */
    public String getGradeCd() {
        return gradeCd;
    }

    /**
     * @param gradeCd the gradeCd to set
     */
    public void setGradeCd(String gradeCd) {
        this.gradeCd = gradeCd;
    }

    /**
     * @return the divCd
     */
    public String getDivCd() {
        return divCd;
    }

    /**
     * @param divCd the divCd to set
     */
    public void setDivCd(String divCd) {
        this.divCd = divCd;
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
     * @return the carAllocCancDt
     */
    public Date getCarAllocCancDt() {
        return carAllocCancDt;
    }

    /**
     * @param carAllocCancDt the carAllocCancDt to set
     */
    public void setCarAllocCancDt(Date carAllocCancDt) {
        this.carAllocCancDt = carAllocCancDt;
    }

    /**
     * @return the invcPublDt
     */
    public Date getInvcPublDt() {
        return invcPublDt;
    }

    /**
     * @param invcPublDt the invcPublDt to set
     */
    public void setInvcPublDt(Date invcPublDt) {
        this.invcPublDt = invcPublDt;
    }

    /**
     * @return the custSaleDt
     */
    public Date getCustSaleDt() {
        return custSaleDt;
    }

    /**
     * @param custSaleDt the custSaleDt to set
     */
    public void setCustSaleDt(Date custSaleDt) {
        this.custSaleDt = custSaleDt;
    }

    /**
     * @return the custSaleCancDt
     */
    public Date getCustSaleCancDt() {
        return custSaleCancDt;
    }

    /**
     * @param custSaleCancDt the custSaleCancDt to set
     */
    public void setCustSaleCancDt(Date custSaleCancDt) {
        this.custSaleCancDt = custSaleCancDt;
    }

    /**
     * @return the dlrGrDt
     */
    public Date getDlrGrDt() {
        return dlrGrDt;
    }

    /**
     * @param dlrGrDt the dlrGrDt to set
     */
    public void setDlrGrDt(Date dlrGrDt) {
        this.dlrGrDt = dlrGrDt;
    }

    /**
     * @return the vinmEtc2
     */
    public String getVinmEtc2() {
        return vinmEtc2;
    }

    /**
     * @param vinmEtc2 the vinmEtc2 to set
     */
    public void setVinmEtc2(String vinmEtc2) {
        this.vinmEtc2 = vinmEtc2;
    }

    /**
     * @return the grReturnReasonCd
     */
    public String getGrReturnReasonCd() {
        return grReturnReasonCd;
    }

    /**
     * @param grReturnReasonCd the grReturnReasonCd to set
     */
    public void setGrReturnReasonCd(String grReturnReasonCd) {
        this.grReturnReasonCd = grReturnReasonCd;
    }

    /**
     * @return the vinmEtc5
     */
    public String getVinmEtc5() {
        return vinmEtc5;
    }

    /**
     * @param vinmEtc5 the vinmEtc5 to set
     */
    public void setVinmEtc5(String vinmEtc5) {
        this.vinmEtc5 = vinmEtc5;
    }

    /**
     * @return the vinmEtc6
     */
    public String getVinmEtc6() {
        return vinmEtc6;
    }

    /**
     * @param vinmEtc6 the vinmEtc6 to set
     */
    public void setVinmEtc6(String vinmEtc6) {
        this.vinmEtc6 = vinmEtc6;
    }

    /**
     * @return the allocDlrCd
     */
    public String getAllocDlrCd() {
        return allocDlrCd;
    }

    /**
     * @param allocDlrCd the allocDlrCd to set
     */
    public void setAllocDlrCd(String allocDlrCd) {
        this.allocDlrCd = allocDlrCd;
    }

    /**
     * @return the grReturnDt
     */
    public String getGrReturnDt() {
        return grReturnDt;
    }

    /**
     * @param grReturnDt the grReturnDt to set
     */
    public void setGrReturnDt(String grReturnDt) {
        this.grReturnDt = grReturnDt;
    }

    /**
     * @return the vinmCmiv
     */
    public String getVinmCmiv() {
        return vinmCmiv;
    }

    /**
     * @param vinmCmiv the vinmCmiv to set
     */
    public void setVinmCmiv(String vinmCmiv) {
        this.vinmCmiv = vinmCmiv;
    }

    /**
     * @return the vinmBkcd
     */
    public String getVinmBkcd() {
        return vinmBkcd;
    }

    /**
     * @param vinmBkcd the vinmBkcd to set
     */
    public void setVinmBkcd(String vinmBkcd) {
        this.vinmBkcd = vinmBkcd;
    }

    /**
     * @return the vinmBktx
     */
    public String getVinmBktx() {
        return vinmBktx;
    }

    /**
     * @param vinmBktx the vinmBktx to set
     */
    public void setVinmBktx(String vinmBktx) {
        this.vinmBktx = vinmBktx;
    }

    /**
     * @return the vinmWarc
     */
    public String getVinmWarc() {
        return vinmWarc;
    }

    /**
     * @param vinmWarc the vinmWarc to set
     */
    public void setVinmWarc(String vinmWarc) {
        this.vinmWarc = vinmWarc;
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
     * @return the vinmCpgm
     */
    public String getVinmCpgm() {
        return vinmCpgm;
    }

    /**
     * @param vinmCpgm the vinmCpgm to set
     */
    public void setVinmCpgm(String vinmCpgm) {
        this.vinmCpgm = vinmCpgm;
    }

    /**
     * @return the vinmUpgm
     */
    public String getVinmUpgm() {
        return vinmUpgm;
    }

    /**
     * @param vinmUpgm the vinmUpgm to set
     */
    public void setVinmUpgm(String vinmUpgm) {
        this.vinmUpgm = vinmUpgm;
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
     * @return the vinmF20007
     */
    public String getVinmF20007() {
        return vinmF20007;
    }

    /**
     * @param vinmF20007 the vinmF20007 to set
     */
    public void setVinmF20007(String vinmF20007) {
        this.vinmF20007 = vinmF20007;
    }

    /**
     * @return the vinmF20008
     */
    public String getVinmF20008() {
        return vinmF20008;
    }

    /**
     * @param vinmF20008 the vinmF20008 to set
     */
    public void setVinmF20008(String vinmF20008) {
        this.vinmF20008 = vinmF20008;
    }

    /**
     * @return the vinmF20009
     */
    public String getVinmF20009() {
        return vinmF20009;
    }

    /**
     * @param vinmF20009 the vinmF20009 to set
     */
    public void setVinmF20009(String vinmF20009) {
        this.vinmF20009 = vinmF20009;
    }

    /**
     * @return the vinmF20010
     */
    public String getVinmF20010() {
        return vinmF20010;
    }

    /**
     * @param vinmF20010 the vinmF20010 to set
     */
    public void setVinmF20010(String vinmF20010) {
        this.vinmF20010 = vinmF20010;
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
     * @return the retlCancReasonCd
     */
    public String getRetlCancReasonCd() {
        return retlCancReasonCd;
    }

    /**
     * @param retlCancReasonCd the retlCancReasonCd to set
     */
    public void setRetlCancReasonCd(String retlCancReasonCd) {
        this.retlCancReasonCd = retlCancReasonCd;
    }

    /**
     * @return the carNm
     */
    public String getCarNm() {
        return carNm;
    }

    /**
     * @param carNm the carNm to set
     */
    public void setCarNm(String carNm) {
        this.carNm = carNm;
    }

    /**
     * @return the carDispQty
     */
    public String getCarDispQty() {
        return carDispQty;
    }

    /**
     * @param carDispQty the carDispQty to set
     */
    public void setCarDispQty(String carDispQty) {
        this.carDispQty = carDispQty;
    }

    /**
     * @return the openYn
     */
    public String getOpenYn() {
        return openYn;
    }

    /**
     * @param openYn the openYn to set
     */
    public void setOpenYn(String openYn) {
        this.openYn = openYn;
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
     * @return the lv2DlrStockYn
     */
    public String getLv2DlrStockYn() {
        return lv2DlrStockYn;
    }

    /**
     * @param lv2DlrStockYn the lv2DlrStockYn to set
     */
    public void setLv2DlrStockYn(String lv2DlrStockYn) {
        this.lv2DlrStockYn = lv2DlrStockYn;
    }

    /**
     * @return the lv2DlrStockGrDt
     */
    public Date getLv2DlrStockGrDt() {
        return lv2DlrStockGrDt;
    }

    /**
     * @param lv2DlrStockGrDt the lv2DlrStockGrDt to set
     */
    public void setLv2DlrStockGrDt(Date lv2DlrStockGrDt) {
        this.lv2DlrStockGrDt = lv2DlrStockGrDt;
    }

    /**
     * @return the cmpCarYn
     */
    public String getCmpCarYn() {
        return cmpCarYn;
    }

    /**
     * @param cmpCarYn the cmpCarYn to set
     */
    public void setCmpCarYn(String cmpCarYn) {
        this.cmpCarYn = cmpCarYn;
    }

    /**
     * @return the cmpCarDstinCd
     */
    public String getCmpCarDstinCd() {
        return cmpCarDstinCd;
    }

    /**
     * @param cmpCarDstinCd the cmpCarDstinCd to set
     */
    public void setCmpCarDstinCd(String cmpCarDstinCd) {
        this.cmpCarDstinCd = cmpCarDstinCd;
    }

    /**
     * @return the carRunDistVal
     */
    public String getCarRunDistVal() {
        return carRunDistVal;
    }

    /**
     * @param carRunDistVal the carRunDistVal to set
     */
    public void setCarRunDistVal(String carRunDistVal) {
        this.carRunDistVal = carRunDistVal;
    }

    /**
     * @return the tecId
     */
    public String getTecId() {
        return tecId;
    }

    /**
     * @param tecId the tecId to set
     */
    public void setTecId(String tecId) {
        this.tecId = tecId;
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
     * @return the temp1
     */
    public String getTemp1() {
        return temp1;
    }

    /**
     * @param temp1 the temp1 to set
     */
    public void setTemp1(String temp1) {
        this.temp1 = temp1;
    }

    /**
     * @return the temp2
     */
    public String getTemp2() {
        return temp2;
    }

    /**
     * @param temp2 the temp2 to set
     */
    public void setTemp2(String temp2) {
        this.temp2 = temp2;
    }

    /**
     * @return the temp3
     */
    public String getTemp3() {
        return temp3;
    }

    /**
     * @param temp3 the temp3 to set
     */
    public void setTemp3(String temp3) {
        this.temp3 = temp3;
    }

    /**
     * @return the temp4
     */
    public String getTemp4() {
        return temp4;
    }

    /**
     * @param temp4 the temp4 to set
     */
    public void setTemp4(String temp4) {
        this.temp4 = temp4;
    }

    /**
     * @return the temp5
     */
    public String getTemp5() {
        return temp5;
    }

    /**
     * @param temp5 the temp5 to set
     */
    public void setTemp5(String temp5) {
        this.temp5 = temp5;
    }

    /**
     * @return the temp6
     */
    public String getTemp6() {
        return temp6;
    }

    /**
     * @param temp6 the temp6 to set
     */
    public void setTemp6(String temp6) {
        this.temp6 = temp6;
    }

    /**
     * @return the temp7
     */
    public String getTemp7() {
        return temp7;
    }

    /**
     * @param temp7 the temp7 to set
     */
    public void setTemp7(String temp7) {
        this.temp7 = temp7;
    }

    /**
     * @return the temp8
     */
    public String getTemp8() {
        return temp8;
    }

    /**
     * @param temp8 the temp8 to set
     */
    public void setTemp8(String temp8) {
        this.temp8 = temp8;
    }

    /**
     * @return the temp9
     */
    public String getTemp9() {
        return temp9;
    }

    /**
     * @param temp9 the temp9 to set
     */
    public void setTemp9(String temp9) {
        this.temp9 = temp9;
    }

    /**
     * @return the temp10
     */
    public String getTemp10() {
        return temp10;
    }

    /**
     * @param temp10 the temp10 to set
     */
    public void setTemp10(String temp10) {
        this.temp10 = temp10;
    }

    /**
     * @return the frepCmpnId
     */
    public String getFrepCmpnId() {
        return frepCmpnId;
    }

    /**
     * @param frepCmpnId the frepCmpnId to set
     */
    public void setFrepCmpnId(String frepCmpnId) {
        this.frepCmpnId = frepCmpnId;
    }

    /**
     * @return the frepCorpCd
     */
    public String getFrepCorpCd() {
        return frepCorpCd;
    }

    /**
     * @param frepCorpCd the frepCorpCd to set
     */
    public void setFrepCorpCd(String frepCorpCd) {
        this.frepCorpCd = frepCorpCd;
    }

    /**
     * @return the frepDeptType
     */
    public String getFrepDeptType() {
        return frepDeptType;
    }

    /**
     * @param frepDeptType the frepDeptType to set
     */
    public void setFrepDeptType(String frepDeptType) {
        this.frepDeptType = frepDeptType;
    }

    /**
     * @return the frepDeptPlac
     */
    public String getFrepDeptPlac() {
        return frepDeptPlac;
    }

    /**
     * @param frepDeptPlac the frepDeptPlac to set
     */
    public void setFrepDeptPlac(String frepDeptPlac) {
        this.frepDeptPlac = frepDeptPlac;
    }

    /**
     * @return the frepDlrCd
     */
    public String getFrepDlrCd() {
        return frepDlrCd;
    }

    /**
     * @param frepDlrCd the frepDlrCd to set
     */
    public void setFrepDlrCd(String frepDlrCd) {
        this.frepDlrCd = frepDlrCd;
    }

    /**
     * @return the frepCarLine
     */
    public String getFrepCarLine() {
        return frepCarLine;
    }

    /**
     * @param frepCarLine the frepCarLine to set
     */
    public void setFrepCarLine(String frepCarLine) {
        this.frepCarLine = frepCarLine;
    }

    /**
     * @return the frepApplDate
     */
    public String getFrepApplDate() {
        return frepApplDate;
    }

    /**
     * @param frepApplDate the frepApplDate to set
     */
    public void setFrepApplDate(String frepApplDate) {
        this.frepApplDate = frepApplDate;
    }

    /**
     * @return the frepEndDate
     */
    public String getFrepEndDate() {
        return frepEndDate;
    }

    /**
     * @param frepEndDate the frepEndDate to set
     */
    public void setFrepEndDate(String frepEndDate) {
        this.frepEndDate = frepEndDate;
    }

    /**
     * @return the frepPrceRate
     */
    public String getFrepPrceRate() {
        return frepPrceRate;
    }

    /**
     * @param frepPrceRate the frepPrceRate to set
     */
    public void setFrepPrceRate(String frepPrceRate) {
        this.frepPrceRate = frepPrceRate;
    }

    /**
     * @return the frepUnitPric
     */
    public String getFrepUnitPric() {
        return frepUnitPric;
    }

    /**
     * @param frepUnitPric the frepUnitPric to set
     */
    public void setFrepUnitPric(String frepUnitPric) {
        this.frepUnitPric = frepUnitPric;
    }

    /**
     * @return the frepDlrChrg
     */
    public String getFrepDlrChrg() {
        return frepDlrChrg;
    }

    /**
     * @param frepDlrChrg the frepDlrChrg to set
     */
    public void setFrepDlrChrg(String frepDlrChrg) {
        this.frepDlrChrg = frepDlrChrg;
    }

    /**
     * @return the frepDlrEuro
     */
    public String getFrepDlrEuro() {
        return frepDlrEuro;
    }

    /**
     * @param frepDlrEuro the frepDlrEuro to set
     */
    public void setFrepDlrEuro(String frepDlrEuro) {
        this.frepDlrEuro = frepDlrEuro;
    }

    /**
     * @return the frepRtalChrg
     */
    public String getFrepRtalChrg() {
        return frepRtalChrg;
    }

    /**
     * @param frepRtalChrg the frepRtalChrg to set
     */
    public void setFrepRtalChrg(String frepRtalChrg) {
        this.frepRtalChrg = frepRtalChrg;
    }

    /**
     * @return the frepRtalEuro
     */
    public String getFrepRtalEuro() {
        return frepRtalEuro;
    }

    /**
     * @param frepRtalEuro the frepRtalEuro to set
     */
    public void setFrepRtalEuro(String frepRtalEuro) {
        this.frepRtalEuro = frepRtalEuro;
    }

    /**
     * @return the frepVendChrg
     */
    public String getFrepVendChrg() {
        return frepVendChrg;
    }

    /**
     * @param frepVendChrg the frepVendChrg to set
     */
    public void setFrepVendChrg(String frepVendChrg) {
        this.frepVendChrg = frepVendChrg;
    }

    /**
     * @return the frepVendEuro
     */
    public String getFrepVendEuro() {
        return frepVendEuro;
    }

    /**
     * @param frepVendEuro the frepVendEuro to set
     */
    public void setFrepVendEuro(String frepVendEuro) {
        this.frepVendEuro = frepVendEuro;
    }

    /**
     * @return the frepInsrChrg
     */
    public String getFrepInsrChrg() {
        return frepInsrChrg;
    }

    /**
     * @param frepInsrChrg the frepInsrChrg to set
     */
    public void setFrepInsrChrg(String frepInsrChrg) {
        this.frepInsrChrg = frepInsrChrg;
    }

    /**
     * @return the frepInsrEuro
     */
    public String getFrepInsrEuro() {
        return frepInsrEuro;
    }

    /**
     * @param frepInsrEuro the frepInsrEuro to set
     */
    public void setFrepInsrEuro(String frepInsrEuro) {
        this.frepInsrEuro = frepInsrEuro;
    }

    /**
     * @return the frepEtcChrg1
     */
    public String getFrepEtcChrg1() {
        return frepEtcChrg1;
    }

    /**
     * @param frepEtcChrg1 the frepEtcChrg1 to set
     */
    public void setFrepEtcChrg1(String frepEtcChrg1) {
        this.frepEtcChrg1 = frepEtcChrg1;
    }

    /**
     * @return the frepEtcChrg2
     */
    public String getFrepEtcChrg2() {
        return frepEtcChrg2;
    }

    /**
     * @param frepEtcChrg2 the frepEtcChrg2 to set
     */
    public void setFrepEtcChrg2(String frepEtcChrg2) {
        this.frepEtcChrg2 = frepEtcChrg2;
    }

    /**
     * @return the frepLeadTime
     */
    public String getFrepLeadTime() {
        return frepLeadTime;
    }

    /**
     * @param frepLeadTime the frepLeadTime to set
     */
    public void setFrepLeadTime(String frepLeadTime) {
        this.frepLeadTime = frepLeadTime;
    }

    /**
     * @return the frepTurnTime
     */
    public String getFrepTurnTime() {
        return frepTurnTime;
    }

    /**
     * @param frepTurnTime the frepTurnTime to set
     */
    public void setFrepTurnTime(String frepTurnTime) {
        this.frepTurnTime = frepTurnTime;
    }

    /**
     * @return the frepDistant
     */
    public String getFrepDistant() {
        return frepDistant;
    }

    /**
     * @param frepDistant the frepDistant to set
     */
    public void setFrepDistant(String frepDistant) {
        this.frepDistant = frepDistant;
    }

    /**
     * @return the frepPricConf
     */
    public String getFrepPricConf() {
        return frepPricConf;
    }

    /**
     * @param frepPricConf the frepPricConf to set
     */
    public void setFrepPricConf(String frepPricConf) {
        this.frepPricConf = frepPricConf;
    }

    /**
     * @return the frepStat
     */
    public String getFrepStat() {
        return frepStat;
    }

    /**
     * @param frepStat the frepStat to set
     */
    public void setFrepStat(String frepStat) {
        this.frepStat = frepStat;
    }

    /**
     * @return the frepRgstDate
     */
    public Date getFrepRgstDate() {
        return frepRgstDate;
    }

    /**
     * @param frepRgstDate the frepRgstDate to set
     */
    public void setFrepRgstDate(Date frepRgstDate) {
        this.frepRgstDate = frepRgstDate;
    }

    /**
     * @return the frepRgstNo
     */
    public String getFrepRgstNo() {
        return frepRgstNo;
    }

    /**
     * @param frepRgstNo the frepRgstNo to set
     */
    public void setFrepRgstNo(String frepRgstNo) {
        this.frepRgstNo = frepRgstNo;
    }

    /**
     * @return the frepLastUpdate
     */
    public Date getFrepLastUpdate() {
        return frepLastUpdate;
    }

    /**
     * @param frepLastUpdate the frepLastUpdate to set
     */
    public void setFrepLastUpdate(Date frepLastUpdate) {
        this.frepLastUpdate = frepLastUpdate;
    }

    /**
     * @return the frepUpdateNo
     */
    public String getFrepUpdateNo() {
        return frepUpdateNo;
    }

    /**
     * @param frepUpdateNo the frepUpdateNo to set
     */
    public void setFrepUpdateNo(String frepUpdateNo) {
        this.frepUpdateNo = frepUpdateNo;
    }

    /**
     * @return the uploadTimestamp
     */
    public String getUploadTimestamp() {
        return uploadTimestamp;
    }

    /**
     * @param uploadTimestamp the uploadTimestamp to set
     */
    public void setUploadTimestamp(String uploadTimestamp) {
        this.uploadTimestamp = uploadTimestamp;
    }

    /**
     * @return the uploadSeq
     */
    public String getUploadSeq() {
        return uploadSeq;
    }

    /**
     * @param uploadSeq the uploadSeq to set
     */
    public void setUploadSeq(String uploadSeq) {
        this.uploadSeq = uploadSeq;
    }

    /**
     * @return the uploadDt
     */
    public String getUploadDt() {
        return uploadDt;
    }

    /**
     * @param uploadDt the uploadDt to set
     */
    public void setUploadDt(String uploadDt) {
        this.uploadDt = uploadDt;
    }

    /**
     * @return the uploadHm
     */
    public String getUploadHm() {
        return uploadHm;
    }

    /**
     * @param uploadHm the uploadHm to set
     */
    public void setUploadHm(String uploadHm) {
        this.uploadHm = uploadHm;
    }

    /**
     * @return the dstbCmpNm
     */
    public String getDstbCmpNm() {
        return dstbCmpNm;
    }

    /**
     * @param dstbCmpNm the dstbCmpNm to set
     */
    public void setDstbCmpNm(String dstbCmpNm) {
        this.dstbCmpNm = dstbCmpNm;
    }

    /**
     * @return the trsfCarNo
     */
    public String getTrsfCarNo() {
        return trsfCarNo;
    }

    /**
     * @param trsfCarNo the trsfCarNo to set
     */
    public void setTrsfCarNo(String trsfCarNo) {
        this.trsfCarNo = trsfCarNo;
    }

    /**
     * @return the trsfLocCd
     */
    public String getTrsfLocCd() {
        return trsfLocCd;
    }

    /**
     * @param trsfLocCd the trsfLocCd to set
     */
    public void setTrsfLocCd(String trsfLocCd) {
        this.trsfLocCd = trsfLocCd;
    }

    /**
     * @return the trsfStatCd
     */
    public String getTrsfStatCd() {
        return trsfStatCd;
    }

    /**
     * @param trsfStatCd the trsfStatCd to set
     */
    public void setTrsfStatCd(String trsfStatCd) {
        this.trsfStatCd = trsfStatCd;
    }

    /**
     * @return the driverNm
     */
    public String getDriverNm() {
        return driverNm;
    }

    /**
     * @param driverNm the driverNm to set
     */
    public void setDriverNm(String driverNm) {
        this.driverNm = driverNm;
    }

    /**
     * @return the driverTelNo
     */
    public String getDriverTelNo() {
        return driverTelNo;
    }

    /**
     * @param driverTelNo the driverTelNo to set
     */
    public void setDriverTelNo(String driverTelNo) {
        this.driverTelNo = driverTelNo;
    }

    /**
     * @return the preAlrtNtceCont
     */
    public String getPreAlrtNtceCont() {
        return preAlrtNtceCont;
    }

    /**
     * @param preAlrtNtceCont the preAlrtNtceCont to set
     */
    public void setPreAlrtNtceCont(String preAlrtNtceCont) {
        this.preAlrtNtceCont = preAlrtNtceCont;
    }

    /**
     * @return the dstbCmpDlDt
     */
    public Date getDstbCmpDlDt() {
        return dstbCmpDlDt;
    }

    /**
     * @param dstbCmpDlDt the dstbCmpDlDt to set
     */
    public void setDstbCmpDlDt(Date dstbCmpDlDt) {
        this.dstbCmpDlDt = dstbCmpDlDt;
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
     * @return the cstlNm
     */
    public String getCstlNm() {
        return cstlNm;
    }

    /**
     * @param cstlNm the cstlNm to set
     */
    public void setCstlNm(String cstlNm) {
        this.cstlNm = cstlNm;
    }

    /**
     * @return the distOfficeNm
     */
    public String getDistOfficeNm() {
        return distOfficeNm;
    }

    /**
     * @param distOfficeNm the distOfficeNm to set
     */
    public void setDistOfficeNm(String distOfficeNm) {
        this.distOfficeNm = distOfficeNm;
    }

    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }

    
    
    
	public String getSdptCd() {
		return sdptCd;
	}

	public void setSdptCd(String sdptCd) {
		this.sdptCd = sdptCd;
	}

	public String getDistOfficeCd() {
		return distOfficeCd;
	}

	public void setDistOfficeCd(String distOfficeCd) {
		this.distOfficeCd = distOfficeCd;
	}

	public void bind(int rowNo, int cellNo, Object value) throws ExcelDataBindingException {
        try{
        	/**
            switch(cellNo){
                case 0:this.setDlrCd(ExcelDataBinderUtil.toString(value).trim()); break;
                case 1:this.setVinNo(ExcelDataBinderUtil.toString(value).trim()); break;
                case 2:this.setDstbCmpNm(ExcelDataBinderUtil.toString(value).trim()); break;
                case 3:this.setTrsfCarNo(ExcelDataBinderUtil.toString(value).trim()); break;
                case 4:this.setTrsfLocCd(ExcelDataBinderUtil.toString(value).trim()); break;
                case 5:this.setTrsfStatCd(ExcelDataBinderUtil.toString(value).trim()); break;
                case 6:this.setDriverNm(ExcelDataBinderUtil.toString(value).trim()); break;
                case 7:this.setDriverTelNo(ExcelDataBinderUtil.toString(value).trim()); break;
                case 8:this.setPreAlrtNtceCont(ExcelDataBinderUtil.toString(value).trim()); break;
                case 9:this.setCarRegNo(ExcelDataBinderUtil.toString(value).trim()); break;
                case 10:this.setDstbCmpDlDt(getDateValue(value, "yyyy-MM-dd HH:mm:ss")); break;
                default :
            }
            **/
        	//dcs 在途信息上传 模板中“物流公司”删掉 贾明 2018-9-3
            switch(cellNo){
            case 0:this.setDlrCd(ExcelDataBinderUtil.toString(value).trim()); break;
            case 1:this.setVinNo(ExcelDataBinderUtil.toString(value).trim()); break;
            //case 2:this.setDstbCmpNm(ExcelDataBinderUtil.toString(value).trim()); break;
            case 2:this.setTrsfCarNo(ExcelDataBinderUtil.toString(value).trim()); break;
            case 3:this.setTrsfLocCd(ExcelDataBinderUtil.toString(value).trim()); break;
            case 4:this.setTrsfStatCd(ExcelDataBinderUtil.toString(value).trim()); break;
            case 5:this.setDriverNm(ExcelDataBinderUtil.toString(value).trim()); break;
            case 6:this.setDriverTelNo(ExcelDataBinderUtil.toString(value).trim()); break;
            case 7:this.setPreAlrtNtceCont(ExcelDataBinderUtil.toString(value).trim()); break;
            case 8:this.setCarRegNo(ExcelDataBinderUtil.toString(value).trim()); break;
            case 9:this.setDstbCmpDlDt(getDateValue(value, "yyyy-MM-dd HH:mm:ss")); break;
            default :
        }
        }catch(Exception e){

            ExcelDataBindingException bindingException = new ExcelDataBindingException(messageSource.getMessage("global.err.excelUpload.dataExtract", null, LocaleContextHolder.getLocale()), e);
            bindingException.setRowNo(rowNo);
            bindingException.setColNo(cellNo);
            bindingException.setFieldValue(value.toString());

            throw bindingException;
        }


    }

    public List<ExcelUploadError> validate(ExcelDataBindContext context) {

        List<ExcelUploadError> errors = new ArrayList<ExcelUploadError>();

        // vin no
        if(StringUtils.isBlank(this.getVinNo())){

            String msg = messageSource.getMessage(
                "global.info.required.field"
                , new String[]{
                        messageSource.getMessage("sal.lbl.vinNo", null, LocaleContextHolder.getLocale())
                }
                , LocaleContextHolder.getLocale()
            );

            errors.add(new ExcelUploadError(context.getRow(), 0, this.getVinNo(), msg));
        }

        //dcs 在途信息上传 模板中“物流公司”删掉 贾明 2018-9-3
        /**
        if(StringUtils.isBlank(this.getDstbCmpNm())){

            String msg = messageSource.getMessage(
                "global.info.required.field"
                , new String[]{
                        messageSource.getMessage("global.lbl.logisticsCmpn", null, LocaleContextHolder.getLocale())
                }
                , LocaleContextHolder.getLocale()
            );

            errors.add(new ExcelUploadError(context.getRow(), 1, this.getDstbCmpNm(), msg));
        }
      **/
        //TP차번호
        if(StringUtils.isBlank(this.getTrsfCarNo())){

            String msg = messageSource.getMessage(
                "global.info.required.field"
                , new String[]{
                        messageSource.getMessage("global.lbl.tpCarNo", null, LocaleContextHolder.getLocale())
                }
                , LocaleContextHolder.getLocale()
            );

            errors.add(new ExcelUploadError(context.getRow(), 2, this.getTrsfCarNo(), msg));
        }

        //운송중위치
        if(StringUtils.isBlank(this.getTrsfLocCd())){

            String msg = messageSource.getMessage(
                "global.info.required.field"
                , new String[]{
                        messageSource.getMessage("global.lbl.trsfPosition", null, LocaleContextHolder.getLocale())
                }
                , LocaleContextHolder.getLocale()
            );

            errors.add(new ExcelUploadError(context.getRow(), 3, this.getTrsfLocCd(), msg));
        }

        //상태
        if(StringUtils.isBlank(this.getTrsfStatCd())){

            String msg = messageSource.getMessage(
                "global.info.required.field"
                , new String[]{
                        messageSource.getMessage("global.lbl.statNm", null, LocaleContextHolder.getLocale())
                }
                , LocaleContextHolder.getLocale()
            );

            errors.add(new ExcelUploadError(context.getRow(), 4, this.getTrsfStatCd(), msg));
        }


        return errors;
    }

    /**
     * 해당 객체의 Date형의 형식을 받아온다.
     * yyyy-mm-mm , yyyy-m-m , yyyy.mm.mm , yyyy.m.m , yyyy/mm/mm , yyyy/m/m
     */
    public String getDatePattern(Object obj) throws Exception{
        String str = ExcelDataBinderUtil.toString(obj);

        if(StringUtils.isNotEmpty(str)){
            String gubun = str.substring(4, 5);

            return "yyyy"+gubun+"MM"+gubun+"dd";
        }

        return "yyyy-MM-dd";
    }
    public Date getDateValue(Object obj, String pattern) throws Exception{
        if(obj instanceof java.lang.String){
            String str = ExcelDataBinderUtil.toString(obj).trim();
            String gubun = str.substring(4, 5);

            int length = str.length();

            String[] date;
            if(gubun.equals("-")){
                date = str.split(gubun);
            }else{
                date = str.split("\\"+gubun);
            }

            if(length == 8 || length == 9){
                date[1] = StringUtils.leftPad(date[1], 2, "0");
                date[2] = StringUtils.leftPad(date[2], 2, "0");
            }

            return DateUtil.convertToDate(date[0]+gubun+date[1]+gubun+date[2], getDatePattern(obj));
        }else{
            return ExcelDataBinderUtil.getDateValue(obj, pattern);
        }
    }

	public String getSignoffDtStr() {
		return signoffDtStr;
	}

	public void setSignoffDtStr(String signoffDtStr) {
		this.signoffDtStr = signoffDtStr;
	}

	public String getDlrGrDtStr() {
		return dlrGrDtStr;
	}

	public void setDlrGrDtStr(String dlrGrDtStr) {
		this.dlrGrDtStr = dlrGrDtStr;
	}

    

}