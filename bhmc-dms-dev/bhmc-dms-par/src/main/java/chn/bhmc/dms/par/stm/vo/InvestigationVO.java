package chn.bhmc.dms.par.stm.vo;

import java.util.Date;

import org.hibernate.validator.constraints.NotEmpty;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;
/**
 * 재고실사 VO
 *
 * @ClassName   : InvestigationVO.java
 * @Description : InvestigationVO Class
 * @author Ju Won Lee
 * @since 2016. 1. 21.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 21.     Ju Won Lee     최초 생성
 * </pre>
 */

@ValidDescriptor({
    @ValidField(field="dlrCd"                 , mesgKey="par.lbl.dlrCd")
   ,@ValidField(field="stockDdDocNo"          , mesgKey="par.lbl.stockDdDocNo")
   ,@ValidField(field="docStatCd"             , mesgKey="par.lbl.docStatCd")
   ,@ValidField(field="pltCd"                 , mesgKey="par.lbl.pltCd")
   ,@ValidField(field="strgeCd"               , mesgKey="par.lbl.strgeCd")
   ,@ValidField(field="stockIvstPlanDt"       , mesgKey="par.lbl.stockIvstPlanDt")
   ,@ValidField(field="prsnId"                , mesgKey="par.lbl.prsNm")
   ,@ValidField(field="stockLockYn"           , mesgKey="par.lbl.stockLockYn")
   ,@ValidField(field="stockAdjMvtDocYy"      , mesgKey="par.lbl.stockAdjMvtDocYy")
   ,@ValidField(field="stockAdjMvtDocNo"      , mesgKey="par.lbl.stockAdjMvtDocNo")
   ,@ValidField(field="approveReqDt"          , mesgKey="par.lbl.approveReqDt")
   ,@ValidField(field="endDt"                 , mesgKey="par.lbl.endDt")
   ,@ValidField(field="cancDt"                , mesgKey="par.lbl.cancDt")
   ,@ValidField(field="signOpnCont"           , mesgKey="par.lbl.signOpnCont")
   })

public class InvestigationVO extends BaseVO{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 218491767419593775L;

    /**
     * 저장 성공실패 여부
     **/
    private  boolean resultYn;

    /**
     * 딜러코드
     **/
    private String dlrCd;

    /**
     * 재고실사문서번호
     **/
    private String stockDdDocNo;

    /**
     * 재고실사문서라인번호
     **/
    private int stockDdDocLineNo;

    /**
     * 문서상태코드
     **/
    private String docStatCd;

    /**
     * 센터코드
     **/
    private String pltCd;

    /**
     * 창고코드
     **/
    @NotEmpty
    private String strgeCd;

    /**
     * 재고조사계획일자
     **/
    @NotEmpty
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date stockIvstPlanDt;

    /**
     * 담당자ID
     **/
    @NotEmpty
    private String prsnId;

    /**
     * 담당자ID
     **/
    private String prsnNm;

    /**
     * 실사승인자ID
     **/
    private String approvePrsnId;

    /**
     * 실사승인자ID
     **/
    private String approvePrsnNm;

    /**
     * 실사확인자
     **/
    private String regUsrNm;

    /**
     * 재고통제여부
     **/
    @NotEmpty

    private String stockLockYn;

    /**
     * 재고조정수불유형
     **/
    private String mvtTp;

    /**
     * 재고조정수물문서년월
     **/
    private String stockAdjMvtDocYy;

    /**
     * 재고조정수불문서번호
     **/
    private String stockAdjMvtDocNo;

    /**
     * 승인요청일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date approveReqDt;

    /**
     * 완료일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date endDt;

    /**
     * 반려일자
     **/
    //CANC_DT
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date cancDt;

    /**
     * 결재의견내용
     **/
    private String signOpnCont;

    /**
     * 비고
     **/
    //REMARK
    private String remark;

    /**
     * 등록일
     **/
    //REG_DT
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date                   regDt;

