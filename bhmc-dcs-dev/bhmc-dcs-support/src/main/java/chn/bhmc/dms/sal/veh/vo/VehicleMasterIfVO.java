package chn.bhmc.dms.sal.veh.vo;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonProperty;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : VehicleMasterIfVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Lee Seungmin
 * @since 2016. 9. 26.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 9. 26.     Lee Seungmin     최초 생성
 * </pre>
 */

public class VehicleMasterIfVO {

    private static long serialVersionUID = 7094630459059054030L;

    @JsonProperty("CAR_ID")
    private String carId;

    @JsonProperty("VIN_NO")
    private String vinNo;

    @JsonProperty("VIN_NO1")
    private String vinNo1;

    @JsonProperty("VIN_NO2")
    private String vinNo2;

    @JsonProperty("CARLINE_CD")
    private String carlineCd;

    @JsonProperty("MODEL_CD")
    private String modelCd;

    @JsonProperty("OCN_CD")
    private String ocnCd;

    @JsonProperty("EXT_COLOR_CD")
    private String extColorCd;

    @JsonProperty("INT_COLOR_CD")
    private String intColorCd;

    @JsonProperty("CAR_STAT_CD")
    private String carStatCd;

    @JsonProperty("OWN_STAT_CD")
    private String ownStatCd;

    @JsonProperty("STOCK_TP")
    private String stockTp;

    @JsonProperty("CAR_DSTIN_CD")
    private String carDstinCd;

    @JsonProperty("STRGE_CD")
    private String strgeCd;

    @JsonProperty("LOC_CD")
    private String locCd;

    @JsonProperty("DLR_CD")
    private String dlrCd;

    @JsonProperty("SALE_TP")
    private String saleTp;

    @JsonProperty("CONTRACT_NO")
    private String contractNo;

    @JsonProperty("NCAR_DSTIN_CD")
    private String ncarDstinCd;

    @JsonProperty("GREY_YN")
    private String greyYn;

    @JsonProperty("GR_DT")
    private Date grDt;

    @JsonProperty("CAR_REG_NO")
    private String carRegNo;

    @JsonProperty("MANUFACT_YY_MM_DT")
    private String manufactYyMmDt;

    @JsonProperty("GRTE_START_DT")
    private Date grteStartDt;

    @JsonProperty("GRTE_END_DT")
    private Date grteEndDt;

    @JsonProperty("DISUSE_DT")
    private Date disuseDt;

    @JsonProperty("GRTE_STD_CD")
    private String grteStdCd;

    @JsonProperty("DEL_YN")
    private String delYn;

    @JsonProperty("CAR_REG_DT")
    private Date carRegDt;

    @JsonProperty("CORP_CAR_DSTIN_CD")
    private String corpCarDstinCd;

    @JsonProperty("MCAR_CD")
    private String mcarCd;

    @JsonProperty("MAKER_CD")
    private String makerCd;

    @JsonProperty("ENGIN_MODEL_CD")
    private String enginModelCd;

    @JsonProperty("ENGIN_SERIAL_NO")
    private String enginSerialNo;

    @JsonProperty("KEY_NO")
    private String keyNo;

    @JsonProperty("TRIM_DT")
    private Date TrimDt;

    @JsonProperty("SIGNOFF_DT")
    private Date signoffDt;

    @JsonProperty("DLR_ORD_REQ_DT")
    private Date dlrOrdReqDt;

    @JsonProperty("CAR_VIN_ALLOC_DT")
    private Date carVinAllocDt;

    @JsonProperty("CAR_DUMP_CD")
    private String carDumpCd;

    @JsonProperty("ORD_NO")
    private String ordNo;

    @JsonProperty("ORD_DLR_CD")
    private String ordDlrCd;

    @JsonProperty("ORD_DLR_YY_MM_DT")
    private String ordDlrYyMmDt;

    @JsonProperty("ORD_MM_DT")
    private String ordMmDt;

    @JsonProperty("ORD_SEQ")
    private int ordSeq;

    @JsonProperty("CERT_NO")
    private String certNo;

    @JsonProperty("TRSF_DLR_CD")
    private String trsfDlrCd;

    @JsonProperty("TRSF_CMP_CD")
    private String trsfCmpCd;

    @JsonProperty("TRSF_CMP_TRUCK_NO")
    private String trsfCmpTruckNo;

    @JsonProperty("ORD_TP")
    private String ordTp;

    @JsonProperty("PLT_GI_DT")
    private Date pltGiDt;

