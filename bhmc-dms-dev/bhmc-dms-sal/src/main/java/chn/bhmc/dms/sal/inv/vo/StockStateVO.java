 package chn.bhmc.dms.sal.inv.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : StockStateVO
 * @Description : 재고상태관리 VO
 * @author Jin Suk Kim
 * @since 2016. 3. 24.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 24.     Jin Suk Kim     최초 생성
 * </pre>
 */

public class StockStateVO extends BaseVO{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 2603027388585097515L;

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
    private int cnt;

    private String vinNo;             // 차대번호
    private String ncarDstinCd;       // 신차량구분코드
    private String stockTp;           // 재고유형
    private String cmpCarYn;          // 회사차여부
    private String cmpCarDstinCd;     // 회사차구분
    private String strgeCd;           // 창고
    private String locCd;             // 위치
    private String locNm;             // 위치명

    private String bfStockTp;         // 재고유형(변경전)
    private String bfCmpCarYn;        // 회사차여부(변경전)
    private String bfCmpCarDstinCd;   // 회사차구분(변경전)
    private String bfStrgeCd;         // 창고(변경전)
    private String bfLocCd;           // 위치(변경전)

    private String carStatCd;         // 차량상태
    private String ownStatCd;         // 보유상태
    private String ordTp;             // 주문유형
    private String enginModelCd;      // 엔진번호
    private String certNo;            // 합격증번호
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date   grDt;              // 입고일자
    private String dlrCd;             // 딜러코드

    private String statChgCd;         // 상태변동코드
    private String statChgBefCont;    // 상태변동전내용
    private String statChgAftCont;    // 상태변동후내용

    private int    mmCnt;             // 재고월령
    private String mmCntColor;        // 재고월령 색상

    private String ordDlrYyMmDt;        // 주문년월
    private String ordMmDt;             // 주문일
    private String manufactYyMmDt;      // 생산일자
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date   carVinAllocDt;       // 배정일자
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date   pltGiDt;             // 출고일자

    private double retlPrc;             // 구매가격
    private double whslPrc;             // 지도가격
    private double ddctRate;            // 공제비율

    private String lv2DlrStockYn;       // 2급딜러 재고 여부
    private String contractNo;          // 계약번호
    private String rfidNo;              // RFID번호
    private String preGiYn;             // 선출고여부
    private String certSecu2Cd;         // 합격증저당코드

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
     * @return the bfStockTp
     */
    public String getBfStockTp() {
        return bfStockTp;
    }
    /**
     * @param bfStockTp the bfStockTp to set
     */
    public void setBfStockTp(String bfStockTp) {
        this.bfStockTp = bfStockTp;
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
     * @return the ddctRate
     */
    public double getDdctRate() {
        return ddctRate;
    }
    /**
     * @param ddctRate the ddctRate to set
     */
    public void setDdctRate(double ddctRate) {
        this.ddctRate = ddctRate;
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
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }

}