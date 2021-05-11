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
 * @ClassName   : AccessoryItemSalesItemSupportVO
 * @Description : 용품판매문서 품목 정보
 * @author LIU JING
 * @since c
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author           description
 *  ===========    =============    ===========================
 *  2017. 5. 12.   LIU JINF               최초 생성
 * </pre>
 */
@ValidDescriptor({
    @ValidField(field="dlrCd", mesgKey="sal.lbl.dlrCd")
})
public class AccessoryItemSalesItemSupportVO extends BaseVO{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 8955078429631039579L;

    /**
     * 딜러코드
     **/
    private String dlrCd;

    /**
     * 용품계약번호
     **/
    private String goodsContractNo;

    /**
     * 일련번호
     **/
    private int seq;

    /**
     * 차종
     */
    private String carlineCd;

    /**
     * 차량등록번호
     **/
    private String carRegNo;

    /**
     * 차대번호
     **/
    private String vinNo;

    /**
     * 전화번호
     **/
    private String telNo;
    private String hpNo;

    /**
     * 멤버십 번호
     **/
    private String membershipNo;
    /**
     * 고객명
     */
    private String contractCustNm;
    /**
     * 사용 포인트
     **/
    private Double pointVal;
    /**
     * 등록자명
     */
    private String regUsrNm;

    /**
     * 용품코드
     **/
    private String goodsCd;

    /**
     * 용품명
     */
    private String goodsNm;

    /**
     * 용품수량
     **/
    private int goodsCnt;

    /**
     * 용품단위코드
     */
    private String goodsUnitCd;

    /**
     * 단가
     **/
    private Double retlPrc;

    /**
     * 단가(세금제외)
     **/
    private Double taxDdctPrc;

    /**
     * 총가격
     */
    private Double retlTotAmt;

    /**
     * 할인율
     **/
    private double dcRate;

    /**
     * 판매금액
     **/
    private Double saleAmt;

    /**
     * 지불유형
     **/
    //private String payTp;

    /**
     * 총금액
     **/
    private Double totAmt;

    /**
     * 패키지품목코드
     **/
    private String pkgItemCd;

    /**
     * 입고창고코드
     */
    private String grStrgeCd;

    /**
     * 출고창고코드
     */
    private String giStrgeCd;

    /**
     * 할인금액
     */
    private double dcAmt;

    /**
     * 표시
     */
    private String chk;

    /**
     * 수불문서년월
     */
    private String mvtDocYyMm;

    /**
     * 수불문서번호
     */
    private String mvtDocNo;

    /**
     * 수불문서라인번호
     */
    private int mvtDocLineNo;

    /**
     * 설치담당자ID
     */
    private String eqipPrsnId;


    /**
     * 원 소매가
     **/
    private Double orgRetlPrc;

    /**
     * 출고일자
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date expcGiEndDt;

    /**
     * 완료일자
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date realDlDt;

    /**
     * 판매일자
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date saleDt;

    /**
     * 설치비용
     */
    private double eqipCostAmt;

    /**
     * 설치예정일
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date expcEqipDt;

    /**
     * 설치종료일
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date eqipEndDt;

    /**
     * 반품일
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date returnDt;

    /**
     * 상태코드
     * '10':출고대기
     * '20':출고
     * '30':반품대기
     * '40':반품
     */
    private String statCd;

    /**
     * 참조문서번호
     **/
    private String refDocNo;

    /**
     * 참조문서라인번호
     **/
    private int refDocLineNo;

    /**
     * 반품문서번호
     **/
    private String returnDocNo;

    /**
     * 반품수량
     **/
    private int returnQty;

    /**
     * 기반품수량
     **/
    private int preReturnQty;

    /**
     * 가용재고
     **/
    private int avlbStockQty;

    /**
     * 부품유형
     */
    private String itemDstinCd;

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
     * @return the goodsCd
     */
    public String getGoodsCd() {
        return goodsCd;
    }