    /**
     * 수불문서라인번호
     **/
    @NotEmpty
    private  int                    mvtDocLineNo;

    /**
     * 위치코드
     **/
    private  String                 locCd;

    /**
     * 품목코드
     **/
    @NotEmpty
    private  String                 itemCd;

    /**
     * 장부수량
     **/
    private  Double                 bookQty;

    /**
     * 실사수량
     **/
    private  Double                 ddQty;

    /**
     * 단위코드
     **/
    //UNIT_CD
    private  String                 unitCd;

    /**
     * 사유코드
     **/
    //REASON_CD
    private  String                 reasonCont;

    /**
     * 품목상태코드
     **/
    private  String                 itemStatCd;

    /**
     * 품목명
     **/
    private  String                 itemNm;

    /**
     * 품목구분
     **/
    private  String                 itemDstinCd;

    /**
     * 차종
     **/
    private  String                 carlineCd;

    /**
     * ABC CLASS
     **/
    private  String                 abcInd;

    /***
     * LAST_GR_DT
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date                   lastGrDt;

    /***
     * LAST_GI_DT
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date                   lastGiDt;

    /**
     * 차이수량
     **/
    private  Double                 diffQty;

    /**
     * 단가
     **/
    private  Double                movingAvgPrc;

    /**
     * 반려ITEM
     **/
    private  Double                 objectionItem;

    /**
     * 반려QTY
     **/
    private  Double                 objectionQty;

    /**
     * 반려AMT
     **/
    private  Double                 objectionAmt;


    /**
     * 등록ITEM
     **/
    private  Double                 inputItem;

    /**
     * 등록QTY
     **/
    private  Double                 inputQty;

    /**
     * 등록AMT
     **/
    private  Double                 inputAmt;

    /**
     * 승인ITEM
     **/
    private  Double                 agreementItem;

    /**
     * 승인QTY
     **/
    private  Double                 agreementQty;

    /**
     * 승인AMT
     **/
    private  Double                 agreementAmt;

    /**
     * 승인요청ITEM
     **/
    private  Double                 approveItem;

    /**
     * 승인요청QTY
     **/
    private  Double                 approveQty;

    /**
     * 승인요청AMT
     **/
    private  Double                 approveAmt;

    /**
     * 정상ITEM
     **/
    private  Double                 norItem;

    /**
     * 초과ITEM
     **/
    private  Double                 overItem;

    /**
     * 초과Qty
     **/
    private  Double                 overQty;

    /**
     * 초과AMT
     **/
    private  Double                 overAmt;

    /**
     * 부족ITEM
     **/
    private  Double                 shortItem;

    /**
     * 부족Qty
     **/
    private  Double                 shortQty;

    /**
     * 부족AMT
     **/
    private  Double                 shortAmt;

    /**
     * 로우 번호
     */
    private int rowno;

    /**
     * 재고수량
     */
    private double stockQty = 0.0;

    /**
     * 재고금액
     */
    private double stockPrice = 0.0;

    /**
     * 수정일시(UPDATE시 가능여부 체크용)
     **/
    //UPDT_DT_STR
    private  String          updtDtStr;

    /**
     * @return the resultYn
     */
    public boolean isResultYn() {
        return resultYn;
    }

