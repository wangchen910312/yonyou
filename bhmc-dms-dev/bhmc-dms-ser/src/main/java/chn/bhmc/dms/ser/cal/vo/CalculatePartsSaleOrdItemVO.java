package chn.bhmc.dms.ser.cal.vo;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.math.NumberUtils;
import org.springframework.context.i18n.LocaleContextHolder;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;
import chn.bhmc.dms.core.support.excel.AbstractExcelDataBinder;
import chn.bhmc.dms.core.support.excel.ExcelDataBindContext;
import chn.bhmc.dms.core.support.excel.ExcelDataBinderUtil;
import chn.bhmc.dms.core.support.excel.ExcelDataBindingException;
import chn.bhmc.dms.core.support.excel.ExcelUploadError;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : PartsSaleOrdItemVO.java
 * @Description : PartsSaleOrdItemVO.class
 * @author Ju Won Lee
 * @since 2016. 2. 3.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 3.     Ju Won Lee     최초 생성
 * </pre>
 */

@ValidDescriptor({
    @ValidField(field="dlrCd"              , mesgKey="par.lbl.dlrCd")
   ,@ValidField(field="parSaleOrdNo"       , mesgKey="par.lbl.parSaleOrdNo")
   ,@ValidField(field="parSaleOrdLineNo"   , mesgKey="par.lbl.parSaleOrdLineNo")
   ,@ValidField(field="itemStatCd"         , mesgKey="par.lbl.itemStatCd")
   ,@ValidField(field="calcTpCd"           , mesgKey="par.lbl.calcTpCd")
   ,@ValidField(field="itemCd"             , mesgKey="par.lbl.itemCd")
   ,@ValidField(field="eqipExpcDt"         , mesgKey="par.lbl.eqipExpcDt")
   ,@ValidField(field="dcRate"             , mesgKey="par.lbl.dcRate")
   ,@ValidField(field="prc"                , mesgKey="par.lbl.prc")
   ,@ValidField(field="amt"                , mesgKey="par.lbl.amt")
   ,@ValidField(field="unitCd"             , mesgKey="par.lbl.unitCd")
   ,@ValidField(field="ordQty"             , mesgKey="par.lbl.ordQty")
   ,@ValidField(field="endQty"             , mesgKey="par.lbl.endQty")
   ,@ValidField(field="regUsrId"           , mesgKey="par.lbl.regUsrId")
   ,@ValidField(field="regDt"              , mesgKey="par.lbl.regDt")
   ,@ValidField(field="updtUsrId"          , mesgKey="par.lbl.updtUsrId")
   ,@ValidField(field="updtDt"             , mesgKey="par.lbl.updtDt")
   })
public class CalculatePartsSaleOrdItemVO  extends AbstractExcelDataBinder{



        /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -6071720494896446459L;

    /**
     * 딜러코드
     **/
    private  String              dlrCd;

    /**
     * 부품판매오더번호
     **/
    private  String              parSaleOrdNo;

    /**
     * 부품반품오더번호
     **/
    private  String              returnDocNo;

    /**
     * 부품판매오더라인번호
     **/
    private  int                 parSaleOrdLineNo;

    /**
     * 오더상태코드
     **/
    //ORD_STAT_CD
    private  String            ordStatCd;

    /**
     * 오더일자
     **/
    //ORD_DT
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date              ordDt;

    /**
     * 오더시간
     **/
    //ORD_TIME
    private  String              ordTime;

    /**
     * 취소일자
     **/
    //ORD_DT
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date              cancDt;

    /**
     * 취소시간
     **/
    //CANC_TIME
    private  String              cancTime;

    /**
     * 반품일자
     **/
    //ORD_DT
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date              returnDt;

    /**
     * 반품시간
     **/
    //ORD_TIME
    private  String              returnTime;

    /**
     * 판매유형
     **/
    //SALE_TP
    private  String              saleTp;

