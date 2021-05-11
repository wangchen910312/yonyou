package chn.bhmc.dms.sal.mst.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

public class PositionsDiscountAmtVO extends BaseVO {

	private static final long serialVersionUID = -6091261787809835772L;

	private String dlrCd;
	private String carlineCd;
	private String modelCd;
	private String ocnCd;

    private String carlineNm;
    private String modelNm;
    private String ocnNm;

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date startDt;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date endDt;

    private double dcTotAmt1;
    private double carDcAmt1;
    private double goodsDcAmt1;

    private double dcTotAmt2;
    private double carDcAmt2;
    private double goodsDcAmt2;

    private double dcTotAmt3;
    private double carDcAmt3;
    private double goodsDcAmt3;

    //private String dcApplyYn;
    private String prcNregYn;

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
     * @return the startDt
     */
    public Date getStartDt() {
        return startDt;
    }

    /**
     * @param startDt the startDt to set
     */
    public void setStartDt(Date startDt) {
        this.startDt = startDt;
    }

    /**
     * @return the endDt
     */
    public Date getEndDt() {
        return endDt;
    }

    /**
     * @param endDt the endDt to set
     */
    public void setEndDt(Date endDt) {
        this.endDt = endDt;
    }

    /**
     * @return the dcTotAmt1
     */
    public double getDcTotAmt1() {
        return dcTotAmt1;
    }

    /**
     * @param dcTotAmt1 the dcTotAmt1 to set
     */
    public void setDcTotAmt1(double dcTotAmt1) {
        this.dcTotAmt1 = dcTotAmt1;
    }

    /**
     * @return the carDcAmt1
     */
    public double getCarDcAmt1() {
        return carDcAmt1;
    }

    /**
     * @param carDcAmt1 the carDcAmt1 to set
     */
    public void setCarDcAmt1(double carDcAmt1) {
        this.carDcAmt1 = carDcAmt1;
    }

    /**
     * @return the goodsDcAmt1
     */
    public double getGoodsDcAmt1() {
        return goodsDcAmt1;
    }

    /**
     * @param goodsDcAmt1 the goodsDcAmt1 to set
     */
    public void setGoodsDcAmt1(double goodsDcAmt1) {
        this.goodsDcAmt1 = goodsDcAmt1;
    }

    /**
     * @return the dcTotAmt2
     */
    public double getDcTotAmt2() {
        return dcTotAmt2;
    }

    /**
     * @param dcTotAmt2 the dcTotAmt2 to set
     */
    public void setDcTotAmt2(double dcTotAmt2) {
        this.dcTotAmt2 = dcTotAmt2;
    }

    /**
     * @return the carDcAmt2
     */
    public double getCarDcAmt2() {
        return carDcAmt2;
    }

    /**
     * @param carDcAmt2 the carDcAmt2 to set
     */
    public void setCarDcAmt2(double carDcAmt2) {
        this.carDcAmt2 = carDcAmt2;
    }

    /**
     * @return the goodsDcAmt2
     */
    public double getGoodsDcAmt2() {
        return goodsDcAmt2;
    }

    /**
     * @param goodsDcAmt2 the goodsDcAmt2 to set
     */
    public void setGoodsDcAmt2(double goodsDcAmt2) {
        this.goodsDcAmt2 = goodsDcAmt2;
    }

    /**
     * @return the dcTotAmt3
     */
    public double getDcTotAmt3() {
        return dcTotAmt3;
    }

    /**
     * @param dcTotAmt3 the dcTotAmt3 to set
     */
    public void setDcTotAmt3(double dcTotAmt3) {
        this.dcTotAmt3 = dcTotAmt3;
    }

    /**
     * @return the carDcAmt3
     */
    public double getCarDcAmt3() {
        return carDcAmt3;
    }

    /**
     * @param carDcAmt3 the carDcAmt3 to set
     */
    public void setCarDcAmt3(double carDcAmt3) {
        this.carDcAmt3 = carDcAmt3;
    }

    /**
     * @return the goodsDcAmt3
     */
    public double getGoodsDcAmt3() {
        return goodsDcAmt3;
    }

    /**
     * @param goodsDcAmt3 the goodsDcAmt3 to set
     */
    public void setGoodsDcAmt3(double goodsDcAmt3) {
        this.goodsDcAmt3 = goodsDcAmt3;
    }

    /**
     * @return the prcNregYn
     */
    public String getPrcNregYn() {
        return prcNregYn;
    }

    /**
     * @param prcNregYn the prcNregYn to set
     */
    public void setPrcNregYn(String prcNregYn) {
        this.prcNregYn = prcNregYn;
    }

    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }

}