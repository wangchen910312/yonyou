package chn.bhmc.dms.mob.api.part.vo;

import java.util.Date;

import org.hibernate.validator.constraints.NotEmpty;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;


/**
 * 공용품목마스터 VO
 *
 * @ClassName   : ComItemMasterVO.java
 * @Description : ComItemMasterVO Class
 * @author Eun Jung Jang
 * @since 2016. 5. 13.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 13.     Eun Jung Jang      최초 생성
 * </pre>
 */
@ValidDescriptor({
    @ValidField(field="dlrCd", mesgKey="par.lbl.dlrCd")
    ,@ValidField(field="itemCd", mesgKey="par.lbl.itemCd")
    ,@ValidField(field="comItemCd", mesgKey="par.lbl.comItemCd")
    ,@ValidField(field="remark", mesgKey="par.lbl.remark")
    ,@ValidField(field="regUsrId", mesgKey="par.lbl.regUsrId")
    ,@ValidField(field="regDt", mesgKey="par.lbl.regDt")
    ,@ValidField(field="updtUsrId", mesgKey="par.lbl.updtUsrId")
    ,@ValidField(field="updtDt", mesgKey="par.lbl.updtDt")
})
public class ComItemMasterVO extends BaseVO{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -4642597828280769609L;

    /**
     * 딜러코드
     **/
    private String dlrCd;

    /**
     * 통용품목코드
     **/
    private String comItemCd;

    /**
     * 통용품목명
     **/
    private String comItemNm;

    /**
     * 비고
     **/
    private String remark;

    /**
     * 등록자ID
     **/
    private String regUsrId;

    /**
     * 등록일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date regDt;

    /**
     * 수정자ID
     **/
    private String updtUsrId;

    /**
     * 수정일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date updtDt;

    /**
     * 품목코드
     **/
    @NotEmpty
    private String itemCd;

    /**
     * 로컬여부
     **/
    private String spyrCd;

    /**
     * 품목명
     **/
    private String itemNm;

    /**
     * 품목영문명
     **/
    private String itemEnNm;

    /**
     * 딜러자체품목명
     **/
    private String dlrSelfItemNm;

    /**
     * 품목구분코드
     **/
    private String itemDstinCd;

    /**
     * 품목그룹코드
     **/
    private String itemGrpCd;

    /**
     * 품목그룹명
     **/
    private String itemGrpNm;

    /**
     * HS코드
     **/
    private String hsCd;

    /**
     * 종료여부
     **/
    private String endYn = "N";

    /**
     * 시작일자
     **/
    private Date startDt;

    /**
     * 종료일자
     **/
    private Date endDt;

    /**
     * 기존품목코드
     **/
    private String preItemCd;

    /**
     * 구형대체품목코드
    **/
    private String oldRplcItemCd;

    /**
     * 신규대체품목코드
     **/
    private String newRplcItemCd;

    /**
     * 구형대체부품호환여부
     **/
    private String oldRplcParCmptYn;

    /**
     * 신규대체부품호환여부
     **/
    private String newRplcParCmptYn;

    /**
     * SUC코드
     **/
    private String sucCd;

    /**
     * 최종호환품목코드
     **/
    private String lastCmptItemCd;

    /**
     * 차량사용단위수
     **/
    private Double carUseUnitCnt;

    /**
     * 차종
     **/
    private String carlineCd;

    /**
     * 모비스수입로컬여부유형
     **/
    private String mobisImpLocalYnTp;

    /**
     * 부품특성코드
     **/
    private String parSpecCd;

    /**
     * PNC코드
     **/
    private String pncCd;

    /**
     * 재고단위코드
     **/
    private String stockUnitCd;

    /**
     * 품목길이값
     **/
    private String itemLgthVal;

    /**
     * 품목폭값
    **/
    private String itemWidthVal;

    /**
     * 품목높이값
     **/
    private String itemHgthVal;

    /**
     * 중량단위코드
     **/
    private String weightUnitCd;

    /**
     * 총중량값
     **/
    private Double totWeightVal;

    /**
     * 순중량값
     **/
    private Double netWeightVal;

    /**
     * 첨부문서번호
     **/
    private String fileDocNo;

    /**
     * 첨부문서번호URL
     **/
    private String fileDocUrl;

    /**
     * 구매리드타임
     **/
    private int purcLeadHm;

    /**
     * 소요량올림유형
     **/
    private Double cqtyRaiseTp;

    /**
     * 최소구매수량
     **/
    private Double minPurcQty;

    /**
     * 적정재고산출여부
     **/
    private String stdrdStockCalcYn;

    /**
     * 안전재고수량
     **/
    private Double sftyStockQty;

    /**
     * 적정재고수량
     **/
    private Double stdrdStockQty;

    /**
     * 적정재고적용률
     **/
    private Double stdrdStockApplyRate;

