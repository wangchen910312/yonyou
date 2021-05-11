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
 * @ClassName   : TargetDcptMgmtCustConfigSaveVO.java
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
    @ValidField(field="custGubnVal", mesgKey="mis.lbl.gubn")
    ,@ValidField(field="custChannelVal", mesgKey="mis.lbl.salechannel")
})
public class TargetDcptMgmtCustConfigSaveVO extends BaseSaveVO<TargetDcptMgmtVO> {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 6766567829277392502L;

    public List<TargetDcptMgmtVO> targetCustConfigUploadList = new ArrayList<TargetDcptMgmtVO>();

    /**
     * @return the targetCustConfigUploadList
     */
    public List<TargetDcptMgmtVO> getTargetCustConfigUploadList() {
        return targetCustConfigUploadList;
    }

    /**
     * @param targetCustConfigUploadList the targetCustConfigUploadList to set
     */
    public void setTargetCustConfigUploadList(List<TargetDcptMgmtVO> targetCustConfigUploadList) {
        this.targetCustConfigUploadList = targetCustConfigUploadList;
    }

}
