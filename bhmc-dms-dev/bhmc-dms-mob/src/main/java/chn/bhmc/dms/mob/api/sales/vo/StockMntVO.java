 package chn.bhmc.dms.mob.api.sales.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * @ClassName   : StockMntVO
 * @Description : 재고관리 VO
 * @author Jin Suk Kim
 * @since 2016. 3. 24.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 11. 24.     Jin Suk Kim     최초 생성
 * </pre>
 */

public class StockMntVO extends BaseVO{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -1953891789085584090L;

    private String carId;
    private String stockTp;
    private String carStatNm;
    private String vinNo;
    private String ncarDstinCd;
    private String carlineCd;
    private String carlineNm;
    private String modelCd;
    private String modelNm;
    private String ocnCd;
    private String ocnNm;
    private String extColorCd;
    private String extColorNm;
    private String intColorCd;
    private String intColorNm;
    private String ordTp;
    private String ordTpNm;
    private String strYn;
    private String strNo;
    private String damageCd;
    private String lockKindNm;
    private String blockYn;
    private String blockSaleAdvNo;
    private String strgeCd;
    private String locCd;
    private String locNm;
    private String cmpCarYn;
    private String cmpCarDstinCd;
    private String bfDamageCd;
    private String bfBlockYn;
    private String bfBlockSaleAdvNo;
    private String bfStrgeCd;
    private String bfLocCd;
    private String bfCmpCarYn;
    private String bfCmpCarDstinCd;
    private String openYn;
    private double retlPrc;
    private String usedAmtTp;
    private String usedAmtTpNm;
    private String bankNm;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date signoffDt;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date signoffDtFormat;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date pltGiDt;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date dlrGrDt;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date pltGiDtFormat;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date dlrGrDtFormat;
    
    private String pltGiDtStr;
    private String dlrGrDtStr;
    
    private String enginModelCd;
    private String certNo;
    private String carStatCd;
    private String ownStatCd;
    private String mmCnt;
    private String mmCntColor;
    private String giDdCnt;
    private String grDdCnt;
    private double whslPrc;
    private String dlrCd;
    private String dlrNm;

    private String statChgCd;         // 상태변동코드
    private String statChgBefCont;    // 상태변동전내용
    private String statChgAftCont;    // 상태변동후내용

    private String vinmF20010;
    private String temp2;
    
    private int cnt;
    
    private String reqStatCd;         // 이상출고 신청 진행상태
    
    /*   전략출고 신청   */

