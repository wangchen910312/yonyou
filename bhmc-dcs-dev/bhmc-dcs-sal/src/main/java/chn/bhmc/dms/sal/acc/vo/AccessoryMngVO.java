package chn.bhmc.dms.sal.acc.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : FincInfoMngVO
 * @Description : 경품판매관리 VO
 * @author Kang Seok Han
 * @since 2016. 1. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author           description
 *  ===========    =============    ===========================
 *  2016. 6. 09.    Kim Jin Suk           최초 생성
 * </pre>
 */
@ValidDescriptor({
    @ValidField(field="dlrCd"            , mesgKey="sal.lbl.dlrCd")
   })
public class AccessoryMngVO extends BaseVO{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 764486579894828586L;


    /**
     * 딜러코드
     **/
    private  String           dlrCd;

    /**
     * 용품계약번호
     **/
    private  String           goodsContractNo;

    /**
     * 용품유형
     **/
    private  String           goodsTp;

    /**
     * 용품계약일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date             goodsContractDt;

    /**
     * 계약고객번호
     **/
    private  String           contractCustNo;
    private  String           contractCustNm;

    /**
     * 연계인고객번호
     **/
    private  String           pconCustNo;
    private  String           pconCustNm;

    /**
     * 전화번호
     **/
    private  String           telNo;

    /**
     * 차량브랜드코드
     **/
    private  String           carBrandCd;

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
     * 외장색상코드
     **/
    private  String           extColorCd;
    private  String           extColorNm;

    /**
     * 내장색상코드
     **/
    private  String           intColorCd;
    private  String           intColorNm;

    /**
     * 차대번호
     **/
    private  String           vinNo;

    /**
     * 차량등록번호
     **/
    private  String           carRegNo;

    /**
     * 판매계약번호
     **/
    private  String           saleContractNo;

    /**
     * 예정출고완료일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date             expcGiEndDt;

    /**
     * 설치담당자ID
     **/
    private  String           eqipPrsnId;

    /**
     * 실제인도일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date             realDlDt;

    /**
     * 용품금액
     **/
    private  Double           goodsAmt;

    /**
     * 증정금액
     **/
    private  Double           prenAmt;

    /**
     * 용품실제금액(판매금액)
     **/
    private  Double           goodsRealAmt;

    /**
     * 추가증정금액
     **/
    private  Double           addPrenAmt;

    /**
     * 고객지불금액
     **/
    private  Double           custPayAmt;

    /**
     * 경품명칭
     */
    private  String           goodsNm;
    private  int              goodsCnt;

    /**
     * 오더상태
     */
    private  String           contractStatCd;

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
     * @return the goodsContractNo
     */
    public String getGoodsContractNo() {
        return goodsContractNo;
    }

    /**
     * @param goodsContractNo the goodsContractNo to set
     */
    public void setGoodsContractNo(String goodsContractNo) {
        this.goodsContractNo = goodsContractNo;
    }

    /**
     * @return the goodsTp
     */
    public String getGoodsTp() {
        return goodsTp;
    }

    /**
     * @param goodsTp the goodsTp to set
     */
    public void setGoodsTp(String goodsTp) {
        this.goodsTp = goodsTp;
    }

    /**
     * @return the goodsContractDt
     */
    public Date getGoodsContractDt() {
        return goodsContractDt;
    }

    /**
     * @param goodsContractDt the goodsContractDt to set
     */
    public void setGoodsContractDt(Date goodsContractDt) {
        this.goodsContractDt = goodsContractDt;
    }

    /**
     * @return the contractCustNo
     */
    public String getContractCustNo() {
        return contractCustNo;
    }

    /**
     * @param contractCustNo the contractCustNo to set
     */
    public void setContractCustNo(String contractCustNo) {
        this.contractCustNo = contractCustNo;
    }

    /**
     * @return the contractCustNm
     */
    public String getContractCustNm() {
        return contractCustNm;
    }

    /**
     * @param contractCustNm the contractCustNm to set
     */
    public void setContractCustNm(String contractCustNm) {
        this.contractCustNm = contractCustNm;
    }

