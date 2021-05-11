package chn.bhmc.dms.mis.tds.vo;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.context.i18n.LocaleContextHolder;

import chn.bhmc.dms.core.support.excel.AbstractExcelDataBinder;
import chn.bhmc.dms.core.support.excel.ExcelDataBindContext;
import chn.bhmc.dms.core.support.excel.ExcelDataBinderUtil;
import chn.bhmc.dms.core.support.excel.ExcelDataBindingException;
import chn.bhmc.dms.core.support.excel.ExcelUploadError;

/**
 * <pre>
 * 목표 분해 공구
 * </pre>
 *
 * @ClassName   : TargetDcptStepVO.java
 * @Description : 목표 분해 공구
 * @author chibeom.song
 * @since 2016. 9. 20.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 9. 20.   chibeom.song     최초 생성
 * </pre>
 */

public class TargetDcptStepVO extends AbstractExcelDataBinder {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 2924692645434750515L;

    private int rnum;
    private String goalYy;
    private String goalMm;
    private String carlineCd;
    private String carlineNm;
    private String carlineConfig;
    private String regUsrId;
    private String updtUsrId;

    private String sMonitorSaleDate;

    private String empNo;
    private String goalPrefVal;

    private String productProfitVal;
    private String settingProfitVal;
    private String carProfitVal;
    private String allProfitVal;
    private String goalProfitPrefVal;

    private String custGoalYy;
    private String custGoalMm;
    private String nameGubn;
    private String nameChannel;

    private String custGubnCarlineCd;
    private String custGubnCarlineNm;
    private String custGubnValue;

    private String custUpdtUsrId;
    private String custRegUsrId;
    private String custGubnVal;
    private String custChannelVal;

    private String saleGoalYy;
    private String saleGoalMm;
    private String carDcptEmpNo;
    private String carDcptEmpNm;
    private String carDcptCarlineCd;
    private String carDcptCarlineNm;
    private String carDcptGoalPrefVal;

    private String saleUpdtUsrId;
    private String saleRegUsrId;

    private String dealerGoalYy;
    private String dealerGoalMm;

