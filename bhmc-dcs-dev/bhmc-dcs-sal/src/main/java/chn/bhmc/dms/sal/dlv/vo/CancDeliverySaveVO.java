package chn.bhmc.dms.sal.dlv.vo;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CancDeliverySaveVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author kim yewon
 * @since 2016. 10. 23.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 10. 23.  kim yewon     최초 생성
 * </pre>
 */
@ValidDescriptor({

})
public class CancDeliverySaveVO extends BaseSaveVO<CancDeliveryVO> {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 2864274377715677856L;

    private String approveYn;                   //승인여부

    /**
     * @return the approveYn
     */
    public String getApproveYn() {
        return approveYn;
    }

    /**
     * @param approveYn the approveYn to set
     */
    public void setApproveYn(String approveYn) {
        this.approveYn = approveYn;
    }

}
