package chn.bhmc.dms.mis.tds.vo;

import java.util.ArrayList;
import java.util.List;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;
/**
 * <pre>
 * 목표 분해 공구 - 차형별 이익설정
 * </pre>
 *
 * @ClassName   : TargetProfitConfigSaveVO.java
 * @Description : 목표 분해 공구 - 차형별 이익설정
 * @author chibeom.song
 * @since 2016. 9. 27.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 9. 27.   chibeom.song     최초 생성
 * </pre>
 */
@ValidDescriptor({
    @ValidField(field="productProfitVal", mesgKey="mis.lbl.cstAmt")
   ,@ValidField(field="settingProfitVal", mesgKey="mis.lbl.salePrice")
})
public class TargetProfitConfigSaveVO extends BaseSaveVO<TargetDcptStepSearchVO> {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 7847630268289914048L;

    public List<TargetDcptStepSearchVO> targetSaleProfitList = new ArrayList<TargetDcptStepSearchVO>();

    /**
     * @return the targetSaleProfitList
     */
    public List<TargetDcptStepSearchVO> getTargetSaleProfitList() {
        return targetSaleProfitList;
    }

    /**
     * @param targetSaleProfitList the targetSaleProfitList to set
     */
    public void setTargetSaleProfitList(List<TargetDcptStepSearchVO> targetSaleProfitList) {
        this.targetSaleProfitList = targetSaleProfitList;
    }

}
