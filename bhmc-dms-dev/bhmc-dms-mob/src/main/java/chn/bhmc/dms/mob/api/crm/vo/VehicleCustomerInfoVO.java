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
 * @ClassName   : VehicleCustomerInfoVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Jin Suk Kim
 * @since 2016. 3. 30.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 30.     Jin Suk Kim     최초 생성
 * </pre>
 */

public class VehicleCustomerInfoVO extends BaseVO{
    private static final long serialVersionUID = -5075860418280733805L;

    private String vinNo;                   // 차대번호(VIN)
    private String ncarDstinCd;             // 신차량구분
    private String dlrCd;                   // 딜러코드
    private String dlrNm;                   // 딜러명
    private String carRegNo;                // 차량번호
    private String carlineCd;               // 차량코드
    private String carlineNm;
    private String modelCd;                 // 모델코드
    private String modelNm;
    private String ocnCd;                   // OCN코드
    private String ocnNm;
    private String extColorCd;              // 외장색코드
    private String extColorNm;
    private String intColorCd;              // 내장색코드
    private String intColorNm;

    private String corpCarDstinCd;          // 자사차량구분코드 SAL118
    private String carBrandCd;              // 브랜드코드 COM019
    private String carNm;                   // 차량명(중고차)

    private String enginNo;                 // 엔진번호
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date   custSaleDt;              // 고객판매일자

    private String ordDlrCd;                // 주문딜러코드
    private String ordDlrNm;                // 주물딜러명
    private String enginSerialNo;           //
    private String invcPublDt;              // 인보이스발행일자

    private String useYn;                  //현재소유여부
    private Date custRegDt;                //차량소유등록일

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
     * @return the ordDlrNm
     */
    public String getOrdDlrNm() {
        return ordDlrNm;
    }
    /**
     * @param ordDlrNm the ordDlrNm to set
     */
    public void setOrdDlrNm(String ordDlrNm) {
        this.ordDlrNm = ordDlrNm;
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
     * @return the invcPublDt
     */
    public String getInvcPublDt() {
        return invcPublDt;
    }
    /**
     * @param invcPublDt the invcPublDt to set
     */
    public void setInvcPublDt(String invcPublDt) {
        this.invcPublDt = invcPublDt;
    }
    /**
     * @return the useYn
     */
    public String getUseYn() {
        return useYn;
    }
    /**
     * @param useYn the useYn to set
     */
    public void setUseYn(String useYn) {
        this.useYn = useYn;
    }
    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }
    /**
     * @return the custRegDt
     */
    public Date getCustRegDt() {
        return custRegDt;
    }
    /**
     * @param custRegDt the custRegDt to set
     */
    public void setCustRegDt(Date custRegDt) {
        this.custRegDt = custRegDt;
    }
}