    /**
     * 구매소요량산출여부
     **/
    private String purcCqtyCalcYn = "N";

    /**
     * 재고담당자명
     **/
    private String stockPrsnId;

    /**
     * 구매담당자명
     **/
    private String purcPrsnId;

    /**
     * 입고창고코드
     **/
    private String grStrgeCd;

    /**
     * 위치코드
     **/
    private String locCd;

    /**
     * 출고창고코드
     **/
    private String giStrgeCd;

    /**
     * 요청창고코드
     **/
    private String reqStrgeCd;

    /**
     * 수입검사유형
     **/
    private String impTestTp;

    /**
     * ABC CLASS
     **/
    private String abcInd;

    /**
     * 3개월평균수요
     **/
    private Double mm3AvgDmndQty;

    /**
     * 6개월평균수요
     **/
    private Double mm6AvgDmndQty;

    /**
     * 12개월평균수요
     **/
    private Double mm12AvgDmndQty;

    /**
     * 중앙소요량
     **/
    private Double purcReqCnt;

    /**
     * NONMOVINGSTOCK여부
     **/
    private String nonMovingFlg;

    /**
     * 이전최종입고일자
     **/
    private Date befLastGrDt;

    /**
     * 최종입고일자
     **/
    private Date lastGrDt;

    /**
     * 이전최종출고일자
     **/
    private Date befLastGiDt;

    /**
     * 최종출고일자
     **/
    private Date lastGiDt;

    /**
     * 로컬품목연계여부
     **/
    private String localItemIfYn;

    /**
     * 권장소비자가격금액
     **/
    private Double recomRtprcAmt;

    /**
     * 업체유형
     **/
    private String bpTp;

    /**
     * 업체코드
     **/
    private String bpCd;

    /**
     * 업체명
     **/
    private String bpNm;

    /**
     * 구매단가유형
     **/
    private String prcTp;

    /**
     * 브랜드
     **/
    private String brandCd;

    /**
     * 구매단가
     **/
    private Double purcPrc;

    /**
     * 판매단가
     **/
    private Double salePrcAmt;

    /**
     * 단가수량
     **/
    private Double prcQty;

    /**
     * 가용재고
     **/
    private Double avlbStockQty;

    /**
     * 입고예정수량
     **/
    private Double grScheQty;

    /**
     * 출고예정수량
     **/
    private Double giScheQty;

    /**
     * 단가수량단위코드
     **/
    private String prcQtyUnitCd;

    /**
     * 공용차종
     **/
    private String comCarlineNm;

    /**
     * 이동평균가
     **/
    private Double movingAvgPrc;

    /**
     * 품목바코드
     **/
    private String itemBarsCd;

    /**
     * 품목QR코드
     **/
    private String itemQrCd;

    /**
     * 차종코드2_적용차종
     **/
    private String carlineCd2;

    /**
     * 단종여부
     **/
    private String prndYn = "N";

    /**
     * 위험품여부
     **/
    private String dgrItemYn = "N";

    /**
     * 모델코드
     **/
    private String modelCd;

    /**
     * 최종입고금액
     **/
    private Double lastGrAmt = 0.0;

    /**
     * 최대안전재고수량
     **/
    private Double maxSftyStockQty = 0.0;

    /**
     * 예약수량
     **/
    private Double resvStockQty = 0.0;

    /**
     * 보류수량
     **/
    private Double clamStockQty = 0.0;

    /**
     * 차입수량
    **/
    private Double borrowQty = 0.0;

    /**
     * 대여수량
     **/
    private Double rentQty = 0.0;

    /**
     * 재고수량
     **/
    private Double stockQty = 0.0;

    /**
     * 입고재고
     **/
    private Double giStrgeStock = 0.0;

    /**
     * 총재고
     **/
    private Double totStockQty = 0.0;

    /**
     * 재고수량
     **/
    private Double strgeStockQty = 0.0;

    /**
     * 대당수량
     **/
    private Double carlineStockQty = 0.0;

    /**
     * 예약수량
     **/
    private Double resvQty = 0.0;

    /**
     * 최소포장수량
     **/
    private Double minPackQty = 0.0;

    /**
     * 도색여부
     **/
    private String paintYn = "";

    /**
     * 주사용여부
     **/
    private String mjrUseYn = "N";

    /**
     * 주고장여부
     **/
    private String mjrErrYn = "N";

    /**
     * 갱신일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date renewDt;

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
     * @return the comItemCd
     */
    public String getComItemCd() {
        return comItemCd;
    }

    /**
     * @param comItemCd the comItemCd to set
     */
    public void setComItemCd(String comItemCd) {
        this.comItemCd = comItemCd;
    }

    /**
     * @return the comItemNm
     */
    public String getComItemNm() {
        return comItemNm;
    }

