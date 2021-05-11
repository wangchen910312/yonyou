package chn.bhmc.dms.mis.tmp.vo;

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
 * [제조사] 시장현황등록
 * </pre>
 *
 * @ClassName   : TargetMarketStatusVO.java
 * @Description : [제조사] 시장현황등록
 * @author chibeom.song
 * @since 2016. 9. 9.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 9. 9.    chibeom.song     최초 생성
 * </pre>
 */

public class TargetMarketStatusVO extends AbstractExcelDataBinder {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 2924692645434750515L;

    private String sMarketStatusYear;               // 년도
    private String sMarketStatusMonth;              // 월
    private String sMarketStatusProvince;           // 성
    private String sMarketStatusCity;               // 시

    private String sMarketStatusYearParam;           // 년도
    private String sMarketStatusMonthParam;          // 월
    private String sMarketStatusProvinceParam;       // 성
    private String sMarketStatusCityParam;           // 시

    private String sMarketStatusYyMm;

    private String provinceCd;                  // 성 코드
    private String provinceNm;                  // 성 이름
    private String cityCd;                      // 시 코드
    private String cityNm;                      // 시 이름
    private String areaCd;                      // 지역 코드
    private String areaNm;                      // 지역 명
    private String regYear;                     // 등록년도
    private String regMonth;                    // 등록월
    private String marketRefVal;                // 참조값

    /**
     * @return the sMarketStatusYear
     */
    public String getsMarketStatusYear() {
        return sMarketStatusYear;
    }

    /**
     * @param sMarketStatusYear the sMarketStatusYear to set
     */
    public void setsMarketStatusYear(String sMarketStatusYear) {
        this.sMarketStatusYear = sMarketStatusYear;
    }

    /**
     * @return the sMarketStatusMonth
     */
    public String getsMarketStatusMonth() {
        return sMarketStatusMonth;
    }

    /**
     * @param sMarketStatusMonth the sMarketStatusMonth to set
     */
    public void setsMarketStatusMonth(String sMarketStatusMonth) {
        this.sMarketStatusMonth = sMarketStatusMonth;
    }

    /**
     * @return the sMarketStatusProvince
     */
    public String getsMarketStatusProvince() {
        return sMarketStatusProvince;
    }

    /**
     * @param sMarketStatusProvince the sMarketStatusProvince to set
     */
    public void setsMarketStatusProvince(String sMarketStatusProvince) {
        this.sMarketStatusProvince = sMarketStatusProvince;
    }

    /**
     * @return the sMarketStatusCity
     */
    public String getsMarketStatusCity() {
        return sMarketStatusCity;
    }

    /**
     * @param sMarketStatusCity the sMarketStatusCity to set
     */
    public void setsMarketStatusCity(String sMarketStatusCity) {
        this.sMarketStatusCity = sMarketStatusCity;
    }

    /**
     * @return the sMarketStatusYearParam
     */
    public String getsMarketStatusYearParam() {
        return sMarketStatusYearParam;
    }

    /**
     * @param sMarketStatusYearParam the sMarketStatusYearParam to set
     */
    public void setsMarketStatusYearParam(String sMarketStatusYearParam) {
        this.sMarketStatusYearParam = sMarketStatusYearParam;
    }

    /**
     * @return the sMarketStatusMonthParam
     */
    public String getsMarketStatusMonthParam() {
        return sMarketStatusMonthParam;
    }

    /**
     * @param sMarketStatusMonthParam the sMarketStatusMonthParam to set
     */
    public void setsMarketStatusMonthParam(String sMarketStatusMonthParam) {
        this.sMarketStatusMonthParam = sMarketStatusMonthParam;
    }

    /**
     * @return the sMarketStatusProvinceParam
     */
    public String getsMarketStatusProvinceParam() {
        return sMarketStatusProvinceParam;
    }

    /**
     * @param sMarketStatusProvinceParam the sMarketStatusProvinceParam to set
     */
    public void setsMarketStatusProvinceParam(String sMarketStatusProvinceParam) {
        this.sMarketStatusProvinceParam = sMarketStatusProvinceParam;
    }

    /**
     * @return the sMarketStatusCityParam
     */
    public String getsMarketStatusCityParam() {
        return sMarketStatusCityParam;
    }

    /**
     * @param sMarketStatusCityParam the sMarketStatusCityParam to set
     */
    public void setsMarketStatusCityParam(String sMarketStatusCityParam) {
        this.sMarketStatusCityParam = sMarketStatusCityParam;
    }

    /**
     * @return the sMarketStatusYyMm
     */
    public String getsMarketStatusYyMm() {
        return sMarketStatusYyMm;
    }

    /**
     * @param sMarketStatusYyMm the sMarketStatusYyMm to set
     */
    public void setsMarketStatusYyMm(String sMarketStatusYyMm) {
        this.sMarketStatusYyMm = sMarketStatusYyMm;
    }

    /**
     * @return the provinceCd
     */
    public String getProvinceCd() {
        return provinceCd;
    }

    /**
     * @param provinceCd the provinceCd to set
     */
    public void setProvinceCd(String provinceCd) {
        this.provinceCd = provinceCd;
    }

