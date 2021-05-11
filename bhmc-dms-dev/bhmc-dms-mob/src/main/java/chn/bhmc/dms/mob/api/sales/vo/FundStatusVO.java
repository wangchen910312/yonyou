package chn.bhmc.dms.mob.api.sales.vo;

import java.util.List;

import org.springframework.context.i18n.LocaleContextHolder;

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
 * @ClassName   : FundStatusVO
 * @Description : 자금현황 조회 VO
 * @author Kim Jin Suk
 * @since 2016. 8. 22.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author           description
 *  ===========    =============    ===========================
 *  2016. 8. 22.    Kim Jin Suk        최초 생성
 * </pre>
 */

public class FundStatusVO extends AbstractExcelDataBinder{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 5955861179820053324L;

    private String dlrCd;               // 딜러코드
    private String yy;                  // 년도
    private String mm;                  // 월
    private String dd;                  // 일
    private String yyMmDd;              // 년월일

    private double cashAmt;             // 현금
    private double prt2Amt;             // 이방자금
    private double prt3Amt;             // 삼방자금
    private double prcChgAmt;           // 조정금
    private double incnAmt;             // 인센티브

    private double cashDpstAmt;         // 입금 - 현금
    private double prt2DpstAmt;         // 입금 - 이방자금
    private double prt3DpstAmt;         // 입금 - 삼방자금
    private double prcChgDpsAmt;        // 입금 - 조정금
    private double incnDpsAmt;          // 입금 - 인센티브
    private double totDpstAmt;          // 입금 - 합계

    private double wdrwCashAmt;         // 출금 - 현금
    private double wdrwPrt2Amt;         // 출금 - 이방자금
    private double wdrwPrt3Amt;         // 출금 - 삼방자금
    private double wdrwAmt;             // 출금 - 합계
    private double wdrwCnclAmt;         // 출금 - 취소

    private double cashBalAmt;          // 잔액 - 현금
    private double prt2BalAmt;          // 잔액 - 이방자금
    private double prt3BalAmt;          // 잔액 - 삼방자금
    private double totBalAmt;           // 잔액 - 합계

    private double bfCashBalAmt;        // 전잔액 - 현금
    private double bfPrt2BalAmt;        // 전잔액 - 이방자금
    private double bfPrt3BalAmt;        // 전잔액 - 삼방자금
    private double bfTotBalAmt;         // 전잔액 - 합계
    private double bfPrcChgAmt;         // 조정금
    private double bfIncnAmt;           // 인센티브

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
     * @return the yy
     */
    public String getYy() {
        return yy;
    }

    /**
     * @param yy the yy to set
     */
    public void setYy(String yy) {
        this.yy = yy;
    }

    /**
     * @return the mm
     */
    public String getMm() {
        return mm;
    }

    /**
     * @param mm the mm to set
     */
    public void setMm(String mm) {
        this.mm = mm;
    }

    /**
     * @return the dd
     */
    public String getDd() {
        return dd;
    }

    /**
     * @param dd the dd to set
     */
    public void setDd(String dd) {
        this.dd = dd;
    }

    /**
     * @return the yyMmDd
     */
    public String getYyMmDd() {
        return yyMmDd;
    }

    /**
     * @param yyMmDd the yyMmDd to set
     */
    public void setYyMmDd(String yyMmDd) {
        this.yyMmDd = yyMmDd;
    }

    /**
     * @return the cashAmt
     */
    public double getCashAmt() {
        return cashAmt;
    }

    /**
     * @param cashAmt the cashAmt to set
     */
    public void setCashAmt(double cashAmt) {
        this.cashAmt = cashAmt;
    }

    /**
     * @return the prt2Amt
     */
    public double getPrt2Amt() {
        return prt2Amt;
    }

    /**
     * @param prt2Amt the prt2Amt to set
     */
    public void setPrt2Amt(double prt2Amt) {
        this.prt2Amt = prt2Amt;
    }

