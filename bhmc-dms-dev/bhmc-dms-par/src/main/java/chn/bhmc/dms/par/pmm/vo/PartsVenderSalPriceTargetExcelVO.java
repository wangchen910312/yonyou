package chn.bhmc.dms.par.pmm.vo;

import java.util.ArrayList;
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
 * @ClassName   : PartsVenderSalPriceTargetExcelVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author In Bo Shim
 * @since 2016. 6. 2.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 6. 2.     In Bo Shim     최초 생성
 * </pre>
 */

public class PartsVenderSalPriceTargetExcelVO extends AbstractExcelDataBinder {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 5601958877748598191L;

    /**
     * 딜러코드
     */
    private String dlrCd;

    /**
     * 부품코드
     */
    private String itemCd = "";

    /**
     *  입고창고코드
     */
    private String grStrgeCd = "";

    /**
     *  입고창고명
     */
    private String grStrgeNm = "";

    /**
     *  소매가
     */
    private String salePriceCost01 = "";
    /**
     *  도매가
     */
    private String salePriceCost02 = "";
    /**
     *  보험가
     */
    private String salePriceCost03 = "";

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
     * @return the grStrgeCd
     */
    public String getGrStrgeCd() {
        return grStrgeCd;
    }

    /**
     * @param grStrgeCd the grStrgeCd to set
     */
    public void setGrStrgeCd(String grStrgeCd) {
        this.grStrgeCd = grStrgeCd;
    }

    /**
     * @return the grStrgeNm
     */
    public String getGrStrgeNm() {
        return grStrgeNm;
    }

    /**
     * @param grStrgeNm the grStrgeNm to set
     */
    public void setGrStrgeNm(String grStrgeNm) {
        this.grStrgeNm = grStrgeNm;
    }

    /**
     * @return the salePriceCost01
     */
    public String getSalePriceCost01() {
        return salePriceCost01;
    }

    /**
     * @param salePriceCost01 the salePriceCost01 to set
     */
    public void setSalePriceCost01(String salePriceCost01) {
        this.salePriceCost01 = salePriceCost01;
    }

    /**
     * @return the salePriceCost02
     */
    public String getSalePriceCost02() {
        return salePriceCost02;
    }

    /**
     * @param salePriceCost02 the salePriceCost02 to set
     */
    public void setSalePriceCost02(String salePriceCost02) {
        this.salePriceCost02 = salePriceCost02;
    }

    /**
     * @return the salePriceCost03
     */
    public String getSalePriceCost03() {
        return salePriceCost03;
    }

    /**
     * @param salePriceCost03 the salePriceCost03 to set
     */
    public void setSalePriceCost03(String salePriceCost03) {
        this.salePriceCost03 = salePriceCost03;
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public void bind(int rowNo, int cellNo, Object value) throws ExcelDataBindingException {

        try{
            switch(cellNo){
                case 0:this.setItemCd(ExcelDataBinderUtil.toString(value).trim()); break;
                case 1:this.setGrStrgeNm(ExcelDataBinderUtil.toString(value).trim()); break;
                case 2:this.setSalePriceCost01(ExcelDataBinderUtil.toString(value)); break;
                case 3:this.setSalePriceCost02(ExcelDataBinderUtil.toString(value)); break;
                case 4:this.setSalePriceCost03(ExcelDataBinderUtil.toString(value)); break;
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


        return errors;
    }


}