    /**
     * 고객유형
     **/
    //CUST_TP
    private  String            custTp;


    /**
     * 고객코드
     **/
    //CUST_CD
    private  String            custCd;

    /**
     * 고객명
     **/
    //CUST_NM
    private  String            custNm;


    /**
     * SA_ID
     **/
    //SA_ID

    private  String            saId;

    /**
     * SA_NM
     **/
    //SA_NM

    private  String            saNm;

    /**
     * SAL_PRSN_ID
     **/
    //SAL_PRSN_ID

    private  String            salPrsnId;

    /**
     * SAL_PRSN_NM
     **/
    //SAL_PRSN_NM

    private  String            salPrsnNm;


    /**
     * CANC_ID
     **/
    //CANC_ID

    private  String            cancId;

    /**
     * CANC_NM
     **/
    //CANC_NM

    private  String            cancNm;

    /**
     * RETURN_ID
     **/
    //RETURN_ID

    private  String            returnId;

    /**
     * SA_NM
     **/
    //SA_NM

    private  String            returnNm;


    /**
     * 총금액
     **/
    //TOT_AMT
    private  Double            totAmt;

    /**
     * 부품비용
     **/
    //PART_COST
    private  Double            partCost;

    /**
     * 품목상태코드
     **/
    //ITEM_STAT_CD
    private  String              itemStatCd;

    /**
     * 정산유형코드
     **/
    //CALC_TP_CD
    private  String              calcTpCd;

    /**
     * 품목코드
     **/
    //ITEM_CD
    private  String              itemCd;

    /**
     * 품목명
     **/
    //ITEM_NM
    private  String              itemNm;

    /**
     * 설치예정일자
     **/
    //EQIP_EXPC_DT
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date                eqipExpcDt;

    /**
     * 할인율
     **/
    //DC_RATE
    private  Double              dcRate;

    /**
     * 단가
     **/
    //PRC
    private  Double              prc;

    /**
     * 금액
     **/
    //AMT
    private  Double              amt;

    /**
     * 할인금액
     **/
    //DC_AMT
    private  Double              dcAmt;

    /**
     * 단위코드
     **/
    //UNIT_CD
    private  String              unitCd;

    /**
     * 단가유형
     **/
    //PRC_TP
    private  String              prcTp;

    /**
     * 부품유형
     **/
    //ITEM_DSTIN_CD
    private  String              itemDstinCd;

    /**
     * 출고창고
     **/
    //GI_STRGE_CD
    private  String              giStrgeCd;

    /**
     * 출고로케이션
     **/
    //GI_LOC_CD
    private  String              giLocCd;

    /**
     * 출고로케이션
     **/
    //GI_LOC_NM
    private  String              giLocNm;

    /**
     * 로케이션
     **/
    //LOC_CD
    private  String              locCd;

    /**
     * 패키지
     **/
    //PKG_ITEM_CD
    private  String              pkgItemCd;

    /**
     * 패키지명
     **/
    //PKG_ITEM_NM
    private  String              pkgItemNm;

    /**
     * 오더수량
     **/
    //ORD_QTY
    private  Double              ordQty;

    /**
     * 취소수량
     **/
    //CANC_QTY
    private  Double              cancQty;

    /**
     * 반품수량
     **/
    //RETURN_QTY
    private  Double              returnQty;

    /**
     * 기반품수량
     **/
    //PRE_RETURN_QTY
    private  Double              preReturnQty;

    /**
     * 장면수량
     **/
    //STOCK_QTY
    private  Double              stockQty;

    /**
     * 가용수량
     **/
    //AVLB_STOCK_QTY
    private  Double              avlbStockQty;

    /**
     * 예류수량
     **/
    //RESV_STOCK_QTY
    private  Double              resvStockQty;

    /**
     * 차입수량
     **/
    //BORROW_QTY
    private  Double              borrowQty;

    /**
     * 차출수량
     **/
    //RENT_QTY
    private  Double              rentQty;

