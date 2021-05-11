package chn.bhmc.dms.core.support.excel;

import java.util.ArrayList;
import java.util.List;

import org.springframework.context.MessageSource;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : AbstractExcelDataBinder.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 3. 4.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 4.     Kang Seok Han     최초 생성
 * </pre>
 */

public abstract class AbstractExcelDataBinder extends BaseVO implements ExcelDataBinder {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 2605912558093622000L;

    protected MessageSource messageSource;

    private List<ExcelUploadError> errors = new ArrayList<ExcelUploadError>();
    private int errorCount = 0;

    /*
     * @see chn.bhmc.dms.core.support.excel.ExcelDataBinder#setMessageSource(org.springframework.context.MessageSource)
     */
    @Override
    public void setMessageSource(MessageSource messageSource) {
        this.messageSource = messageSource;
    }


    /*
     * @see chn.bhmc.dms.core.support.excel.ExcelDataBinder#setErrors(java.util.List)
     */
    @Override
    public void setErrors(List<ExcelUploadError> errors) {
        this.errors = errors;
    }

    /*
     * @see chn.bhmc.dms.core.support.excel.ExcelDataBinder#getErrors()
     */
    @Override
    public List<ExcelUploadError> getErrors() {
        return errors;
    }

    /*
     * @see chn.bhmc.dms.core.support.excel.ExcelDataBinder#setErrorCount(int)
     */
    @Override
    public void setErrorCount(int errorCount) {
        this.errorCount = errorCount;
    }

    /*
     * @see chn.bhmc.dms.core.support.excel.ExcelDataBinder#getErrorCount()
     */
    @Override
    public int getErrorCount() {
        return errorCount;
    }

}
