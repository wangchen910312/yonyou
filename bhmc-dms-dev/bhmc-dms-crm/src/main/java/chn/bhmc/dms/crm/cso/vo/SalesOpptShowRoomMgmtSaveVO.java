package chn.bhmc.dms.crm.cso.vo;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.crm.cmm.vo.AddressInfoVO;

/**
 * 전시장프로세스 저장  VO
 *
 * @ClassName   : SalesOpptShowRoomMgmtSaveVO
 * @Description : SalesOpptShowRoomMgmtSaveVO
 * @author in moon lee
 * @since 2016.03.07.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016.03.07     in moon lee     최초 생성
 * </pre>
 */

public class SalesOpptShowRoomMgmtSaveVO extends BaseSaveVO<AddressInfoVO> {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 5091746083386843175L;

    /*@Valid */
    public SalesOpptShowRoomMgmtVO salesOpptShowRoomMgmtVO;

    public BaseSaveVO<AddressInfoVO> addressInfoVOList;

    /**
     * @return the salesOpptShowRoomMgmtVO
     */
    public SalesOpptShowRoomMgmtVO getSalesOpptShowRoomMgmtVO() {
        return salesOpptShowRoomMgmtVO;
    }

    /**
     * @param salesOpptShowRoomMgmtVO the salesOpptShowRoomMgmtVO to set
     */
    public void setSalesOpptShowRoomMgmtVO(SalesOpptShowRoomMgmtVO salesOpptShowRoomMgmtVO) {
        this.salesOpptShowRoomMgmtVO = salesOpptShowRoomMgmtVO;
    }

    /**
     * @return the addressInfoVOList
     */
    public BaseSaveVO<AddressInfoVO> getAddressInfoVOList() {
        return addressInfoVOList;
    }

    /**
     * @param addressInfoVOList the addressInfoVOList to set
     */
    public void setAddressInfoVOList(BaseSaveVO<AddressInfoVO> addressInfoVOList) {
        this.addressInfoVOList = addressInfoVOList;
    }



}