package chn.bhmc.dms.mob.api.sales.vo;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;
import org.springframework.context.i18n.LocaleContextHolder;

import com.fasterxml.jackson.annotation.JsonInclude;
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
 * @ClassName   : DBMessageSourceVO.java
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
public class DBMessageSourceVO extends AbstractExcelDataBinder {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 2924692645434750515L;


    /**
     * 메세지일련번호
     */
    private int mesgSeq;

    /**
     * 번들
     */
    @NotBlank
    private String bundleNm;

    /**
     * 언어코드
     */
    @Length(min=2, max=2)
    private String langCd;

    /**
     * 국가코드
     */
    @Length(min=0, max=2)
    @JsonInclude
    private String cntryCd;

    /**
     * 메세지키
     */
    @NotBlank
    private String mesgKey;

    /**
     * 메세지
     */
    @NotBlank
    private String mesgTxt;

    /**
     * 최종변경일시
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date lstUpdtDt;

    /**
     * 사용여부
     */
    private String useYn = "Y";

    /**
     * @return the mesgSeq
     */
    public int getMesgSeq() {
        return mesgSeq;
    }

    /**
     * @param mesgSeq the mesgSeq to set
     */
    public void setMesgSeq(int mesgSeq) {
        this.mesgSeq = mesgSeq;
    }

    /**
     * @return the bundleNm
     */
    public String getBundleNm() {
        return bundleNm;
    }

    /**
     * @param bundleNm the bundleNm to set
     */
    public void setBundleNm(String bundleNm) {
        this.bundleNm = bundleNm;
    }

    /**
     * @return the langCd
     */
    public String getLangCd() {
        return langCd;
    }

    /**
     * @param langCd the langCd to set
     */
    public void setLangCd(String langCd) {
        this.langCd = langCd;
    }


    /**
     * @return the cntryCd
     */
    public String getCntryCd() {
        return cntryCd;
    }

    /**
     * @param cntryCd the cntryCd to set
     */
    public void setCntryCd(String cntryCd) {
        this.cntryCd = cntryCd;
    }

    /**
     * @return the mesgKey
     */
    public String getMesgKey() {
        return mesgKey;
    }

    /**
     * @param mesgKey the mesgKey to set
     */
    public void setMesgKey(String mesgKey) {
        this.mesgKey = mesgKey;
    }

    /**
     * @return the mesgTxt
     */
    public String getMesgTxt() {
        return mesgTxt;
    }

    /**
     * @param mesgTxt the mesgTxt to set
     */
    public void setMesgTxt(String mesgTxt) {
        this.mesgTxt = mesgTxt;
    }

    /**
     * @return the lstUpdtDt
     */
    public Date getLstUpdtDt() {
        return lstUpdtDt;
    }

    /**
     * @param lstUpdtDt the lstUpdtDt to set
     */
    public void setLstUpdtDt(Date lstUpdtDt) {
        this.lstUpdtDt = lstUpdtDt;
    }

    /**
     * @return the useYn
     */
    public String getUseYn() {
        return useYn;
    }

    /**
     * @param useYn the useYn to set
     */
    public void setUseYn(String useYn) {
        this.useYn = useYn;
    }

    /**
     * {@inheritDoc}
     */
    public void bind(int rowNo, int cellNo, Object value) throws ExcelDataBindingException {
        try{
            switch(cellNo){
                case 0:this.setBundleNm(ExcelDataBinderUtil.toString(value).trim()); break;   //번들
                case 1:this.setLangCd(ExcelDataBinderUtil.toString(value).trim()); break;     //언어
                case 2:this.setMesgKey(ExcelDataBinderUtil.toString(value).trim()); break;    //메세지코드
                case 3:this.setMesgTxt(ExcelDataBinderUtil.toString(value).trim()); break;    //메세지
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

        //번들
        if(StringUtils.isBlank(this.getBundleNm())){

            String msg = messageSource.getMessage(
                "global.info.required.field"
                , new String[]{
                        messageSource.getMessage("global.lbl.bundle", null, LocaleContextHolder.getLocale())
                }
                , LocaleContextHolder.getLocale()
            );

            errors.add(new ExcelUploadError(context.getRow(), 0, this.getBundleNm(), msg));
        }

        //언어
        if(StringUtils.isBlank(this.getLangCd())){

            String msg = messageSource.getMessage(
                "global.info.required.field"
                , new String[]{
                        messageSource.getMessage("global.lbl.langCd", null, LocaleContextHolder.getLocale())
                }
                , LocaleContextHolder.getLocale()
            );

            errors.add(new ExcelUploadError(context.getRow(), 1, this.getLangCd(), msg));
        }

        //메시지키
        if(StringUtils.isBlank(this.getMesgKey())){

            String msg = messageSource.getMessage(
                "global.info.required.field"
                , new String[]{
                        messageSource.getMessage("global.lbl.mesgKey", null, LocaleContextHolder.getLocale())
                }
                , LocaleContextHolder.getLocale()
            );

            errors.add(new ExcelUploadError(context.getRow(), 2, this.getMesgKey(), msg));
        }

        //메시지
        if(StringUtils.isBlank(this.getMesgTxt())){

            String msg = messageSource.getMessage(
                "global.info.required.field"
                , new String[]{
                        messageSource.getMessage("global.lbl.mesgTxt", null, LocaleContextHolder.getLocale())
                }
                , LocaleContextHolder.getLocale()
            );

            errors.add(new ExcelUploadError(context.getRow(), 3, this.getMesgTxt(), msg));
        }

        return errors;
    }
}