    @JsonProperty("CERT_SECU_CD")
    private String certSecuCd;

    @JsonProperty("ERP_ORD_NO")
    private String erpOrdNo;

    @JsonProperty("CMP_CD")
    private String cmpCd;

    @JsonProperty("DIST_CD")
    private String distCd;

    @JsonProperty("GRADE_CD")
    private String gradeCd;

    @JsonProperty("DIV_CD")
    private String divCd;

    @JsonProperty("ENGIN_NO")
    private String enginNo;

    @JsonProperty("CAR_ALLOC_CANC_DT")
    private Date carAllocCancDt;

    @JsonProperty("INVC_PUBL_DT")
    private Date invcPublDt;

    @JsonProperty("CUST_SALE_DT")
    private Date custSaleDt;

    @JsonProperty("CUST_SALE_CANC_DT")
    private Date custSaleCancDt;

    @JsonProperty("DLR_GR_DT")
    private Date dlrGrDt;

    @JsonProperty("VINM_ETC2")
    private String vinmEtc2;

    @JsonProperty("GR_RETURN_REASON_CD")
    private String grReturnReasonCd;

    @JsonProperty("VINM_ETC5")
    private String vinmEtc5;

    @JsonProperty("VINM_ETC6")
    private String vinmEtc6;

    @JsonProperty("ALLOC_DLR_CD")
    private String allocDlrCd;

    @JsonProperty("GR_RETURN_DT")
    private Date grReturnDt;

    @JsonProperty("VINM_CMIV")
    private String vinmCmiv;

    @JsonProperty("VINM_BKCD")
    private String vinmBkcd;

    @JsonProperty("VINM_BKTX")
    private String vinmBktx;

    @JsonProperty("VINM_WARC")
    private String vinmWarc;

    @JsonProperty("STAT_CD")
    private String statCd;

    @JsonProperty("VINM_CPGM")
    private String vinmCpgm;

    @JsonProperty("VINM_UPGM")
    private String vinmUpgm;

    @JsonProperty("RFID_NO")
    private String rfidNo;

    @JsonProperty("VINM_F20007")
    private String vinmF20007;

    @JsonProperty("VINM_F20008")
    private String vinmF20008;

    @JsonProperty("VINM_F20009")
    private String vinmF20009;

    @JsonProperty("VINM_F20010")
    private String vinmF20010;

    @JsonProperty("RETL_TP_CD")
    private String retlTpCd;

    @JsonProperty("RETL_CANC_REASON_CD")
    private String retlCancReasonCd;

    @JsonProperty("CAR_NM")
    private String carNm;

    @JsonProperty("CAR_DISP_QTY")
    private int carDispQty;

    @JsonProperty("OPEN_YN")
    private String openYn;

    @JsonProperty("REMARK")
    private String remark;

    @JsonProperty("LV2_DLR_ORG_CD")
    private String lv2DlrOrgCd;

    @JsonProperty("LV2_DLR_STOCK_YN")
    private String lv2DlrStockYn;

    @JsonProperty("LV2_DLR_STOCK_GR_DT")
    private Date lv2DlrStockGrDt;

    @JsonProperty("CMP_CAR_YN")
    private String cmpCarYn;

    @JsonProperty("CMP_CAR_DSTIN_CD")
    private String cmpCarDstinCd;

    @JsonProperty("CAR_RUN_DIST_VAL")
    private int carRunDstVal;

    @JsonProperty("TEC_ID")
    private String tecId;

    @JsonProperty("CAR_BRAND_CD")
    private String carBrandCd;

    @JsonProperty("TEMP1")
    private String temp1;

    @JsonProperty("TEMP2")
    private String temp2;

    @JsonProperty("TEMP3")
    private String temp3;

    @JsonProperty("TEMP4")
    private String temp4;

    @JsonProperty("TEMP5")
    private String temp5;

    @JsonProperty("TEMP6")
    private int temp6;

    @JsonProperty("TEMP7")
    private int temp7;

    @JsonProperty("TEMP8")
    private int temp8;

    @JsonProperty("TEMP9")
    private int temp9;

    @JsonProperty("TEMP10")
    private int temp10;

    @JsonProperty("REG_USR_ID")
    private String regUsrId;

    @JsonProperty("REG_DT")
    private Date regDt;

    @JsonProperty("UPDT_USR_ID")
    private String updtUsrId;

    @JsonProperty("UPDT_DT")
    private Date updtDt;

