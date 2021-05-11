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
 * @ClassName   : TargetDcptMgmtSaveVO.java
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
    @ValidField(field="provinceCd", mesgKey="mis.lbl.provinceCd")
    ,@ValidField(field="cityCd", mesgKey="mis.lbl.cityCd")
    ,@ValidField(field="areaCd", mesgKey="mis.lbl.areaCd")
    ,@ValidField(field="regYear", mesgKey="mis.lbl.regYear")
    ,@ValidField(field="regMonth", mesgKey="mis.lbl.regMonth")
    ,@ValidField(field="marketRefVal", mesgKey="mis.lbl.marketRefVal")
})
public class TargetDcptMgmtSaveVO extends BaseSaveVO<TargetDcptMgmtVO> {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 6766567829277392502L;

    public List<TargetDcptMgmtVO> targetDcptMgmtRegUploadList = new ArrayList<TargetDcptMgmtVO>();

    /**
     * @return the targetDcptMgmtRegUploadList
     */
    public List<TargetDcptMgmtVO> getTargetDcptMgmtRegUploadList() {
        return targetDcptMgmtRegUploadList;
    }

    /**
     * @param targetDcptMgmtRegUploadList the targetDcptMgmtRegUploadList to set
     */
    public void setTargetDcptMgmtRegUploadList(List<TargetDcptMgmtVO> targetDcptMgmtRegUploadList) {
        this.targetDcptMgmtRegUploadList = targetDcptMgmtRegUploadList;
    }

}
