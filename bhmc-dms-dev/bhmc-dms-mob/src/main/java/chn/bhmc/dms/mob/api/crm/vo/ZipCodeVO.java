package chn.bhmc.dms.mob.api.crm.vo;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.hibernate.validator.constraints.NotBlank;
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
 * @ClassName   : ZipCodeVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 1. 18.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 18.     Kang Seok Han     최초 생성
 * </pre>
 */
public class ZipCodeVO extends AbstractExcelDataBinder  {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 2924692645434750515L;


    /**
     * 우편번호
     */
    @NotBlank
    private String zipCd;

    /**
     * 확장우편번호
     */

    private String extZipCd;

    /**
     * 성 코드
     */
    @NotBlank
    private String sungCd;

    /**
     * 성 이름
     */
    @NotBlank
    private String sungNm;


    /**
     * 도시 코드
     */
    @NotBlank
    private String cityCd;


    /**
     * 도시 이름
     */
    @NotBlank
    private String cityNm;

    /**
     * 지역명
     */
    @NotBlank
    private String distNm;

    /**
     * 지역코드
     */
    @NotBlank
    private String distCd;

    /**
     *  사용유무
     */

    private String useYn;

    /**
     * @return the zipCd
     */
    public String getZipCd() {
        return zipCd;
    }

    /**
     * @param zipCd the zipCd to set
     */
    public void setZipCd(String zipCd) {
        this.zipCd = zipCd;
    }

    /**
     * @return the sungNm
     */
    public String getSungNm() {
        return sungNm;
    }

    /**
     * @param sungNm the sungNm to set
     */
    public void setSungNm(String sungNm) {
        this.sungNm = sungNm;
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
     * @return the distNm
     */
    public String getDistNm() {
        return distNm;
    }

    /**
     * @param distNm the distNm to set
     */
    public void setDistNm(String distNm) {
        this.distNm = distNm;
    }

    /**
     * @return the useYn
     */
    public String getUseYn() {
        return useYn;
    }

    /**
     * @return the useYn
     */
    public String setUseYn(String useYn) {
        return this.useYn = useYn;
    }

    /**
     * @return the extZipCd
     */
    public String getExtZipCd() {
        return extZipCd;
    }

    /**
     * @param extZipCd the extZipCd to set
     */
    public void setExtZipCd(String extZipCd) {
        this.extZipCd = extZipCd;
    }

    /**
     * @return the sungCd
     */
    public String getSungCd() {
        return sungCd;
    }

    /**
     * @param sungCd the sungCd to set
     */
    public void setSungCd(String sungCd) {
        this.sungCd = sungCd;
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
     * @return the distCd
     */
    public String getDistCd() {
        return distCd;
    }

    /**
     * @param distCd the distCd to set
     */
    public void setDistCd(String distCd) {
        this.distCd = distCd;
    }

    /**
     * {@inheritDoc}
     */
    public void bind(int rowNo, int cellNo, Object value) throws ExcelDataBindingException {
        try{
            switch(cellNo){
                case 0:this.setSungCd(ExcelDataBinderUtil.toString(value).trim()); break;   // 성코드
                case 1:this.setCityCd(ExcelDataBinderUtil.toString(value).trim()); break;     //도시코드
                case 2:this.setDistCd(ExcelDataBinderUtil.toString(value).trim()); break;    //지역코드
                case 3:this.setSungNm(ExcelDataBinderUtil.toString(value).trim()); break;    //성이름
                case 4:this.setCityNm(ExcelDataBinderUtil.toString(value).trim()); break;    //도시이름
                case 5:this.setDistNm(ExcelDataBinderUtil.toString(value).trim()); break;    //지역이름
                case 6:this.setZipCd(ExcelDataBinderUtil.toString(value).trim()); break;    //우편번호
                case 7:this.setExtZipCd(ExcelDataBinderUtil.toString(value).trim()); break;    //확장우편번호
                case 8:this.setUseYn(ExcelDataBinderUtil.toString(value).trim()); break;    //사용유무

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

        //성코드
        if(StringUtils.isBlank(this.getSungCd())){

            String msg = messageSource.getMessage(
                "global.info.required.field"
                , new String[]{
                        messageSource.getMessage("global.lbl.sungCd", null, LocaleContextHolder.getLocale())
                }
                , LocaleContextHolder.getLocale()
            );

            errors.add(new ExcelUploadError(context.getRow(), 0, this.getSungCd(), msg));
        }

        //도시코드
        if(StringUtils.isBlank(this.getCityCd())){

            String msg = messageSource.getMessage(
                "global.info.required.field"
                , new String[]{
                        messageSource.getMessage("global.lbl.cityCd", null, LocaleContextHolder.getLocale())
                }
                , LocaleContextHolder.getLocale()
            );

            errors.add(new ExcelUploadError(context.getRow(), 1, this.getCityCd(), msg));
        }

        //지역코드
        if(StringUtils.isBlank(this.getDistCd())){

            String msg = messageSource.getMessage(
                "global.info.required.field"
                , new String[]{
                        messageSource.getMessage("global.lbl.distCd", null, LocaleContextHolder.getLocale())
                }
                , LocaleContextHolder.getLocale()
            );

            errors.add(new ExcelUploadError(context.getRow(), 3, this.getDistCd(), msg));
        }

        //성이름
        if(StringUtils.isBlank(this.getSungNm())){

            String msg = messageSource.getMessage(
                "global.info.required.field"
                , new String[]{
                        messageSource.getMessage("global.lbl.sungNm", null, LocaleContextHolder.getLocale())
                }
                , LocaleContextHolder.getLocale()
            );

            errors.add(new ExcelUploadError(context.getRow(), 0, this.getSungNm(), msg));
        }

        //도시이름
        if(StringUtils.isBlank(this.getCityNm())){

            String msg = messageSource.getMessage(
                "global.info.required.field"
                , new String[]{
                        messageSource.getMessage("global.lbl.cityNm", null, LocaleContextHolder.getLocale())
                }
                , LocaleContextHolder.getLocale()
            );

            errors.add(new ExcelUploadError(context.getRow(), 1, this.getCityNm(), msg));
        }

        //지역이름
        if(StringUtils.isBlank(this.getDistNm())){

            String msg = messageSource.getMessage(
                "global.info.required.field"
                , new String[]{
                        messageSource.getMessage("global.lbl.distNm", null, LocaleContextHolder.getLocale())
                }
                , LocaleContextHolder.getLocale()
            );

            errors.add(new ExcelUploadError(context.getRow(), 3, this.getDistNm(), msg));
        }

        //도시이름
        if(StringUtils.isBlank(this.getZipCd())){

            String msg = messageSource.getMessage(
                "global.info.required.field"
                , new String[]{
                        messageSource.getMessage("global.lbl.zipCd", null, LocaleContextHolder.getLocale())
                }
                , LocaleContextHolder.getLocale()
            );

            errors.add(new ExcelUploadError(context.getRow(), 1, this.getZipCd(), msg));
        }

        return errors;


    }



}
