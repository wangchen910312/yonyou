package chn.bhmc.dms.sal.orc.vo;

import java.util.Date;
import java.util.List;

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
 * @ClassName   : SumOrderCntVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Jin Suk Kim
 * @since 2016. 3. 14.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 14.     Jin Suk Kim     최초 생성
 * </pre>
 */

@ValidDescriptor({
    @ValidField(field="dlrCd"               , mesgKey="sal.lbl.dlrCd")
   ,@ValidField(field="ordTp"               , mesgKey="sal.lbl.ordTp")
   })
public class SumOrderCntVO extends AbstractExcelDataBinder{
    /**
     * @return the saleRgstId
     */
    public String getSaleRgstId() {
        return saleRgstId;
    }

    /**
     * @param saleRgstId the saleRgstId to set
     */
    public void setSaleRgstId(String saleRgstId) {
        this.saleRgstId = saleRgstId;
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
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 6526587570939759458L;

    /**
     * 딜러코드
     **/
    private  String               dlrCd;

    /**
     * 오더년월일자
     **/

    private  String               ordYyMmDt;

    /**
     * 오더기간
     **/
    private  String               ordPrid;

    /**
     * 오더년월
     **/

    private  String               yyMm;

    /**
     * 오더주차
     **/
    private  String               week;

    /**
     * 오더상태코드
     **/
    private  String               ordStatCd;

    /**
     * 주문등급
     */
    private  String               ordGradeCd;

    /**
     * 차종코드
     **/
    private  String               carlineCd;

    /**
     * 차종명
     **/
    private  String               carlineNm;

    /**
     * 모델코드
     **/
    private  String               modelCd;

    /**
     * 모델코드
     **/
    private  String               modelNm;

    /**
     * OCN코드
     **/
    private  String               ocnCd;

    /**
     * OCN명
     **/
    private  String               ocnNm;

    /**
     * 외장색상코드
     **/
    private  String               extColorCd;

    /**
     * 외장색상명
     **/
    private  String               extColorNm;

    /**
     * 내장색상코드
     **/
    private  String               intColorCd;

    /**
     * 내장색상명
     **/
    private  String               intColorNm;

    /**
     * 오더유형
     **/
    private  String               ordTp;

    /**
     * 오더수량
     **/
    private  int                  ordQty;

    /**
     * 1차확정수량
     **/
    private  int                  fstConfirmQty;

    /**
     * 2차확정수량
     **/
    private  int                  scndConfirmQty;

    /**
     * 취소수량합
     */
    private  int                  cnclQty;

    /**
     * 취소사유
     */
    private  String               cnclRsn;

    /**
     * 미배정수량합
     */
    private  int                  nOrdQty;

    /**
     * PDI수량합
     */
    private  int                  pdiQty;

    /**
     * VIN배정수량합
     */
    private  int                  vinQty;

    /**
     * 딜러판매수량합
     */
    private  int                  dlrSaleQty;

    /**
     * 오더번호
     **/
    private  String               ordNo;

    /**
     * 최종통과수량
     */
    private  int                  finalQty;

    /**
     * 승인대기수량
     */
    private  int                  wtOrdQty;

    /**
     * 승인후취소수량
     */
    private  int                  dlrCnclQty;

    /**
     * 미배정수량
     */
    private  int                  nonAlocQty;

    /**
     * 공장출고수량
     */
    private  int                  gateOutQty;

    /**
     * 조회토탈건수
     */
    private  int                  srchTotCnt;

    /**
     * 미통과수량
     */
    private  int                  scndParIsffAdjQty;

    /**
     * 딜러입고수량
     */
    private  int                  dlrInQty;

    /**
     * 딜러출고수량
     */
    private  int                  dlrOutQty;


    /**
     * 최종확인수량
     */
    private  int                  finalConfQty;

    private String  saleRgstId;


    /**
     * 주문유형 (한글 이름)
     */
    private  String ordTpNm;


    /**
     * @return the finalConfQty
     */
    public int getFinalConfQty() {
        return finalConfQty;
    }

    /**
     * @param finalConfQty the finalConfQty to set
     */
    public void setFinalConfQty(int finalConfQty) {
        this.finalConfQty = finalConfQty;
    }

    /**
     * 심사평가월
     **/
    private  String               emont;

    private  Double               dcRate;

    private  Double               mdpr;
    private  Double               damt;
    private  Double               dcAmt;
    private  Double               aamt;
    private  int                  sumTotalQty;

    private  int                  MissSetQty; //임무배정수량
    private  int                  tranMissQty;//배송임무배정수량
    private String ordSeq;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date ordDate;
    private String chrgCd;
    private String vinmVloc;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date pdiDt;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date retailDt;
    private String vinNo;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date vinDt;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date fndlDt;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date dlrGrDt;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date custSaleDt;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date ordDt;
    private String ordDtChar;
    private String ordLst;
    private String misSetDt;
    private String tranSetDt;
    private String ordDateXls;
    private String pdiDtXls;
    private String vinDtXls;
    private String retailDtXls;
    private String dlrGrDtXls;
    private String custSaleDtXls;
    private String fndlDtXls;
    private String mdprXls;
    private String dcRateXls;
    private String damtXls;
    private String dcAmtXls;
    private String misSetDtXls;
    private String tranSetDtXls;




    /**
     * @return the ordTpNm
     */
    public String getOrdTpNm() {
        return ordTpNm;
    }

    /**
     * @param ordTpNm the ordTpNm to set
     */
    public void setOrdTpNm(String ordTpNm) {
        this.ordTpNm = ordTpNm;
    }

    /**
     * @return the ordDtChar
     */
    public String getOrdDtChar() {
        return ordDtChar;
    }

    /**
     * @param ordDtChar the ordDtChar to set
     */
    public void setOrdDtChar(String ordDtChar) {
        this.ordDtChar = ordDtChar;
    }

    /**
     * @return the misSetDtXls
     */
    public String getMisSetDtXls() {
        return misSetDtXls;
    }

    /**
     * @param misSetDtXls the misSetDtXls to set
     */
    public void setMisSetDtXls(String misSetDtXls) {
        this.misSetDtXls = misSetDtXls;
    }

    /**
     * @return the tranSetDtXls
     */
    public String getTranSetDtXls() {
        return tranSetDtXls;
    }

    /**
     * @param tranSetDtXls the tranSetDtXls to set
     */
    public void setTranSetDtXls(String tranSetDtXls) {
        this.tranSetDtXls = tranSetDtXls;
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
     * @return the ordYyMmDt
     */
    public String getOrdYyMmDt() {
        return ordYyMmDt;
    }

    /**
     * @param ordYyMmDt the ordYyMmDt to set
     */
    public void setOrdYyMmDt(String ordYyMmDt) {
        this.ordYyMmDt = ordYyMmDt;
    }

    /**
     * @return the ordPrid
     */
    public String getOrdPrid() {
        return ordPrid;
    }

    /**
     * @param ordPrid the ordPrid to set
     */
    public void setOrdPrid(String ordPrid) {
        this.ordPrid = ordPrid;
    }

    /**
     * @return the yyMm
     */
    public String getYyMm() {
        return yyMm;
    }

    /**
     * @param yyMm the yyMm to set
     */
    public void setYyMm(String yyMm) {
        this.yyMm = yyMm;
    }

    /**
     * @return the week
     */
    public String getWeek() {
        return week;
    }

    /**
     * @param week the week to set
     */
    public void setWeek(String week) {
        this.week = week;
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
     * @return the ordGradeCd
     */
    public String getOrdGradeCd() {
        return ordGradeCd;
    }

    /**
     * @param ordGradeCd the ordGradeCd to set
     */
    public void setOrdGradeCd(String ordGradeCd) {
        this.ordGradeCd = ordGradeCd;
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
     * @return the ordTp
     */
    public String getOrdTp() {
        return ordTp;
    }

    /**
     * @param ordTp the ordTp to set
     */
    public void setOrdTp(String ordTp) {
        this.ordTp = ordTp;
    }

    /**
     * @return the ordQty
     */
    public int getOrdQty() {
        return ordQty;
    }

    /**
     * @param ordQty the ordQty to set
     */
    public void setOrdQty(int ordQty) {
        this.ordQty = ordQty;
    }

    /**
     * @return the fstConfirmQty
     */
    public int getFstConfirmQty() {
        return fstConfirmQty;
    }

    /**
     * @param fstConfirmQty the fstConfirmQty to set
     */
    public void setFstConfirmQty(int fstConfirmQty) {
        this.fstConfirmQty = fstConfirmQty;
    }

    /**
     * @return the scndConfirmQty
     */
    public int getScndConfirmQty() {
        return scndConfirmQty;
    }

    /**
     * @param scndConfirmQty the scndConfirmQty to set
     */
    public void setScndConfirmQty(int scndConfirmQty) {
        this.scndConfirmQty = scndConfirmQty;
    }

    /**
     * @return the cnclQty
     */
    public int getCnclQty() {
        return cnclQty;
    }

    /**
     * @param cnclQty the cnclQty to set
     */
    public void setCnclQty(int cnclQty) {
        this.cnclQty = cnclQty;
    }

    /**
     * @return the cnclRsn
     */
    public String getCnclRsn() {
        return cnclRsn;
    }

    /**
     * @param cnclRsn the cnclRsn to set
     */
    public void setCnclRsn(String cnclRsn) {
        this.cnclRsn = cnclRsn;
    }

    /**
     * @return the nOrdQty
     */
    public int getnOrdQty() {
        return nOrdQty;
    }

    /**
     * @param nOrdQty the nOrdQty to set
     */
    public void setnOrdQty(int nOrdQty) {
        this.nOrdQty = nOrdQty;
    }

    /**
     * @return the pdiQty
     */
    public int getPdiQty() {
        return pdiQty;
    }

    /**
     * @param pdiQty the pdiQty to set
     */
    public void setPdiQty(int pdiQty) {
        this.pdiQty = pdiQty;
    }

    /**
     * @return the vinQty
     */
    public int getVinQty() {
        return vinQty;
    }

    /**
     * @param vinQty the vinQty to set
     */
    public void setVinQty(int vinQty) {
        this.vinQty = vinQty;
    }

    /**
     * @return the dlrSaleQty
     */
    public int getDlrSaleQty() {
        return dlrSaleQty;
    }

    /**
     * @param dlrSaleQty the dlrSaleQty to set
     */
    public void setDlrSaleQty(int dlrSaleQty) {
        this.dlrSaleQty = dlrSaleQty;
    }

    /**
     * @return the ordNo
     */
    public String getOrdNo() {
        return ordNo;
    }

    /**
     * @param ordNo the ordNo to set
     */
    public void setOrdNo(String ordNo) {
        this.ordNo = ordNo;
    }

    /**
     * @return the finalQty
     */
    public int getFinalQty() {
        return finalQty;
    }

    /**
     * @param finalQty the finalQty to set
     */
    public void setFinalQty(int finalQty) {
        this.finalQty = finalQty;
    }

    /**
     * @return the wtOrdQty
     */
    public int getWtOrdQty() {
        return wtOrdQty;
    }

    /**
     * @param wtOrdQty the wtOrdQty to set
     */
    public void setWtOrdQty(int wtOrdQty) {
        this.wtOrdQty = wtOrdQty;
    }

    /**
     * @return the dlrCnclQty
     */
    public int getDlrCnclQty() {
        return dlrCnclQty;
    }

    /**
     * @param dlrCnclQty the dlrCnclQty to set
     */
    public void setDlrCnclQty(int dlrCnclQty) {
        this.dlrCnclQty = dlrCnclQty;
    }

    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }

    /**
     * @return the srchTotCnt
     */
    public int getSrchTotCnt() {
        return srchTotCnt;
    }

    /**
     * @param srchTotCnt the srchTotCnt to set
     */
    public void setSrchTotCnt(int srchTotCnt) {
        this.srchTotCnt = srchTotCnt;
    }

    /**
     * @return the nonAlocQty
     */
    public int getNonAlocQty() {
        return nonAlocQty;
    }

    /**
     * @param nonAlocQty the nonAlocQty to set
     */
    public void setNonAlocQty(int nonAlocQty) {
        this.nonAlocQty = nonAlocQty;
    }

    /**
     * @return the gateOutQty
     */
    public int getGateOutQty() {
        return gateOutQty;
    }

    /**
     * @param gateOutQty the gateOutQty to set
     */
    public void setGateOutQty(int gateOutQty) {
        this.gateOutQty = gateOutQty;
    }

    /**
     * @return the scndParIsffAdjQty
     */
    public int getScndParIsffAdjQty() {
        return scndParIsffAdjQty;
    }

    /**
     * @param scndParIsffAdjQty the scndParIsffAdjQty to set
     */
    public void setScndParIsffAdjQty(int scndParIsffAdjQty) {
        this.scndParIsffAdjQty = scndParIsffAdjQty;
    }

    /**
     * @return the ordSeq
     */
    public String getOrdSeq() {
        return ordSeq;
    }

    /**
     * @param ordSeq the ordSeq to set
     */
    public void setOrdSeq(String ordSeq) {
        this.ordSeq = ordSeq;
    }

    /**
     * @return the dlrInQty
     */
    public int getDlrInQty() {
        return dlrInQty;
    }

    /**
     * @param dlrInQty the dlrInQty to set
     */
    public void setDlrInQty(int dlrInQty) {
        this.dlrInQty = dlrInQty;
    }

    /**
     * @return the dlrOutQty
     */
    public int getDlrOutQty() {
        return dlrOutQty;
    }

    /**
     * @param dlrOutQty the dlrOutQty to set
     */
    public void setDlrOutQty(int dlrOutQty) {
        this.dlrOutQty = dlrOutQty;
    }

    /**
     * @return the ordDate
     */
    public Date getOrdDate() {
        return ordDate;
    }

    /**
     * @param ordDate the ordDate to set
     */
    public void setOrdDate(Date ordDate) {
        this.ordDate = ordDate;
    }

    /**
     * @return the chrgCd
     */
    public String getChrgCd() {
        return chrgCd;
    }

    /**
     * @param chrgCd the chrgCd to set
     */
    public void setChrgCd(String chrgCd) {
        this.chrgCd = chrgCd;
    }

    /**
     * @return the vinmVloc
     */
    public String getVinmVloc() {
        return vinmVloc;
    }

    /**
     * @param vinmVloc the vinmVloc to set
     */
    public void setVinmVloc(String vinmVloc) {
        this.vinmVloc = vinmVloc;
    }

    /**
     * @return the pdiDt
     */
    public Date getPdiDt() {
        return pdiDt;
    }

    /**
     * @param pdiDt the pdiDt to set
     */
    public void setPdiDt(Date pdiDt) {
        this.pdiDt = pdiDt;
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
     * @return the vinDt
     */
    public Date getVinDt() {
        return vinDt;
    }

    /**
     * @param vinDt the vinDt to set
     */
    public void setVinDt(Date vinDt) {
        this.vinDt = vinDt;
    }

    /**
     * @return the fndlDt
     */
    public Date getFndlDt() {
        return fndlDt;
    }

    /**
     * @param fndlDt the fndlDt to set
     */
    public void setFndlDt(Date fndlDt) {
        this.fndlDt = fndlDt;
    }

    /**
     * @return the dlrGrDt
     */
    public Date getDlrGrDt() {
        return dlrGrDt;
    }

    /**
     * @param dlrGrDt the dlrGrDt to set
     */
    public void setDlrGrDt(Date dlrGrDt) {
        this.dlrGrDt = dlrGrDt;
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
     * @return the ordLst
     */
    public String getOrdLst() {
        return ordLst;
    }

    /**
     * @param ordLst the ordLst to set
     */
    public void setOrdLst(String ordLst) {
        this.ordLst = ordLst;
    }

    @Override
    public void bind(int rowNo, int cellNo, Object value) throws ExcelDataBindingException {
        try{
            switch(cellNo){
                case 0:this.setCarlineNm(ExcelDataBinderUtil.toString(value).trim()); break;
                case 1:this.setModelNm(ExcelDataBinderUtil.toString(value).trim()); break;
                case 2:this.setOcnNm(ExcelDataBinderUtil.toString(value).trim()); break;
                case 3:this.setExtColorNm(ExcelDataBinderUtil.toString(value).trim()); break;
                case 4:this.setIntColorNm(ExcelDataBinderUtil.toString(value).trim()); break;
                case 5:this.setOrdQty(ExcelDataBinderUtil.getIntValue(value)); break;
                case 6:this.setOrdTp(ExcelDataBinderUtil.toString(value).trim()); break;
                case 7:this.setOrdStatCd(ExcelDataBinderUtil.toString(value).trim()); break;
                case 8:this.setOrdDateXls(ExcelDataBinderUtil.toString(value).trim()); break;
                case 9:this.setChrgCd(ExcelDataBinderUtil.toString(value).trim()); break;
                case 10:this.setOrdSeq(ExcelDataBinderUtil.toString(value).trim()); break;
                case 11:this.setVinmVloc(ExcelDataBinderUtil.toString(value).trim()); break;
                case 12:this.setEmont(ExcelDataBinderUtil.toString(value).trim()); break;
                case 13:this.setPdiDtXls(ExcelDataBinderUtil.toString(value).trim()); break;
                case 14:this.setMisSetDtXls(ExcelDataBinderUtil.toString(value).trim()); break;
                case 15:this.setTranSetDtXls(ExcelDataBinderUtil.toString(value).trim()); break;
                case 16:this.setVinDtXls(ExcelDataBinderUtil.toString(value).trim()); break;
                case 17:this.setRetailDtXls(ExcelDataBinderUtil.toString(value).trim()); break;
                case 18:this.setDlrGrDtXls(ExcelDataBinderUtil.toString(value).trim()); break;
                case 19:this.setCustSaleDtXls(ExcelDataBinderUtil.toString(value).trim()); break;
                case 20:this.setVinNo(ExcelDataBinderUtil.toString(value).trim()); break;
                case 21:this.setMdprXls(ExcelDataBinderUtil.toString(value).trim()); break;
                case 22:this.setDcRateXls(ExcelDataBinderUtil.toString(value).trim()); break;
                case 23:this.setDamtXls(ExcelDataBinderUtil.toString(value).trim()); break;
                case 24:this.setDcAmtXls(ExcelDataBinderUtil.toString(value).trim()); break;
            }
        }catch(Exception e){

            ExcelDataBindingException bindingException = new ExcelDataBindingException(messageSource.getMessage("global.err.excelUpload.dataExtract", null, LocaleContextHolder.getLocale()), e);
            bindingException.setRowNo(rowNo);
            bindingException.setColNo(cellNo);
            bindingException.setFieldValue(value.toString());

            throw bindingException;
        }
    }

    @Override
    public List<ExcelUploadError> validate(ExcelDataBindContext context) {
        return null;
    }

    /**
     * @return the retailDt
     */
    public Date getRetailDt() {
        return retailDt;
    }

    /**
     * @param retailDt the retailDt to set
     */
    public void setRetailDt(Date retailDt) {
        this.retailDt = retailDt;
    }

    /**
     * @return the ordDateXls
     */
    public String getOrdDateXls() {
        return ordDateXls;
    }

    /**
     * @return the pdiDtXls
     */
    public String getPdiDtXls() {
        return pdiDtXls;
    }

    /**
     * @return the vinDtXls
     */
    public String getVinDtXls() {
        return vinDtXls;
    }

    /**
     * @return the retailDtXls
     */
    public String getRetailDtXls() {
        return retailDtXls;
    }

    /**
     * @return the dlrGrDtXls
     */
    public String getDlrGrDtXls() {
        return dlrGrDtXls;
    }

    /**
     * @return the custSaleDtXls
     */
    public String getCustSaleDtXls() {
        return custSaleDtXls;
    }

    /**
     * @param ordDateXls the ordDateXls to set
     */
    public void setOrdDateXls(String ordDateXls) {
        this.ordDateXls = ordDateXls;
    }

    /**
     * @param pdiDtXls the pdiDtXls to set
     */
    public void setPdiDtXls(String pdiDtXls) {
        this.pdiDtXls = pdiDtXls;
    }

    /**
     * @param vinDtXls the vinDtXls to set
     */
    public void setVinDtXls(String vinDtXls) {
        this.vinDtXls = vinDtXls;
    }

    /**
     * @param retailDtXls the retailDtXls to set
     */
    public void setRetailDtXls(String retailDtXls) {
        this.retailDtXls = retailDtXls;
    }

    /**
     * @param dlrGrDtXls the dlrGrDtXls to set
     */
    public void setDlrGrDtXls(String dlrGrDtXls) {
        this.dlrGrDtXls = dlrGrDtXls;
    }

    /**
     * @param custSaleDtXls the custSaleDtXls to set
     */
    public void setCustSaleDtXls(String custSaleDtXls) {
        this.custSaleDtXls = custSaleDtXls;
    }

    /**
     * @return the fndlDtXls
     */
    public String getFndlDtXls() {
        return fndlDtXls;
    }

    /**
     * @param fndlDtXls the fndlDtXls to set
     */
    public void setFndlDtXls(String fndlDtXls) {
        this.fndlDtXls = fndlDtXls;
    }

    /**
     * @return the emont
     */
    public String getEmont() {
        return emont;
    }

    /**
     * @param emont the emont to set
     */
    public void setEmont(String emont) {
        this.emont = emont;
    }

    /**
     * @return the dcRate
     */
    public Double getDcRate() {
        return dcRate;
    }

    /**
     * @return the mdpr
     */
    public Double getMdpr() {
        return mdpr;
    }

    /**
     * @return the damt
     */
    public Double getDamt() {
        return damt;
    }

    /**
     * @param dcRate the dcRate to set
     */
    public void setDcRate(Double dcRate) {
        this.dcRate = dcRate;
    }

    /**
     * @param mdpr the mdpr to set
     */
    public void setMdpr(Double mdpr) {
        this.mdpr = mdpr;
    }

    /**
     * @param damt the damt to set
     */
    public void setDamt(Double damt) {
        this.damt = damt;
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
     * @return the mdprXls
     */
    public String getMdprXls() {
        return mdprXls;
    }

    /**
     * @return the dcRateXls
     */
    public String getDcRateXls() {
        return dcRateXls;
    }

    /**
     * @return the damtXls
     */
    public String getDamtXls() {
        return damtXls;
    }

    /**
     * @return the dcAmtXls
     */
    public String getDcAmtXls() {
        return dcAmtXls;
    }

    /**
     * @param mdprXls the mdprXls to set
     */
    public void setMdprXls(String mdprXls) {
        this.mdprXls = mdprXls;
    }

    /**
     * @param dcRateXls the dcRateXls to set
     */
    public void setDcRateXls(String dcRateXls) {
        this.dcRateXls = dcRateXls;
    }

    /**
     * @param damtXls the damtXls to set
     */
    public void setDamtXls(String damtXls) {
        this.damtXls = damtXls;
    }

    /**
     * @param dcAmtXls the dcAmtXls to set
     */
    public void setDcAmtXls(String dcAmtXls) {
        this.dcAmtXls = dcAmtXls;
    }

    /**
     * @return the sumTotalQty
     */
    public int getSumTotalQty() {
        return sumTotalQty;
    }

    /**
     * @param sumTotalQty the sumTotalQty to set
     */
    public void setSumTotalQty(int sumTotalQty) {
        this.sumTotalQty = sumTotalQty;
    }

    /**
     * @return the misSetDt
     */
    public String getMisSetDt() {
        return misSetDt;
    }

    /**
     * @return the tranSetDt
     */
    public String getTranSetDt() {
        return tranSetDt;
    }

    /**
     * @param misSetDt the misSetDt to set
     */
    public void setMisSetDt(String misSetDt) {
        this.misSetDt = misSetDt;
    }

    /**
     * @param tranSetDt the tranSetDt to set
     */
    public void setTranSetDt(String tranSetDt) {
        this.tranSetDt = tranSetDt;
    }

    /**
     * @return the aamt
     */
    public Double getAamt() {
        return aamt;
    }

    /**
     * @param aamt the aamt to set
     */
    public void setAamt(Double aamt) {
        this.aamt = aamt;
    }
    /**
     * @return the missSetQty
     */
    public int getMissSetQty() {
        return MissSetQty;
    }

    /**
     * @param missSetQty the missSetQty to set
     */
    public void setMissSetQty(int missSetQty) {
        MissSetQty = missSetQty;
    }

    /**
     * @return the tranMissQty
     */
    public int getTranMissQty() {
        return tranMissQty;
    }

    /**
     * @param tranMissQty the tranMissQty to set
     */
    public void setTranMissQty(int tranMissQty) {
        this.tranMissQty = tranMissQty;
    }

}