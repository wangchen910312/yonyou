package chn.bhmc.dms.sal.veh.vo;

import chn.bhmc.dms.core.datatype.BaseVO;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : VehicleMasterVO.java
 * @Description : 차량마스터 VO
 * @author kim yewon
 * @since 2016. 2. 1.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 28.     Jin Suk Kim        최초 생성
 *
 * </pre>
 */

public class VehicleMasterPopupVO extends BaseVO {


    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 4768388767008982574L;
    //차량마스터 정보
    private String carId;                               // CAR ID
    private String carlineCd;                           // 차종코드
    private String carlineNm;
    private String carlineCdNm;
    private String modelCd;                             // 모델코드
    private String modelNm;
    private String modelCdNm;
    private String ocnCd;                               // OCN코드
    private String ocnNm;
    private String ocnCdNm;
    private String extColorCd;                          // 외장색코드
    private String extColorNm;
    private String extColorCdNm;
    private String intColorCd;                          // 내장색코드
    private String intColorNm;
    private String intColorCdNm;

    //정비에서 신차정보 저장시 필요되는 파라미터
    private String dlrCd;                               // 판매딜러
    private String vinNo;                               // 차대번호
    private String carBrandCd;                          // 브랜드
    private String temp1;                               // 차량명
    private String temp2;                               //
    private String temp3;                               //
    private String temp4;                               //
    private String temp5;                               //
    private String useYn;                               //
    private Double whPrc;                               //
    private Double dcRate;                               //
    private Double aamt;                               //



    public Double getWhPrc() {
        return whPrc;
    }
    public void setWhPrc(Double whPrc) {
        this.whPrc = whPrc;
    }
    public String getCarId() {
        return carId;
    }
    public void setCarId(String carId) {
        this.carId = carId;
    }
    public String getCarlineCd() {
        return carlineCd;
    }
    public void setCarlineCd(String carlineCd) {
        this.carlineCd = carlineCd;
    }
    public String getCarlineNm() {
        return carlineNm;
    }
    public void setCarlineNm(String carlineNm) {
        this.carlineNm = carlineNm;
    }
    public String getCarlineCdNm() {
        return carlineCdNm;
    }
    public void setCarlineCdNm(String carlineCdNm) {
        this.carlineCdNm = carlineCdNm;
    }
    public String getModelCd() {
        return modelCd;
    }
    public void setModelCd(String modelCd) {
        this.modelCd = modelCd;
    }
    public String getModelNm() {
        return modelNm;
    }
    public void setModelNm(String modelNm) {
        this.modelNm = modelNm;
    }
    public String getModelCdNm() {
        return modelCdNm;
    }
    public void setModelCdNm(String modelCdNm) {
        this.modelCdNm = modelCdNm;
    }
    public String getOcnCd() {
        return ocnCd;
    }
    public void setOcnCd(String ocnCd) {
        this.ocnCd = ocnCd;
    }
    public String getOcnNm() {
        return ocnNm;
    }
    public void setOcnNm(String ocnNm) {
        this.ocnNm = ocnNm;
    }
    public String getOcnCdNm() {
        return ocnCdNm;
    }
    public void setOcnCdNm(String ocnCdNm) {
        this.ocnCdNm = ocnCdNm;
    }
    public String getExtColorCd() {
        return extColorCd;
    }
    public void setExtColorCd(String extColorCd) {
        this.extColorCd = extColorCd;
    }
    public String getExtColorNm() {
        return extColorNm;
    }
    public void setExtColorNm(String extColorNm) {
        this.extColorNm = extColorNm;
    }
    public String getExtColorCdNm() {
        return extColorCdNm;
    }
    public void setExtColorCdNm(String extColorCdNm) {
        this.extColorCdNm = extColorCdNm;
    }
    public String getIntColorCd() {
        return intColorCd;
    }
    public void setIntColorCd(String intColorCd) {
        this.intColorCd = intColorCd;
    }
    public String getIntColorNm() {
        return intColorNm;
    }
    public void setIntColorNm(String intColorNm) {
        this.intColorNm = intColorNm;
    }
    public String getIntColorCdNm() {
        return intColorCdNm;
    }
    public void setIntColorCdNm(String intColorCdNm) {
        this.intColorCdNm = intColorCdNm;
    }
    public String getDlrCd() {
        return dlrCd;
    }
    public void setDlrCd(String dlrCd) {
        this.dlrCd = dlrCd;
    }
    public String getVinNo() {
        return vinNo;
    }
    public void setVinNo(String vinNo) {
        this.vinNo = vinNo;
    }
    public String getCarBrandCd() {
        return carBrandCd;
    }
    public void setCarBrandCd(String carBrandCd) {
        this.carBrandCd = carBrandCd;
    }
    public String getTemp1() {
        return temp1;
    }
    public void setTemp1(String temp1) {
        this.temp1 = temp1;
    }
    public String getTemp2() {
        return temp2;
    }
    public void setTemp2(String temp2) {
        this.temp2 = temp2;
    }
    public String getTemp3() {
        return temp3;
    }
    public void setTemp3(String temp3) {
        this.temp3 = temp3;
    }
    public String getTemp4() {
        return temp4;
    }
    public void setTemp4(String temp4) {
        this.temp4 = temp4;
    }
    public String getTemp5() {
        return temp5;
    }
    public void setTemp5(String temp5) {
        this.temp5 = temp5;
    }
    public String getUseYn() {
        return useYn;
    }
    public void setUseYn(String useYn) {
        this.useYn = useYn;
    }
    public Double getDcRate() {
        return dcRate;
    }
    public void setDcRate(Double dcRate) {
        this.dcRate = dcRate;
    }
    public Double getAamt() {
        return aamt;
    }
    public void setAamt(Double aamt) {
        this.aamt = aamt;
    }




}