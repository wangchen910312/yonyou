package chn.bhmc.dms.ser.wac.vo;

import java.util.List;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
/**
 * <pre>
 * 고품관리 SaveVO
 * </pre>
 *
 * @ClassName   : ClaimOldItemManageSaveVO.java
 * @Description : 고품관리 SaveVO.
 * @author Yin Xueyuan
 * @since 2016. 5. 6.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 6.     Yin Xueyuan     최초 생성
 * </pre>
 */
@ValidDescriptor({
})

public class ClaimOldItemManageSaveVO extends BaseSaveVO<Object> {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -3169297452561233140L;
    
    private List<ClaimOldItemManageVO> claimOldItemManageList;

    public List<ClaimOldItemManageVO> getClaimOldItemManageList() {
        return claimOldItemManageList;
    }

    public void setClaimOldItemManageList(List<ClaimOldItemManageVO> claimOldItemManageList) {
        this.claimOldItemManageList = claimOldItemManageList;
    }

    
    
    
    

}
