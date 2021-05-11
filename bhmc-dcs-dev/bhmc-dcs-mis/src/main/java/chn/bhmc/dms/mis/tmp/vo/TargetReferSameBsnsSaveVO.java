package chn.bhmc.dms.mis.tmp.vo;

import java.util.ArrayList;
import java.util.List;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;
/**
 * <pre>
 * [제조사] 동종업계 참조
 * </pre>
 *
 * @ClassName   : TargetReferSameBsnsSaveVO.java
 * @Description : [제조사] 동종업계 참조
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
    @ValidField(field="referDt", mesgKey="mis.lbl.referDt")
    ,@ValidField(field="referYearDt", mesgKey="mis.lbl.referYearDt")
    ,@ValidField(field="referMonthDt", mesgKey="mis.lbl.referMonthDt")
    ,@ValidField(field="referDayDt", mesgKey="mis.lbl.referDayDt")
    ,@ValidField(field="visitReqVal", mesgKey="mis.lbl.visitReqVal")
    ,@ValidField(field="visitDealVal", mesgKey="mis.lbl.visitDealVal")
    ,@ValidField(field="totDealVal", mesgKey="mis.lbl.totDealVal")
    ,@ValidField(field="perOfterVal", mesgKey="mis.lbl.perOfterVal")
    ,@ValidField(field="successVal", mesgKey="mis.lbl.successVal")
    ,@ValidField(field="targetAchVal", mesgKey="mis.lbl.targetAchVal")
    ,@ValidField(field="goodsCarQty", mesgKey="mis.lbl.goodscarqty")
    ,@ValidField(field="insApplyRate", mesgKey="mis.lbl.inspassesrate")
    ,@ValidField(field="fincApplyRate", mesgKey="mis.lbl.fncpassesrate")
})
public class TargetReferSameBsnsSaveVO extends BaseSaveVO<TargetReferSameBsnsVO> {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 6766567829277392502L;

    public List<TargetReferSameBsnsVO> targetReferSameBsnsList = new ArrayList<TargetReferSameBsnsVO>();

    /**
     * @return the targetReferSameBsnsList
     */
    public List<TargetReferSameBsnsVO> getTargetReferSameBsnsList() {
        return targetReferSameBsnsList;
    }

    /**
     * @param targetReferSameBsnsList the targetReferSameBsnsList to set
     */
    public void setTargetReferSameBsnsList(List<TargetReferSameBsnsVO> targetReferSameBsnsList) {
        this.targetReferSameBsnsList = targetReferSameBsnsList;
    }

}
