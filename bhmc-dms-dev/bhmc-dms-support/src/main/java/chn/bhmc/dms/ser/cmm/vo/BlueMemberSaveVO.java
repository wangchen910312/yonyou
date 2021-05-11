package chn.bhmc.dms.ser.cmm.vo;

import java.util.List;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.crm.dmm.vo.BlueMembershipJoinVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BlueMemberSaveVO.java
 * @Description : 블루멤버스 Save
 * @author Kim Kyung Mok
 * @since 2016. 9. 7.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 7. 7.     Kim Kyung Mok     최초 생성
 * </pre>
 */

public class BlueMemberSaveVO extends BaseSaveVO<Object> {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 4874972549770397876L;

    // 공임
    List<BlueMembershipJoinVO> bmSaveVO;

    /**
     * @return the bmSaveVO
     */
    public List<BlueMembershipJoinVO> getBmSaveVO() {
        return bmSaveVO;
    }

    /**
     * @param bmSaveVO the bmSaveVO to set
     */
    public void setBmSaveVO(List<BlueMembershipJoinVO> bmSaveVO) {
        this.bmSaveVO = bmSaveVO;
    }


}
