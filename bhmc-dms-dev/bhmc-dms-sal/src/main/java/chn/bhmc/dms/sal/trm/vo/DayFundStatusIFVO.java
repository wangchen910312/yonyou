package chn.bhmc.dms.sal.trm.vo;

import com.fasterxml.jackson.annotation.JsonProperty;

import chn.bhmc.dms.core.datatype.BaseVO;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : DayFundStatusIFVO
 * @Description : 일자금현황 조회 IF VO
 * @author Kim Jin Suk
 * @since 2016. 8. 18.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author           description
 *  ===========    =============    ===========================
 *  2016. 8. 18.    Kim Jin Suk        최초 생성
 * </pre>
 */

public class DayFundStatusIFVO extends BaseVO{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 7520549700959116625L;

    @JsonProperty("DALO_DATE")
    private String daloDate;            // 일자

    @JsonProperty("DALO_DLR_CD")
    private String daloDlrCd;           // 딜러

    @JsonProperty("DALO_MODEL_CD")
    private String daloModelCd;         // 모델

    @JsonProperty("DALO_OCN_CD")
    private String daloOcnCd;           // OCN

    @JsonProperty("DALO_EXC_CD")
    private String daloExcCd;           // 외장색

    @JsonProperty("DALO_ALLO_QTY")
    private double daloAlloQty;         // 오더수량

    @JsonProperty("DALO_MSRP")
    private double daloMsrp;            // 지도가격

    @JsonProperty("DALO_BEF_DC")
    private double daloBefDc;           // DC전가격

    @JsonProperty("DALO_DC_RATE")
    private double daloDcRate;          // DC율

    @JsonProperty("DALO_DC_AMT")
    private double daloDcAmt;           // 할인금액

    @JsonProperty("DALO_ALLO_AMT")
    private double daloAlloAmt;         // DC후 가격

    @JsonProperty("DALO_ORD_NO")
    private String daloOrdNo;         // 오더번호

    @JsonProperty("DALO_ORD_TP")
    private String daloOrdTp;         // 오더유형

    @JsonProperty("DALO_CAR_LINE")
    private String daloCarLine;         // 차종코드

    @JsonProperty("DALO_INC_CD")
    private String daloIncCd;         // 내장색코드

    @JsonProperty("DALO_ADJT_AMT")
    private double daloAdjtAmt;         // 조정금액

    @JsonProperty("DALO_FINAL_AMT")
    private double daloFinalAmt;         // 최종가격

    @JsonProperty("DALO_CHAH_AMT")
    private double daloChahAmt;         // 현금공제액

    @JsonProperty("DALO_2PRY_AMT")
    private double dalo2pryAmt;         // 2방공제액

    @JsonProperty("DALO_3PRY_AMT")
    private double dalo3pryAmt;         // 2방공제액

    // 차종
    private String carlineCd;
    private String carlineNm;

    // 모델
    private String modelCd;
    private String modelNm;

    // ocn
    private String ocnCd;
    private String ocnNm;

    // 외장색
    private String extColorCd;
    private String extColorNm;

    // 내장색
    private String intColorCd;
    private String intColorNm;

    // 오더타입
    private String ordTpCd;
    private String ordTpNm;

    // 주문수량
    private int ordQty;
    //承兑汇票号
    private String vinmBkwb;
    //车架号
    private String vinNo;
    /**
     * @return the daloDate
     */
    public String getDaloDate() {
        return daloDate;
    }

    /**
     * @param daloDate the daloDate to set
     */
    public void setDaloDate(String daloDate) {
        this.daloDate = daloDate;
    }

    /**
     * @return the daloDlrCd
     */
    public String getDaloDlrCd() {
        return daloDlrCd;
    }

    /**
     * @param daloDlrCd the daloDlrCd to set
     */
    public void setDaloDlrCd(String daloDlrCd) {
        this.daloDlrCd = daloDlrCd;
    }

    /**
     * @return the daloModelCd
     */
    public String getDaloModelCd() {
        return daloModelCd;
    }

    /**
     * @param daloModelCd the daloModelCd to set
     */
    public void setDaloModelCd(String daloModelCd) {
        this.daloModelCd = daloModelCd;
    }

    /**
     * @return the daloOcnCd
     */
    public String getDaloOcnCd() {
        return daloOcnCd;
    }

    /**
     * @param daloOcnCd the daloOcnCd to set
     */
    public void setDaloOcnCd(String daloOcnCd) {
        this.daloOcnCd = daloOcnCd;
    }

    /**
     * @return the daloExcCd
     */
    public String getDaloExcCd() {
        return daloExcCd;
    }

    /**
     * @param daloExcCd the daloExcCd to set
     */
    public void setDaloExcCd(String daloExcCd) {
        this.daloExcCd = daloExcCd;
    }

    /**
     * @return the daloAlloQty
     */
    public double getDaloAlloQty() {
        return daloAlloQty;
    }

    /**
     * @param daloAlloQty the daloAlloQty to set
     */
    public void setDaloAlloQty(double daloAlloQty) {
        this.daloAlloQty = daloAlloQty;
    }

    /**
     * @return the daloMsrp
     */
    public double getDaloMsrp() {
        return daloMsrp;
    }