    @JsonProperty("PRE_GI_YN")
    private String preGiYn;

    @JsonProperty("DAMAGE_YN")
    private String dmageYn;

    @JsonProperty("MM_CNT")
    private int mmCnt;

    @JsonProperty("DD_CNT")
    private int ddCnt;

    @JsonProperty("RETL_PRC")
    private int retlPrc;

    @JsonProperty("WHSL_PRC")
    private int whslPrc;

    @JsonProperty("DDCT_RATE")
    private int ddctRate;

    @JsonProperty("BLOCK_SALE_ADV_NO")
    private String blockSaleAdvNo;

    @JsonProperty("TM_NO1")
    private String tmNo1;

    @JsonProperty("TM_NO2")
    private String tmNo2;

    @JsonProperty("CERT_SECU2_CD")
    private String certSecu2Cd;

    @JsonProperty("JEONGPAN_NO")
    private String jeongpanNo;

    @JsonProperty("SALE_EMP_NO")
    private String saleEmpNo;

    @JsonProperty("EXPC_CHK_DT")
    private Date expcChkDt;

    @JsonProperty("EXPC_CHK_RUN_DIST_VAL")
    private int expcChkRunDistVal;

    @JsonProperty("CUST_NO")
    private String custNo;

    @JsonProperty("CUST_NM")
    private String custNm;

    @JsonProperty("BHMC_YN")
    private String bhmcYn;

    @JsonProperty("TEL_NO")
    private String telNo;