    /**
     * @return the prt3Amt
     */
    public double getPrt3Amt() {
        return prt3Amt;
    }

    /**
     * @param prt3Amt the prt3Amt to set
     */
    public void setPrt3Amt(double prt3Amt) {
        this.prt3Amt = prt3Amt;
    }

    /**
     * @return the prcChgAmt
     */
    public double getPrcChgAmt() {
        return prcChgAmt;
    }

    /**
     * @param prcChgAmt the prcChgAmt to set
     */
    public void setPrcChgAmt(double prcChgAmt) {
        this.prcChgAmt = prcChgAmt;
    }

    /**
     * @return the incnAmt
     */
    public double getIncnAmt() {
        return incnAmt;
    }

    /**
     * @param incnAmt the incnAmt to set
     */
    public void setIncnAmt(double incnAmt) {
        this.incnAmt = incnAmt;
    }

    /**
     * @return the cashDpstAmt
     */
    public double getCashDpstAmt() {
        return cashDpstAmt;
    }

    /**
     * @param cashDpstAmt the cashDpstAmt to set
     */
    public void setCashDpstAmt(double cashDpstAmt) {
        this.cashDpstAmt = cashDpstAmt;
    }

    /**
     * @return the prt2DpstAmt
     */
    public double getPrt2DpstAmt() {
        return prt2DpstAmt;
    }

    /**
     * @param prt2DpstAmt the prt2DpstAmt to set
     */
    public void setPrt2DpstAmt(double prt2DpstAmt) {
        this.prt2DpstAmt = prt2DpstAmt;
    }

    /**
     * @return the prt3DpstAmt
     */
    public double getPrt3DpstAmt() {
        return prt3DpstAmt;
    }

    /**
     * @param prt3DpstAmt the prt3DpstAmt to set
     */
    public void setPrt3DpstAmt(double prt3DpstAmt) {
        this.prt3DpstAmt = prt3DpstAmt;
    }

    /**
     * @return the totDpstAmt
     */
    public double getTotDpstAmt() {
        return totDpstAmt;
    }

    /**
     * @param totDpstAmt the totDpstAmt to set
     */
    public void setTotDpstAmt(double totDpstAmt) {
        this.totDpstAmt = totDpstAmt;
    }

    /**
     * @return the wdrwCashAmt
     */
    public double getWdrwCashAmt() {
        return wdrwCashAmt;
    }

    /**
     * @param wdrwCashAmt the wdrwCashAmt to set
     */
    public void setWdrwCashAmt(double wdrwCashAmt) {
        this.wdrwCashAmt = wdrwCashAmt;
    }

    /**
     * @return the wdrwPrt2Amt
     */
    public double getWdrwPrt2Amt() {
        return wdrwPrt2Amt;
    }

    /**
     * @param wdrwPrt2Amt the wdrwPrt2Amt to set
     */
    public void setWdrwPrt2Amt(double wdrwPrt2Amt) {
        this.wdrwPrt2Amt = wdrwPrt2Amt;
    }

    /**
     * @return the wdrwPrt3Amt
     */
    public double getWdrwPrt3Amt() {
        return wdrwPrt3Amt;
    }

    /**
     * @param wdrwPrt3Amt the wdrwPrt3Amt to set
     */
    public void setWdrwPrt3Amt(double wdrwPrt3Amt) {
        this.wdrwPrt3Amt = wdrwPrt3Amt;
    }

    /**
     * @return the wdrwAmt
     */
    public double getWdrwAmt() {
        return wdrwAmt;
    }

    /**
     * @param wdrwAmt the wdrwAmt to set
     */
    public void setWdrwAmt(double wdrwAmt) {
        this.wdrwAmt = wdrwAmt;
    }

    /**
     * @return the cashBalAmt
     */
    public double getCashBalAmt() {
        return cashBalAmt;
    }

