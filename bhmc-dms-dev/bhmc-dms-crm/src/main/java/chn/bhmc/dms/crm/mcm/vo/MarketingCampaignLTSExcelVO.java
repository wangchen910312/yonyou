package chn.bhmc.dms.crm.mcm.vo;
import org.apache.commons.lang3.StringUtils;
import java.util.ArrayList;
import java.util.List;

import org.springframework.context.i18n.LocaleContextHolder;

import chn.bhmc.dms.core.support.excel.AbstractExcelDataBinder;
import chn.bhmc.dms.core.support.excel.ExcelDataBindContext;
import chn.bhmc.dms.core.support.excel.ExcelDataBinderUtil;
import chn.bhmc.dms.core.support.excel.ExcelDataBindingException;
import chn.bhmc.dms.core.support.excel.ExcelUploadError;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;

/**
 * 마케팅 캠패인 VIN번호 엑셀업로드용  VO
 *
 * @ClassName   : MarketingCampaignVinExcelVO.java
 * @Description : MarketingCampaignVinExcelVO Class
 * @author hyoung jun an
 * @since 2016.03.04.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016.03.04     hyoung jun an    최초 생성
 * </pre>
 */

@ValidDescriptor({
     
    })

public class MarketingCampaignLTSExcelVO extends AbstractExcelDataBinder {


    /**
     * Statements
     * (long)serialVersionUID 
     */
    private static final long serialVersionUID = 9035877603677310138L;

    /**
     * 캠페인 대상빈
     **/
    private String vinNo;
    
    private String ltsModelCd;
    private String ltsModelNm;


    
    public String getLtsModelCd() {
        return ltsModelCd;
    }

    public void setLtsModelCd(String ltsModelCd) {
        this.ltsModelCd = ltsModelCd;
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
     * {@inheritDoc}
     */
    @Override
    public void bind(int rowNo, int cellNo, Object value) throws ExcelDataBindingException {
        try{
            switch(cellNo){
                case 0  : this.setLtsModelCd(ExcelDataBinderUtil.toString(value).trim());       break;    //LTS MODEL
                case 1  : this.setLtsModelNm(ExcelDataBinderUtil.toString(value).trim());       break;    //LTS MODEL
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
        List<ExcelUploadError> errors = new ArrayList<ExcelUploadError>();

        // LTS 코드
       if(StringUtils.isBlank(this.getLtsModelCd())){

            String msg = messageSource.getMessage(
                "global.info.required.field"
                , new String[]{
                        messageSource.getMessage("ser.lbl.vinNo", null, LocaleContextHolder.getLocale())
                }
                , LocaleContextHolder.getLocale()
            );

            errors.add(new ExcelUploadError(context.getRow(), 0, this.getLtsModelCd(), msg));
        }

        return errors;
    }

    /**
     * @param ltsModelNm the ltsModelNm to set
     */
    public void setLtsModelNm(String ltsModelNm) {
        this.ltsModelNm = ltsModelNm;
    }

    /**
     * @return the ltsModelNm
     */
    public String getLtsModelNm() {
        return ltsModelNm;
    }

}