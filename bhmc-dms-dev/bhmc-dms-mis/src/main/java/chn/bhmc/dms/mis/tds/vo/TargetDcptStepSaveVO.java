package chn.bhmc.dms.mis.tds.vo;

import java.util.ArrayList;
import java.util.List;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;


/**
 * <pre>
 * 목표 분해 공구
 * </pre>
 *
 * @ClassName   : TargetDcptStepSaveVO.java
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
@ValidDescriptor({
    @ValidField(field="empNo", mesgKey="global.lbl.empNo")
    ,@ValidField(field="carlineCd", mesgKey="global.lbl.carLine")
    ,@ValidField(field="goalPrefVal", mesgKey="mis.lbl.targetvalue")
})
public class TargetDcptStepSaveVO extends BaseSaveVO<TargetDcptStepVO> {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 6766567829277392502L;

    public List<TargetDcptStepVO> targetSalesmanRegUploadList = new ArrayList<TargetDcptStepVO>();

    /**
     * @return the targetSalesmanRegUploadList
     */
    public List<TargetDcptStepVO> getTargetSalesmanRegUploadList() {
        return targetSalesmanRegUploadList;
    }

    /**
     * @param targetSalesmanRegUploadList the targetSalesmanRegUploadList to set
     */
    public void setTargetSalesmanRegUploadList(List<TargetDcptStepVO> targetSalesmanRegUploadList) {
        this.targetSalesmanRegUploadList = targetSalesmanRegUploadList;
    }


}