    /**
     * @return the pconCustNo
     */
    public String getPconCustNo() {
        return pconCustNo;
    }

    /**
     * @param pconCustNo the pconCustNo to set
     */
    public void setPconCustNo(String pconCustNo) {
        this.pconCustNo = pconCustNo;
    }

    /**
     * @return the pconCustNm
     */
    public String getPconCustNm() {
        return pconCustNm;
    }

    /**
     * @param pconCustNm the pconCustNm to set
     */
    public void setPconCustNm(String pconCustNm) {
        this.pconCustNm = pconCustNm;
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
     * @return the saleContractNo
     */
    public String getSaleContractNo() {
        return saleContractNo;
    }

    /**
     * @param saleContractNo the saleContractNo to set
     */
    public void setSaleContractNo(String saleContractNo) {
        this.saleContractNo = saleContractNo;
    }

    /**
     * @return the expcGiEndDt
     */
    public Date getExpcGiEndDt() {
        return expcGiEndDt;
    }

    /**
     * @param expcGiEndDt the expcGiEndDt to set
     */
    public void setExpcGiEndDt(Date expcGiEndDt) {
        this.expcGiEndDt = expcGiEndDt;
    }

    /**
     * @return the eqipPrsnId
     */
    public String getEqipPrsnId() {
        return eqipPrsnId;
    }

    /**
     * @param eqipPrsnId the eqipPrsnId to set
     */
    public void setEqipPrsnId(String eqipPrsnId) {
        this.eqipPrsnId = eqipPrsnId;
    }

    /**
     * @return the realDlDt
     */
    public Date getRealDlDt() {
        return realDlDt;
    }

    /**
     * @param realDlDt the realDlDt to set
     */
    public void setRealDlDt(Date realDlDt) {
        this.realDlDt = realDlDt;
    }

    /**
     * @return the goodsAmt
     */
    public Double getGoodsAmt() {
        return goodsAmt;
    }

    /**
     * @param goodsAmt the goodsAmt to set
     */
    public void setGoodsAmt(Double goodsAmt) {
        this.goodsAmt = goodsAmt;
    }

    /**
     * @return the prenAmt
     */
    public Double getPrenAmt() {
        return prenAmt;
    }

    /**
     * @param prenAmt the prenAmt to set
     */
    public void setPrenAmt(Double prenAmt) {
        this.prenAmt = prenAmt;
    }

    /**
     * @return the goodsRealAmt
     */
    public Double getGoodsRealAmt() {
        return goodsRealAmt;
    }

    /**
     * @param goodsRealAmt the goodsRealAmt to set
     */
    public void setGoodsRealAmt(Double goodsRealAmt) {
        this.goodsRealAmt = goodsRealAmt;
    }

    /**
     * @return the addPrenAmt
     */
    public Double getAddPrenAmt() {
        return addPrenAmt;
    }

    /**
     * @param addPrenAmt the addPrenAmt to set
     */
    public void setAddPrenAmt(Double addPrenAmt) {
        this.addPrenAmt = addPrenAmt;
    }

    /**
     * @return the custPayAmt
     */
    public Double getCustPayAmt() {
        return custPayAmt;
    }

    /**
     * @param custPayAmt the custPayAmt to set
     */
    public void setCustPayAmt(Double custPayAmt) {
        this.custPayAmt = custPayAmt;
    }

    /**
     * @return the goodsNm
     */
    public String getGoodsNm() {
        return goodsNm;
    }

    /**
     * @param goodsNm the goodsNm to set
     */
    public void setGoodsNm(String goodsNm) {
        this.goodsNm = goodsNm;
    }

    /**
     * @return the goodsCnt
     */
    public int getGoodsCnt() {
        return goodsCnt;
    }

    /**
     * @param goodsCnt the goodsCnt to set
     */
    public void setGoodsCnt(int goodsCnt) {
        this.goodsCnt = goodsCnt;
    }

    /**
     * @return the contractStatCd
     */
    public String getContractStatCd() {
        return contractStatCd;
    }

    /**
     * @param contractStatCd the contractStatCd to set
     */
    public void setContractStatCd(String contractStatCd) {
        this.contractStatCd = contractStatCd;
    }

    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }

}