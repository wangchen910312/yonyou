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


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : NotAssignedOrderVO.java
 * @Description : 미배정 주문조회 grid VO
 * @author Bong
 * @since 2016. 3. 10.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 10.       Bong                최초 생성
 * </pre>
 */

public class NotAssignedOrderVO extends AbstractExcelDataBinder{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -8161903449158550263L;

    private String ordpCndy;            // 주문일자
    private String salesNo;             // 주문번호
    private String sord;                // 주문유형

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date  ordDt;               // 주문일자

    private String carlineCd;           // 차종코드
    private String carlineNm;           // 차종명
    private String modelCd;             // 모델코드
    private String modelNm;             // 모델명
    private String ocnCd;               // ocn 코드
    private String ocnNm;               // ocn 명
    private String extColorCd;          // 외장색 코드
    private String extColorNm;          // 외장색명
    private String intColorCd;          // 내장색 코드
    private String intColorNm;          // 내장색 명
    private String chrgCd;              // 주문자
    private String ordpExno;            // 납기예시일
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date  askDt;              // 주문취소 신청일자
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date askDtFormat;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date ordDtFormat;

    private String inno;                // 납기예시일

    private double mdpr;                // DC전 가격
    private double aftMdpr;             // DC후 가격
    private double adjp;                // 할인금액
    private double ordpVapr;            // 필요자금
    private int ordpCount;              // 오더수량
    private int needsAmt;
    private String paym;                //담보유형

    private String saleRgstUsr;         // 판매고문
    private String dlrCd;
    private double whPrc;               // 도매가격
    private double cashAmt;             // 현금공제금액
    private double d2prtAmt;            // 2방공제금액
    private double d3prtAmt;            // 3방공제금액

    private double aamt;            // 영수증금액
    private double damt;            // 할인금액
    private double dcRate;            // 할인율

    private String ordYymmS;
    private String ordWeek;
    private String ordType;

    private String saleRgstId;      //판매인id
    private String saleRgstNm;      //판매인명

    private double orty;

    /**
     * 미배정 주문조회 합
     */
    private double aamtSum;     // 영수증금액 합
    private double ortySum;     // 오더수량
    private double mdprSum;     // 시장지도가
    private double damtSum;     // 할인금액
    private String ordDtXls;
    private String ordpExnoXls;
    private String ordRgstId;
    private String ordTpNm;

    private String ordYyMm;           // 오더년월
    private String ordGradeCd;        // 오더등급
    private double ordSeq;            // 주문일련번호
    private String adjStatCd;         // 주문상태
    private String seq;



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
     * @return the ordRgstId
     */
    public String getOrdRgstId() {
        return ordRgstId;
    }
    /**
     * @param ordRgstId the ordRgstId to set
     */
    public void setOrdRgstId(String ordRgstId) {
        this.ordRgstId = ordRgstId;
    }
    /**
     * @return the ordDtXls
     */
    public String getOrdDtXls() {
        return ordDtXls;
    }
    /**
     * @param ordDtXls the ordDtXls to set
     */
    public void setOrdDtXls(String ordDtXls) {
        this.ordDtXls = ordDtXls;
    }
    /**
     * @return the ordpExnoXls
     */
    public String getOrdpExnoXls() {
        return ordpExnoXls;
    }
    /**
     * @param ordpExnoXls the ordpExnoXls to set
     */
    public void setOrdpExnoXls(String ordpExnoXls) {
        this.ordpExnoXls = ordpExnoXls;
    }
    /**
     * @return the ordpCndy
     */
    public String getOrdpCndy() {
        return ordpCndy;
    }
    /**
     * @param ordpCndy the ordpCndy to set
     */
    public void setOrdpCndy(String ordpCndy) {
        this.ordpCndy = ordpCndy;
    }