    /**
     * @param daloMsrp the daloMsrp to set
     */
    public void setDaloMsrp(double daloMsrp) {
        this.daloMsrp = daloMsrp;
    }

    /**
     * @return the daloBefDc
     */
    public double getDaloBefDc() {
        return daloBefDc;
    }

    /**
     * @param daloBefDc the daloBefDc to set
     */
    public void setDaloBefDc(double daloBefDc) {
        this.daloBefDc = daloBefDc;
    }

    /**
     * @return the daloDcRate
     */
    public double getDaloDcRate() {
        return daloDcRate;
    }

    /**
     * @param daloDcRate the daloDcRate to set
     */
    public void setDaloDcRate(double daloDcRate) {
        this.daloDcRate = daloDcRate;
    }

    /**
     * @return the daloDcAmt
     */
    public double getDaloDcAmt() {
        return daloDcAmt;
    }

    /**
     * @param daloDcAmt the daloDcAmt to set
     */
    public void setDaloDcAmt(double daloDcAmt) {
        this.daloDcAmt = daloDcAmt;
    }

    /**
     * @return the daloAlloAmt
     */
    public double getDaloAlloAmt() {
        return daloAlloAmt;
    }

    /**
     * @param daloAlloAmt the daloAlloAmt to set
     */
    public void setDaloAlloAmt(double daloAlloAmt) {
        this.daloAlloAmt = daloAlloAmt;
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
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }

    /**
     * @return the daloOrdNo
     */
    public String getDaloOrdNo() {
        return daloOrdNo;
    }

    /**
     * @param daloOrdNo the daloOrdNo to set
     */
    public void setDaloOrdNo(String daloOrdNo) {
        this.daloOrdNo = daloOrdNo;
    }

    /**
     * @return the daloOrdTp
     */
    public String getDaloOrdTp() {
        return daloOrdTp;
    }

    /**
     * @param daloOrdTp the daloOrdTp to set
     */
    public void setDaloOrdTp(String daloOrdTp) {
        this.daloOrdTp = daloOrdTp;
    }

    /**
     * @return the daloCarLine
     */
    public String getDaloCarLine() {
        return daloCarLine;
    }

    /**
     * @param daloCarLine the daloCarLine to set
     */
    public void setDaloCarLine(String daloCarLine) {
        this.daloCarLine = daloCarLine;
    }

    /**
     * @return the daloIncCd
     */
    public String getDaloIncCd() {
        return daloIncCd;
    }

    /**
     * @param daloIncCd the daloIncCd to set
     */
    public void setDaloIncCd(String daloIncCd) {
        this.daloIncCd = daloIncCd;
    }

    /**
     * @return the daloAdjtAmt
     */
    public double getDaloAdjtAmt() {
        return daloAdjtAmt;
    }

    /**
     * @param daloAdjtAmt the daloAdjtAmt to set
     */
    public void setDaloAdjtAmt(double daloAdjtAmt) {
        this.daloAdjtAmt = daloAdjtAmt;
    }

    /**
     * @return the daloFinalAmt
     */
    public double getDaloFinalAmt() {
        return daloFinalAmt;
    }

    /**
     * @param daloFinalAmt the daloFinalAmt to set
     */
    public void setDaloFinalAmt(double daloFinalAmt) {
        this.daloFinalAmt = daloFinalAmt;
    }

    /**
     * @return the ordTpCd
     */
    public String getOrdTpCd() {
        return ordTpCd;
    }

    /**
     * @param ordTpCd the ordTpCd to set
     */
    public void setOrdTpCd(String ordTpCd) {
        this.ordTpCd = ordTpCd;
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
     * @return the ordQty
     */
    public int getOrdQty() {
        return ordQty;
    }

    /**
     * @param ordQty the ordQty to set
     */
    public void setOrdQty(int ordQty) {
        this.ordQty = ordQty;
    }

    /**
     * @return the daloChahAmt
     */
    public double getDaloChahAmt() {
        return daloChahAmt;
    }

    /**
     * @return the dalo2pryAmt
     */
    public double getDalo2pryAmt() {
        return dalo2pryAmt;
    }

    /**
     * @return the dalo3pryAmt
     */
    public double getDalo3pryAmt() {
        return dalo3pryAmt;
    }

    /**
     * @param daloChahAmt the daloChahAmt to set
     */
    public void setDaloChahAmt(double daloChahAmt) {
        this.daloChahAmt = daloChahAmt;
    }

    /**
     * @param dalo2pryAmt the dalo2pryAmt to set
     */
    public void setDalo2pryAmt(double dalo2pryAmt) {
        this.dalo2pryAmt = dalo2pryAmt;
    }

    /**
     * @param dalo3pryAmt the dalo3pryAmt to set
     */
    public void setDalo3pryAmt(double dalo3pryAmt) {
        this.dalo3pryAmt = dalo3pryAmt;
    }

	public String getVinmBkwb() {
		return vinmBkwb;
	}

	public void setVinmBkwb(String vinmBkwb) {
		this.vinmBkwb = vinmBkwb;
	}

	public String getVinNo() {
		return vinNo;
	}

	public void setVinNo(String vinNo) {
		this.vinNo = vinNo;
	}

}
