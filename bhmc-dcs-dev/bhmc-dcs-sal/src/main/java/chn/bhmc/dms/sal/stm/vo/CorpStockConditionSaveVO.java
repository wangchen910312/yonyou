package chn.bhmc.dms.sal.stm.vo;

import java.util.ArrayList;
import java.util.List;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CorpStockConditionSaveVO
 * @Description :
 * @author Kim Jin Suk
 * @since 2016. 7. 25.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 28.     Kang Seok Han     최초 생성
 * </pre>
 */
@ValidDescriptor({

})
public class CorpStockConditionSaveVO extends BaseSaveVO<CorpStockConditionVO> {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 7265681027105881419L;

    public List<CorpStockConditionVO> uploadList = new ArrayList<CorpStockConditionVO>();

    /**
     * @return the uploadList
     */
    public List<CorpStockConditionVO> getUploadList() {
        return uploadList;
    }

    /**
     * @param uploadList the uploadList to set
     */
    public void setUploadList(List<CorpStockConditionVO> uploadList) {
        this.uploadList = uploadList;
    }

    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }

}