    /**
     * @return the salesNo
     */
    public String getSalesNo() {
        return salesNo;
    }
    /**
     * @param salesNo the salesNo to set
     */
    public void setSalesNo(String salesNo) {
        this.salesNo = salesNo;
    }
    /**
     * @return the sord
     */
    public String getSord() {
        return sord;
    }
    /**
     * @param sord the sord to set
     */
    public void setSord(String sord) {
        this.sord = sord;
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
     * @return the ordpExno
     */
    public String getOrdpExno() {
        return ordpExno;
    }
    /**
     * @param ordpExno the ordpExno to set
     */
    public void setOrdpExno(String ordpExno) {
        this.ordpExno = ordpExno;
    }
    /**
     * @return the askDt
     */
    public Date getAskDt() {
        return askDt;
    }
    /**
     * @param askDt the askDt to set
     */
    public void setAskDt(Date askDt) {
        this.askDt = askDt;
    }
    /**
     * @return the askDtFormat
     */
    public Date getAskDtFormat() {
        return askDtFormat;
    }
    /**
     * @param askDtFormat the askDtFormat to set
     */
    public void setAskDtFormat(Date askDtFormat) {
        this.askDtFormat = askDtFormat;
    }
    /**
     * @return the ordDtFormat
     */
    public Date getOrdDtFormat() {
        return ordDtFormat;
    }
    /**
     * @param ordDtFormat the ordDtFormat to set
     */
    public void setOrdDtFormat(Date ordDtFormat) {
        this.ordDtFormat = ordDtFormat;
    }
    /**
     * @return the mdpr
     */
    public double getMdpr() {
        return mdpr;
    }
    /**
     * @param mdpr the mdpr to set
     */
    public void setMdpr(double mdpr) {
        this.mdpr = mdpr;
    }

    /**
     * @return the aftMdpr
     */
    public double getAftMdpr() {
        return aftMdpr;
    }
    /**
     * @param aftMdpr the aftMdpr to set
     */
    public void setAftMdpr(double aftMdpr) {
        this.aftMdpr = aftMdpr;
    }
    /**
     * @return the adjp
     */
    public double getAdjp() {
        return adjp;
    }
    /**
     * @param adjp the adjp to set
     */
    public void setAdjp(double adjp) {
        this.adjp = adjp;
    }
    /**
     * @return the ordpVapr
     */
    public double getOrdpVapr() {
        return ordpVapr;
    }
    /**
     * @param ordpVapr the ordpVapr to set
     */
    public void setOrdpVapr(double ordpVapr) {
        this.ordpVapr = ordpVapr;
    }
    /**
     * @return the ordpCount
     */
    public int getOrdpCount() {
        return ordpCount;
    }
    /**
     * @param ordpCount the ordpCount to set
     */
    public void setOrdpCount(int ordpCount) {
        this.ordpCount = ordpCount;
    }
    /**
     * @return the inno
     */
    public String getInno() {
        return inno;
    }
    /**
     * @param inno the inno to set
     */
    public void setInno(String inno) {
        this.inno = inno;
    }
    /**
     * @return the needsAmt
     */
    public int getNeedsAmt() {
        return needsAmt;
    }
    /**
     * @param needsAmt the needsAmt to set
     */
    public void setNeedsAmt(int needsAmt) {
        this.needsAmt = needsAmt;
    }
    /**
     * @return the saleRgstUsr
     */
    public String getSaleRgstUsr() {
        return saleRgstUsr;
    }
    /**
     * @param saleRgstUsr the saleRgstUsr to set
     */
    public void setSaleRgstUsr(String saleRgstUsr) {
        this.saleRgstUsr = saleRgstUsr;
    }
    /**
     * @return the paym
     */
    public String getPaym() {
        return paym;
    }
    /**
     * @param paym the paym to set
     */
    public void setPaym(String paym) {
        this.paym = paym;
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
     * @return the cashAmt
     */
    public double getCashAmt() {
        return cashAmt;
    }
    /**
     * @return the d2prtAmt
     */
    public double getD2prtAmt() {
        return d2prtAmt;
    }
    /**
     * @return the d3prtAmt
     */
    public double getD3prtAmt() {
        return d3prtAmt;
    }
    /**
     * @param cashAmt the cashAmt to set
     */
    public void setCashAmt(double cashAmt) {
        this.cashAmt = cashAmt;
    }
    /**
     * @param d2prtAmt the d2prtAmt to set
     */
    public void setD2prtAmt(double d2prtAmt) {
        this.d2prtAmt = d2prtAmt;
    }
    /**
     * @param d3prtAmt the d3prtAmt to set
     */
    public void setD3prtAmt(double d3prtAmt) {
        this.d3prtAmt = d3prtAmt;
    }
    /**
     * @return the whPrc
     */
    public double getWhPrc() {
        return whPrc;
    }
    /**
     * @param whPrc the whPrc to set
     */
    public void setWhPrc(double whPrc) {
        this.whPrc = whPrc;
    }
    /**
     * @return the aamt
     */
    public double getAamt() {
        return aamt;
    }
    /**
     * @return the damt
     */
    public double getDamt() {
        return damt;
    }
    /**
     * @param aamt the aamt to set
     */
    public void setAamt(double aamt) {
        this.aamt = aamt;
    }
    /**
     * @param damt the damt to set
     */
    public void setDamt(double damt) {
        this.damt = damt;
    }
    /**
     * @return the ordWeek
     */
    public String getOrdWeek() {
        return ordWeek;
    }
    /**
     * @return the ordType
     */
    public String getOrdType() {
        return ordType;
    }
    /**
     * @param ordWeek the ordWeek to set
     */
    public void setOrdWeek(String ordWeek) {
        this.ordWeek = ordWeek;
    }
    /**
     * @param ordType the ordType to set
     */
    public void setOrdType(String ordType) {
        this.ordType = ordType;
    }
    /**
     * @return the ordYymmS
     */
    public String getOrdYymmS() {
        return ordYymmS;
    }
    /**
     * @param ordYymmS the ordYymmS to set
     */
    public void setOrdYymmS(String ordYymmS) {
        this.ordYymmS = ordYymmS;
    }
    /**
     * @return the orty
     */
    public double getOrty() {
        return orty;
    }
    /**
     * @param orty the orty to set
     */
    public void setOrty(double orty) {
        this.orty = orty;
    }
    /**
     * @return the aamtSum
     */
    public double getAamtSum() {
        return aamtSum;
    }
    /**
     * @param aamtSum the aamtSum to set
     */
    public void setAamtSum(double aamtSum) {
        this.aamtSum = aamtSum;
    }
    /**
     * @return the ortySum
     */
    public double getOrtySum() {
        return ortySum;
    }
    /**
     * @param ortySum the ortySum to set
     */
    public void setOrtySum(double ortySum) {
        this.ortySum = ortySum;
    }
    /**
     * @return the mdprSum
     */
    public double getMdprSum() {
        return mdprSum;
    }
    /**
     * @param mdprSum the mdprSum to set
     */
    public void setMdprSum(double mdprSum) {
        this.mdprSum = mdprSum;
    }
    /**
     * @return the damtSum
     */
    public double getDamtSum() {
        return damtSum;
    }
    /**
     * @param damtSum the damtSum to set
     */
    public void setDamtSum(double damtSum) {
        this.damtSum = damtSum;
    }
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
     * @return the saleRgstNm
     */
    public String getSaleRgstNm() {
        return saleRgstNm;
    }
    /**
     * @param saleRgstNm the saleRgstNm to set
     */
    public void setSaleRgstNm(String saleRgstNm) {
        this.saleRgstNm = saleRgstNm;
    }
    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
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
     * @return the ordYyMm
     */
    public String getOrdYyMm() {
        return ordYyMm;
    }
    /**
     * @param ordYyMm the ordYyMm to set
     */
    public void setOrdYyMm(String ordYyMm) {
        this.ordYyMm = ordYyMm;
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
     * @return the ordSeq
     */
    public double getOrdSeq() {
        return ordSeq;
    }
    /**
     * @param ordSeq the ordSeq to set
     */
    public void setOrdSeq(double ordSeq) {
        this.ordSeq = ordSeq;
    }
    /**
     * @return the adjStatCd
     */
    public String getAdjStatCd() {
        return adjStatCd;
    }
    /**
     * @param adjStatCd the adjStatCd to set
     */
    public void setAdjStatCd(String adjStatCd) {
        this.adjStatCd = adjStatCd;
    }
    /**
     * @return the seq
     */
    public String getSeq() {
        return seq;
    }
    /**
     * @param seq the seq to set
     */
    public void setSeq(String seq) {
        this.seq = seq;
    }
    @Override
    public void bind(int rowNo, int cellNo, Object value) throws ExcelDataBindingException {
        try{
            switch(cellNo){
                case 0:this.setOrdDtXls(ExcelDataBinderUtil.toString(value).trim()); break;
                case 1:this.setSalesNo(ExcelDataBinderUtil.toString(value).trim()); break;
                case 2:this.setDlrCd(ExcelDataBinderUtil.toString(value).trim()); break;
                case 3:this.setCarlineCd(ExcelDataBinderUtil.toString(value).trim()); break;
                case 4:this.setCarlineNm(ExcelDataBinderUtil.toString(value).trim()); break;
                case 5:this.setModelNm(ExcelDataBinderUtil.toString(value).trim()); break;
                case 6:this.setOcnCd(ExcelDataBinderUtil.toString(value).trim()); break;
                case 7:this.setOcnNm(ExcelDataBinderUtil.toString(value).trim()); break;
                case 8:this.setExtColorCd(ExcelDataBinderUtil.toString(value).trim()); break;
                case 9:this.setExtColorNm(ExcelDataBinderUtil.toString(value).trim()); break;
                case 10:this.setIntColorCd(ExcelDataBinderUtil.toString(value).trim()); break;
                case 11:this.setOrdpExnoXls(ExcelDataBinderUtil.toString(value).trim()); break;
                case 12:this.setChrgCd(ExcelDataBinderUtil.toString(value).trim()); break;
                case 13:this.setSaleRgstId(ExcelDataBinderUtil.toString(value).trim()); break;
                case 14:this.setMdpr(ExcelDataBinderUtil.getDoubleValue(value)); break;
                case 15:this.setDamt(ExcelDataBinderUtil.getDoubleValue(value)); break;
                case 16:this.setAamt(ExcelDataBinderUtil.getDoubleValue(value)); break;
                case 17:this.setPaym(ExcelDataBinderUtil.toString(value).trim()); break;

            }
        }catch(Exception e){

            ExcelDataBindingException bindingException = new ExcelDataBindingException(messageSource.getMessage("global.err.excelUpload.dataExtract", null, LocaleContextHolder.getLocale()), e);
            bindingException.setRowNo(rowNo);
            bindingException.setColNo(cellNo);
            bindingException.setFieldValue(value.toString());

            throw bindingException;
        }
    }
    /*
     * @see chn.bhmc.dms.core.support.excel.ExcelDataBinder#validate(chn.bhmc.dms.core.support.excel.ExcelDataBindContext)
     */
    @Override
    public List<ExcelUploadError> validate(ExcelDataBindContext context) {
        // TODO Auto-generated method stub
        return null;
    }

}