    /**
     * @return the vinmF20010
     */
    public String getVinmF20010() {
        return vinmF20010;
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
     * @param vinmF20010 the vinmF20010 to set
     */
    public void setVinmF20010(String vinmF20010) {
        this.vinmF20010 = vinmF20010;
    }
    /**
     * 전략출고 심사상태
     **/
    //STR_STAT
    private  String        strStat;
    private  String        strStatCd;
    
    /**
     * 전략출고 신청일자
     **/
    //STR_ASK_DT
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date          strAskDt;
    /**
     * 전략출고 심사일자
     **/
    //STR_CONFIRM_DT
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date          strConfirmDt;
    /**
     * 심사자
     **/
    //CONFIRM_USR_ID
    private  String        confirmUsrId;
    /**
     * 심사비고
     **/
    //CONFIRM_REMARK
    private  String        confirmRemark;
    /**
     * 고객코드
     **/
    //CUST_CD
    private  String        custCd;
    /**
     * 고객명
     **/
    //CUST_NM
    private  String        custNm;
    /**
     * 비고
     **/
    //REMARK
    private  String        remark;
    /**
     * 계약번호
     **/
    //CONTRACT_NO
    private  String        contractNo;
    /**
     * 취소일자
     **/
    //CANC_DT
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date          cancDt;
    /**
     * 취소사유
     **/
    //CAANC_RESON
    private  String        caancReson;

    /* End 전략출고 신청   */

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
     * @return the carStatNm
     */
    public String getCarStatNm() {
        return carStatNm;
    }
    /**
     * @param carStatNm the carStatNm to set
     */
    public void setCarStatNm(String carStatNm) {
        this.carStatNm = carStatNm;
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
     * @return the ordTpNm
     */
    public String getOrdTpNm() {
        return ordTpNm;
    }
    /**
     * @param ordTpNm the ordTpNm to set
     */
    public void setOrdTpNm(String ordTpNm) {
        this.ordTpNm = ordTpNm;
    }
    /**
     * @return the strYn
     */
    public String getStrYn() {
        return strYn;
    }
    /**
     * @param strYn the strYn to set
     */
    public void setStrYn(String strYn) {
        this.strYn = strYn;
    }
    /**
     * @return the strNo
     */
    public String getStrNo() {
        return strNo;
    }
    /**
     * @param strNo the strNo to set
     */
    public void setStrNo(String strNo) {
        this.strNo = strNo;
    }
    /**
     * @return the damageCd
     */
    public String getDamageCd() {
        return damageCd;
    }
    /**
     * @param damageCd the damageCd to set
     */
    public void setDamageCd(String damageCd) {
        this.damageCd = damageCd;
    }
    /**
     * @return the lockKindNm
     */
    public String getLockKindNm() {
        return lockKindNm;
    }
    /**
     * @param lockKindNm the lockKindNm to set
     */
    public void setLockKindNm(String lockKindNm) {
        this.lockKindNm = lockKindNm;
    }
    /**
     * @return the blockYn
     */
    public String getBlockYn() {
        return blockYn;
    }
    /**
     * @param blockYn the blockYn to set
     */
    public void setBlockYn(String blockYn) {
        this.blockYn = blockYn;
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
     * @return the locNm
     */
    public String getLocNm() {
        return locNm;
    }
    /**
     * @param locNm the locNm to set
     */
    public void setLocNm(String locNm) {
        this.locNm = locNm;
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
     * @return the bfDamageCd
     */
    public String getBfDamageCd() {
        return bfDamageCd;
    }
    /**
     * @param bfDamageCd the bfDamageCd to set
     */
    public void setBfDamageCd(String bfDamageCd) {
        this.bfDamageCd = bfDamageCd;
    }
    /**
     * @return the bfBlockYn
     */
    public String getBfBlockYn() {
        return bfBlockYn;
    }
    /**
     * @param bfBlockYn the bfBlockYn to set
     */
    public void setBfBlockYn(String bfBlockYn) {
        this.bfBlockYn = bfBlockYn;
    }
    /**
     * @return the bfBlockSaleAdvNo
     */
    public String getBfBlockSaleAdvNo() {
        return bfBlockSaleAdvNo;
    }
    /**
     * @param bfBlockSaleAdvNo the bfBlockSaleAdvNo to set
     */
    public void setBfBlockSaleAdvNo(String bfBlockSaleAdvNo) {
        this.bfBlockSaleAdvNo = bfBlockSaleAdvNo;
    }
    /**
     * @return the bfStrgeCd
     */
    public String getBfStrgeCd() {
        return bfStrgeCd;
    }
    /**
     * @param bfStrgeCd the bfStrgeCd to set
     */
    public void setBfStrgeCd(String bfStrgeCd) {
        this.bfStrgeCd = bfStrgeCd;
    }
    /**
     * @return the bfLocCd
     */
    public String getBfLocCd() {
        return bfLocCd;
    }
    /**
     * @param bfLocCd the bfLocCd to set
     */
    public void setBfLocCd(String bfLocCd) {
        this.bfLocCd = bfLocCd;
    }
    /**
     * @return the bfCmpCarYn
     */
    public String getBfCmpCarYn() {
        return bfCmpCarYn;
    }
    /**
     * @param bfCmpCarYn the bfCmpCarYn to set
     */
    public void setBfCmpCarYn(String bfCmpCarYn) {
        this.bfCmpCarYn = bfCmpCarYn;
    }
    /**
     * @return the bfCmpCarDstinCd
     */
    public String getBfCmpCarDstinCd() {
        return bfCmpCarDstinCd;
    }
    /**
     * @param bfCmpCarDstinCd the bfCmpCarDstinCd to set
     */
    public void setBfCmpCarDstinCd(String bfCmpCarDstinCd) {
        this.bfCmpCarDstinCd = bfCmpCarDstinCd;
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
     * @return the retlPrc
     */
    public double getRetlPrc() {
        return retlPrc;
    }
    /**
     * @param retlPrc the retlPrc to set
     */
    public void setRetlPrc(double retlPrc) {
        this.retlPrc = retlPrc;
    }
    /**
     * @return the usedAmtTp
     */
    public String getUsedAmtTp() {
        return usedAmtTp;
    }
    /**
     * @param usedAmtTp the usedAmtTp to set
     */
    public void setUsedAmtTp(String usedAmtTp) {
        this.usedAmtTp = usedAmtTp;
    }
    /**
     * @return the usedAmtTpNm
     */
    public String getUsedAmtTpNm() {
        return usedAmtTpNm;
    }
    /**
     * @param usedAmtTpNm the usedAmtTpNm to set
     */
    public void setUsedAmtTpNm(String usedAmtTpNm) {
        this.usedAmtTpNm = usedAmtTpNm;
    }
    /**
     * @return the bankNm
     */
    public String getBankNm() {
        return bankNm;
    }
    /**
     * @param bankNm the bankNm to set
     */
    public void setBankNm(String bankNm) {
        this.bankNm = bankNm;
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
     * @return the signoffDtFormat
     */
    public Date getSignoffDtFormat() {
        return signoffDtFormat;
    }
    /**
     * @param signoffDtFormat the signoffDtFormat to set
     */
    public void setSignoffDtFormat(Date signoffDtFormat) {
        this.signoffDtFormat = signoffDtFormat;
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
     * @return the pltGiDtFormat
     */
    public Date getPltGiDtFormat() {
        return pltGiDtFormat;
    }
    /**
     * @param pltGiDtFormat the pltGiDtFormat to set
     */
    public void setPltGiDtFormat(Date pltGiDtFormat) {
        this.pltGiDtFormat = pltGiDtFormat;
    }
    /**
     * @return the dlrGrDtFormat
     */
    public Date getDlrGrDtFormat() {
        return dlrGrDtFormat;
    }
    /**
     * @param dlrGrDtFormat the dlrGrDtFormat to set
     */
    public void setDlrGrDtFormat(Date dlrGrDtFormat) {
        this.dlrGrDtFormat = dlrGrDtFormat;
    }
    /**
     * @return the pltGiDtStr
     */
    public String getPltGiDtStr() {
        return pltGiDtStr;
    }
    /**
     * @param pltGiDtStr the pltGiDtStr to set
     */
    public void setPltGiDtStr(String pltGiDtStr) {
        this.pltGiDtStr = pltGiDtStr;
    }
    /**
     * @return the dlrGrDtStr
     */
    public String getDlrGrDtStr() {
        return dlrGrDtStr;
    }
    /**
     * @param dlrGrDtStr the dlrGrDtStr to set
     */
    public void setDlrGrDtStr(String dlrGrDtStr) {
        this.dlrGrDtStr = dlrGrDtStr;
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
     * @return the mmCnt
     */
    public String getMmCnt() {
        return mmCnt;
    }
    /**
     * @param mmCnt the mmCnt to set
     */
    public void setMmCnt(String mmCnt) {
        this.mmCnt = mmCnt;
    }
    /**
     * @return the mmCntColor
     */
    public String getMmCntColor() {
        return mmCntColor;
    }
    /**
     * @param mmCntColor the mmCntColor to set
     */
    public void setMmCntColor(String mmCntColor) {
        this.mmCntColor = mmCntColor;
    }
    /**
     * @return the giDdCnt
     */
    public String getGiDdCnt() {
        return giDdCnt;
    }
    /**
     * @param giDdCnt the giDdCnt to set
     */
    public void setGiDdCnt(String giDdCnt) {
        this.giDdCnt = giDdCnt;
    }
    /**
     * @return the grDdCnt
     */
    public String getGrDdCnt() {
        return grDdCnt;
    }
    /**
     * @param grDdCnt the grDdCnt to set
     */
    public void setGrDdCnt(String grDdCnt) {
        this.grDdCnt = grDdCnt;
    }
    /**
     * @return the whslPrc
     */
    public double getWhslPrc() {
        return whslPrc;
    }
    /**
     * @param whslPrc the whslPrc to set
     */
    public void setWhslPrc(double whslPrc) {
        this.whslPrc = whslPrc;
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
     * @return the statChgCd
     */
    public String getStatChgCd() {
        return statChgCd;
    }
    /**
     * @param statChgCd the statChgCd to set
     */
    public void setStatChgCd(String statChgCd) {
        this.statChgCd = statChgCd;
    }
    /**
     * @return the statChgBefCont
     */
    public String getStatChgBefCont() {
        return statChgBefCont;
    }
    /**
     * @param statChgBefCont the statChgBefCont to set
     */
    public void setStatChgBefCont(String statChgBefCont) {
        this.statChgBefCont = statChgBefCont;
    }
    /**
     * @return the statChgAftCont
     */
    public String getStatChgAftCont() {
        return statChgAftCont;
    }
    /**
     * @param statChgAftCont the statChgAftCont to set
     */
    public void setStatChgAftCont(String statChgAftCont) {
        this.statChgAftCont = statChgAftCont;
    }
    /**
     * @return the strStat
     */
    public String getStrStat() {
        return strStat;
    }
    /**
     * @param strStat the strStat to set
     */
    public void setStrStat(String strStat) {
        this.strStat = strStat;
    }
    /**
     * @return the strStatCd
     */
    public String getStrStatCd() {
        return strStatCd;
    }
    /**
     * @param strStatCd the strStatCd to set
     */
    public void setStrStatCd(String strStatCd) {
        this.strStatCd = strStatCd;
    }
    /**
     * @return the strAskDt
     */
    public Date getStrAskDt() {
        return strAskDt;
    }
    /**
     * @param strAskDt the strAskDt to set
     */
    public void setStrAskDt(Date strAskDt) {
        this.strAskDt = strAskDt;
    }
    /**
     * @return the strConfirmDt
     */
    public Date getStrConfirmDt() {
        return strConfirmDt;
    }
    /**
     * @param strConfirmDt the strConfirmDt to set
     */
    public void setStrConfirmDt(Date strConfirmDt) {
        this.strConfirmDt = strConfirmDt;
    }
    /**
     * @return the confirmUsrId
     */
    public String getConfirmUsrId() {
        return confirmUsrId;
    }
    /**
     * @param confirmUsrId the confirmUsrId to set
     */
    public void setConfirmUsrId(String confirmUsrId) {
        this.confirmUsrId = confirmUsrId;
    }
    /**
     * @return the confirmRemark
     */
    public String getConfirmRemark() {
        return confirmRemark;
    }
    /**
     * @param confirmRemark the confirmRemark to set
     */
    public void setConfirmRemark(String confirmRemark) {
        this.confirmRemark = confirmRemark;
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
     * @return the caancReson
     */
    public String getCaancReson() {
        return caancReson;
    }
    /**
     * @param caancReson the caancReson to set
     */
    public void setCaancReson(String caancReson) {
        this.caancReson = caancReson;
    }
    /**
     * @return the cnt
     */
    public int getCnt() {
        return cnt;
    }
    /**
     * @param cnt the cnt to set
     */
    public void setCnt(int cnt) {
        this.cnt = cnt;
    }
    /**
     * @return the reqStatCd
     */
    public String getReqStatCd() {
        return reqStatCd;
    }
    /**
     * @param reqStatCd the reqStatCd to set
     */
    public void setReqStatCd(String reqStatCd) {
        this.reqStatCd = reqStatCd;
    }
    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }

}