    private String dlrCd;


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
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }

    /**
     * @return the rnum
     */
    public int getRnum() {
        return rnum;
    }

    /**
     * @param rnum the rnum to set
     */
    public void setRnum(int rnum) {
        this.rnum = rnum;
    }

    /**
     * @return the goalYy
     */
    public String getGoalYy() {
        return goalYy;
    }

    /**
     * @param goalYy the goalYy to set
     */
    public void setGoalYy(String goalYy) {
        this.goalYy = goalYy;
    }

    /**
     * @return the goalMm
     */
    public String getGoalMm() {
        return goalMm;
    }

    /**
     * @param goalMm the goalMm to set
     */
    public void setGoalMm(String goalMm) {
        this.goalMm = goalMm;
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
     * @return the carlineConfig
     */
    public String getCarlineConfig() {
        return carlineConfig;
    }

    /**
     * @param carlineConfig the carlineConfig to set
     */
    public void setCarlineConfig(String carlineConfig) {
        this.carlineConfig = carlineConfig;
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
     * @return the sMonitorSaleDate
     */
    public String getsMonitorSaleDate() {
        return sMonitorSaleDate;
    }

    /**
     * @param sMonitorSaleDate the sMonitorSaleDate to set
     */
    public void setsMonitorSaleDate(String sMonitorSaleDate) {
        this.sMonitorSaleDate = sMonitorSaleDate;
    }

    /**
     * @return the empNo
     */
    public String getEmpNo() {
        return empNo;
    }

    /**
     * @param empNo the empNo to set
     */
    public void setEmpNo(String empNo) {
        this.empNo = empNo;
    }

    /**
     * @return the goalPrefVal
     */
    public String getGoalPrefVal() {
        return goalPrefVal;
    }

    /**
     * @param goalPrefVal the goalPrefVal to set
     */
    public void setGoalPrefVal(String goalPrefVal) {
        this.goalPrefVal = goalPrefVal;
    }

    /**
     * @return the productProfitVal
     */
    public String getProductProfitVal() {
        return productProfitVal;
    }

    /**
     * @param productProfitVal the productProfitVal to set
     */
    public void setProductProfitVal(String productProfitVal) {
        this.productProfitVal = productProfitVal;
    }

    /**
     * @return the settingProfitVal
     */
    public String getSettingProfitVal() {
        return settingProfitVal;
    }

    /**
     * @param settingProfitVal the settingProfitVal to set
     */
    public void setSettingProfitVal(String settingProfitVal) {
        this.settingProfitVal = settingProfitVal;
    }

    /**
     * @return the carProfitVal
     */
    public String getCarProfitVal() {
        return carProfitVal;
    }

    /**
     * @param carProfitVal the carProfitVal to set
     */
    public void setCarProfitVal(String carProfitVal) {
        this.carProfitVal = carProfitVal;
    }

    /**
     * @return the allProfitVal
     */
    public String getAllProfitVal() {
        return allProfitVal;
    }

    /**
     * @param allProfitVal the allProfitVal to set
     */
    public void setAllProfitVal(String allProfitVal) {
        this.allProfitVal = allProfitVal;
    }

    /**
     * @return the goalProfitPrefVal
     */
    public String getGoalProfitPrefVal() {
        return goalProfitPrefVal;
    }

    /**
     * @param goalProfitPrefVal the goalProfitPrefVal to set
     */
    public void setGoalProfitPrefVal(String goalProfitPrefVal) {
        this.goalProfitPrefVal = goalProfitPrefVal;
    }

    /**
     * @return the custGoalYy
     */
    public String getCustGoalYy() {
        return custGoalYy;
    }

    /**
     * @param custGoalYy the custGoalYy to set
     */
    public void setCustGoalYy(String custGoalYy) {
        this.custGoalYy = custGoalYy;
    }

    /**
     * @return the custGoalMm
     */
    public String getCustGoalMm() {
        return custGoalMm;
    }

    /**
     * @param custGoalMm the custGoalMm to set
     */
    public void setCustGoalMm(String custGoalMm) {
        this.custGoalMm = custGoalMm;
    }

    /**
     * @return the nameGubn
     */
    public String getNameGubn() {
        return nameGubn;
    }

    /**
     * @param nameGubn the nameGubn to set
     */
    public void setNameGubn(String nameGubn) {
        this.nameGubn = nameGubn;
    }

    /**
     * @return the nameChannel
     */
    public String getNameChannel() {
        return nameChannel;
    }

    /**
     * @param nameChannel the nameChannel to set
     */
    public void setNameChannel(String nameChannel) {
        this.nameChannel = nameChannel;
    }

    /**
     * @return the custGubnCarlineCd
     */
    public String getCustGubnCarlineCd() {
        return custGubnCarlineCd;
    }

    /**
     * @param custGubnCarlineCd the custGubnCarlineCd to set
     */
    public void setCustGubnCarlineCd(String custGubnCarlineCd) {
        this.custGubnCarlineCd = custGubnCarlineCd;
    }

    /**
     * @return the custGubnCarlineNm
     */
    public String getCustGubnCarlineNm() {
        return custGubnCarlineNm;
    }

    /**
     * @param custGubnCarlineNm the custGubnCarlineNm to set
     */
    public void setCustGubnCarlineNm(String custGubnCarlineNm) {
        this.custGubnCarlineNm = custGubnCarlineNm;
    }

    /**
     * @return the custGubnValue
     */
    public String getCustGubnValue() {
        return custGubnValue;
    }

    /**
     * @param custGubnValue the custGubnValue to set
     */
    public void setCustGubnValue(String custGubnValue) {
        this.custGubnValue = custGubnValue;
    }

    /**
     * @return the custUpdtUsrId
     */
    public String getCustUpdtUsrId() {
        return custUpdtUsrId;
    }

    /**
     * @param custUpdtUsrId the custUpdtUsrId to set
     */
    public void setCustUpdtUsrId(String custUpdtUsrId) {
        this.custUpdtUsrId = custUpdtUsrId;
    }

    /**
     * @return the custRegUsrId
     */
    public String getCustRegUsrId() {
        return custRegUsrId;
    }

    /**
     * @param custRegUsrId the custRegUsrId to set
     */
    public void setCustRegUsrId(String custRegUsrId) {
        this.custRegUsrId = custRegUsrId;
    }

    /**
     * @return the custGubnVal
     */
    public String getCustGubnVal() {
        return custGubnVal;
    }

    /**
     * @param custGubnVal the custGubnVal to set
     */
    public void setCustGubnVal(String custGubnVal) {
        this.custGubnVal = custGubnVal;
    }

    /**
     * @return the custChannelVal
     */
    public String getCustChannelVal() {
        return custChannelVal;
    }

    /**
     * @param custChannelVal the custChannelVal to set
     */
    public void setCustChannelVal(String custChannelVal) {
        this.custChannelVal = custChannelVal;
    }

    /**
     * @return the saleGoalYy
     */
    public String getSaleGoalYy() {
        return saleGoalYy;
    }

    /**
     * @param saleGoalYy the saleGoalYy to set
     */
    public void setSaleGoalYy(String saleGoalYy) {
        this.saleGoalYy = saleGoalYy;
    }

    /**
     * @return the saleGoalMm
     */
    public String getSaleGoalMm() {
        return saleGoalMm;
    }

    /**
     * @param saleGoalMm the saleGoalMm to set
     */
    public void setSaleGoalMm(String saleGoalMm) {
        this.saleGoalMm = saleGoalMm;
    }

    /**
     * @return the carDcptEmpNo
     */
    public String getCarDcptEmpNo() {
        return carDcptEmpNo;
    }

    /**
     * @param carDcptEmpNo the carDcptEmpNo to set
     */
    public void setCarDcptEmpNo(String carDcptEmpNo) {
        this.carDcptEmpNo = carDcptEmpNo;
    }

    /**
     * @return the carDcptEmpNm
     */
    public String getCarDcptEmpNm() {
        return carDcptEmpNm;
    }

    /**
     * @param carDcptEmpNm the carDcptEmpNm to set
     */
    public void setCarDcptEmpNm(String carDcptEmpNm) {
        this.carDcptEmpNm = carDcptEmpNm;
    }

    /**
     * @return the carDcptCarlineCd
     */
    public String getCarDcptCarlineCd() {
        return carDcptCarlineCd;
    }

    /**
     * @param carDcptCarlineCd the carDcptCarlineCd to set
     */
    public void setCarDcptCarlineCd(String carDcptCarlineCd) {
        this.carDcptCarlineCd = carDcptCarlineCd;
    }

    /**
     * @return the carDcptCarlineNm
     */
    public String getCarDcptCarlineNm() {
        return carDcptCarlineNm;
    }

    /**
     * @param carDcptCarlineNm the carDcptCarlineNm to set
     */
    public void setCarDcptCarlineNm(String carDcptCarlineNm) {
        this.carDcptCarlineNm = carDcptCarlineNm;
    }

    /**
     * @return the carDcptGoalPrefVal
     */
    public String getCarDcptGoalPrefVal() {
        return carDcptGoalPrefVal;
    }

    /**
     * @param carDcptGoalPrefVal the carDcptGoalPrefVal to set
     */
    public void setCarDcptGoalPrefVal(String carDcptGoalPrefVal) {
        this.carDcptGoalPrefVal = carDcptGoalPrefVal;
    }

    /**
     * @return the saleUpdtUsrId
     */
    public String getSaleUpdtUsrId() {
        return saleUpdtUsrId;
    }

    /**
     * @param saleUpdtUsrId the saleUpdtUsrId to set
     */
    public void setSaleUpdtUsrId(String saleUpdtUsrId) {
        this.saleUpdtUsrId = saleUpdtUsrId;
    }

    /**
     * @return the saleRegUsrId
     */
    public String getSaleRegUsrId() {
        return saleRegUsrId;
    }

    /**
     * @param saleRegUsrId the saleRegUsrId to set
     */
    public void setSaleRegUsrId(String saleRegUsrId) {
        this.saleRegUsrId = saleRegUsrId;
    }

    /**
     * @return the dealerGoalYy
     */
    public String getDealerGoalYy() {
        return dealerGoalYy;
    }

    /**
     * @param dealerGoalYy the dealerGoalYy to set
     */
    public void setDealerGoalYy(String dealerGoalYy) {
        this.dealerGoalYy = dealerGoalYy;
    }

    /**
     * @return the dealerGoalMm
     */
    public String getDealerGoalMm() {
        return dealerGoalMm;
    }

    /**
     * @param dealerGoalMm the dealerGoalMm to set
     */
    public void setDealerGoalMm(String dealerGoalMm) {
        this.dealerGoalMm = dealerGoalMm;
    }

    /**
     * {@inheritDoc}
     */
    public void bind(int rowNo, int cellNo, Object value) throws ExcelDataBindingException {
        try{
            switch(cellNo){
                case 0:this.setEmpNo(ExcelDataBinderUtil.toString(value).trim()); break;
                case 1:this.setCarlineCd(ExcelDataBinderUtil.toString(value).trim()); break;
                case 2:this.setGoalPrefVal(ExcelDataBinderUtil.toString(value).trim()); break;
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

    /**
     * {@inheritDoc}
     */
    public List<ExcelUploadError> validate(ExcelDataBindContext context) {

        List<ExcelUploadError> errors = new ArrayList<ExcelUploadError>();

        // 사원번호
        if(StringUtils.isBlank(this.getEmpNo())){

            String msg = messageSource.getMessage(
                "global.info.required.field"
                , new String[]{
                        messageSource.getMessage("global.lbl.empNo", null, LocaleContextHolder.getLocale())
                }
                , LocaleContextHolder.getLocale()
            );

            errors.add(new ExcelUploadError(context.getRow(), 0, this.getEmpNo(), msg));
        }

        // 차종코드
        if(StringUtils.isBlank(this.getCarlineCd())){

            String msg = messageSource.getMessage(
                "global.info.required.field"
                , new String[]{
                        messageSource.getMessage("global.lbl.carLine", null, LocaleContextHolder.getLocale())
                }
                , LocaleContextHolder.getLocale()
            );

            errors.add(new ExcelUploadError(context.getRow(), 1, this.getCarlineCd(), msg));
        }

        // 목표설정값
        if(StringUtils.isBlank(this.getGoalPrefVal())){

            String msg = messageSource.getMessage(
                "global.info.required.field"
                , new String[]{
                        messageSource.getMessage("mis.lbl.targetvalue", null, LocaleContextHolder.getLocale())
                }
                , LocaleContextHolder.getLocale()
            );

            errors.add(new ExcelUploadError(context.getRow(), 2, this.getGoalPrefVal(), msg));
        }

        return errors;
    }

}
