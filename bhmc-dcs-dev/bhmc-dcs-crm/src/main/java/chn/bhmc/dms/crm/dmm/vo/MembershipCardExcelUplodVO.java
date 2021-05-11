package chn.bhmc.dms.crm.dmm.vo;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.builder.ReflectionToStringBuilder;
import org.hibernate.validator.constraints.NotEmpty;
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
 * @ClassName   : MembershipCardExcelUplodVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kim Hyun Ho
 * @since 2016. 4. 7.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 7.     Kim Hyun Ho     최초 생성
 * </pre>
 */

public class MembershipCardExcelUplodVO extends AbstractExcelDataBinder {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 7002785341966225718L;

    /**
     * 카드종류코드
     **/
     @NotEmpty
     private  String cardTpCd;

     /**
     * 카드번호
     **/
     @NotEmpty
     private  String cardNo;

     /**
     * 카드사용기한
     **/
     @JsonDeserialize(using=JsonDateDeserializer.class)
     private  Date cardUseDt;

     /**
     * 카드형태코드
     **/
     @NotEmpty
     private  String cardFormCd;



    /**
     * @return the cardTpCd
     */
    public String getCardTpCd() {
        return cardTpCd;
    }

    /**
     * @param cardTpCd the cardTpCd to set
     */
    public void setCardTpCd(String cardTpCd) {
        this.cardTpCd = cardTpCd;
    }

    /**
     * @return the cardNo
     */
    public String getCardNo() {
        return cardNo;
    }

    /**
     * @param cardNo the cardNo to set
     */
    public void setCardNo(String cardNo) {
        this.cardNo = cardNo;
    }

    /**
     * @return the cardUseDt
     */
    public Date getCardUseDt() {
        return cardUseDt;
    }

    /**
     * @param cardUseDt the cardUseDt to set
     */
    public void setCardUseDt(Date cardUseDt) {
        this.cardUseDt = cardUseDt;
    }

    /**
     * @return the cardFormCd
     */
    public String getCardFormCd() {
        return cardFormCd;
    }

    /**
     * @param cardFormCd the cardFormCd to set
     */
    public void setCardFormCd(String cardFormCd) {
        this.cardFormCd = cardFormCd;
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public void bind(int rowNo, int cellNo, Object value) throws ExcelDataBindingException {
        // TODO Auto-generated method stub
        try{
            switch(cellNo){
                case 0:this.setCardNo(ExcelDataBinderUtil.toString(value).trim()); break;   //카드번호
                case 1:this.setCardTpCd(ExcelDataBinderUtil.toString(value).trim()); break;     //카드종류
                case 2:this.setCardUseDt(ExcelDataBinderUtil.getDateValue(cardUseDt, "")); break;    //카드사용기한
                case 3:this.setCardFormCd(ExcelDataBinderUtil.toString(value).trim()); break;    //카드형태
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
        List<ExcelUploadError> errors = new ArrayList<ExcelUploadError>();

        //카드번호
        if(StringUtils.isBlank(this.getCardNo())){

            String msg = messageSource.getMessage(
                "global.info.required.field"
                , new String[]{
                        messageSource.getMessage("global.lbl.cardNo", null, LocaleContextHolder.getLocale())
                }
                , LocaleContextHolder.getLocale()
            );

            errors.add(new ExcelUploadError(context.getRow(), 0, this.getCardNo(), msg));
        }

        //카드종류
        if(StringUtils.isBlank(this.getCardTpCd())){

            String msg = messageSource.getMessage(
                "global.info.required.field"
                , new String[]{
                        messageSource.getMessage("global.lbl.cardTpCd", null, LocaleContextHolder.getLocale())
                }
                , LocaleContextHolder.getLocale()
            );

            errors.add(new ExcelUploadError(context.getRow(), 1, this.getCardTpCd(), msg));
        }

        //카드사용기한
        if(this.getCardUseDt() == null){

            String msg = messageSource.getMessage(
                "global.info.required.field"
                , new String[]{
                        messageSource.getMessage("global.lbl.cardUseDt", null, LocaleContextHolder.getLocale())
                }
                , LocaleContextHolder.getLocale()
            );

            errors.add(new ExcelUploadError(context.getRow(), 3, "cardUseDt", msg));
        }

        //카드형태
        if(StringUtils.isBlank(this.getCardFormCd())){

            String msg = messageSource.getMessage(
                "global.info.required.field"
                , new String[]{
                        messageSource.getMessage("global.lbl.cardFormCd", null, LocaleContextHolder.getLocale())
                }
                , LocaleContextHolder.getLocale()
            );

            errors.add(new ExcelUploadError(context.getRow(), 4, this.getCardFormCd(), msg));
        }


        return errors;
    }

    /*
     * @see java.lang.Object#toString()
     */
    @Override
    public String toString() {
        return ReflectionToStringBuilder.toString(this);
    }

}