    /**
     * @param cashBalAmt the cashBalAmt to set
     */
    public void setCashBalAmt(double cashBalAmt) {
        this.cashBalAmt = cashBalAmt;
    }

    /**
     * @return the prt2BalAmt
     */
    public double getPrt2BalAmt() {
        return prt2BalAmt;
    }

    /**
     * @param prt2BalAmt the prt2BalAmt to set
     */
    public void setPrt2BalAmt(double prt2BalAmt) {
        this.prt2BalAmt = prt2BalAmt;
    }

    /**
     * @return the prt3BalAmt
     */
    public double getPrt3BalAmt() {
        return prt3BalAmt;
    }

    /**
     * @param prt3BalAmt the prt3BalAmt to set
     */
    public void setPrt3BalAmt(double prt3BalAmt) {
        this.prt3BalAmt = prt3BalAmt;
    }

    /**
     * @return the totBalAmt
     */
    public double getTotBalAmt() {
        return totBalAmt;
    }

    /**
     * @param totBalAmt the totBalAmt to set
     */
    public void setTotBalAmt(double totBalAmt) {
        this.totBalAmt = totBalAmt;
    }

    /**
     * {@inheritDoc}
     */
    public void bind(int rowNo, int cellNo, Object value) throws ExcelDataBindingException {
        try{
            switch(cellNo){
                case 0:this.setDlrCd(ExcelDataBinderUtil.toString(value).trim()); break;      //딜러코드
                case 1:this.setYyMmDd(ExcelDataBinderUtil.toString(value).trim()); break;     //년월일
                case 2:this.setCashAmt(  ExcelDataBinderUtil.getDoubleValue(value)); break;   //현금
                case 3:this.setPrt2Amt(ExcelDataBinderUtil.getDoubleValue(value)); break;     //이방자금
                case 4:this.setPrt3Amt(ExcelDataBinderUtil.getDoubleValue(value)); break;     //삼방자금
                case 5:this.setPrcChgAmt(ExcelDataBinderUtil.getDoubleValue(value)); break;   //조정금
                case 6:this.setIncnAmt(ExcelDataBinderUtil.getDoubleValue(value)); break;     //인센티브
                case 7:this.setCashDpstAmt(ExcelDataBinderUtil.getDoubleValue(value)); break;     //입금합계 - 현금
                case 8:this.setPrt2DpstAmt(ExcelDataBinderUtil.getDoubleValue(value)); break;     //입금합계 - 이방자금
                case 9:this.setPrt3DpstAmt(ExcelDataBinderUtil.getDoubleValue(value)); break;     //입금합계 - 삼방자금
                case 10:this.setTotDpstAmt(ExcelDataBinderUtil.getDoubleValue(value)); break;     //입금합계 - 합계
                case 11:this.setWdrwCashAmt(ExcelDataBinderUtil.getDoubleValue(value)); break;     //출금합계 - 현금
                case 12:this.setWdrwPrt2Amt(ExcelDataBinderUtil.getDoubleValue(value)); break;     //출금합계 - 이방자금
                case 13:this.setWdrwPrt3Amt(ExcelDataBinderUtil.getDoubleValue(value)); break;     //출금합계 - 삼방자금
                case 14:this.setWdrwAmt(ExcelDataBinderUtil.getDoubleValue(value)); break;         //출금합계 - 합계
                case 15:this.setCashBalAmt(ExcelDataBinderUtil.getDoubleValue(value)); break;     //잔액 - 현금
                case 16:this.setPrt2BalAmt(ExcelDataBinderUtil.getDoubleValue(value)); break;     //잔액 - 이방자금
                case 17:this.setPrt3BalAmt(ExcelDataBinderUtil.getDoubleValue(value)); break;     //잔액 - 삼방자금
                case 18:this.setTotBalAmt(ExcelDataBinderUtil.getDoubleValue(value)); break;      //잔액 - 합계
                case 19:this.setBfCashBalAmt(ExcelDataBinderUtil.getDoubleValue(value)); break;     //전잔액 - 현금
                case 20:this.setBfPrt2BalAmt(ExcelDataBinderUtil.getDoubleValue(value)); break;     //전잔액 - 이방자금
                case 21:this.setBfPrt3BalAmt(ExcelDataBinderUtil.getDoubleValue(value)); break;     //전잔액 - 삼방자금
                case 22:this.setBfTotBalAmt(ExcelDataBinderUtil.getDoubleValue(value)); break;      //전잔액 - 합계
                default :
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

    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }

    /**
     * @return the bfCashBalAmt
     */
    public double getBfCashBalAmt() {
        return bfCashBalAmt;
    }

    /**
     * @param bfCashBalAmt the bfCashBalAmt to set
     */
    public void setBfCashBalAmt(double bfCashBalAmt) {
        this.bfCashBalAmt = bfCashBalAmt;
    }

    /**
     * @return the bfPrt2BalAmt
     */
    public double getBfPrt2BalAmt() {
        return bfPrt2BalAmt;
    }

    /**
     * @param bfPrt2BalAmt the bfPrt2BalAmt to set
     */
    public void setBfPrt2BalAmt(double bfPrt2BalAmt) {
        this.bfPrt2BalAmt = bfPrt2BalAmt;
    }

    /**
     * @return the bfPrt3BalAmt
     */
    public double getBfPrt3BalAmt() {
        return bfPrt3BalAmt;
    }

    /**
     * @param bfPrt3BalAmt the bfPrt3BalAmt to set
     */
    public void setBfPrt3BalAmt(double bfPrt3BalAmt) {
        this.bfPrt3BalAmt = bfPrt3BalAmt;
    }

    /**
     * @return the bfTotBalAmt
     */
    public double getBfTotBalAmt() {
        return bfTotBalAmt;
    }

    /**
     * @param bfTotBalAmt the bfTotBalAmt to set
     */
    public void setBfTotBalAmt(double bfTotBalAmt) {
        this.bfTotBalAmt = bfTotBalAmt;
    }

    /**
     * @return the bfPrcChgAmt
     */
    public double getBfPrcChgAmt() {
        return bfPrcChgAmt;
    }

    /**
     * @param bfPrcChgAmt the bfPrcChgAmt to set
     */
    public void setBfPrcChgAmt(double bfPrcChgAmt) {
        this.bfPrcChgAmt = bfPrcChgAmt;
    }

    /**
     * @return the bfIncnAmt
     */
    public double getBfIncnAmt() {
        return bfIncnAmt;
    }

    /**
     * @param bfIncnAmt the bfIncnAmt to set
     */
    public void setBfIncnAmt(double bfIncnAmt) {
        this.bfIncnAmt = bfIncnAmt;
    }

    /**
     * @return the prcChgDpsAmt
     */
    public double getPrcChgDpsAmt() {
        return prcChgDpsAmt;
    }

    /**
     * @param prcChgDpsAmt the prcChgDpsAmt to set
     */
    public void setPrcChgDpsAmt(double prcChgDpsAmt) {
        this.prcChgDpsAmt = prcChgDpsAmt;
    }

    /**
     * @return the incnDpsAmt
     */
    public double getIncnDpsAmt() {
        return incnDpsAmt;
    }

    /**
     * @param incnDpsAmt the incnDpsAmt to set
     */
    public void setIncnDpsAmt(double incnDpsAmt) {
        this.incnDpsAmt = incnDpsAmt;
    }

    /**
     * @return the wdrwCnclAmt
     */
    public double getWdrwCnclAmt() {
        return wdrwCnclAmt;
    }

    /**
     * @param wdrwCnclAmt the wdrwCnclAmt to set
     */
    public void setWdrwCnclAmt(double wdrwCnclAmt) {
        this.wdrwCnclAmt = wdrwCnclAmt;
    }

}
