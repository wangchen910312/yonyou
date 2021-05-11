package chn.bhmc.dms.sal.aap.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;


/**
 * @ClassName   : AapMngVO
 * @Description : 클래스 설명을 기술합니다.
 * @author KIMJINSUK
 * @since 2016. 4. 14.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 14.     KIMJINSUK             최초 생성
 *
 * </pre>
 */

public class AapMngVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 2317782484641900351L;

    /**
     * 딜러코드
     **/
    private  String           dlrCd;

    /**
     * 일련번호
     **/
    private  int              seq = -1;

    /**
     * 대행일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date             aapDt;

    /**
     * 대행작업구분코드
     **/
    private  String           aapWrkDstinCd;

    /**
     * 계약번호
     **/
    private  String           contractNo;

    /**
     * 차대번호
     **/
    private  String           vinNo;

    /**
     * 차종코드
     **/
    private  String           carlineCd;
    private  String           carlineNm;

    /**
     * 모델코드
     **/
    private  String           modelCd;
    private  String           modelNm;

    /**
     * OCN코드
     **/
    private  String           ocnCd;
    private  String           ocnNm;

    /**
     * 차량등록번호
     **/
    private  String           carRegNo;

    /**
     * 고객번호
     **/
    private  String           custNo;

    /**
     * 고객명
     **/
    private  String           custNm;

    /**
     * 고객유형
     **/
    private  String           custTp;

    /**
     * 대행사원명
     **/
    private  String           aapEmpNm;

    /**
     * 원가금액
     **/
    private  Double           cstAmt;

    /**
     * 이윤금액
     **/
    private  Double           profitAmt;

    /**
     * 대행금액
     **/
    private  Double           aapAmt;

    /**
     * 성코드
     **/
    private  String           sungCd;
    private  String           sungNm;

    /**
     * 도시코드
     **/
    private  String           cityCd;
    private  String           cityNm;

    /**
     * 지역코드
     **/
    private  String           distCd;
    private  String           distNm;

    /**
     * 등록이전금액
     **/
    private  Double           regPreAmt;

    /**
     * 실등록금액
     **/
    private  Double           realRegAmt;

    /**
     * 등록수수료금액
     **/
    private  Double           regFeeAmt;

    /**
     * 등록예상일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date             regExpcDt;

    /**
     * 구매세금이전금액
     **/
    private  Double           purcTaxPreAmt;

    /**
     * 실구매세금액
     **/
    private  Double           realPurcTaxAmt;

    /**
     * 실등록일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date             realRegDt;

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
     * @return the seq
     */
    public int getSeq() {
        return seq;
    }

    /**
     * @param seq the seq to set
     */
    public void setSeq(int seq) {
        this.seq = seq;
    }

    /**
     * @return the aapDt
     */
    public Date getAapDt() {
        return aapDt;
    }

    /**
     * @param aapDt the aapDt to set
     */
    public void setAapDt(Date aapDt) {
        this.aapDt = aapDt;
    }

    /**
     * @return the aapWrkDstinCd
     */
    public String getAapWrkDstinCd() {
        return aapWrkDstinCd;
    }

    /**
     * @param aapWrkDstinCd the aapWrkDstinCd to set
     */
    public void setAapWrkDstinCd(String aapWrkDstinCd) {
        this.aapWrkDstinCd = aapWrkDstinCd;
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
     * @return the aapEmpNm
     */
    public String getAapEmpNm() {
        return aapEmpNm;
    }

    /**
     * @param aapEmpNm the aapEmpNm to set
     */
    public void setAapEmpNm(String aapEmpNm) {
        this.aapEmpNm = aapEmpNm;
    }

    /**
     * @return the cstAmt
     */
    public Double getCstAmt() {
        return cstAmt;
    }

    /**
     * @param cstAmt the cstAmt to set
     */
    public void setCstAmt(Double cstAmt) {
        this.cstAmt = cstAmt;
    }

    /**
     * @return the profitAmt
     */
    public Double getProfitAmt() {
        return profitAmt;
    }

    /**
     * @param profitAmt the profitAmt to set
     */
    public void setProfitAmt(Double profitAmt) {
        this.profitAmt = profitAmt;
    }

    /**
     * @return the aapAmt
     */
    public Double getAapAmt() {
        return aapAmt;
    }

    /**
     * @param aapAmt the aapAmt to set
     */
    public void setAapAmt(Double aapAmt) {
        this.aapAmt = aapAmt;
    }

    /**
     * @return the sungCd
     */
    public String getSungCd() {
        return sungCd;
    }

    /**
     * @param sungCd the sungCd to set
     */
    public void setSungCd(String sungCd) {
        this.sungCd = sungCd;
    }

    /**
     * @return the sungNm
     */
    public String getSungNm() {
        return sungNm;
    }

    /**
     * @param sungNm the sungNm to set
     */
    public void setSungNm(String sungNm) {
        this.sungNm = sungNm;
    }

    /**
     * @return the cityCd
     */
    public String getCityCd() {
        return cityCd;
    }

    /**
     * @param cityCd the cityCd to set
     */
    public void setCityCd(String cityCd) {
        this.cityCd = cityCd;
    }

    /**
     * @return the cityNm
     */
    public String getCityNm() {
        return cityNm;
    }

    /**
     * @param cityNm the cityNm to set
     */
    public void setCityNm(String cityNm) {
        this.cityNm = cityNm;
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
     * @return the distNm
     */
    public String getDistNm() {
        return distNm;
    }

    /**
     * @param distNm the distNm to set
     */
    public void setDistNm(String distNm) {
        this.distNm = distNm;
    }

    /**
     * @return the regPreAmt
     */
    public Double getRegPreAmt() {
        return regPreAmt;
    }

    /**
     * @param regPreAmt the regPreAmt to set
     */
    public void setRegPreAmt(Double regPreAmt) {
        this.regPreAmt = regPreAmt;
    }

    /**
     * @return the realRegAmt
     */
    public Double getRealRegAmt() {
        return realRegAmt;
    }

    /**
     * @param realRegAmt the realRegAmt to set
     */
    public void setRealRegAmt(Double realRegAmt) {
        this.realRegAmt = realRegAmt;
    }

    /**
     * @return the regFeeAmt
     */
    public Double getRegFeeAmt() {
        return regFeeAmt;
    }

    /**
     * @param regFeeAmt the regFeeAmt to set
     */
    public void setRegFeeAmt(Double regFeeAmt) {
        this.regFeeAmt = regFeeAmt;
    }

    /**
     * @return the regExpcDt
     */
    public Date getRegExpcDt() {
        return regExpcDt;
    }

    /**
     * @param regExpcDt the regExpcDt to set
     */
    public void setRegExpcDt(Date regExpcDt) {
        this.regExpcDt = regExpcDt;
    }

    /**
     * @return the purcTaxPreAmt
     */
    public Double getPurcTaxPreAmt() {
        return purcTaxPreAmt;
    }

    /**
     * @param purcTaxPreAmt the purcTaxPreAmt to set
     */
    public void setPurcTaxPreAmt(Double purcTaxPreAmt) {
        this.purcTaxPreAmt = purcTaxPreAmt;
    }

    /**
     * @return the realPurcTaxAmt
     */
    public Double getRealPurcTaxAmt() {
        return realPurcTaxAmt;
    }

    /**
     * @param realPurcTaxAmt the realPurcTaxAmt to set
     */
    public void setRealPurcTaxAmt(Double realPurcTaxAmt) {
        this.realPurcTaxAmt = realPurcTaxAmt;
    }

    /**
     * @return the realRegDt
     */
    public Date getRealRegDt() {
        return realRegDt;
    }

    /**
     * @param realRegDt the realRegDt to set
     */
    public void setRealRegDt(Date realRegDt) {
        this.realRegDt = realRegDt;
    }

    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }
}