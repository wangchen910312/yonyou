package chn.bhmc.dms.ser.rev.vo;

import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.ser.cmm.vo.TabInfoSaveVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ReservationReceiptVO.java
 * @Description : 예약마스터 VO
 * @author KyungMok Kim
 * @since 2016. 2. 5.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 5.    KyungMok Kim     최초 생성
 * </pre>
 */

@ValidDescriptor({

})
public class ReservationReceiptSaveVO extends TabInfoSaveVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -2203335642180747165L;

    ReservationReceiptVO reservationReceiptVO;

    /**
     * @return the reservationReceiptVO
     */
    public ReservationReceiptVO getReservationReceiptVO() {
        return reservationReceiptVO;
    }

    /**
     * @param reservationReceiptVO the reservationReceiptVO to set
     */
    public void setReservationReceiptVO(ReservationReceiptVO reservationReceiptVO) {
        this.reservationReceiptVO = reservationReceiptVO;
    }

}