    /**
     * 종료수량
     **/
    //END_QTY
    private  Double              endQty;

    /**
     * 엑셀업로드수량
     **/
    //EXCEL_QTY
    private  String              excelQty;

    /**
     * 엑셀업로드단가
     **/
    //EXCEL_PRC
    private  String              excelPrc;

    /**
     * 엑셀업로드할인율
     **/
    //EXCEL_DC_RATE
    private  String              excelDcRate;

    /**
     * 엑셀창고
     **/
    //EXCEL_STRGE_CD
    private  String              excelStrgeCd;


    /**
     * 출고상태코드
     **/
    //GI_STAT_CD
    private  String              giStatCd;

    /**
     * 수령인ID
     **/
    //RECEIVE_ID
    private  String              receiveId;

    /**
     * 출고일자
     **/
    //GI_DT
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date                giDt;

    /**
     * 수령일자
     **/
    //RECEIVE_DT
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date                receiveDt;

    /**
     * 세금공제금액
     **/
    //TAX_DDCT_AMT
    private  Double              taxDdctAmt;

    /**
     * 세금액
     **/
    //TAX_AMT
    private  Double              taxAmt;

    /**
     * 수불문서년월
     **/
    //MVT_DOC_YY_MM
    private  String            mvtDocYyMm;

    /**
     * 수불문서번호
     **/
    //MVT_DOC_NO
    private  String            mvtDocNo;

    /**
     * 수불문서라인번호
     **/
    //MVT_DOC_LINE_NO
    private  int               mvtDocLineNo;

    /**
     * 참조문서번호
     **/
    //REF_DOC_NO
    private  String            refDocNo;

    /**
     * 참조문서라인번호
     **/
    //REF_DOC_LINE_NO
    private  int               refDocLineNo;

    /**
     * 총 품목 수
     **/
    //ITEM_CNT
    private  int                itemCnt;

    /**
     * 인왜용 부품명
     **/
    //PRINT_ITEM_NM
    private  String            printItemNm;

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
     * @return the parSaleOrdNo
     */
    public String getParSaleOrdNo() {
        return parSaleOrdNo;
    }

    /**
     * @param parSaleOrdNo the parSaleOrdNo to set
     */
    public void setParSaleOrdNo(String parSaleOrdNo) {
        this.parSaleOrdNo = parSaleOrdNo;
    }

    /**
     * @return the parSaleOrdLineNo
     */
    public int getParSaleOrdLineNo() {
        return parSaleOrdLineNo;
    }