    /**
     * @return the provinceNm
     */
    public String getProvinceNm() {
        return provinceNm;
    }

    /**
     * @param provinceNm the provinceNm to set
     */
    public void setProvinceNm(String provinceNm) {
        this.provinceNm = provinceNm;
    }

    /**
     * @return the cityCd
     */
    public String getCityCd() {
        return cityCd;
    }

    /**
     * @param cityCd the cityCd to set
     */
    public void setCityCd(String cityCd) {
        this.cityCd = cityCd;
    }

    /**
     * @return the cityNm
     */
    public String getCityNm() {
        return cityNm;
    }

    /**
     * @param cityNm the cityNm to set
     */
    public void setCityNm(String cityNm) {
        this.cityNm = cityNm;
    }

    /**
     * @return the areaCd
     */
    public String getAreaCd() {
        return areaCd;
    }

    /**
     * @param areaCd the areaCd to set
     */
    public void setAreaCd(String areaCd) {
        this.areaCd = areaCd;
    }

    /**
     * @return the areaNm
     */
    public String getAreaNm() {
        return areaNm;
    }

    /**
     * @param areaNm the areaNm to set
     */
    public void setAreaNm(String areaNm) {
        this.areaNm = areaNm;
    }

    /**
     * @return the regYear
     */
    public String getRegYear() {
        return regYear;
    }

    /**
     * @param regYear the regYear to set
     */
    public void setRegYear(String regYear) {
        this.regYear = regYear;
    }

    /**
     * @return the regMonth
     */
    public String getRegMonth() {
        return regMonth;
    }

    /**
     * @param regMonth the regMonth to set
     */
    public void setRegMonth(String regMonth) {
        this.regMonth = regMonth;
    }

    /**
     * @return the marketRefVal
     */
    public String getMarketRefVal() {
        return marketRefVal;
    }

    /**
     * @param marketRefVal the marketRefVal to set
     */
    public void setMarketRefVal(String marketRefVal) {
        this.marketRefVal = marketRefVal;
    }

    /**
     * {@inheritDoc}
     */
    public void bind(int rowNo, int cellNo, Object value) throws ExcelDataBindingException {
        try{
            switch(cellNo){
                case 0:this.setProvinceCd(ExcelDataBinderUtil.toString(value).trim()); break;       // 성코드
                case 2:this.setCityCd(ExcelDataBinderUtil.toString(value).trim()); break;           // 시코드
                case 4:this.setRegYear(ExcelDataBinderUtil.toString(value).trim()); break;          // 등록년도
                case 5:this.setRegMonth(ExcelDataBinderUtil.toString(value).trim()); break;         // 등록월
                case 6:this.setMarketRefVal(ExcelDataBinderUtil.toString(value).trim()); break;     // 참조값
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

        // 성코드
        if(StringUtils.isBlank(this.getProvinceCd())){

            String msg = messageSource.getMessage(
                "global.info.required.field"
                , new String[]{
                        messageSource.getMessage("mis.lbl.provinceCd", null, LocaleContextHolder.getLocale())
                }
                , LocaleContextHolder.getLocale()
            );

            errors.add(new ExcelUploadError(context.getRow(), 0, this.getProvinceCd(), msg));
        }

        // 시코드
        if(StringUtils.isBlank(this.getCityCd())){

            String msg = messageSource.getMessage(
                "global.info.required.field"
                , new String[]{
                        messageSource.getMessage("mis.lbl.cityCd", null, LocaleContextHolder.getLocale())
                }
                , LocaleContextHolder.getLocale()
            );

            errors.add(new ExcelUploadError(context.getRow(), 2, this.getCityCd(), msg));
        }

        // 등록년도
        if(StringUtils.isBlank(this.getRegYear())){

            String msg = messageSource.getMessage(
                "global.info.required.field"
                , new String[]{
                        messageSource.getMessage("mis.lbl.regYear", null, LocaleContextHolder.getLocale())
                }
                , LocaleContextHolder.getLocale()
            );

            errors.add(new ExcelUploadError(context.getRow(), 4, this.getRegYear(), msg));
        }

        // 등록월
        if(StringUtils.isBlank(this.getRegMonth())){

            String msg = messageSource.getMessage(
                "global.info.required.field"
                , new String[]{
                        messageSource.getMessage("mis.lbl.regMonth", null, LocaleContextHolder.getLocale())
                }
                , LocaleContextHolder.getLocale()
            );

            errors.add(new ExcelUploadError(context.getRow(), 5, this.getRegMonth(), msg));
        }

        // 참조값
        if(StringUtils.isBlank(this.getMarketRefVal())){

            String msg = messageSource.getMessage(
                "global.info.required.field"
                , new String[]{
                        messageSource.getMessage("mis.lbl.marketRefVal", null, LocaleContextHolder.getLocale())
                }
                , LocaleContextHolder.getLocale()
            );

            errors.add(new ExcelUploadError(context.getRow(), 6, this.getMarketRefVal(), msg));
        }


        return errors;


    }


}