    /**
     * @param comItemNm the comItemNm to set
     */
    public void setComItemNm(String comItemNm) {
        this.comItemNm = comItemNm;
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
     * @return the regUsrId
     */
    public String getRegUsrId() {
        return regUsrId;
    }

    /**
     * @param regUsrId the regUsrId to set
     */
    public void setRegUsrId(String regUsrId) {
        this.regUsrId = regUsrId;
    }

    /**
     * @return the regDt
     */
    public Date getRegDt() {
        return regDt;
    }

    /**
     * @param regDt the regDt to set
     */
    public void setRegDt(Date regDt) {
        this.regDt = regDt;
    }

    /**
     * @return the updtUsrId
     */
    public String getUpdtUsrId() {
        return updtUsrId;
    }

    /**
     * @param updtUsrId the updtUsrId to set
     */
    public void setUpdtUsrId(String updtUsrId) {
        this.updtUsrId = updtUsrId;
    }

    /**
     * @return the updtDt
     */
    public Date getUpdtDt() {
        return updtDt;
    }

    /**
     * @param updtDt the updtDt to set
     */
    public void setUpdtDt(Date updtDt) {
        this.updtDt = updtDt;
    }

    /**
     * @return the itemCd
     */
    public String getItemCd() {
        return itemCd;
    }

    /**
     * @param itemCd the itemCd to set
     */
    public void setItemCd(String itemCd) {
        this.itemCd = itemCd;
    }

    /**
     * @return the spyrCd
     */
    public String getSpyrCd() {
        return spyrCd;
    }

    /**
     * @param spyrCd the spyrCd to set
     */
    public void setSpyrCd(String spyrCd) {
        this.spyrCd = spyrCd;
    }

    /**
     * @return the itemNm
     */
    public String getItemNm() {
        return itemNm;
    }

    /**
     * @param itemNm the itemNm to set
     */
    public void setItemNm(String itemNm) {
        this.itemNm = itemNm;
    }

    /**
     * @return the itemEnNm
     */
    public String getItemEnNm() {
        return itemEnNm;
    }

    /**
     * @param itemEnNm the itemEnNm to set
     */
    public void setItemEnNm(String itemEnNm) {
        this.itemEnNm = itemEnNm;
    }

    /**
     * @return the dlrSelfItemNm
     */
    public String getDlrSelfItemNm() {
        return dlrSelfItemNm;
    }

    /**
     * @param dlrSelfItemNm the dlrSelfItemNm to set
     */
    public void setDlrSelfItemNm(String dlrSelfItemNm) {
        this.dlrSelfItemNm = dlrSelfItemNm;
    }

    /**
     * @return the itemDstinCd
     */
    public String getItemDstinCd() {
        return itemDstinCd;
    }

    /**
     * @param itemDstinCd the itemDstinCd to set
     */
    public void setItemDstinCd(String itemDstinCd) {
        this.itemDstinCd = itemDstinCd;
    }

    /**
     * @return the itemGrpCd
     */
    public String getItemGrpCd() {
        return itemGrpCd;
    }

    /**
     * @param itemGrpCd the itemGrpCd to set
     */
    public void setItemGrpCd(String itemGrpCd) {
        this.itemGrpCd = itemGrpCd;
    }

    /**
     * @return the itemGrpNm
     */
    public String getItemGrpNm() {
        return itemGrpNm;
    }

    /**
     * @param itemGrpNm the itemGrpNm to set
     */
    public void setItemGrpNm(String itemGrpNm) {
        this.itemGrpNm = itemGrpNm;
    }

    /**
     * @return the hsCd
     */
    public String getHsCd() {
        return hsCd;
    }

    /**
     * @param hsCd the hsCd to set
     */
    public void setHsCd(String hsCd) {
        this.hsCd = hsCd;
    }

    /**
     * @return the endYn
     */
    public String getEndYn() {
        return endYn;
    }

    /**
     * @param endYn the endYn to set
     */
    public void setEndYn(String endYn) {
        this.endYn = endYn;
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
     * @return the preItemCd
     */
    public String getPreItemCd() {
        return preItemCd;
    }

    /**
     * @param preItemCd the preItemCd to set
     */
    public void setPreItemCd(String preItemCd) {
        this.preItemCd = preItemCd;
    }

    /**
     * @return the oldRplcItemCd
     */
    public String getOldRplcItemCd() {
        return oldRplcItemCd;
    }

    /**
     * @param oldRplcItemCd the oldRplcItemCd to set
     */
    public void setOldRplcItemCd(String oldRplcItemCd) {
        this.oldRplcItemCd = oldRplcItemCd;
    }

    /**
     * @return the newRplcItemCd
     */
    public String getNewRplcItemCd() {
        return newRplcItemCd;
    }

    /**
     * @param newRplcItemCd the newRplcItemCd to set
     */
    public void setNewRplcItemCd(String newRplcItemCd) {
        this.newRplcItemCd = newRplcItemCd;
    }

    /**
     * @return the oldRplcParCmptYn
     */
    public String getOldRplcParCmptYn() {
        return oldRplcParCmptYn;
    }

    /**
     * @param oldRplcParCmptYn the oldRplcParCmptYn to set
     */
    public void setOldRplcParCmptYn(String oldRplcParCmptYn) {
        this.oldRplcParCmptYn = oldRplcParCmptYn;
    }

    /**
     * @return the newRplcParCmptYn
     */
    public String getNewRplcParCmptYn() {
        return newRplcParCmptYn;
    }

    /**
     * @param newRplcParCmptYn the newRplcParCmptYn to set
     */
    public void setNewRplcParCmptYn(String newRplcParCmptYn) {
        this.newRplcParCmptYn = newRplcParCmptYn;
    }

    /**
     * @return the sucCd
     */
    public String getSucCd() {
        return sucCd;
    }

    /**
     * @param sucCd the sucCd to set
     */
    public void setSucCd(String sucCd) {
        this.sucCd = sucCd;
    }

    /**
     * @return the lastCmptItemCd
     */
    public String getLastCmptItemCd() {
        return lastCmptItemCd;
    }

    /**
     * @param lastCmptItemCd the lastCmptItemCd to set
     */
    public void setLastCmptItemCd(String lastCmptItemCd) {
        this.lastCmptItemCd = lastCmptItemCd;
    }

    /**
     * @return the carUseUnitCnt
     */
    public Double getCarUseUnitCnt() {
        return carUseUnitCnt;
    }

    /**
     * @param carUseUnitCnt the carUseUnitCnt to set
     */
    public void setCarUseUnitCnt(Double carUseUnitCnt) {
        this.carUseUnitCnt = carUseUnitCnt;
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
     * @return the mobisImpLocalYnTp
     */
    public String getMobisImpLocalYnTp() {
        return mobisImpLocalYnTp;
    }

    /**
     * @param mobisImpLocalYnTp the mobisImpLocalYnTp to set
     */
    public void setMobisImpLocalYnTp(String mobisImpLocalYnTp) {
        this.mobisImpLocalYnTp = mobisImpLocalYnTp;
    }

    /**
     * @return the parSpecCd
     */
    public String getParSpecCd() {
        return parSpecCd;
    }

    /**
     * @param parSpecCd the parSpecCd to set
     */
    public void setParSpecCd(String parSpecCd) {
        this.parSpecCd = parSpecCd;
    }

    /**
     * @return the pncCd
     */
    public String getPncCd() {
        return pncCd;
    }

    /**
     * @param pncCd the pncCd to set
     */
    public void setPncCd(String pncCd) {
        this.pncCd = pncCd;
    }

    /**
     * @return the stockUnitCd
     */
    public String getStockUnitCd() {
        return stockUnitCd;
    }

    /**
     * @param stockUnitCd the stockUnitCd to set
     */
    public void setStockUnitCd(String stockUnitCd) {
        this.stockUnitCd = stockUnitCd;
    }

    /**
     * @return the itemLgthVal
     */
    public String getItemLgthVal() {
        return itemLgthVal;
    }

    /**
     * @param itemLgthVal the itemLgthVal to set
     */
    public void setItemLgthVal(String itemLgthVal) {
        this.itemLgthVal = itemLgthVal;
    }

    /**
     * @return the itemWidthVal
     */
    public String getItemWidthVal() {
        return itemWidthVal;
    }

    /**
     * @param itemWidthVal the itemWidthVal to set
     */
    public void setItemWidthVal(String itemWidthVal) {
        this.itemWidthVal = itemWidthVal;
    }

    /**
     * @return the itemHgthVal
     */
    public String getItemHgthVal() {
        return itemHgthVal;
    }

    /**
     * @param itemHgthVal the itemHgthVal to set
     */
    public void setItemHgthVal(String itemHgthVal) {
        this.itemHgthVal = itemHgthVal;
    }

    /**
     * @return the weightUnitCd
     */
    public String getWeightUnitCd() {
        return weightUnitCd;
    }

    /**
     * @param weightUnitCd the weightUnitCd to set
     */
    public void setWeightUnitCd(String weightUnitCd) {
        this.weightUnitCd = weightUnitCd;
    }

    /**
     * @return the totWeightVal
     */
    public Double getTotWeightVal() {
        return totWeightVal;
    }

    /**
     * @param totWeightVal the totWeightVal to set
     */
    public void setTotWeightVal(Double totWeightVal) {
        this.totWeightVal = totWeightVal;
    }

    /**
     * @return the netWeightVal
     */
    public Double getNetWeightVal() {
        return netWeightVal;
    }

    /**
     * @param netWeightVal the netWeightVal to set
     */
    public void setNetWeightVal(Double netWeightVal) {
        this.netWeightVal = netWeightVal;
    }

    /**
     * @return the fileDocNo
     */
    public String getFileDocNo() {
        return fileDocNo;
    }

    /**
     * @param fileDocNo the fileDocNo to set
     */
    public void setFileDocNo(String fileDocNo) {
        this.fileDocNo = fileDocNo;
    }

    /**
     * @return the fileDocUrl
     */
    public String getFileDocUrl() {
        return fileDocUrl;
    }

    /**
     * @param fileDocUrl the fileDocUrl to set
     */
    public void setFileDocUrl(String fileDocUrl) {
        this.fileDocUrl = fileDocUrl;
    }

    /**
     * @return the purcLeadHm
     */
    public int getPurcLeadHm() {
        return purcLeadHm;
    }

    /**
     * @param purcLeadHm the purcLeadHm to set
     */
    public void setPurcLeadHm(int purcLeadHm) {
        this.purcLeadHm = purcLeadHm;
    }

    /**
     * @return the cqtyRaiseTp
     */
    public Double getCqtyRaiseTp() {
        return cqtyRaiseTp;
    }

    /**
     * @param cqtyRaiseTp the cqtyRaiseTp to set
     */
    public void setCqtyRaiseTp(Double cqtyRaiseTp) {
        this.cqtyRaiseTp = cqtyRaiseTp;
    }

    /**
     * @return the minPurcQty
     */
    public Double getMinPurcQty() {
        return minPurcQty;
    }

    /**
     * @param minPurcQty the minPurcQty to set
     */
    public void setMinPurcQty(Double minPurcQty) {
        this.minPurcQty = minPurcQty;
    }

    /**
     * @return the stdrdStockCalcYn
     */
    public String getStdrdStockCalcYn() {
        return stdrdStockCalcYn;
    }

    /**
     * @param stdrdStockCalcYn the stdrdStockCalcYn to set
     */
    public void setStdrdStockCalcYn(String stdrdStockCalcYn) {
        this.stdrdStockCalcYn = stdrdStockCalcYn;
    }

    /**
     * @return the sftyStockQty
     */
    public Double getSftyStockQty() {
        return sftyStockQty;
    }

    /**
     * @param sftyStockQty the sftyStockQty to set
     */
    public void setSftyStockQty(Double sftyStockQty) {
        this.sftyStockQty = sftyStockQty;
    }

    /**
     * @return the stdrdStockQty
     */
    public Double getStdrdStockQty() {
        return stdrdStockQty;
    }

    /**
     * @param stdrdStockQty the stdrdStockQty to set
     */
    public void setStdrdStockQty(Double stdrdStockQty) {
        this.stdrdStockQty = stdrdStockQty;
    }

    /**
     * @return the stdrdStockApplyRate
     */
    public Double getStdrdStockApplyRate() {
        return stdrdStockApplyRate;
    }

    /**
     * @param stdrdStockApplyRate the stdrdStockApplyRate to set
     */
    public void setStdrdStockApplyRate(Double stdrdStockApplyRate) {
        this.stdrdStockApplyRate = stdrdStockApplyRate;
    }

    /**
     * @return the purcCqtyCalcYn
     */
    public String getPurcCqtyCalcYn() {
        return purcCqtyCalcYn;
    }

    /**
     * @param purcCqtyCalcYn the purcCqtyCalcYn to set
     */
    public void setPurcCqtyCalcYn(String purcCqtyCalcYn) {
        this.purcCqtyCalcYn = purcCqtyCalcYn;
    }

    /**
     * @return the stockPrsnId
     */
    public String getStockPrsnId() {
        return stockPrsnId;
    }

    /**
     * @param stockPrsnId the stockPrsnId to set
     */
    public void setStockPrsnId(String stockPrsnId) {
        this.stockPrsnId = stockPrsnId;
    }

    /**
     * @return the purcPrsnId
     */
    public String getPurcPrsnId() {
        return purcPrsnId;
    }

    /**
     * @param purcPrsnId the purcPrsnId to set
     */
    public void setPurcPrsnId(String purcPrsnId) {
        this.purcPrsnId = purcPrsnId;
    }

    /**
     * @return the grStrgeCd
     */
    public String getGrStrgeCd() {
        return grStrgeCd;
    }

    /**
     * @param grStrgeCd the grStrgeCd to set
     */
    public void setGrStrgeCd(String grStrgeCd) {
        this.grStrgeCd = grStrgeCd;
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
     * @return the giStrgeCd
     */
    public String getGiStrgeCd() {
        return giStrgeCd;
    }

    /**
     * @param giStrgeCd the giStrgeCd to set
     */
    public void setGiStrgeCd(String giStrgeCd) {
        this.giStrgeCd = giStrgeCd;
    }

    /**
     * @return the reqStrgeCd
     */
    public String getReqStrgeCd() {
        return reqStrgeCd;
    }

    /**
     * @param reqStrgeCd the reqStrgeCd to set
     */
    public void setReqStrgeCd(String reqStrgeCd) {
        this.reqStrgeCd = reqStrgeCd;
    }

    /**
     * @return the impTestTp
     */
    public String getImpTestTp() {
        return impTestTp;
    }

    /**
     * @param impTestTp the impTestTp to set
     */
    public void setImpTestTp(String impTestTp) {
        this.impTestTp = impTestTp;
    }

    /**
     * @return the abcInd
     */
    public String getAbcInd() {
        return abcInd;
    }

    /**
     * @param abcInd the abcInd to set
     */
    public void setAbcInd(String abcInd) {
        this.abcInd = abcInd;
    }

    /**
     * @return the mm3AvgDmndQty
     */
    public Double getMm3AvgDmndQty() {
        return mm3AvgDmndQty;
    }

    /**
     * @param mm3AvgDmndQty the mm3AvgDmndQty to set
     */
    public void setMm3AvgDmndQty(Double mm3AvgDmndQty) {
        this.mm3AvgDmndQty = mm3AvgDmndQty;
    }

    /**
     * @return the mm6AvgDmndQty
     */
    public Double getMm6AvgDmndQty() {
        return mm6AvgDmndQty;
    }

    /**
     * @param mm6AvgDmndQty the mm6AvgDmndQty to set
     */
    public void setMm6AvgDmndQty(Double mm6AvgDmndQty) {
        this.mm6AvgDmndQty = mm6AvgDmndQty;
    }

    /**
     * @return the mm12AvgDmndQty
     */
    public Double getMm12AvgDmndQty() {
        return mm12AvgDmndQty;
    }

    /**
     * @param mm12AvgDmndQty the mm12AvgDmndQty to set
     */
    public void setMm12AvgDmndQty(Double mm12AvgDmndQty) {
        this.mm12AvgDmndQty = mm12AvgDmndQty;
    }

    /**
     * @return the purcReqCnt
     */
    public Double getPurcReqCnt() {
        return purcReqCnt;
    }

    /**
     * @param purcReqCnt the purcReqCnt to set
     */
    public void setPurcReqCnt(Double purcReqCnt) {
        this.purcReqCnt = purcReqCnt;
    }

    /**
     * @return the nonMovingFlg
     */
    public String getNonMovingFlg() {
        return nonMovingFlg;
    }

    /**
     * @param nonMovingFlg the nonMovingFlg to set
     */
    public void setNonMovingFlg(String nonMovingFlg) {
        this.nonMovingFlg = nonMovingFlg;
    }

    /**
     * @return the befLastGrDt
     */
    public Date getBefLastGrDt() {
        return befLastGrDt;
    }

    /**
     * @param befLastGrDt the befLastGrDt to set
     */
    public void setBefLastGrDt(Date befLastGrDt) {
        this.befLastGrDt = befLastGrDt;
    }

    /**
     * @return the lastGrDt
     */
    public Date getLastGrDt() {
        return lastGrDt;
    }

    /**
     * @param lastGrDt the lastGrDt to set
     */
    public void setLastGrDt(Date lastGrDt) {
        this.lastGrDt = lastGrDt;
    }

    /**
     * @return the befLastGiDt
     */
    public Date getBefLastGiDt() {
        return befLastGiDt;
    }

    /**
     * @param befLastGiDt the befLastGiDt to set
     */
    public void setBefLastGiDt(Date befLastGiDt) {
        this.befLastGiDt = befLastGiDt;
    }

    /**
     * @return the lastGiDt
     */
    public Date getLastGiDt() {
        return lastGiDt;
    }

    /**
     * @param lastGiDt the lastGiDt to set
     */
    public void setLastGiDt(Date lastGiDt) {
        this.lastGiDt = lastGiDt;
    }

    /**
     * @return the localItemIfYn
     */
    public String getLocalItemIfYn() {
        return localItemIfYn;
    }

    /**
     * @param localItemIfYn the localItemIfYn to set
     */
    public void setLocalItemIfYn(String localItemIfYn) {
        this.localItemIfYn = localItemIfYn;
    }

    /**
     * @return the recomRtprcAmt
     */
    public Double getRecomRtprcAmt() {
        return recomRtprcAmt;
    }

    /**
     * @param recomRtprcAmt the recomRtprcAmt to set
     */
    public void setRecomRtprcAmt(Double recomRtprcAmt) {
        this.recomRtprcAmt = recomRtprcAmt;
    }

    /**
     * @return the bpTp
     */
    public String getBpTp() {
        return bpTp;
    }

    /**
     * @param bpTp the bpTp to set
     */
    public void setBpTp(String bpTp) {
        this.bpTp = bpTp;
    }

    /**
     * @return the bpCd
     */
    public String getBpCd() {
        return bpCd;
    }

    /**
     * @param bpCd the bpCd to set
     */
    public void setBpCd(String bpCd) {
        this.bpCd = bpCd;
    }

    /**
     * @return the bpNm
     */
    public String getBpNm() {
        return bpNm;
    }

    /**
     * @param bpNm the bpNm to set
     */
    public void setBpNm(String bpNm) {
        this.bpNm = bpNm;
    }

    /**
     * @return the prcTp
     */
    public String getPrcTp() {
        return prcTp;
    }

    /**
     * @param prcTp the prcTp to set
     */
    public void setPrcTp(String prcTp) {
        this.prcTp = prcTp;
    }

    /**
     * @return the brandCd
     */
    public String getBrandCd() {
        return brandCd;
    }

    /**
     * @param brandCd the brandCd to set
     */
    public void setBrandCd(String brandCd) {
        this.brandCd = brandCd;
    }

    /**
     * @return the purcPrc
     */
    public Double getPurcPrc() {
        return purcPrc;
    }

    /**
     * @param purcPrc the purcPrc to set
     */
    public void setPurcPrc(Double purcPrc) {
        this.purcPrc = purcPrc;
    }

    /**
     * @return the salePrcAmt
     */
    public Double getSalePrcAmt() {
        return salePrcAmt;
    }

    /**
     * @param salePrcAmt the salePrcAmt to set
     */
    public void setSalePrcAmt(Double salePrcAmt) {
        this.salePrcAmt = salePrcAmt;
    }

    /**
     * @return the prcQty
     */
    public Double getPrcQty() {
        return prcQty;
    }

    /**
     * @param prcQty the prcQty to set
     */
    public void setPrcQty(Double prcQty) {
        this.prcQty = prcQty;
    }

    /**
     * @return the avlbStockQty
     */
    public Double getAvlbStockQty() {
        return avlbStockQty;
    }

    /**
     * @param avlbStockQty the avlbStockQty to set
     */
    public void setAvlbStockQty(Double avlbStockQty) {
        this.avlbStockQty = avlbStockQty;
    }

    /**
     * @return the grScheQty
     */
    public Double getGrScheQty() {
        return grScheQty;
    }

    /**
     * @param grScheQty the grScheQty to set
     */
    public void setGrScheQty(Double grScheQty) {
        this.grScheQty = grScheQty;
    }

    /**
     * @return the giScheQty
     */
    public Double getGiScheQty() {
        return giScheQty;
    }

    /**
     * @param giScheQty the giScheQty to set
     */
    public void setGiScheQty(Double giScheQty) {
        this.giScheQty = giScheQty;
    }

    /**
     * @return the prcQtyUnitCd
     */
    public String getPrcQtyUnitCd() {
        return prcQtyUnitCd;
    }

    /**
     * @param prcQtyUnitCd the prcQtyUnitCd to set
     */
    public void setPrcQtyUnitCd(String prcQtyUnitCd) {
        this.prcQtyUnitCd = prcQtyUnitCd;
    }

    /**
     * @return the comCarlineNm
     */
    public String getComCarlineNm() {
        return comCarlineNm;
    }

    /**
     * @param comCarlineNm the comCarlineNm to set
     */
    public void setComCarlineNm(String comCarlineNm) {
        this.comCarlineNm = comCarlineNm;
    }

    /**
     * @return the movingAvgPrc
     */
    public Double getMovingAvgPrc() {
        return movingAvgPrc;
    }

    /**
     * @param movingAvgPrc the movingAvgPrc to set
     */
    public void setMovingAvgPrc(Double movingAvgPrc) {
        this.movingAvgPrc = movingAvgPrc;
    }

    /**
     * @return the itemBarsCd
     */
    public String getItemBarsCd() {
        return itemBarsCd;
    }

    /**
     * @param itemBarsCd the itemBarsCd to set
     */
    public void setItemBarsCd(String itemBarsCd) {
        this.itemBarsCd = itemBarsCd;
    }

    /**
     * @return the itemQrCd
     */
    public String getItemQrCd() {
        return itemQrCd;
    }

    /**
     * @param itemQrCd the itemQrCd to set
     */
    public void setItemQrCd(String itemQrCd) {
        this.itemQrCd = itemQrCd;
    }

    /**
     * @return the carlineCd2
     */
    public String getCarlineCd2() {
        return carlineCd2;
    }

    /**
     * @param carlineCd2 the carlineCd2 to set
     */
    public void setCarlineCd2(String carlineCd2) {
        this.carlineCd2 = carlineCd2;
    }

    /**
     * @return the prndYn
     */
    public String getPrndYn() {
        return prndYn;
    }

    /**
     * @param prndYn the prndYn to set
     */
    public void setPrndYn(String prndYn) {
        this.prndYn = prndYn;
    }

    /**
     * @return the dgrItemYn
     */
    public String getDgrItemYn() {
        return dgrItemYn;
    }

    /**
     * @param dgrItemYn the dgrItemYn to set
     */
    public void setDgrItemYn(String dgrItemYn) {
        this.dgrItemYn = dgrItemYn;
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
     * @return the lastGrAmt
     */
    public Double getLastGrAmt() {
        return lastGrAmt;
    }

    /**
     * @param lastGrAmt the lastGrAmt to set
     */
    public void setLastGrAmt(Double lastGrAmt) {
        this.lastGrAmt = lastGrAmt;
    }

    /**
     * @return the maxSftyStockQty
     */
    public Double getMaxSftyStockQty() {
        return maxSftyStockQty;
    }

    /**
     * @param maxSftyStockQty the maxSftyStockQty to set
     */
    public void setMaxSftyStockQty(Double maxSftyStockQty) {
        this.maxSftyStockQty = maxSftyStockQty;
    }

    /**
     * @return the resvStockQty
     */
    public Double getResvStockQty() {
        return resvStockQty;
    }

    /**
     * @param resvStockQty the resvStockQty to set
     */
    public void setResvStockQty(Double resvStockQty) {
        this.resvStockQty = resvStockQty;
    }

    /**
     * @return the clamStockQty
     */
    public Double getClamStockQty() {
        return clamStockQty;
    }

    /**
     * @param clamStockQty the clamStockQty to set
     */
    public void setClamStockQty(Double clamStockQty) {
        this.clamStockQty = clamStockQty;
    }

    /**
     * @return the borrowQty
     */
    public Double getBorrowQty() {
        return borrowQty;
    }

    /**
     * @param borrowQty the borrowQty to set
     */
    public void setBorrowQty(Double borrowQty) {
        this.borrowQty = borrowQty;
    }

    /**
     * @return the rentQty
     */
    public Double getRentQty() {
        return rentQty;
    }

    /**
     * @param rentQty the rentQty to set
     */
    public void setRentQty(Double rentQty) {
        this.rentQty = rentQty;
    }

    /**
     * @return the stockQty
     */
    public Double getStockQty() {
        return stockQty;
    }

    /**
     * @param stockQty the stockQty to set
     */
    public void setStockQty(Double stockQty) {
        this.stockQty = stockQty;
    }

    /**
     * @return the giStrgeStock
     */
    public Double getGiStrgeStock() {
        return giStrgeStock;
    }

    /**
     * @param giStrgeStock the giStrgeStock to set
     */
    public void setGiStrgeStock(Double giStrgeStock) {
        this.giStrgeStock = giStrgeStock;
    }

    /**
     * @return the totStockQty
     */
    public Double getTotStockQty() {
        return totStockQty;
    }

    /**
     * @param totStockQty the totStockQty to set
     */
    public void setTotStockQty(Double totStockQty) {
        this.totStockQty = totStockQty;
    }

    /**
     * @return the strgeStockQty
     */
    public Double getStrgeStockQty() {
        return strgeStockQty;
    }

    /**
     * @param strgeStockQty the strgeStockQty to set
     */
    public void setStrgeStockQty(Double strgeStockQty) {
        this.strgeStockQty = strgeStockQty;
    }

    /**
     * @return the carlineStockQty
     */
    public Double getCarlineStockQty() {
        return carlineStockQty;
    }

    /**
     * @param carlineStockQty the carlineStockQty to set
     */
    public void setCarlineStockQty(Double carlineStockQty) {
        this.carlineStockQty = carlineStockQty;
    }

    /**
     * @return the resvQty
     */
    public Double getResvQty() {
        return resvQty;
    }

    /**
     * @param resvQty the resvQty to set
     */
    public void setResvQty(Double resvQty) {
        this.resvQty = resvQty;
    }

    /**
     * @return the minPackQty
     */
    public Double getMinPackQty() {
        return minPackQty;
    }

    /**
     * @param minPackQty the minPackQty to set
     */
    public void setMinPackQty(Double minPackQty) {
        this.minPackQty = minPackQty;
    }

    /**
     * @return the paintYn
     */
    public String getPaintYn() {
        return paintYn;
    }

    /**
     * @param paintYn the paintYn to set
     */
    public void setPaintYn(String paintYn) {
        this.paintYn = paintYn;
    }

    /**
     * @return the mjrUseYn
     */
    public String getMjrUseYn() {
        return mjrUseYn;
    }

    /**
     * @param mjrUseYn the mjrUseYn to set
     */
    public void setMjrUseYn(String mjrUseYn) {
        this.mjrUseYn = mjrUseYn;
    }

    /**
     * @return the mjrErrYn
     */
    public String getMjrErrYn() {
        return mjrErrYn;
    }

    /**
     * @param mjrErrYn the mjrErrYn to set
     */
    public void setMjrErrYn(String mjrErrYn) {
        this.mjrErrYn = mjrErrYn;
    }

    /**
     * @return the renewDt
     */
    public Date getRenewDt() {
        return renewDt;
    }

    /**
     * @param renewDt the renewDt to set
     */
    public void setRenewDt(Date renewDt) {
        this.renewDt = renewDt;
    }
}
