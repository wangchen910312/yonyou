package chn.bhmc.dms.mis.tmp.vo;

import java.util.ArrayList;
import java.util.List;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;
/**
 * <pre>
 * [제조사] 년간 목표 등록
 * </pre>
 *
 * @ClassName   : TargetYearRegSaveVO.java
 * @Description : [제조사] 년간 목표 등록
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
     @ValidField(field="dlrCd", mesgKey="mis.lbl.dlrCd")
    ,@ValidField(field="carLineCd", mesgKey="mis.lbl.carlineCd")
    ,@ValidField(field="goalPrefVal", mesgKey="mis.lbl.goalPrefVal")
})
public class TargetYearRegSaveVO extends BaseSaveVO<TargetYearAllRegVO> {
    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 7847630268289914048L;

    public List<TargetYearAllRegVO> targetAllYearRegUploadList = new ArrayList<TargetYearAllRegVO>();

    /**
     * @return the targetAllYearRegUploadList
     */
    public List<TargetYearAllRegVO> getTargetAllYearRegUploadList() {
        return targetAllYearRegUploadList;
    }

    /**
     * @param targetAllYearRegUploadList the targetAllYearRegUploadList to set
     */
    public void setTargetAllYearRegUploadList(List<TargetYearAllRegVO> targetAllYearRegUploadList) {
        this.targetAllYearRegUploadList = targetAllYearRegUploadList;
    }

    public List<TargetYearPartRegVO> targetPartYearRegUploadList = new ArrayList<TargetYearPartRegVO>();

    /**
     * @return the targetPartYearRegUploadList
     */
    public List<TargetYearPartRegVO> getTargetPartYearRegUploadList() {
        return targetPartYearRegUploadList;
    }

    /**
     * @param targetPartYearRegUploadList the targetPartYearRegUploadList to set
     */
    public void setTargetPartYearRegUploadList(List<TargetYearPartRegVO> targetPartYearRegUploadList) {
        this.targetPartYearRegUploadList = targetPartYearRegUploadList;
    }
}
