package chn.bhmc.dms.mis.tmp.vo;

import java.util.ArrayList;
import java.util.List;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;
/**
 * <pre>
 * [제조사] 월간 목표 등록
 * </pre>
 *
 * @ClassName   : TargetMonthRegSaveVO.java
 * @Description : [제조사] 월간 목표 등록
 * @author chibeom.song
 * @since 2016. 7. 22.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 7. 22.   chibeom.song     최초 생성
 * </pre>
 */

@ValidDescriptor({
    @ValidField(field="goalYy", mesgKey="mis.lbl.goalYy")
    ,@ValidField(field="goalMm", mesgKey="mis.lbl.goalMm")
    ,@ValidField(field="sdptCd", mesgKey="mis.lbl.sdptCd")
    ,@ValidField(field="officeCd", mesgKey="mis.lbl.officeCd")
    ,@ValidField(field="dlrCd", mesgKey="mis.lbl.dlrCd")
    ,@ValidField(field="carLineCd", mesgKey="mis.lbl.carlineCd")
    ,@ValidField(field="goalPrefVal", mesgKey="mis.lbl.goalPrefVal")
})
public class TargetMonthRegSaveVO extends BaseSaveVO<TargetMonthAllRegVO> {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 7847630268289914048L;

    public List<TargetMonthAllRegVO> targetAllMonthRegUploadList = new ArrayList<TargetMonthAllRegVO>();

    /**
     * @return the targetAllMonthRegUploadList
     */
    public List<TargetMonthAllRegVO> getTargetAllMonthRegUploadList() {
        return targetAllMonthRegUploadList;
    }

    /**
     * @param targetAllMonthRegUploadList the targetAllMonthRegUploadList to set
     */
    public void setTargetAllMonthRegUploadList(List<TargetMonthAllRegVO> targetAllMonthRegUploadList) {
        this.targetAllMonthRegUploadList = targetAllMonthRegUploadList;
    }

    public List<TargetMonthPartRegVO> targetPartMonthRegUploadList = new ArrayList<TargetMonthPartRegVO>();

    /**
     * @return the targetPartMonthRegUploadList
     */
    public List<TargetMonthPartRegVO> getTargetPartMonthRegUploadList() {
        return targetPartMonthRegUploadList;
    }

    /**
     * @param targetPartMonthRegUploadList the targetPartMonthRegUploadList to set
     */
    public void setTargetPartMonthRegUploadList(List<TargetMonthPartRegVO> targetPartMonthRegUploadList) {
        this.targetPartMonthRegUploadList = targetPartMonthRegUploadList;
    }

}
