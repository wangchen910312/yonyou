package chn.bhmc.dms.crm.cso.vo;

import java.util.ArrayList;
import java.util.List;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.support.excel.ExcelUploadError;

/**
 * 판매기회프로세스 Excel Upload 저장  VO
 *
 * @ClassName   : SalesOpptProcessMgmtUploadSaveVO
 * @Description : SalesOpptProcessMgmtUploadSaveVO
 * @author in moon lee
 * @since 2016.03.07.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016.03.07     in moon lee     최초 생성
 * </pre>
 */

public class SalesOpptProcessMgmtUploadSaveVO extends BaseSaveVO<SalesOpptProcessMgmtVO> {


    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -405778555669303174L;

    private List<ExcelUploadError> errors = new ArrayList<ExcelUploadError>();

    public List<SalesOpptProcessMgmtVO> batchUploadList = new ArrayList<SalesOpptProcessMgmtVO>();

    /**
     * @return the batchUploadList
     */
    public List<SalesOpptProcessMgmtVO> getBatchUploadList() {
        return batchUploadList;
    }

    /**
     * @param batchUploadList the batchUploadList to set
     */
    public void setBatchUploadList(List<SalesOpptProcessMgmtVO> batchUploadList) {
        this.batchUploadList = batchUploadList;
    }

    /**
     * @return the errors
     */
    public List<ExcelUploadError> getErrors() {
        return errors;
    }

    /**
     * @param errors the errors to set
     */
    public void setErrors(List<ExcelUploadError> errors) {
        this.errors = errors;
    }

}