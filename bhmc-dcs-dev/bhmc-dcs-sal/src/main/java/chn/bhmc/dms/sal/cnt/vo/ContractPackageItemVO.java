package chn.bhmc.dms.sal.cnt.vo;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ContractPackageItemVO
 * @Description : 집단계약 세부내역 VO
 * @author Kang Seok Han
 * @since 2016. 1. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author           description
 *  ===========    =============    ===========================
 *  2016. 5. 26.    Kim Jin Suk           최초 생성
 * </pre>
 */
@ValidDescriptor({
    @ValidField(field="dlrCd"         , mesgKey="sal.lbl.dlrCd")
   ,@ValidField(field="grpContractNo" , mesgKey="sal.lbl.grpContractNo")
   ,@ValidField(field="seq"           , mesgKey="sal.lbl.seq")
   ,@ValidField(field="carlineCd"     , mesgKey="sal.lbl.carlineCd")
   ,@ValidField(field="modelCd"       , mesgKey="sal.lbl.modelCd")
   ,@ValidField(field="ocnCd"         , mesgKey="sal.lbl.ocnCd")
   ,@ValidField(field="extColorCd"    , mesgKey="sal.lbl.extColorCd")
   ,@ValidField(field="intColorCd"    , mesgKey="sal.lbl.intColorCd")
   })
public class ContractPackageItemVO extends BaseVO{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 7971803213503306603L;

    /**
     * 딜러코드
     **/
    private  String         dlrCd;

    /**
     * 그룹계약번호
     **/
    private  String         grpContractNo;

    /**
     * 일련번호
     **/
    private  int            seq;

    /**
     * 차종코드
     **/
    //CARLINE_CD
    private  String         carlineCd;
    private  String         carlineNm;

    /**
     * 모델코드
     **/
    //MODEL_CD
    private  String         modelCd;
    private  String         modelNm;

    /**
     * OCN코드
     **/
    //OCN_CD
    private  String         ocnCd;
    private  String         ocnNm;

    /**
     * 외장색상코드
     **/
    //EXT_COLOR_CD
    private  String         extColorCd;
    private  String         extColorNm;

    /**
     * 내장색상코드
     **/
    //INT_COLOR_CD
    private  String         intColorCd;
    private  String         intColorNm;

    /**
     * 소매가격
     **/
    //RETL_PRC
    private  Double         retlPrc;

    /**
     * 프로모션코드
     **/
    //PROMOTION_NO
    private  String         promotionNo;

    /**
     * 프로모션금액
     **/
    //PROMOTION_AMT
    private  Double         promotionAmt;

    /**
     * 차량수량
     **/
    //CAR_CNT
    private  Double         carCnt;

    /**
     * 실제차량금액
     **/
    //REAL_CAR_AMT
    private  Double         realCarAmt;

    /**
     * 실제지불금액
     **/
    //REAL_PAY_AMT
    private  Double         realPayAmt;

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
     * @return the grpContractNo
     */
    public String getGrpContractNo() {
        return grpContractNo;
    }

    /**
     * @param grpContractNo the grpContractNo to set
     */
    public void setGrpContractNo(String grpContractNo) {
        this.grpContractNo = grpContractNo;
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
     * @return the retlPrc
     */
    public Double getRetlPrc() {
        return retlPrc;
    }

    /**
     * @param retlPrc the retlPrc to set
     */
    public void setRetlPrc(Double retlPrc) {
        this.retlPrc = retlPrc;
    }

    /**
     * @return the promotionNo
     */
    public String getPromotionNo() {
        return promotionNo;
    }

    /**
     * @param promotionNo the promotionNo to set
     */
    public void setPromotionNo(String promotionNo) {
        this.promotionNo = promotionNo;
    }

    /**
     * @return the promotionAmt
     */
    public Double getPromotionAmt() {
        return promotionAmt;
    }

    /**
     * @param promotionAmt the promotionAmt to set
     */
    public void setPromotionAmt(Double promotionAmt) {
        this.promotionAmt = promotionAmt;
    }

    /**
     * @return the carCnt
     */
    public Double getCarCnt() {
        return carCnt;
    }

    /**
     * @param carCnt the carCnt to set
     */
    public void setCarCnt(Double carCnt) {
        this.carCnt = carCnt;
    }

    /**
     * @return the realCarAmt
     */
    public Double getRealCarAmt() {
        return realCarAmt;
    }

    /**
     * @param realCarAmt the realCarAmt to set
     */
    public void setRealCarAmt(Double realCarAmt) {
        this.realCarAmt = realCarAmt;
    }

    /**
     * @return the realPayAmt
     */
    public Double getRealPayAmt() {
        return realPayAmt;
    }

    /**
     * @param realPayAmt the realPayAmt to set
     */
    public void setRealPayAmt(Double realPayAmt) {
        this.realPayAmt = realPayAmt;
    }

    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }

}