    /**
     * @param resultYn the resultYn to set
     */
    public void setResultYn(boolean resultYn) {
        this.resultYn = resultYn;
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
     * @return the stockDdDocNo
     */
    public String getStockDdDocNo() {
        return stockDdDocNo;
    }

    /**
     * @param stockDdDocNo the stockDdDocNo to set
     */
    public void setStockDdDocNo(String stockDdDocNo) {
        this.stockDdDocNo = stockDdDocNo;
    }

    /**
     * @return the stockDdDocLineNo
     */
    public int getStockDdDocLineNo() {
        return stockDdDocLineNo;
    }

    /**
     * @param stockDdDocLineNo the stockDdDocLineNo to set
     */
    public void setStockDdDocLineNo(int stockDdDocLineNo) {
        this.stockDdDocLineNo = stockDdDocLineNo;
    }

    /**
     * @return the docStatCd
     */
    public String getDocStatCd() {
        return docStatCd;
    }

    /**
     * @param docStatCd the docStatCd to set
     */
    public void setDocStatCd(String docStatCd) {
        this.docStatCd = docStatCd;
    }

    /**
     * @return the pltCd
     */
    public String getPltCd() {
        return pltCd;
    }

    /**
     * @param pltCd the pltCd to set
     */
    public void setPltCd(String pltCd) {
        this.pltCd = pltCd;
    }

    /**
     * @return the strgeCd
     */
    public String getStrgeCd() {
        return strgeCd;
    }

    /**
     * @param strgeCd the strgeCd to set
     */
    public void setStrgeCd(String strgeCd) {
        this.strgeCd = strgeCd;
    }

    /**
     * @return the stockIvstPlanDt
     */
    public Date getStockIvstPlanDt() {
        return stockIvstPlanDt;
    }

    /**
     * @param stockIvstPlanDt the stockIvstPlanDt to set
     */
    public void setStockIvstPlanDt(Date stockIvstPlanDt) {
        this.stockIvstPlanDt = stockIvstPlanDt;
    }

    /**
     * @return the prsnId
     */
    public String getPrsnId() {
        return prsnId;
    }

    /**
     * @param prsnId the prsnId to set
     */
    public void setPrsnId(String prsnId) {
        this.prsnId = prsnId;
    }

    /**
     * @return the stockLockYn
     */
    public String getStockLockYn() {
        return stockLockYn;
    }

    /**
     * @param stockLockYn the stockLockYn to set
     */
    public void setStockLockYn(String stockLockYn) {
        this.stockLockYn = stockLockYn;
    }

    /**
     * @return the mvtTp
     */
    public String getMvtTp() {
        return mvtTp;
    }

    /**
     * @param mvtTp the mvtTp to set
     */
    public void setMvtTp(String mvtTp) {
        this.mvtTp = mvtTp;
    }

    /**
     * @return the stockAdjMvtDocYy
     */
    public String getStockAdjMvtDocYy() {
        return stockAdjMvtDocYy;
    }

    /**
     * @param stockAdjMvtDocYy the stockAdjMvtDocYy to set
     */
    public void setStockAdjMvtDocYy(String stockAdjMvtDocYy) {
        this.stockAdjMvtDocYy = stockAdjMvtDocYy;
    }

    /**
     * @return the stockAdjMvtDocNo
     */
    public String getStockAdjMvtDocNo() {
        return stockAdjMvtDocNo;
    }

    /**
     * @param stockAdjMvtDocNo the stockAdjMvtDocNo to set
     */
    public void setStockAdjMvtDocNo(String stockAdjMvtDocNo) {
        this.stockAdjMvtDocNo = stockAdjMvtDocNo;
    }

    /**
     * @return the approveReqDt
     */
    public Date getApproveReqDt() {
        return approveReqDt;
    }

    /**
     * @param approveReqDt the approveReqDt to set
     */
    public void setApproveReqDt(Date approveReqDt) {
        this.approveReqDt = approveReqDt;
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
     * @return the cancDt
     */
    public Date getCancDt() {
        return cancDt;
    }

    /**
     * @param cancDt the cancDt to set
     */
    public void setCancDt(Date cancDt) {
        this.cancDt = cancDt;
    }

    /**
     * @return the signOpnCont
     */
    public String getSignOpnCont() {
        return signOpnCont;
    }

    /**
     * @param signOpnCont the signOpnCont to set
     */
    public void setSignOpnCont(String signOpnCont) {
        this.signOpnCont = signOpnCont;
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
     * @return the bookQty
     */
    public Double getBookQty() {
        return bookQty;
    }

    /**
     * @param bookQty the bookQty to set
     */
    public void setBookQty(Double bookQty) {
        this.bookQty = bookQty;
    }

    /**
     * @return the ddQty
     */
    public Double getDdQty() {
        return ddQty;
    }

    /**
     * @param ddQty the ddQty to set
     */
    public void setDdQty(Double ddQty) {
        this.ddQty = ddQty;
    }

    /**
     * @return the unitCd
     */
    public String getUnitCd() {
        return unitCd;
    }

    /**
     * @param unitCd the unitCd to set
     */
    public void setUnitCd(String unitCd) {
        this.unitCd = unitCd;
    }

    /**
     * @return the reasonCont
     */
    public String getReasonCont() {
        return reasonCont;
    }

    /**
     * @param reasonCont the reasonCont to set
     */
    public void setReasonCont(String reasonCont) {
        this.reasonCont = reasonCont;
    }

    /**
     * @return the itemStatCd
     */
    public String getItemStatCd() {
        return itemStatCd;
    }

    /**
     * @param itemStatCd the itemStatCd to set
     */
    public void setItemStatCd(String itemStatCd) {
        this.itemStatCd = itemStatCd;
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
     * @return the diffQty
     */
    public Double getDiffQty() {
        return diffQty;
    }

    /**
     * @param diffQty the diffQty to set
     */
    public void setDiffQty(Double diffQty) {
        this.diffQty = diffQty;
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
     * @return the objectionItem
     */
    public Double getObjectionItem() {
        return objectionItem;
    }

    /**
     * @param objectionItem the objectionItem to set
     */
    public void setObjectionItem(Double objectionItem) {
        this.objectionItem = objectionItem;
    }

    /**
     * @return the objectionQty
     */
    public Double getObjectionQty() {
        return objectionQty;
    }

    /**
     * @param objectionQty the objectionQty to set
     */
    public void setObjectionQty(Double objectionQty) {
        this.objectionQty = objectionQty;
    }

    /**
     * @return the objectionAmt
     */
    public Double getObjectionAmt() {
        return objectionAmt;
    }

    /**
     * @param objectionAmt the objectionAmt to set
     */
    public void setObjectionAmt(Double objectionAmt) {
        this.objectionAmt = objectionAmt;
    }

    /**
     * @return the inputItem
     */
    public Double getInputItem() {
        return inputItem;
    }

    /**
     * @param inputItem the inputItem to set
     */
    public void setInputItem(Double inputItem) {
        this.inputItem = inputItem;
    }

    /**
     * @return the inputQty
     */
    public Double getInputQty() {
        return inputQty;
    }

    /**
     * @param inputQty the inputQty to set
     */
    public void setInputQty(Double inputQty) {
        this.inputQty = inputQty;
    }

    /**
     * @return the inputAmt
     */
    public Double getInputAmt() {
        return inputAmt;
    }

    /**
     * @param inputAmt the inputAmt to set
     */
    public void setInputAmt(Double inputAmt) {
        this.inputAmt = inputAmt;
    }

    /**
     * @return the agreementItem
     */
    public Double getAgreementItem() {
        return agreementItem;
    }

    /**
     * @param agreementItem the agreementItem to set
     */
    public void setAgreementItem(Double agreementItem) {
        this.agreementItem = agreementItem;
    }

    /**
     * @return the agreementQty
     */
    public Double getAgreementQty() {
        return agreementQty;
    }

    /**
     * @param agreementQty the agreementQty to set
     */
    public void setAgreementQty(Double agreementQty) {
        this.agreementQty = agreementQty;
    }

    /**
     * @return the agreementAmt
     */
    public Double getAgreementAmt() {
        return agreementAmt;
    }

    /**
     * @param agreementAmt the agreementAmt to set
     */
    public void setAgreementAmt(Double agreementAmt) {
        this.agreementAmt = agreementAmt;
    }

    /**
     * @return the approveItem
     */
    public Double getApproveItem() {
        return approveItem;
    }

    /**
     * @param approveItem the approveItem to set
     */
    public void setApproveItem(Double approveItem) {
        this.approveItem = approveItem;
    }

    /**
     * @return the approveQty
     */
    public Double getApproveQty() {
        return approveQty;
    }

    /**
     * @param approveQty the approveQty to set
     */
    public void setApproveQty(Double approveQty) {
        this.approveQty = approveQty;
    }

    /**
     * @return the approveAmt
     */
    public Double getApproveAmt() {
        return approveAmt;
    }

    /**
     * @param approveAmt the approveAmt to set
     */
    public void setApproveAmt(Double approveAmt) {
        this.approveAmt = approveAmt;
    }

    /**
     * @return the norItem
     */
    public Double getNorItem() {
        return norItem;
    }

    /**
     * @param norItem the norItem to set
     */
    public void setNorItem(Double norItem) {
        this.norItem = norItem;
    }

    /**
     * @return the overItem
     */
    public Double getOverItem() {
        return overItem;
    }

    /**
     * @param overItem the overItem to set
     */
    public void setOverItem(Double overItem) {
        this.overItem = overItem;
    }

    /**
     * @return the overQty
     */
    public Double getOverQty() {
        return overQty;
    }

    /**
     * @param overQty the overQty to set
     */
    public void setOverQty(Double overQty) {
        this.overQty = overQty;
    }

    /**
     * @return the overAmt
     */
    public Double getOverAmt() {
        return overAmt;
    }

    /**
     * @param overAmt the overAmt to set
     */
    public void setOverAmt(Double overAmt) {
        this.overAmt = overAmt;
    }

    /**
     * @return the shortItem
     */
    public Double getShortItem() {
        return shortItem;
    }

    /**
     * @param shortItem the shortItem to set
     */
    public void setShortItem(Double shortItem) {
        this.shortItem = shortItem;
    }

    /**
     * @return the shortQty
     */
    public Double getShortQty() {
        return shortQty;
    }

    /**
     * @param shortQty the shortQty to set
     */
    public void setShortQty(Double shortQty) {
        this.shortQty = shortQty;
    }

    /**
     * @return the shortAmt
     */
    public Double getShortAmt() {
        return shortAmt;
    }

    /**
     * @param shortAmt the shortAmt to set
     */
    public void setShortAmt(Double shortAmt) {
        this.shortAmt = shortAmt;
    }

    /**
     * @return the rowno
     */
    public int getRowno() {
        return rowno;
    }

    /**
     * @param rowno the rowno to set
     */
    public void setRowno(int rowno) {
        this.rowno = rowno;
    }

    /**
     * @return the stockQty
     */
    public double getStockQty() {
        return stockQty;
    }

    /**
     * @param stockQty the stockQty to set
     */
    public void setStockQty(double stockQty) {
        this.stockQty = stockQty;
    }

    /**
     * @return the stockPrice
     */
    public double getStockPrice() {
        return stockPrice;
    }

    /**
     * @param stockPrice the stockPrice to set
     */
    public void setStockPrice(double stockPrice) {
        this.stockPrice = stockPrice;
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
     * @return the prsnNm
     */
    public String getPrsnNm() {
        return prsnNm;
    }

    /**
     * @param prsnNm the prsnNm to set
     */
    public void setPrsnNm(String prsnNm) {
        this.prsnNm = prsnNm;
    }

    /**
     * @return the approvePrsnId
     */
    public String getApprovePrsnId() {
        return approvePrsnId;
    }

    /**
     * @param approvePrsnId the approvePrsnId to set
     */
    public void setApprovePrsnId(String approvePrsnId) {
        this.approvePrsnId = approvePrsnId;
    }

    /**
     * @return the approvePrsnNm
     */
    public String getApprovePrsnNm() {
        return approvePrsnNm;
    }

    /**
     * @param approvePrsnNm the approvePrsnNm to set
     */
    public void setApprovePrsnNm(String approvePrsnNm) {
        this.approvePrsnNm = approvePrsnNm;
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

}
