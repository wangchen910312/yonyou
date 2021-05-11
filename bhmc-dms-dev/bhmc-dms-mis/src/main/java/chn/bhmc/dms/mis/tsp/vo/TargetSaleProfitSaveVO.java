package chn.bhmc.dms.mis.tsp.vo;

import java.util.ArrayList;
import java.util.List;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;

/**
 * <pre>
 * [딜러사] 판매이익
 * </pre>
 *
 * @ClassName   : TargetSaleProfitSaveVO.java
 * @Description : [딜러사] 판매이익
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
    @ValidField(field="productVal", mesgKey="mis.lbl.cstAmt")
   ,@ValidField(field="settingVal", mesgKey="mis.lbl.salePrice")
   ,@ValidField(field="carProfitVal", mesgKey="mis.lbl.carone")
   ,@ValidField(field="allProfitVal", mesgKey="mis.lbl.carall")
})
public class TargetSaleProfitSaveVO extends BaseSaveVO<TargetSaleProfitVO> {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 7847630268289914048L;

    public List<TargetSaleProfitVO> targetSaleProfitList = new ArrayList<TargetSaleProfitVO>();

    /**
     * @return the targetAllYearRegUploadList
     */
    public List<TargetSaleProfitVO> getTargetSaleProfitList() {
        return targetSaleProfitList;
    }

    /**
     * @param targetAllYearRegUploadList the targetAllYearRegUploadList to set
     */
    public void setTargetSaleProfitList(List<TargetSaleProfitVO> targetSaleProfitList) {
        this.targetSaleProfitList = targetSaleProfitList;
    }

}