    /**
     * @param parSaleOrdLineNo the parSaleOrdLineNo to set
     */
    public void setParSaleOrdLineNo(int parSaleOrdLineNo) {
        this.parSaleOrdLineNo = parSaleOrdLineNo;
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
     * @return the calcTpCd
     */
    public String getCalcTpCd() {
        return calcTpCd;
    }

    /**
     * @param calcTpCd the calcTpCd to set
     */
    public void setCalcTpCd(String calcTpCd) {
        this.calcTpCd = calcTpCd;
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
     * @return the eqipExpcDt
     */
    public Date getEqipExpcDt() {
        return eqipExpcDt;
    }

    /**
     * @param eqipExpcDt the eqipExpcDt to set
     */
    public void setEqipExpcDt(Date eqipExpcDt) {
        this.eqipExpcDt = eqipExpcDt;
    }

    /**
     * @return the dcRate
     */
    public Double getDcRate() {
        return dcRate;
    }

    /**
     * @param dcRate the dcRate to set
     */
    public void setDcRate(Double dcRate) {
        this.dcRate = dcRate;
    }

    /**
     * @return the prc
     */
    public Double getPrc() {
        return prc;
    }

    /**
     * @param prc the prc to set
     */
    public void setPrc(Double prc) {
        this.prc = prc;
    }

    /**
     * @return the amt
     */
    public Double getAmt() {
        return amt;
    }

    /**
     * @param amt the amt to set
     */
    public void setAmt(Double amt) {
        this.amt = amt;
    }

    /**
     * @return the partCost
     */
    public Double getPartCost() {
        return partCost;
    }

    /**
     * @param partCost the partCost to set
     */
    public void setPartCost(Double partCost) {
        this.partCost = partCost;
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
     * @return the ordQty
     */
    public Double getOrdQty() {
        return ordQty;
    }

    /**
     * @param ordQty the ordQty to set
     */
    public void setOrdQty(Double ordQty) {
        this.ordQty = ordQty;
    }

    /**
     * @return the endQty
     */
    public Double getEndQty() {
        return endQty;
    }

    /**
     * @param endQty the endQty to set
     */
    public void setEndQty(Double endQty) {
        this.endQty = endQty;
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
     * @return the ordStatCd
     */
    public String getOrdStatCd() {
        return ordStatCd;
    }

    /**
     * @param ordStatCd the ordStatCd to set
     */
    public void setOrdStatCd(String ordStatCd) {
        this.ordStatCd = ordStatCd;
    }

    /**
     * @return the ordDt
     */
    public Date getOrdDt() {
        return ordDt;
    }

    /**
     * @param ordDt the ordDt to set
     */
    public void setOrdDt(Date ordDt) {
        this.ordDt = ordDt;
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
     * @return the saleTp
     */
    public String getSaleTp() {
        return saleTp;
    }

    /**
     * @param saleTp the saleTp to set
     */
    public void setSaleTp(String saleTp) {
        this.saleTp = saleTp;
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
     * @return the custCd
     */
    public String getCustCd() {
        return custCd;
    }

    /**
     * @param custCd the custCd to set
     */
    public void setCustCd(String custCd) {
        this.custCd = custCd;
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
     * @return the saId
     */
    public String getSaId() {
        return saId;
    }

    /**
     * @param saId the saId to set
     */
    public void setSaId(String saId) {
        this.saId = saId;
    }

    /**
     * @return the saNm
     */
    public String getSaNm() {
        return saNm;
    }

    /**
     * @param saNm the saNm to set
     */
    public void setSaNm(String saNm) {
        this.saNm = saNm;
    }

    /**
     * @return the salPrsnId
     */
    public String getSalPrsnId() {
        return salPrsnId;
    }

    /**
     * @param salPrsnId the salPrsnId to set
     */
    public void setSalPrsnId(String salPrsnId) {
        this.salPrsnId = salPrsnId;
    }

    /**
     * @return the salPrsnNm
     */
    public String getSalPrsnNm() {
        return salPrsnNm;
    }

    /**
     * @param salPrsnNm the salPrsnNm to set
     */
    public void setSalPrsnNm(String salPrsnNm) {
        this.salPrsnNm = salPrsnNm;
    }

    /**
     * @return the cancId
     */
    public String getCancId() {
        return cancId;
    }

    /**
     * @param cancId the cancId to set
     */
    public void setCancId(String cancId) {
        this.cancId = cancId;
    }

    /**
     * @return the cancNm
     */
    public String getCancNm() {
        return cancNm;
    }

    /**
     * @param cancNm the cancNm to set
     */
    public void setCancNm(String cancNm) {
        this.cancNm = cancNm;
    }

    /**
     * @return the returnId
     */
    public String getReturnId() {
        return returnId;
    }

    /**
     * @param returnId the returnId to set
     */
    public void setReturnId(String returnId) {
        this.returnId = returnId;
    }

    /**
     * @return the returnNm
     */
    public String getReturnNm() {
        return returnNm;
    }

    /**
     * @param returnNm the returnNm to set
     */
    public void setReturnNm(String returnNm) {
        this.returnNm = returnNm;
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
     * @return the giStatCd
     */
    public String getGiStatCd() {
        return giStatCd;
    }

    /**
     * @param giStatCd the giStatCd to set
     */
    public void setGiStatCd(String giStatCd) {
        this.giStatCd = giStatCd;
    }

    /**
     * @return the receiveId
     */
    public String getReceiveId() {
        return receiveId;
    }

    /**
     * @param receiveId the receiveId to set
     */
    public void setReceiveId(String receiveId) {
        this.receiveId = receiveId;
    }

    /**
     * @return the giDt
     */
    public Date getGiDt() {
        return giDt;
    }

    /**
     * @param giDt the giDt to set
     */
    public void setGiDt(Date giDt) {
        this.giDt = giDt;
    }

    /**
     * @return the receiveDt
     */
    public Date getReceiveDt() {
        return receiveDt;
    }

    /**
     * @param receiveDt the receiveDt to set
     */
    public void setReceiveDt(Date receiveDt) {
        this.receiveDt = receiveDt;
    }

    /**
     * @return the taxDdctAmt
     */
    public Double getTaxDdctAmt() {
        return taxDdctAmt;
    }

    /**
     * @param taxDdctAmt the taxDdctAmt to set
     */
    public void setTaxDdctAmt(Double taxDdctAmt) {
        this.taxDdctAmt = taxDdctAmt;
    }

    /**
     * @return the taxAmt
     */
    public Double getTaxAmt() {
        return taxAmt;
    }

    /**
     * @param taxAmt the taxAmt to set
     */
    public void setTaxAmt(Double taxAmt) {
        this.taxAmt = taxAmt;
    }

    /**
     * @return the dcAmt
     */
    public Double getDcAmt() {
        return dcAmt;
    }

    /**
     * @param dcAmt the dcAmt to set
     */
    public void setDcAmt(Double dcAmt) {
        this.dcAmt = dcAmt;
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
     * @return the giLocCd
     */
    public String getGiLocCd() {
        return giLocCd;
    }

    /**
     * @param giLocCd the giLocCd to set
     */
    public void setGiLocCd(String giLocCd) {
        this.giLocCd = giLocCd;
    }

    /**
     * @return the giLocNm
     */
    public String getGiLocNm() {
        return giLocNm;
    }

    /**
     * @param giLocNm the giLocNm to set
     */
    public void setGiLocNm(String giLocNm) {
        this.giLocNm = giLocNm;
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
     * @return the ordTime
     */
    public String getOrdTime() {
        return ordTime;
    }

    /**
     * @param ordTime the ordTime to set
     */
    public void setOrdTime(String ordTime) {
        this.ordTime = ordTime;
    }

    /**
     * @return the cancTime
     */
    public String getCancTime() {
        return cancTime;
    }

    /**
     * @param cancTime the cancTime to set
     */
    public void setCancTime(String cancTime) {
        this.cancTime = cancTime;
    }

    /**
     * @return the returnTime
     */
    public String getReturnTime() {
        return returnTime;
    }

    /**
     * @param returnTime the returnTime to set
     */
    public void setReturnTime(String returnTime) {
        this.returnTime = returnTime;
    }

    /**
     * @return the cancQty
     */
    public Double getCancQty() {
        return cancQty;
    }

    /**
     * @param cancQty the cancQty to set
     */
    public void setCancQty(Double cancQty) {
        this.cancQty = cancQty;
    }

    /**
     * @return the returnQty
     */
    public Double getReturnQty() {
        return returnQty;
    }

    /**
     * @param returnQty the returnQty to set
     */
    public void setReturnQty(Double returnQty) {
        this.returnQty = returnQty;
    }

    /**
     * @return the preReturnQty
     */
    public Double getPreReturnQty() {
        return preReturnQty;
    }

    /**
     * @param preReturnQty the preReturnQty to set
     */
    public void setPreReturnQty(Double preReturnQty) {
        this.preReturnQty = preReturnQty;
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
     * @return the itemCnt
     */
    public int getItemCnt() {
        return itemCnt;
    }

    /**
     * @param itemCnt the itemCnt to set
     */
    public void setItemCnt(int itemCnt) {
        this.itemCnt = itemCnt;
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
     * @return the printItemNm
     */
    public String getPrintItemNm() {
        return printItemNm;
    }

    /**
     * @param printItemNm the printItemNm to set
     */
    public void setPrintItemNm(String printItemNm) {
        this.printItemNm = printItemNm;
    }



    /**
     * @return the pkgItemNm
     */
    public String getPkgItemNm() {
        return pkgItemNm;
    }

    /**
     * @param pkgItemNm the pkgItemNm to set
     */
    public void setPkgItemNm(String pkgItemNm) {
        this.pkgItemNm = pkgItemNm;
    }

    /**
     * @return the excelQty
     */
    public String getExcelQty() {
        return excelQty;
    }

    /**
     * @param excelQty the excelQty to set
     */
    public void setExcelQty(String excelQty) {
        this.excelQty = excelQty;
    }

    /**
     * @return the excelPrc
     */
    public String getExcelPrc() {
        return excelPrc;
    }

    /**
     * @param excelPrc the excelPrc to set
     */
    public void setExcelPrc(String excelPrc) {
        this.excelPrc = excelPrc;
    }

    /**
     * @return the excelDcRate
     */
    public String getExcelDcRate() {
        return excelDcRate;
    }

    /**
     * @param excelDcRate the excelDcRate to set
     */
    public void setExcelDcRate(String excelDcRate) {
        this.excelDcRate = excelDcRate;
    }

    /**
     * @return the excelStrgeCd
     */
    public String getExcelStrgeCd() {
        return excelStrgeCd;
    }

    /**
     * @param excelStrgeCd the excelStrgeCd to set
     */
    public void setExcelStrgeCd(String excelStrgeCd) {
        this.excelStrgeCd = excelStrgeCd;
    }

    /**
     * {@inheritDoc}
     */
    public void bind(int rowNo, int cellNo, Object value) throws ExcelDataBindingException {
        try{
            switch(cellNo){
                case 0:this.setItemCd(ExcelDataBinderUtil.toString(value).trim()); break;   //부품번호
                case 1:this.setExcelQty(ExcelDataBinderUtil.toString(value).trim()); break;     //판매수량
                case 2:this.setExcelPrc(ExcelDataBinderUtil.toString(value).trim()); break;     //판매단가
                case 3:this.setExcelDcRate(ExcelDataBinderUtil.toString(value).trim()); break;     //판매할인율
                case 4:this.setExcelStrgeCd(ExcelDataBinderUtil.toString(value).trim()); break;     //판매창고
            }
        }catch(Exception e){

            ExcelDataBindingException bindingException = new ExcelDataBindingException(messageSource.getMessage("global.err.excelUpload.dataExtract", null, LocaleContextHolder.getLocale()), e);
            bindingException.setRowNo(rowNo);
            bindingException.setColNo(cellNo);
            bindingException.setFieldValue(value.toString());

            throw bindingException;
        }
    }

    /**
     * {@inheritDoc}
     */
    public List<ExcelUploadError> validate(ExcelDataBindContext context) {

        List<ExcelUploadError> errors = new ArrayList<ExcelUploadError>();

        if(!(StringUtils.isBlank(this.getItemCd()) && StringUtils.isBlank(this.getExcelQty()) && StringUtils.isBlank(this.getExcelPrc())&& StringUtils.isBlank(this.getExcelDcRate()))){
            //부품번호
            if(StringUtils.isBlank(this.getItemCd())){

                String msg = messageSource.getMessage(
                    "global.info.required.field"
                    , new String[]{
                            messageSource.getMessage("par.lbl.itemCd", null, LocaleContextHolder.getLocale())
                    }
                    , LocaleContextHolder.getLocale()
                );

                errors.add(new ExcelUploadError(context.getRow(), 0, this.getItemCd(), msg));
            }


            if(StringUtils.isBlank(this.getExcelQty())){
                String msg = messageSource.getMessage(
                        "global.info.emptyParamInfo"
                        , new String[]{
                                messageSource.getMessage("par.lbl.partsSaleQty", null, LocaleContextHolder.getLocale())
                        }
                        , LocaleContextHolder.getLocale()
                    );

                    errors.add(new ExcelUploadError(context.getRow(), 1, String.valueOf(this.getExcelQty()), msg));
            }else{

                //판매수량
                if(NumberUtils.isNumber(this.getExcelQty())){
                    if(NumberUtils.toDouble(this.getExcelQty()) <= 0){
                        String msg = messageSource.getMessage(
                            "par.info.itemReqZeroCntMsg"
                            , new String[]{
                                    messageSource.getMessage("par.lbl.partsSaleQty", null, LocaleContextHolder.getLocale())
                                   ,"0"
                            }
                            , LocaleContextHolder.getLocale()
                        );

                        errors.add(new ExcelUploadError(context.getRow(), 1, String.valueOf(this.getExcelQty()), msg));
                    }
                }else{
                    String msg = messageSource.getMessage(
                            "global.err.checkQtyParam"
                            , new String[]{
                                    messageSource.getMessage("par.lbl.partsSaleQty", null, LocaleContextHolder.getLocale())
                            }
                            , LocaleContextHolder.getLocale()
                        );

                        errors.add(new ExcelUploadError(context.getRow(), 1, String.valueOf(this.getExcelQty()), msg));
                }
            }

            if(!StringUtils.isBlank(this.getExcelPrc())){

                //판매단가
                if(NumberUtils.isNumber(this.getExcelPrc())){
                    if(NumberUtils.toDouble(this.getExcelPrc()) <= 0){
                        String msg = messageSource.getMessage(
                                "par.info.itemReqZeroCntMsg"
                                , new String[]{
                                        messageSource.getMessage("par.lbl.partsSalePrc", null, LocaleContextHolder.getLocale())
                                        ,"0"
                                }
                                , LocaleContextHolder.getLocale()
                        );

                        errors.add(new ExcelUploadError(context.getRow(), 1, String.valueOf(this.getExcelPrc()), msg));
                    }
                }else{
                    String msg = messageSource.getMessage(
                            "global.err.checkQtyParam"
                            , new String[]{
                                    messageSource.getMessage("par.lbl.partsSalePrc", null, LocaleContextHolder.getLocale())
                            }
                            , LocaleContextHolder.getLocale()
                    );

                    errors.add(new ExcelUploadError(context.getRow(), 1, String.valueOf(this.getExcelPrc()), msg));
                }
            }

            if(!StringUtils.isBlank(this.getExcelDcRate())){
                //할인율
                if(NumberUtils.isNumber(this.getExcelDcRate())){
                    if(NumberUtils.toDouble(this.getExcelDcRate()) < 0){
                        String msg = messageSource.getMessage(
                                "par.info.itemReqZeroCntMsg"
                                , new String[]{
                                        messageSource.getMessage("par.lbl.cstDcRate", null, LocaleContextHolder.getLocale())
                                        ,"0"
                                }
                                , LocaleContextHolder.getLocale()
                        );

                        errors.add(new ExcelUploadError(context.getRow(), 1, String.valueOf(this.getExcelDcRate()), msg));
                    }
                }else{
                    String msg = messageSource.getMessage(
                            "global.err.checkQtyParam"
                            , new String[]{
                                    messageSource.getMessage("par.lbl.cstDcRate", null, LocaleContextHolder.getLocale())
                            }
                            , LocaleContextHolder.getLocale()
                    );

                    errors.add(new ExcelUploadError(context.getRow(), 1, String.valueOf(this.getExcelDcRate()), msg));
                }
            }
        }

        return errors;


    }



}