    /**
     * @param goodsCd the goodsCd to set
     */
    public void setGoodsCd(String goodsCd) {
        this.goodsCd = goodsCd;
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
     * @return the goodsUnitCd
     */
    public String getGoodsUnitCd() {
        return goodsUnitCd;
    }

    /**
     * @param goodsUnitCd the goodsUnitCd to set
     */
    public void setGoodsUnitCd(String goodsUnitCd) {
        this.goodsUnitCd = goodsUnitCd;
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
     * @return the taxDdctPrc
     */
    public Double getTaxDdctPrc() {
        return taxDdctPrc;
    }

    /**
     * @param taxDdctPrc the taxDdctPrc to set
     */
    public void setTaxDdctPrc(Double taxDdctPrc) {
        this.taxDdctPrc = taxDdctPrc;
    }

    /**
     * @return the retlTotAmt
     */
    public Double getRetlTotAmt() {
        return retlTotAmt;
    }

    /**
     * @param retlTotAmt the retlTotAmt to set
     */
    public void setRetlTotAmt(Double retlTotAmt) {
        this.retlTotAmt = retlTotAmt;
    }

    /**
     * @return the dcRate
     */
    public double getDcRate() {
        return dcRate;
    }

    /**
     * @param dcRate the dcRate to set
     */
    public void setDcRate(double dcRate) {
        this.dcRate = dcRate;
    }

    /**
     * @return the saleAmt
     */
    public Double getSaleAmt() {
        return saleAmt;
    }

    /**
     * @param saleAmt the saleAmt to set
     */
    public void setSaleAmt(Double saleAmt) {
        this.saleAmt = saleAmt;
    }

    /**
     * @return the totAmt
     */
    public Double getTotAmt() {
        return totAmt;
    }

    /**
     * @param totAmt the totAmt to set
     */
    public void setTotAmt(Double totAmt) {
        this.totAmt = totAmt;
    }

    /**
     * @return the pkgItemCd
     */
    public String getPkgItemCd() {
        return pkgItemCd;
    }

    /**
     * @param pkgItemCd the pkgItemCd to set
     */
    public void setPkgItemCd(String pkgItemCd) {
        this.pkgItemCd = pkgItemCd;
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
     * @return the dcAmt
     */
    public double getDcAmt() {
        return dcAmt;
    }

    /**
     * @param dcAmt the dcAmt to set
     */
    public void setDcAmt(double dcAmt) {
        this.dcAmt = dcAmt;
    }

    /**
     * @return the chk
     */
    public String getChk() {
        return chk;
    }

    /**
     * @param chk the chk to set
     */
    public void setChk(String chk) {
        this.chk = chk;
    }

    /**
     * @return the mvtDocYyMm
     */
    public String getMvtDocYyMm() {
        return mvtDocYyMm;
    }

    /**
     * @param mvtDocYyMm the mvtDocYyMm to set
     */
    public void setMvtDocYyMm(String mvtDocYyMm) {
        this.mvtDocYyMm = mvtDocYyMm;
    }

    /**
     * @return the mvtDocNo
     */
    public String getMvtDocNo() {
        return mvtDocNo;
    }

    /**
     * @param mvtDocNo the mvtDocNo to set
     */
    public void setMvtDocNo(String mvtDocNo) {
        this.mvtDocNo = mvtDocNo;
    }

    /**
     * @return the mvtDocLineNo
     */
    public int getMvtDocLineNo() {
        return mvtDocLineNo;
    }

    /**
     * @param mvtDocLineNo the mvtDocLineNo to set
     */
    public void setMvtDocLineNo(int mvtDocLineNo) {
        this.mvtDocLineNo = mvtDocLineNo;
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
     * @return the orgRetlPrc
     */
    public Double getOrgRetlPrc() {
        return orgRetlPrc;
    }

    /**
     * @param orgRetlPrc the orgRetlPrc to set
     */
    public void setOrgRetlPrc(Double orgRetlPrc) {
        this.orgRetlPrc = orgRetlPrc;
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
     * @return the eqipCostAmt
     */
    public double getEqipCostAmt() {
        return eqipCostAmt;
    }

    /**
     * @param eqipCostAmt the eqipCostAmt to set
     */
    public void setEqipCostAmt(double eqipCostAmt) {
        this.eqipCostAmt = eqipCostAmt;
    }

    /**
     * @return the expcEqipDt
     */
    public Date getExpcEqipDt() {
        return expcEqipDt;
    }

    /**
     * @param expcEqipDt the expcEqipDt to set
     */
    public void setExpcEqipDt(Date expcEqipDt) {
        this.expcEqipDt = expcEqipDt;
    }

    /**
     * @return the eqipEndDt
     */
    public Date getEqipEndDt() {
        return eqipEndDt;
    }

    /**
     * @param eqipEndDt the eqipEndDt to set
     */
    public void setEqipEndDt(Date eqipEndDt) {
        this.eqipEndDt = eqipEndDt;
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
     * @return the statCd
     */
    public String getStatCd() {
        return statCd;
    }

    /**
     * @param statCd the statCd to set
     */
    public void setStatCd(String statCd) {
        this.statCd = statCd;
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
     * @return the refDocLineNo
     */
    public int getRefDocLineNo() {
        return refDocLineNo;
    }

    /**
     * @param refDocLineNo the refDocLineNo to set
     */
    public void setRefDocLineNo(int refDocLineNo) {
        this.refDocLineNo = refDocLineNo;
    }

    /**
     * @return the returnDocNo
     */
    public String getReturnDocNo() {
        return returnDocNo;
    }

    /**
     * @param returnDocNo the returnDocNo to set
     */
    public void setReturnDocNo(String returnDocNo) {
        this.returnDocNo = returnDocNo;
    }

    /**
     * @return the returnQty
     */
    public int getReturnQty() {
        return returnQty;
    }

    /**
     * @param returnQty the returnQty to set
     */
    public void setReturnQty(int returnQty) {
        this.returnQty = returnQty;
    }

    /**
     * @return the preReturnQty
     */
    public int getPreReturnQty() {
        return preReturnQty;
    }

    /**
     * @param preReturnQty the preReturnQty to set
     */
    public void setPreReturnQty(int preReturnQty) {
        this.preReturnQty = preReturnQty;
    }

    /**
     * @return the avlbStockQty
     */
    public int getAvlbStockQty() {
        return avlbStockQty;
    }

    /**
     * @param avlbStockQty the avlbStockQty to set
     */
    public void setAvlbStockQty(int avlbStockQty) {
        this.avlbStockQty = avlbStockQty;
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
     * @param carRegNo the carRegNo to set
     */
    public void setCarRegNo(String carRegNo) {
        this.carRegNo = carRegNo;
    }

    /**
     * @return the carRegNo
     */
    public String getCarRegNo() {
        return carRegNo;
    }

    /**
     * @param vinNo the vinNo to set
     */
    public void setVinNo(String vinNo) {
        this.vinNo = vinNo;
    }

    /**
     * @return the vinNo
     */
    public String getVinNo() {
        return vinNo;
    }

    /**
     * @param telNo the telNo to set
     */
    public void setTelNo(String telNo) {
        this.telNo = telNo;
    }

    /**
     * @return the telNo
     */
    public String getTelNo() {
        return telNo;
    }

    /**
     * @param membershipNo the membershipNo to set
     */
    public void setMembershipNo(String membershipNo) {
        this.membershipNo = membershipNo;
    }

    /**
     * @return the membershipNo
     */
    public String getMembershipNo() {
        return membershipNo;
    }

    /**
     * @param contractCustNm the contractCustNm to set
     */
    public void setContractCustNm(String contractCustNm) {
        this.contractCustNm = contractCustNm;
    }

    /**
     * @return the contractCustNm
     */
    public String getContractCustNm() {
        return contractCustNm;
    }

    /**
     * @param pointVal the pointVal to set
     */
    public void setPointVal(Double pointVal) {
        this.pointVal = pointVal;
    }

    /**
     * @return the pointVal
     */
    public Double getPointVal() {
        return pointVal;
    }

    /**
     * @param regUsrNm the regUsrNm to set
     */
    public void setRegUsrNm(String regUsrNm) {
        this.regUsrNm = regUsrNm;
    }

    /**
     * @return the regUsrNm
     */
    public String getRegUsrNm() {
        return regUsrNm;
    }

    /**
     * @param hpNo the hpNo to set
     */
    public void setHpNo(String hpNo) {
        this.hpNo = hpNo;
    }

    /**
     * @return the hpNo
     */
    public String getHpNo() {
        return hpNo;
    }

}
