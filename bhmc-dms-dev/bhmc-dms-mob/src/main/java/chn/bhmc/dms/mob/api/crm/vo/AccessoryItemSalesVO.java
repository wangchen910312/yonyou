package chn.bhmc.dms.mob.api.crm.vo;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;


/**
 * @ClassName   : AccessoryItemSalesVO
 * @Description : 용품판매관리 VO
 * @author Kang Seok Han
 * @since 2017. 2. 20.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author           description
 *  ===========    =============    ===========================
 *  2017. 2. 20.   Kang Seok Han    최초 생성
 * </pre>
 */
@ValidDescriptor({
    @ValidField(field="dlrCd", mesgKey="sal.lbl.dlrCd")
})
public class AccessoryItemSalesVO extends BaseVO{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -8464924238955113468L;

    /**
     * 딜러코드
     **/
    private String dlrCd;

    /**
     * 용품계약번호
     **/
    private String goodsContractNo;

    /**
     * 용품유형
     **/
    private String goodsTp;

    /**
     * 용품계약일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date goodsContractDt;

    /**
     * 고객번호
     **/
    private String contractCustNo;

    /**
     * 고객명
     */
    private String contractCustNm;

    /**
     * 고객유형
     */
    private String contractCustTp;

    /**
     * 연계인번호
     **/
    private String pconCustNo;

    /**
     * 연계인명
     */
    private String pconCustNm;

    /**
     * 전화번호
     **/
    private String telNo;

    /**
     * 차량브랜드코드
     **/
    private String carBrandCd;

    /**
     * 차종코드
     **/
    private String carlineCd;

    /**
     * 차종명
     */
    private String carlineNm;

    /**
     * 모델코드
     **/
    private String modelCd;

    /**
     * 모델명
     */
    private String modelNm;

    /**
     * 차관코드
     */
    private String fscCd;

    /**
     * 차관명
     */
    private String fscNm;

    /**
     * OCN코드
     **/
    private String ocnCd;

    /**
     * OCN명
     */
    private String ocnNm;

    /**
     * 외장색코드
     **/
    private String extColorCd;

    /**
     * 외장색명
     */
    private String extColorNm;

    /**
     * 내장색코드
     **/
    private String intColorCd;

    /**
     * 내장색명
     */
    private String intColorNm;

    /**
     * 차대번호
     **/
    private String vinNo;

    /**
     * 차량등록번호
     **/
    private String carRegNo;

    /**
     * 판매계약번호
     **/
    private String saleContractNo;

    /**
     * 예정출고완료일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date expcGiEndDt;

    /**
     * 설치담당자ID
     **/
    private String eqipPrsnId;

    /**
     * 실제인도일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date realDlDt;

    /**
     * 판매일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date saleDt;

    /**
     * 용품금액
     **/
    private Double goodsAmt;

    /**
     * 증정금액
     **/
    private Double prenAmt;

    /**
     * 용품실제금액(판매금액)
     **/
    private Double goodsRealAmt;

    /**
     * 추가증정금액
     **/
    private Double addPrenAmt;

    /**
     * 고객지불금액
     **/
    private Double custPayAmt;

    /**
     * 용품명칭
     */
    private String goodsNm;

    /**
     * 용품수
     */
    private int goodsCnt;
    private int goodsTotCnt;

    /**
     * 용품수량
     */
    private int goodsQty;

    /**
     * 오더상태
     */
    private String contractStatCd;

    /**
     * 할인레벨체크
     */
    private String prcNregYn;
    /**
     * 할인레벨코드
     */
    private String dcLvlCd;

    /**
     * 할인승인여부
     */
    private String dcApproveYn;

    /**
     * 할인승인일자
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date dcApproveDt;

    /**
     * 반품일자
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date returnDt;

    /**
     * 참조문서번호
     **/
    private String refDocNo;

    /**
     * 등록자명
     */
    private String regUsrNm;

