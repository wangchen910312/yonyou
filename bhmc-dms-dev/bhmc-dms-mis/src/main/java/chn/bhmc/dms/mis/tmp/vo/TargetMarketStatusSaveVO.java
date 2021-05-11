package chn.bhmc.dms.mis.tmp.vo;

import java.util.ArrayList;
import java.util.List;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;

/**
 * <pre>
 * [제조사] 시장현황등록
 * </pre>
 *
 * @ClassName   : TargetMarketStatusSaveVO.java
 * @Description : [제조사] 시장현황등록
 * @author chibeom.song
 * @since 2016. 9. 9.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 9. 9.    chibeom.song     최초 생성
 * </pre>
 */
@ValidDescriptor({
    @ValidField(field="provinceCd", mesgKey="mis.lbl.provinceCd")
    ,@ValidField(field="cityCd", mesgKey="mis.lbl.cityCd")
    ,@ValidField(field="regYear", mesgKey="mis.lbl.regYear")
    ,@ValidField(field="regMonth", mesgKey="mis.lbl.regMonth")
    ,@ValidField(field="marketRefVal", mesgKey="mis.lbl.marketRefVal")
})
public class TargetMarketStatusSaveVO extends BaseSaveVO<TargetMarketStatusVO> {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 6766567829277392502L;

    public List<TargetMarketStatusVO> targetMarketStatusRegUploadList = new ArrayList<TargetMarketStatusVO>();

    /**
     * @return the targetMarketStatusRegUploadList
     */
    public List<TargetMarketStatusVO> getTargetMarketStatusRegUploadList() {
        return targetMarketStatusRegUploadList;
    }

    /**
     * @param targetMarketStatusRegUploadList the targetMarketStatusRegUploadList to set
     */
    public void setTargetMarketStatusRegUploadList(List<TargetMarketStatusVO> targetMarketStatusRegUploadList) {
        this.targetMarketStatusRegUploadList = targetMarketStatusRegUploadList;
    }

}
