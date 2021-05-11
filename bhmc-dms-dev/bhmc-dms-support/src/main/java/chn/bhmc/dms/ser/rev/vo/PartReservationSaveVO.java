package chn.bhmc.dms.ser.rev.vo;

import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.ser.cmm.vo.TabInfoSaveVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : PartReservationSaveVO.java
 * @Description : 부품예약 SaveVO
 * @author KyungMok Kim
 * @since 2016. 5. 18.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 18.    KyungMok Kim     최초 생성
 * </pre>
 */

@ValidDescriptor({

})
public class PartReservationSaveVO extends TabInfoSaveVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -2203335487316747165L;

    PartReservationVO partReservationVO;

    /**
     * @return the partReservationVO
     */
    public PartReservationVO getPartReservationVO() {
        return partReservationVO;
    }

    /**
     * @param partReservationVO the partReservationVO to set
     */
    public void setPartReservationVO(PartReservationVO partReservationVO) {
        this.partReservationVO = partReservationVO;
    }

}