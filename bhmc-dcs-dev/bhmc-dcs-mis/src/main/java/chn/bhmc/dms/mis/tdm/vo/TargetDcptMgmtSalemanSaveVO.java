package chn.bhmc.dms.mis.tdm.vo;

import java.util.ArrayList;
import java.util.List;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;

/**
 * <pre>
 * [딜러사] 목표분해도
 * </pre>
 *
 * @ClassName   : TargetDcptMgmtSalemanSaveVO.java
 * @Description : [딜러사] 목표분해도
 * @author chibeom.song
 * @since 2016. 7. 21.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 7. 21.   chibeom.song     최초 생성
 * </pre>
 */
@ValidDescriptor({
    @ValidField(field="empNo", mesgKey="global.lbl.empNo")
    ,@ValidField(field="carlineCd", mesgKey="global.lbl.carLine")
    ,@ValidField(field="goalPrefVal", mesgKey="mis.lbl.targetvalue")
})
public class TargetDcptMgmtSalemanSaveVO extends BaseSaveVO<TargetDcptMgmtSalemanVO> {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 6766567829277392502L;

    public List<TargetDcptMgmtSalemanVO> targetSalesmanRegUploadList = new ArrayList<TargetDcptMgmtSalemanVO>();

    /**
     * @return the targetSalesmanRegUploadList
     */
    public List<TargetDcptMgmtSalemanVO> getTargetSalesmanRegUploadList() {
        return targetSalesmanRegUploadList;
    }

    /**
     * @param targetSalesmanRegUploadList the targetSalesmanRegUploadList to set
     */
    public void setTargetSalesmanRegUploadList(List<TargetDcptMgmtSalemanVO> targetSalesmanRegUploadList) {
        this.targetSalesmanRegUploadList = targetSalesmanRegUploadList;
    }



}