    @JsonProperty("HP_NO")
    private String hpNo;

    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }

    /**
     * @param serialversionuid the serialversionuid to set
     */
    public static void setSerialversionuid(long serialversionuid) {
        serialVersionUID = serialversionuid;
    }

    /**
     * @return the carId
     */
    public String getCarId() {
        return carId;
    }

    /**
     * @param carId the carId to set
     */
    public void setCarId(String carId) {
        this.carId = carId;
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
        return TrimDt;
    }

    /**
     * @param trimDt the trimDt to set
     */
    public void setTrimDt(Date trimDt) {
        TrimDt = trimDt;
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
    public int getOrdSeq() {
        return ordSeq;
    }

    /**
     * @param ordSeq the ordSeq to set
     */
    public void setOrdSeq(int ordSeq) {
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
    public Date getGrReturnDt() {
        return grReturnDt;
    }

    /**
     * @param grReturnDt the grReturnDt to set
     */
    public void setGrReturnDt(Date grReturnDt) {
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
    public int getCarDispQty() {
        return carDispQty;
    }

    /**
     * @param carDispQty the carDispQty to set
     */
    public void setCarDispQty(int carDispQty) {
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
     * @return the carRunDstVal
     */
    public int getCarRunDstVal() {
        return carRunDstVal;
    }

    /**
     * @param carRunDstVal the carRunDstVal to set
     */
    public void setCarRunDstVal(int carRunDstVal) {
        this.carRunDstVal = carRunDstVal;
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
    public int getTemp6() {
        return temp6;
    }

    /**
     * @param temp6 the temp6 to set
     */
    public void setTemp6(int temp6) {
        this.temp6 = temp6;
    }

    /**
     * @return the temp7
     */
    public int getTemp7() {
        return temp7;
    }

    /**
     * @param temp7 the temp7 to set
     */
    public void setTemp7(int temp7) {
        this.temp7 = temp7;
    }

    /**
     * @return the temp8
     */
    public int getTemp8() {
        return temp8;
    }

    /**
     * @param temp8 the temp8 to set
     */
    public void setTemp8(int temp8) {
        this.temp8 = temp8;
    }

    /**
     * @return the temp9
     */
    public int getTemp9() {
        return temp9;
    }

    /**
     * @param temp9 the temp9 to set
     */
    public void setTemp9(int temp9) {
        this.temp9 = temp9;
    }

    /**
     * @return the temp10
     */
    public int getTemp10() {
        return temp10;
    }

    /**
     * @param temp10 the temp10 to set
     */
    public void setTemp10(int temp10) {
        this.temp10 = temp10;
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
     * @return the preGiYn
     */
    public String getPreGiYn() {
        return preGiYn;
    }

    /**
     * @param preGiYn the preGiYn to set
     */
    public void setPreGiYn(String preGiYn) {
        this.preGiYn = preGiYn;
    }

    /**
     * @return the dmageYn
     */
    public String getDmageYn() {
        return dmageYn;
    }

    /**
     * @param dmageYn the dmageYn to set
     */
    public void setDmageYn(String dmageYn) {
        this.dmageYn = dmageYn;
    }

    /**
     * @return the mmCnt
     */
    public int getMmCnt() {
        return mmCnt;
    }

    /**
     * @param mmCnt the mmCnt to set
     */
    public void setMmCnt(int mmCnt) {
        this.mmCnt = mmCnt;
    }

    /**
     * @return the ddCnt
     */
    public int getDdCnt() {
        return ddCnt;
    }

    /**
     * @param ddCnt the ddCnt to set
     */
    public void setDdCnt(int ddCnt) {
        this.ddCnt = ddCnt;
    }

    /**
     * @return the retlPrc
     */
    public int getRetlPrc() {
        return retlPrc;
    }

    /**
     * @param retlPrc the retlPrc to set
     */
    public void setRetlPrc(int retlPrc) {
        this.retlPrc = retlPrc;
    }

    /**
     * @return the whslPrc
     */
    public int getWhslPrc() {
        return whslPrc;
    }

    /**
     * @param whslPrc the whslPrc to set
     */
    public void setWhslPrc(int whslPrc) {
        this.whslPrc = whslPrc;
    }

    /**
     * @return the ddctRate
     */
    public int getDdctRate() {
        return ddctRate;
    }

    /**
     * @param ddctRate the ddctRate to set
     */
    public void setDdctRate(int ddctRate) {
        this.ddctRate = ddctRate;
    }

    /**
     * @return the blockSaleAdvNo
     */
    public String getBlockSaleAdvNo() {
        return blockSaleAdvNo;
    }

    /**
     * @param blockSaleAdvNo the blockSaleAdvNo to set
     */
    public void setBlockSaleAdvNo(String blockSaleAdvNo) {
        this.blockSaleAdvNo = blockSaleAdvNo;
    }

    /**
     * @return the tmNo1
     */
    public String getTmNo1() {
        return tmNo1;
    }

    /**
     * @param tmNo1 the tmNo1 to set
     */
    public void setTmNo1(String tmNo1) {
        this.tmNo1 = tmNo1;
    }

    /**
     * @return the tmNo2
     */
    public String getTmNo2() {
        return tmNo2;
    }

    /**
     * @param tmNo2 the tmNo2 to set
     */
    public void setTmNo2(String tmNo2) {
        this.tmNo2 = tmNo2;
    }

    /**
     * @return the certSecu2Cd
     */
    public String getCertSecu2Cd() {
        return certSecu2Cd;
    }

    /**
     * @param certSecu2Cd the certSecu2Cd to set
     */
    public void setCertSecu2Cd(String certSecu2Cd) {
        this.certSecu2Cd = certSecu2Cd;
    }

    /**
     * @return the jeongpanNo
     */
    public String getJeongpanNo() {
        return jeongpanNo;
    }

    /**
     * @param jeongpanNo the jeongpanNo to set
     */
    public void setJeongpanNo(String jeongpanNo) {
        this.jeongpanNo = jeongpanNo;
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
     * @return the expcChkDt
     */
    public Date getExpcChkDt() {
        return expcChkDt;
    }

    /**
     * @param expcChkDt the expcChkDt to set
     */
    public void setExpcChkDt(Date expcChkDt) {
        this.expcChkDt = expcChkDt;
    }

    /**
     * @return the expcChkRunDistVal
     */
    public int getExpcChkRunDistVal() {
        return expcChkRunDistVal;
    }

    /**
     * @param expcChkRunDistVal the expcChkRunDistVal to set
     */
    public void setExpcChkRunDistVal(int expcChkRunDistVal) {
        this.expcChkRunDistVal = expcChkRunDistVal;
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
     * @return the bhmcYn
     */
    public String getBhmcYn() {
        return bhmcYn;
    }

    /**
     * @param bhmcYn the bhmcYn to set
     */
    public void setBhmcYn(String bhmcYn) {
        this.bhmcYn = bhmcYn;
    }

    /**
     * @return the telNo
     */
    public String getTelNo() {
        return telNo;
    }

    /**
     * @param telNo the telNo to set
     */
    public void setTelNo(String telNo) {
        this.telNo = telNo;
    }

    /**
     * @return the hpNo
     */
    public String getHpNo() {
        return hpNo;
    }

    /**
     * @param hpNo the hpNo to set
     */
    public void setHpNo(String hpNo) {
        this.hpNo = hpNo;
    }
}