    /**
     * 수정일시(UPDATE시 가능여부 체크용)
     **/
    //UPDT_DT_STR
    private  String updtDtStr;

    /**
     * 멤버십 번호
     **/
    private String membershipNo;

    /**
     * 카드 번호
     **/
    private String cardNo;

    /**
     * 사용 포인트
     **/
    private Double pointVal;

    /**
     * 포인트 사용 금액
     **/
    private Double pointAmt;

    /**
     * 쿠폰 발행번호
     **/
    private String cupnPubliNo;

    /**
     * 쿠폰 취소
     */
    private String cancCupnPubliNo;

    /**
     * 쿠폰 사용 금액
     **/
    private Double cupnAmt;

    /**
     * point 수정여부
     */
    private String pointSaveYn;
    /**
     * 쿠폰 수정여부
     */
    private String cupnSaveYn;


    /**
     * 완성일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date confirmDt;

    /**
     * 지불방식
     *
    private String payTp;
    private String paysTpCb;
    */

    /**
     * 용품품목 리스트
     */
    List<AccessoryItemSalesItemVO> items = new ArrayList<AccessoryItemSalesItemVO>();

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
     * @return the contractCustTp
     */
    public String getContractCustTp() {
        return contractCustTp;
    }

    /**
     * @param contractCustTp the contractCustTp to set
     */
    public void setContractCustTp(String contractCustTp) {
        this.contractCustTp = contractCustTp;
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
     * @return the fscCd
     */
    public String getFscCd() {
        return fscCd;
    }

    /**
     * @param fscCd the fscCd to set
     */
    public void setFscCd(String fscCd) {
        this.fscCd = fscCd;
    }

    /**
     * @return the fscNm
     */
    public String getFscNm() {
        return fscNm;
    }

    /**
     * @param fscNm the fscNm to set
     */
    public void setFscNm(String fscNm) {
        this.fscNm = fscNm;
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
     * @return the saleDt
     */
    public Date getSaleDt() {
        return saleDt;
    }

    /**
     * @param saleDt the saleDt to set
     */
    public void setSaleDt(Date saleDt) {
        this.saleDt = saleDt;
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
     * @return the goodsTotCnt
     */
    public int getGoodsTotCnt() {
        return goodsTotCnt;
    }

    /**
     * @param goodsTotCnt the goodsTotCnt to set
     */
    public void setGoodsTotCnt(int goodsTotCnt) {
        this.goodsTotCnt = goodsTotCnt;
    }

    /**
     * @return the goodsQty
     */
    public int getGoodsQty() {
        return goodsQty;
    }

    /**
     * @param goodsQty the goodsQty to set
     */
    public void setGoodsQty(int goodsQty) {
        this.goodsQty = goodsQty;
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
     * @return the dcLvlCd
     */
    public String getDcLvlCd() {
        return dcLvlCd;
    }

    /**
     * @param dcLvlCd the dcLvlCd to set
     */
    public void setDcLvlCd(String dcLvlCd) {
        this.dcLvlCd = dcLvlCd;
    }

    /**
     * @return the dcApproveYn
     */
    public String getDcApproveYn() {
        return dcApproveYn;
    }

    /**
     * @param dcApproveYn the dcApproveYn to set
     */
    public void setDcApproveYn(String dcApproveYn) {
        this.dcApproveYn = dcApproveYn;
    }

    /**
     * @return the dcApproveDt
     */
    public Date getDcApproveDt() {
        return dcApproveDt;
    }

    /**
     * @param dcApproveDt the dcApproveDt to set
     */
    public void setDcApproveDt(Date dcApproveDt) {
        this.dcApproveDt = dcApproveDt;
    }

    /**
     * @return the items
     */
    public List<AccessoryItemSalesItemVO> getItems() {
        return items;
    }

    /**
     * @param items the items to set
     */
    public void setItems(List<AccessoryItemSalesItemVO> items) {
        this.items = items;
    }


    /**
     * @return the returnDt
     */
    public Date getReturnDt() {
        return returnDt;
    }

    /**
     * @param returnDt the returnDt to set
     */
    public void setReturnDt(Date returnDt) {
        this.returnDt = returnDt;
    }

    /**
     * @return the refDocNo
     */
    public String getRefDocNo() {
        return refDocNo;
    }

    /**
     * @param refDocNo the refDocNo to set
     */
    public void setRefDocNo(String refDocNo) {
        this.refDocNo = refDocNo;
    }

    /**
     * @return the regUsrNm
     */
    public String getRegUsrNm() {
        return regUsrNm;
    }

    /**
     * @param regUsrNm the regUsrNm to set
     */
    public void setRegUsrNm(String regUsrNm) {
        this.regUsrNm = regUsrNm;
    }

    /**
     * @return the updtDtStr
     */
    public String getUpdtDtStr() {
        return updtDtStr;
    }

    /**
     * @param updtDtStr the updtDtStr to set
     */
    public void setUpdtDtStr(String updtDtStr) {
        this.updtDtStr = updtDtStr;
    }

    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }

    /**
     * @return the membershipNo
     */
    public String getMembershipNo() {
        return membershipNo;
    }

    /**
     * @param membershipNo the membershipNo to set
     */
    public void setMembershipNo(String membershipNo) {
        this.membershipNo = membershipNo;
    }

    /**
     * @return the cardNo
     */
    public String getCardNo() {
        return cardNo;
    }

    /**
     * @param cardNo the cardNo to set
     */
    public void setCardNo(String cardNo) {
        this.cardNo = cardNo;
    }

    /**
     * @return the pointVal
     */
    public Double getPointVal() {
        return pointVal;
    }

    /**
     * @param pointVal the pointVal to set
     */
    public void setPointVal(Double pointVal) {
        this.pointVal = pointVal;
    }

    /**
     * @return the pointAmt
     */
    public Double getPointAmt() {
        return pointAmt;
    }

    /**
     * @param pointAmt the pointAmt to set
     */
    public void setPointAmt(Double pointAmt) {
        this.pointAmt = pointAmt;
    }

    /**
     * @return the cupnPubliNo
     */
    public String getCupnPubliNo() {
        return cupnPubliNo;
    }

    /**
     * @param cupnPubliNo the cupnPubliNo to set
     */
    public void setCupnPubliNo(String cupnPubliNo) {
        this.cupnPubliNo = cupnPubliNo;
    }


    /**
     * @return the cupnAmt
     */
    public Double getCupnAmt() {
        return cupnAmt;
    }

    /**
     * @param cupnAmt the cupnAmt to set
     */
    public void setCupnAmt(Double cupnAmt) {
        this.cupnAmt = cupnAmt;
    }

    public String getCancCupnPubliNo() {
        return cancCupnPubliNo;
    }

    public void setCancCupnPubliNo(String cancCupnPubliNo) {
        this.cancCupnPubliNo = cancCupnPubliNo;
    }

    /**
     * @return the pointSaveYn
     */
    public String getPointSaveYn() {
        return pointSaveYn;
    }

    /**
     * @param pointSaveYn the pointSaveYn to set
     */
    public void setPointSaveYn(String pointSaveYn) {
        this.pointSaveYn = pointSaveYn;
    }

    /**
     * @return the cupnSaveYn
     */
    public String getCupnSaveYn() {
        return cupnSaveYn;
    }

    /**
     * @param cupnSaveYn the cupnSaveYn to set
     */
    public void setCupnSaveYn(String cupnSaveYn) {
        this.cupnSaveYn = cupnSaveYn;
    }

    /**
     * @return the confirmDt
     */
    public Date getConfirmDt() {
        return confirmDt;
    }

    /**
     * @param confirmDt the confirmDt to set
     */
    public void setConfirmDt(Date confirmDt) {
        this.confirmDt = confirmDt;
    }



}